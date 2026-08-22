# Kode sumber

Rancang modul berdasarkan kebutuhan proyek. Pemisahan yang lazim—tetapi tidak wajib—adalah:

- `config.py`: konfigurasi dan seed;
- `data.py`: load, schema validation, cleaning, split;
- `features.py`: transformasi/feature engineering;
- `train.py`: baseline dan training;
- `evaluate.py`: metrik, error analysis, dan artefak;
- `llm.py`: grounding, prompt, guardrail, evaluasi;
- `app.py`: antarmuka aplikasi.

Hindari menaruh seluruh sistem di satu notebook. Fungsi penting harus dapat diimpor dan diuji.
