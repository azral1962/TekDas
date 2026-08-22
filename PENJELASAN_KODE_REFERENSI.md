# Penjelasan Kode Proyek Referensi

Folder [`simulation/`](simulation/) memperlihatkan alur end-to-end **data → BI → ML → LLM → Streamlit** untuk kasus prediksi customer churn. Kode ini adalah bahan belajar, bukan jawaban yang cukup untuk jalur Adapt atau Create.

## 1. Peta arsitektur

```text
customers.csv ─┐
orders.csv ────┼─> data_prep.py ─> train/test CSV ─> ml_model.py
product_*.csv ─┤                                      │
monthly_*.csv ─┘                                      ├─> model + metrics
                                                       │
data mentah + model + metrics ─────────────────────────┼─> app.py
                                                       │
                                                vai_analyst.py ─> Ollama
```

Tanggung jawab dipisahkan agar setiap tahap dapat diuji dan dijelaskan. `app.py` tidak melatih model; aplikasi hanya memuat hasil pipeline yang sudah dibuat.

## 2. Data sumber

| File | Unit observasi | Peran |
|---|---|---|
| `customers.csv` | satu pelanggan | profil, fitur agregat, dan target `churned` |
| `orders.csv` | satu transaksi | perilaku transaksi, status, return, rating |
| `product_summary.csv` | satu produk | agregat performa produk |
| `monthly_revenue.csv` | satu bulan | tren delivered revenue |

Semantik agregat penting: `monthly_revenue.csv` hanya merepresentasikan revenue order berstatus `Delivered`, sehingga `return_rate` pada file tersebut selalu nol. Analisis return harus memakai `orders.csv`. Ini adalah contoh mengapa nama kolom tidak boleh dipercaya tanpa verifikasi.

## 3. `data_prep.py`

Tujuan file ini adalah membuat data model secara deterministik dan memeriksa asumsi data sedini mungkin.

### Konstanta skema

`TARGET`, `ID_COLUMN`, `CATEGORICAL_COLUMNS`, `NUMERIC_COLUMNS`, dan `FEATURE_COLUMNS` menjadi kontrak antara preprocessing, training, dan aplikasi. Perubahan schema harus dilakukan secara konsisten pada kontrak ini.

### `load_source_data()`

Fungsi memuat empat CSV dari folder file Python, bukan dari current working directory. Penggunaan `Path(__file__).resolve().parent` membuat perintah lebih stabil saat dijalankan dari lokasi berbeda.

### `validate_sources()`

Fungsi memeriksa kolom wajib dan berhenti dengan error yang jelas bila dataset tidak sesuai. Validasi ini mencegah pipeline menghasilkan output diam-diam dari input yang salah.

### `prepare_customer_features()`

Fungsi:

1. mengubah tanggal registrasi menjadi tipe datetime;
2. menentukan umur pelanggan relatif terhadap tanggal snapshot;
3. membuat `orders_per_year`, `reviews_per_order`, dan `returns_per_order`;
4. menjaga fitur kategorikal sebagai teks;
5. mengembalikan hanya ID, fitur, dan target yang disepakati.

Encoding belum dilakukan di sini. Imputasi dan one-hot encoding berada di dalam pipeline Scikit-learn agar hanya dipelajari dari train set dan tidak membocorkan informasi test set.

### `build_data_quality_report()`

Fungsi menghasilkan pemeriksaan kualitas dan rekonsiliasi agregat sebagai JSON. Nilainya dipakai sebagai audit trail, bukan hanya pesan sementara di terminal.

### `main()`

`main()` menjalankan urutan lengkap, membuat split stratified 80/20 dengan `random_state=42`, lalu menyimpan data model dan laporan kualitas. ID dipertahankan pada file edukasi agar prediksi dapat ditelusuri kembali ke baris sumber; ID tidak masuk ke fitur model.

## 4. `ml_model.py`

### `build_pipeline()`

Pipeline memiliki dua jalur transformasi:

- numerik: missing value diisi dengan median;
- kategorikal: missing value diisi dengan modus lalu diubah menggunakan one-hot encoding.

