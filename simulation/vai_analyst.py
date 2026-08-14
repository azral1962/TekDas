"""LLM layer: turn ML output + business facts into an explainable action suggestion.

The default model can be changed without editing code:
    OLLAMA_MODEL=llama3.2 python vai_analyst.py
"""
import os
from typing import Any, Dict, Iterable
import ollama

DEFAULT_MODEL = os.getenv("OLLAMA_MODEL", "llama3.2")


def _compact_dict(data: Dict[str, Any], keys: Iterable[str]) -> Dict[str, Any]:
    return {k: data.get(k) for k in keys if k in data}


def build_prompt(
    customer_profile: Dict[str, Any],
    churn_probability: float,
    recent_orders: list | None = None,
    model_factors: list | None = None,
) -> str:
    """Build a grounded prompt students can inspect before calling the LLM."""
    profile = _compact_dict(customer_profile, [
        "customer_id", "country", "age", "gender", "membership_tier",
        "total_orders", "total_spend_usd", "avg_order_value_usd",
        "days_since_last_purchase", "preferred_category", "preferred_device",
        "preferred_payment_method", "acquisition_channel", "reviews_given",
        "avg_review_score", "returns_made", "wishlist_items",
        "newsletter_subscribed",
    ])

    return f"""
You are a Business Intelligence teaching assistant.
Use ONLY the supplied data. The machine-learning score is a prediction, not a proven cause.
Do not invent customer facts, motives, income, complaints, or future behavior.

CUSTOMER PROFILE
{profile}

ML OUTPUT
Predicted probability of churn: {churn_probability:.1%}

RECENT ORDER EVIDENCE
{recent_orders or 'No order rows available for this customer.'}

GLOBAL MODEL FACTORS
{model_factors or 'Not supplied.'}

TASK
Write in Indonesian for a business manager:
1. One sentence interpreting the churn probability.
2. Two evidence-based observations from the supplied customer/order data.
3. Two practical retention actions that are proportional to the evidence.
4. One short caution stating what cannot be concluded from this model.
Keep the answer concise and use bullet points.
""".strip()


def generate_customer_strategy(
    customer_profile: Dict[str, Any],
    churn_probability: float,
    recent_orders: list | None = None,
    model_factors: list | None = None,
    model: str = DEFAULT_MODEL,
) -> str:
    prompt = build_prompt(
        customer_profile=customer_profile,
        churn_probability=churn_probability,
        recent_orders=recent_orders,
        model_factors=model_factors,
    )

    try:
        response = ollama.chat(
            model=model,
            messages=[{"role": "user", "content": prompt}],
            options={"temperature": 0.2},
        )
        return response["message"]["content"]
    except Exception as exc:
        return (
            f"Tidak dapat menghubungi Ollama model '{model}'. "
            f"Pastikan `ollama serve` aktif dan model sudah tersedia. Detail: {exc}"
        )


if __name__ == "__main__":
    demo_customer = {
        "customer_id": "C-DEMO",
        "membership_tier": "Free",
        "total_orders": 4,
        "total_spend_usd": 286.63,
        "days_since_last_purchase": 120,
        "preferred_category": "Electronics",
        "newsletter_subscribed": 0,
    }
    print(build_prompt(demo_customer, 0.72))
