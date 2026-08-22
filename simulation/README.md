# Proyek Referensi — Kaggle BI + ML + LLM

Proyek pembelajaran ini menghubungkan **CSV → Business Intelligence → Machine Learning → LLM analyst → Streamlit** untuk kasus customer churn. Baca penjelasan per fungsi pada [`../PENJELASAN_KODE_REFERENSI.md`](../PENJELASAN_KODE_REFERENSI.md).

## Isi proyek

- `customers.csv`: data tingkat pelanggan dan target `churned`;
- `orders.csv`: evidence tingkat transaksi;
- `product_summary.csv`: agregasi tingkat produk;
- `monthly_revenue.csv`: agregasi bulanan delivered revenue;
- `data_prep.py`: validasi, cleaning, feature engineering, dan train/test split;
- `ml_model.py`: pipeline Scikit-learn dan evaluasi Random Forest;
- `vai_analyst.py`: grounded prompt dan pemanggilan Ollama lokal;
- `app.py`: dashboard Streamlit yang menggabungkan semua lapisan.

## Menjalankan

```bash
pip install -r requirements.txt
python data_prep.py
python ml_model.py
```

## Memvalidasi vAI analyst tanpa Streamlit

Instal Ollama secara terpisah, lalu jalankan perintah berikut sebelum `app.py`:

```bash
ollama serve
ollama pull llama3.2
python vai_analyst.py
```

Jalankan `ollama serve` pada terminal terpisah dan biarkan aktif. Validasi yang berhasil menampilkan rekomendasi retensi dalam bahasa Indonesia. Error koneksi/model akan menampilkan petunjuk perbaikan.

Opsi mandiri:

```bash
python vai_analyst.py --model llama3.2
python vai_analyst.py --prompt-only
```

Opsi pertama memilih model. Opsi kedua mencetak dan memeriksa struktur prompt tanpa menghubungi Ollama.

Setelah pengujian mandiri berhasil, jalankan dashboard:

```bash
streamlit run app.py
```

## Pelajaran penting tentang data

`monthly_revenue.csv` hanya cocok dengan revenue order berstatus `Delivered`, sehingga `return_rate` bernilai nol. Gunakan `orders.csv` untuk analisis return. Hal ini disengaja untuk menunjukkan bahwa makna agregat harus diverifikasi sebelum modeling atau prompting LLM.

## Status sebagai proyek referensi

Menjalankan kode ini apa adanya termasuk jalur Reproduce. Untuk jalur Adapt, gunakan workspace `proyek_adaptasi/` dan ubah keputusan pipeline berdasarkan dataset lain. Untuk jalur Create, mulai dari proposal pada `proyek_orisinal/`.
