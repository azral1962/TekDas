"""Train and evaluate a churn model on the actual customers.csv schema.

Run after data_prep.py:
    python ml_model.py
"""
from pathlib import Path
import json
import joblib
import pandas as pd
from sklearn.compose import ColumnTransformer
from sklearn.ensemble import RandomForestClassifier
from sklearn.impute import SimpleImputer
from sklearn.metrics import (
    accuracy_score,
    classification_report,
    confusion_matrix,
    f1_score,
    precision_score,
    recall_score,
    roc_auc_score,
)
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import OneHotEncoder

from data_prep import (
    CATEGORICAL_COLUMNS,
    FEATURE_COLUMNS,
    ID_COLUMN,
    NUMERIC_COLUMNS,
    TARGET,
)

BASE_DIR = Path(__file__).resolve().parent


def build_pipeline() -> Pipeline:
    numeric_pipe = Pipeline([
        ("imputer", SimpleImputer(strategy="median")),
    ])
    categorical_pipe = Pipeline([
        ("imputer", SimpleImputer(strategy="most_frequent")),
        ("onehot", OneHotEncoder(handle_unknown="ignore")),
    ])

    preprocessor = ColumnTransformer([
        ("num", numeric_pipe, NUMERIC_COLUMNS),
        ("cat", categorical_pipe, CATEGORICAL_COLUMNS),
    ])

    # Churn is only a minority of the customers, so balanced class weights make
    # the exercise less misleading than optimizing plain accuracy alone.
    classifier = RandomForestClassifier(
        n_estimators=350,
        min_samples_leaf=3,
        class_weight="balanced",
        random_state=42,
        n_jobs=-1,
    )

    return Pipeline([
        ("preprocess", preprocessor),
        ("model", classifier),
    ])


def main():
    train = pd.read_csv(BASE_DIR / "customer_train.csv")
    test = pd.read_csv(BASE_DIR / "customer_test.csv")

    X_train = train[FEATURE_COLUMNS]
    y_train = train[TARGET]
    X_test = test[FEATURE_COLUMNS]
    y_test = test[TARGET]

    pipeline = build_pipeline()
    print("Training Random Forest churn model...")
    pipeline.fit(X_train, y_train)

    y_pred = pipeline.predict(X_test)
    y_prob = pipeline.predict_proba(X_test)[:, 1]

    metrics = {
        "accuracy": float(accuracy_score(y_test, y_pred)),
        "precision_churn": float(precision_score(y_test, y_pred, zero_division=0)),
        "recall_churn": float(recall_score(y_test, y_pred, zero_division=0)),
        "f1_churn": float(f1_score(y_test, y_pred, zero_division=0)),
        "roc_auc": float(roc_auc_score(y_test, y_prob)),
        "confusion_matrix": confusion_matrix(y_test, y_pred).tolist(),
        "test_churn_rate": float(y_test.mean()),
    }

    print("\nClassification report:\n")
    print(classification_report(y_test, y_pred, digits=3, zero_division=0))
    print(f"ROC-AUC: {metrics['roc_auc']:.3f}")

    joblib.dump(pipeline, BASE_DIR / "customer_churn_pipeline.pkl")

    # Global feature importance is useful for teaching what the model learned.
    feature_names = pipeline.named_steps["preprocess"].get_feature_names_out()
    importances = pipeline.named_steps["model"].feature_importances_
    fi = (
        pd.DataFrame({"feature": feature_names, "importance": importances})
        .sort_values("importance", ascending=False)
        .reset_index(drop=True)
    )
    fi.to_csv(BASE_DIR / "feature_importance.csv", index=False)

    # Export test predictions with customer IDs for dashboard traceability.
    pred = test[[ID_COLUMN, TARGET]].copy()
    pred["predicted_churn"] = y_pred
    pred["churn_probability"] = y_prob
    pred.to_csv(BASE_DIR / "customer_predictions.csv", index=False)

    with open(BASE_DIR / "model_metrics.json", "w", encoding="utf-8") as f:
        json.dump(metrics, f, indent=2)

    print("\nSaved: customer_churn_pipeline.pkl")
    print("Saved: feature_importance.csv, customer_predictions.csv, model_metrics.json")


if __name__ == "__main__":
    main()
