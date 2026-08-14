# Kaggle Business Intelligence: ML + LLM

A teaching project that connects four concepts in one pipeline:

**Kaggle CSV -> Business Intelligence -> Machine Learning -> LLM analyst**

## Files

- `customers.csv`: customer-level data and target `churned`
- `orders.csv`: transaction-level evidence
- `product_summary.csv`: product-level aggregation
- `monthly_revenue.csv`: delivered-revenue monthly aggregation
- `data_prep.py`: validation, cleaning, feature engineering, train/test split
- `ml_model.py`: sklearn preprocessing + Random Forest training/evaluation
- `vai_analyst.py`: grounded prompt + local Ollama call
- `app.py`: Streamlit dashboard combining all layers

## Run

```bash
pip install -r requirements.txt
python data_prep.py
python ml_model.py
streamlit run app.py
```

For the LLM tab, install Ollama separately, pull a model, and start Ollama. The model name is configurable:

```bash
export OLLAMA_MODEL=llama3.2
streamlit run app.py
```

## Important data lesson

`monthly_revenue.csv` matches revenue from `Delivered` orders only, so its `return_rate` is zero. Use `orders.csv` for return analysis. This is intentional to emphasize that students should verify the meaning of aggregates before modeling or prompting an LLM.