Keduanya digabungkan oleh `ColumnTransformer`, kemudian diteruskan ke `RandomForestClassifier`. `class_weight="balanced"` dipakai karena kelas churn merupakan minoritas, tetapi pilihan ini tetap harus dibandingkan dengan baseline.

### Training dan evaluasi

Model dilatih hanya pada `customer_train.csv`, lalu dievaluasi pada `customer_test.csv`. Kode mencatat accuracy, precision, recall, F1, ROC-AUC, confusion matrix, dan prevalensi target pada test set.

Accuracy tidak cukup untuk data imbalance. Contoh: bila hanya 10% pelanggan churn, model yang selalu memilih “tidak churn” mencapai accuracy 90% tetapi recall churn 0%.

### Artefak

| Artefak | Kegunaan |
|---|---|
| `customer_churn_pipeline.pkl` | preprocessing dan model yang sudah fit |
| `model_metrics.json` | hasil evaluasi yang dapat dibaca aplikasi/paper |
| `feature_importance.csv` | importance global dari Random Forest |
| `customer_predictions.csv` | prediksi test set yang dapat ditelusuri lewat ID |

Feature importance menunjukkan asosiasi yang digunakan model, bukan hubungan kausal.

## 5. `vai_analyst.py`

File ini memisahkan pembuatan prompt dari pemanggilan Ollama. Prompt menerima profil pelanggan, probabilitas churn, transaksi terbaru, dan faktor model. Grounding membatasi konteks yang boleh dipakai LLM serta meminta model membedakan bukti, inferensi, dan rekomendasi.

Mode `--prompt-only` dapat dipakai untuk memeriksa struktur prompt tanpa menginstal atau menjalankan model LLM:

```bash
cd simulation
python vai_analyst.py --prompt-only
```

Keluaran LLM tidak otomatis benar. Evaluasi minimal harus memeriksa dukungan bukti, konsistensi dengan skor ML, tindakan yang dapat dilakukan, dan tidak adanya klaim yang dibuat-buat.

## 6. `app.py`

Streamlit menyatukan empat lapisan:

1. **Kaggle Data:** inspeksi tabel dan makna setiap sumber;
2. **Business Intelligence:** tren revenue, kategori, dan riwayat transaksi;
3. **Machine Learning:** probabilitas churn, threshold, label, dan metrik;
4. **LLM Analyst:** prompt grounded dan rekomendasi berbasis konteks.

`@st.cache_data` digunakan untuk data, sedangkan `@st.cache_resource` untuk model. Aplikasi menghitung fitur pelanggan dengan fungsi yang sama seperti saat training untuk mencegah training-serving skew.

## 7. Urutan menjalankan

```bash
python -m pip install -r requirements.txt
cd simulation
python data_prep.py
python ml_model.py
python vai_analyst.py --prompt-only
streamlit run app.py
```

Untuk LLM lokal, jalankan `ollama serve`, unduh model yang disepakati, lalu validasi `python vai_analyst.py`. Aplikasi tetap dapat memuat bagian data/BI/ML tanpa memanggil LLM.

## 8. Pertanyaan code defense

Mahasiswa harus mampu menjawab, dengan menunjuk kode dan output:

1. Apa unit observasi dan target pada setiap tahap?
2. Mengapa ID tidak menjadi fitur?
3. Mengapa encoding ditempatkan di dalam pipeline?
4. Apa yang akan terjadi bila split dilakukan setelah preprocessing seluruh data?
5. Mengapa accuracy dapat menyesatkan?
6. Bagaimana threshold mengubah false positive dan false negative?
7. Apakah feature importance berarti sebab-akibat?
8. Evidence apa yang diterima LLM dan apa yang tidak?
9. Bagaimana mendeteksi hallucination pada rekomendasi?
10. Bagian apa yang wajib berubah ketika dataset diganti?

## 9. Batas antara Reproduce dan Adapt

Eksperimen parameter, threshold, atau visualisasi pada dataset yang sama masih termasuk Reproduce. Adapt menuntut perubahan yang lahir dari dataset dan problem baru: schema, validasi, feature engineering, split, baseline, metrik, prompt, serta keputusan desain aplikasi.
