"""Streamlit teaching dashboard: Kaggle -> BI -> ML -> LLM.

Run:
    streamlit run app.py
"""
from pathlib import Path
import json
import joblib
import pandas as pd
import streamlit as st

from data_prep import FEATURE_COLUMNS, prepare_customer_features
from vai_analyst import DEFAULT_MODEL, generate_customer_strategy, build_prompt

BASE_DIR = Path(__file__).resolve().parent

st.set_page_config(page_title="Kaggle Business Intelligence: ML + LLM", layout="wide")
st.title("Kaggle Business Intelligence — dari Data ke ML dan LLM")
st.caption("Proyek pembelajaran: pahami data terlebih dahulu, prediksi churn dengan ML, lalu gunakan LLM untuk membantu interpretasi bisnis.")


@st.cache_data
def load_csvs():
    customers = pd.read_csv(BASE_DIR / "customers.csv")
    orders = pd.read_csv(BASE_DIR / "orders.csv")
    products = pd.read_csv(BASE_DIR / "product_summary.csv")
    monthly = pd.read_csv(BASE_DIR / "monthly_revenue.csv")
    orders["order_date"] = pd.to_datetime(orders["order_date"], errors="coerce")
    customers["registration_date"] = pd.to_datetime(customers["registration_date"], errors="coerce")
    return customers, orders, products, monthly


@st.cache_resource
def load_model():
    model_path = BASE_DIR / "customer_churn_pipeline.pkl"
    if not model_path.exists():
        return None
    return joblib.load(model_path)


@st.cache_data
def load_optional_outputs():
    fi_path = BASE_DIR / "feature_importance.csv"
    metrics_path = BASE_DIR / "model_metrics.json"
    fi = pd.read_csv(fi_path) if fi_path.exists() else pd.DataFrame()
    metrics = {}
    if metrics_path.exists():
        metrics = json.loads(metrics_path.read_text(encoding="utf-8"))
    return fi, metrics


customers, orders, products, monthly = load_csvs()
model = load_model()
feature_importance, model_metrics = load_optional_outputs()

# Headline BI metrics use definitions visible in orders.csv.
delivered = orders[orders["order_status"].eq("Delivered")]
col1, col2, col3, col4 = st.columns(4)
col1.metric("Customers", f"{len(customers):,}")
col2.metric("Orders", f"{len(orders):,}")
col3.metric("Delivered revenue", f"${delivered['total_amount_usd'].sum():,.0f}")
col4.metric("Observed churn", f"{customers['churned'].mean():.1%}")

st.sidebar.header("Pilih pelanggan")
selected_id = st.sidebar.selectbox("Customer ID", customers["customer_id"].tolist())
decision_threshold = st.sidebar.slider("ML decision threshold", 0.10, 0.90, 0.50, 0.05)
customer_row = customers.loc[customers["customer_id"].eq(selected_id)].iloc[0]
customer_orders = orders.loc[orders["customer_id"].eq(selected_id)].sort_values("order_date", ascending=False)

# Build exactly the same engineered features used during training.
snapshot_date = max(orders["order_date"].max(), customers["registration_date"].max())
prepared = prepare_customer_features(customers.loc[customers["customer_id"].eq(selected_id)], snapshot_date)
X_customer = prepared[FEATURE_COLUMNS]


tab_data, tab_bi, tab_ml, tab_llm = st.tabs([
    "1 · Kaggle Data",
    "2 · Business Intelligence",
    "3 · Machine Learning",
    "4 · LLM Analyst",
])

with tab_data:
    st.subheader("Empat tabel, empat tingkat informasi")
    st.markdown(
        "- **customers.csv** — satu baris per pelanggan; `churned` adalah target ML.\n"
        "- **orders.csv** — satu baris per transaksi; sumber utama untuk perilaku transaksi dan return.\n"
        "- **product_summary.csv** — agregasi per produk.\n"
        "- **monthly_revenue.csv** — agregasi bulanan untuk revenue yang sudah delivered."
    )

    dataset_name = st.selectbox("Lihat tabel", ["customers", "orders", "product_summary", "monthly_revenue"])
    frames = {
        "customers": customers,
        "orders": orders,
        "product_summary": products,
        "monthly_revenue": monthly,
    }
    df_view = frames[dataset_name]
    st.write(f"Shape: {df_view.shape[0]:,} rows × {df_view.shape[1]} columns")
    st.dataframe(df_view.head(100), use_container_width=True)

    if (monthly["return_rate"] == 0).all():
        st.warning(
            "Data-quality lesson: `monthly_revenue.return_rate` selalu 0. "
            "Total revenue file ini sama dengan revenue order berstatus Delivered, jadi analisis return harus memakai `orders.csv`, bukan kolom agregat ini."
        )

