"""Prompt grounded untuk proyek Adapt; sesuaikan peran dan kriteria evaluasi."""

import argparse
import json
import os

import ollama

DEFAULT_MODEL = os.getenv("OLLAMA_MODEL", "llama3.2")


def build_prompt(record: dict, prediction: object, metrics: dict) -> str:
    evidence = {
        "record": record,
        "prediction": prediction,
        "model_evaluation": metrics,
    }
    return f"""Anda adalah analis untuk [TODO: stakeholder dan keputusan].

Gunakan hanya EVIDENCE_JSON di bawah. Jangan membuat fakta yang tidak tersedia.
Pisahkan dengan jelas: (1) bukti, (2) inferensi, (3) rekomendasi.
Jika bukti tidak cukup, nyatakan informasi apa yang hilang.

EVIDENCE_JSON:
{json.dumps(evidence, indent=2, default=str)}

Tugas:
1. Jelaskan prediksi dengan bahasa yang sesuai pengguna.
2. Berikan paling banyak tiga tindakan yang terkait langsung dengan bukti.
3. Sebutkan ketidakpastian dan batas penggunaan prediksi.
"""


def generate(prompt: str, model: str = DEFAULT_MODEL) -> str:
    response = ollama.chat(model=model, messages=[{"role": "user", "content": prompt}])
    return response["message"]["content"]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--prompt-only", action="store_true")
    parser.add_argument("--model", default=DEFAULT_MODEL)
    args = parser.parse_args()

    example = build_prompt(
        record={"TODO_feature": "TODO_value"},
        prediction="TODO_class",
        metrics={"TODO_metric": 0.0},
    )
    print(example)
    if not args.prompt_only:
        print(generate(example, args.model))


if __name__ == "__main__":
    main()
