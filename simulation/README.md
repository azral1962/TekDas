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
```

## Validate the vAI analyst without Streamlit

Install Ollama separately, then run these commands before starting `app.py`:

```bash
ollama serve
ollama pull llama3.2
python vai_analyst.py
```

Run `ollama serve` in a separate terminal and leave it active. A successful validation prints an Indonesian retention recommendation and exits with status code 0. A connection or model error prints corrective commands and exits with status code 1.

Useful standalone options:

```bash
python vai_analyst.py --model llama3.2
python vai_analyst.py --prompt-only
```

The first option selects a model. The second prints and validates the prompt structure without contacting Ollama.

After the standalone test succeeds, start the dashboard:

```bash
streamlit run app.py
```

## Important data lesson

`monthly_revenue.csv` matches revenue from `Delivered` orders only, so its `return_rate` is zero. Use `orders.csv` for return analysis. This is intentional to emphasize that students should verify the meaning of aggregates before modeling or prompting an LLM.
