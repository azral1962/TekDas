# Proyek Adaptasi — Dataset Berbeda

Folder ini adalah workspace jalur **Adapt**. Pilih dataset yang berbeda dari `simulation/`, lalu sesuaikan seluruh pipeline berdasarkan problem dan semantik data baru.

## Identitas proyek

| Item | Isi mahasiswa |
|---|---|
| Judul | TODO |
| Dataset dan URL | TODO |
| Lisensi | TODO |
| Tanggal akses | TODO |
| Unit observasi | TODO |
| Target | TODO |
| Stakeholder/keputusan | TODO |
| Metrik utama dan alasan | TODO |

Lengkapi juga [`DATA_CARD.md`](DATA_CARD.md) sebelum training.

## Struktur

```text
proyek_adaptasi/
├── data/
│   ├── raw/          # data sumber lokal; tidak otomatis di-commit
│   └── processed/    # split yang dihasilkan data_prep.py
├── artifacts/        # model, metrik, prediksi; tidak otomatis di-commit
├── config.py         # kontrak dataset dan fitur
├── data_prep.py      # load, validasi, cleaning, split
├── train.py          # baseline, model utama, evaluasi
├── llm.py            # prompt grounded dan pemanggilan Ollama opsional
└── app.py            # aplikasi Streamlit
```

## Cara mulai

1. Periksa bahwa dataset boleh digunakan dan didistribusikan. Bila tidak, simpan hanya URL dan instruksi download.
2. Letakkan file CSV di `data/raw/`.
3. Isi seluruh TODO di `config.py`.
4. Sesuaikan validasi/cleaning pada `data_prep.py`.
5. Tentukan baseline, model, metrik, dan threshold di `train.py`.
6. Ubah konteks prompt pada `llm.py`.
7. Bangun BI dan UX yang sesuai stakeholder di `app.py`.

```bash
cd proyek_adaptasi
python -m pip install -r requirements.txt
python data_prep.py
python train.py
python llm.py --prompt-only
streamlit run app.py
```

## Syarat adaptasi substantif

- Dataset dan problem berbeda dari proyek referensi.
- Unit observasi, target, data dictionary, dan batasan data dijelaskan.
- Validasi serta feature engineering mengikuti semantik dataset baru.
- Split menghindari leakage; gunakan group/time split bila random split tidak valid.
- Baseline dan metrik sesuai biaya error stakeholder.
- Model utama dibandingkan secara adil terhadap baseline.
- Prompt hanya menggunakan evidence yang tersedia dan keluarannya diuji.
- Dashboard menjawab tugas pengguna, bukan menyalin empat tab tanpa alasan.
- README, kode, output, dan laporan saling konsisten.

Mengganti CSV tetapi mempertahankan asumsi customer churn tanpa pemeriksaan bukan adaptasi.