with tab_bi:
    st.subheader("Descriptive BI sebelum predictive ML")
    monthly_plot = monthly.copy()
    monthly_plot["period"] = pd.to_datetime(dict(year=monthly_plot.year, month=monthly_plot.month, day=1))
    st.markdown("**Delivered revenue by month**")
    st.line_chart(monthly_plot.set_index("period")["revenue_usd"])

    category_perf = (
        delivered.groupby("category", as_index=False)
        .agg(revenue_usd=("total_amount_usd", "sum"), orders=("order_id", "count"))
        .sort_values("revenue_usd", ascending=False)
    )
    st.markdown("**Delivered revenue by category**")
    st.bar_chart(category_perf.set_index("category")["revenue_usd"])

    st.markdown(f"**Recent orders for {selected_id}**")
    cols = ["order_date", "product_name", "category", "total_amount_usd", "order_status", "returned", "customer_rating"]
    st.dataframe(customer_orders[cols].head(20), use_container_width=True)

with tab_ml:
    st.subheader("Prediksi churn")
    st.dataframe(pd.DataFrame([customer_row.to_dict()]), use_container_width=True)

    if model is None:
        st.error("Model belum dibuat. Jalankan `python data_prep.py` lalu `python ml_model.py`.")
    else:
        churn_prob = float(model.predict_proba(X_customer)[0, 1])
        predicted = int(churn_prob >= decision_threshold)
        a, b, c = st.columns(3)
        a.metric("Churn probability", f"{churn_prob:.1%}")
        b.metric("Predicted class", "Churn" if predicted else "Not churn", help=f"Threshold = {decision_threshold:.2f}")
        c.metric("Actual label (dataset)", "Churn" if int(customer_row["churned"]) else "Not churn")

        st.info(
            f"Probability ≠ certainty. Decision threshold saat ini {decision_threshold:.2f}. "
            "Karena churn hanya sebagian kecil pelanggan, evaluasi model perlu melihat precision/recall/F1/ROC-AUC, bukan accuracy saja."
        )

        if model_metrics:
            m1, m2, m3, m4 = st.columns(4)
            m1.metric("Accuracy", f"{model_metrics['accuracy']:.3f}")
            m2.metric("Recall churn", f"{model_metrics['recall_churn']:.3f}")
            m3.metric("F1 churn", f"{model_metrics['f1_churn']:.3f}")
            m4.metric("ROC-AUC", f"{model_metrics['roc_auc']:.3f}")

        if not feature_importance.empty:
            st.markdown("**Top global model features**")
            top_fi = feature_importance.head(15).set_index("feature")
            st.bar_chart(top_fi["importance"])

with tab_llm:
    st.subheader("LLM sebagai analyst — bukan pengganti model")
    st.caption(f"Ollama model: {DEFAULT_MODEL} (ubah dengan environment variable OLLAMA_MODEL)")

    if model is None:
        st.error("Train model terlebih dahulu agar LLM menerima skor ML yang nyata.")
    else:
        churn_prob = float(model.predict_proba(X_customer)[0, 1])
        recent_order_records = customer_orders[
            ["order_date", "product_name", "category", "total_amount_usd", "order_status", "returned"]
        ].head(5).copy()
        if not recent_order_records.empty:
            recent_order_records["order_date"] = recent_order_records["order_date"].dt.strftime("%Y-%m-%d")
        recent_order_records = recent_order_records.to_dict("records")
        model_factors = feature_importance.head(8).to_dict("records") if not feature_importance.empty else []

        prompt = build_prompt(
            customer_profile=customer_row.to_dict(),
            churn_probability=churn_prob,
            recent_orders=recent_order_records,
            model_factors=model_factors,
        )
        with st.expander("Lihat prompt yang dikirim ke LLM"):
            st.code(prompt, language="text")

        if st.button("Generate evidence-based action plan"):
            with st.spinner("LLM menyusun interpretasi dari data dan skor ML..."):
                answer = generate_customer_strategy(
                    customer_profile=customer_row.to_dict(),
                    churn_probability=churn_prob,
                    recent_orders=recent_order_records,
                    model_factors=model_factors,
                )
            st.markdown(answer)

st.markdown("---")
st.caption("Teaching principle: Kaggle supplies data; BI describes it; ML predicts a target; LLM communicates and contextualizes the evidence.")
