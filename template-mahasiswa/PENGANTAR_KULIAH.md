# Pengantar Kuliah Teknologi Cerdas

## Gambaran umum

Kuliah ini mempelajari cara membangun aplikasi cerdas yang dapat dipertanggungjawabkan, bukan sekadar menjalankan satu model. Mahasiswa akan menghubungkan data, Business Intelligence (BI), Machine Learning (ML), Large Language Model (LLM), antarmuka aplikasi, dan keputusan manusia dalam satu proyek semester.

Arsitektur acuannya adalah:

```text
masalah → data → validasi → BI → ML → LLM → aplikasi → keputusan manusia
```

Setiap panah harus dapat dijelaskan. Jika satu komponen tidak diperlukan, mahasiswa harus dapat memberikan alasan teknis dan kontekstual.

## Capaian pembelajaran

Setelah menyelesaikan kuliah, mahasiswa diharapkan mampu:

1. merumuskan masalah, stakeholder, unit analisis, target, dan kriteria keberhasilan;
2. memeriksa provenance, lisensi, semantik, kualitas, serta keterbatasan data;
3. membangun pipeline data dan ML tanpa data leakage;
4. memilih baseline, metrik, threshold, dan analisis error yang sesuai;
5. meng-ground LLM pada bukti yang dapat ditelusuri serta menguji keluarannya;
6. mengintegrasikan pipeline ke aplikasi Python/Streamlit;
7. mereproduksi eksperimen dan mengomunikasikan hasil dengan jujur;
8. mempertahankan keputusan desain dan kode melalui demo atau ujian lisan.

## Peta semester

| Tahap | Minggu | Fokus | Artefak utama |
|---|---:|---|---|
| Orientasi | 1–2 | problem framing, sumber data, Git | pernyataan masalah |
| Data & BI | 3–5 | semantik, validasi, EDA, feature engineering | data card dan temuan BI |
| Machine Learning | 6–10 | baseline, pipeline, evaluasi, interpretasi | model dan error analysis |
| LLM & aplikasi | 11–13 | grounding, prompt, integrasi Streamlit | aplikasi end-to-end |
| Adapt/Create | 14–15 | kontribusi, verifikasi, etika | eksperimen final |
| Pertahanan | 16 | paper, demo, code defense | laporan dan presentasi |

## Cara belajar dengan repository ini

Gunakan repository secara berurutan:

1. **Pahami** konsep melalui slide.
2. **Reproduksi** `simulation/` dan cocokkan outputnya.
3. **Jelaskan** setiap tahap melalui `PENJELASAN_KODE_REFERENSI.md`.
4. **Adaptasikan** pipeline pada dataset lain di `proyek_adaptasi/`.
5. **Ciptakan** problem dan data sendiri di `proyek_orisinal/` bila mengambil jalur Create.
6. **Laporkan** semua keputusan, hasil, keterbatasan, serta kontribusi pada paper akhir.

## Prinsip akademik dan etika

- Tidak boleh memalsukan data, metrik, eksperimen, sitasi, atau hasil pengguna.
- Bantuan AI harus diverifikasi; mahasiswa tetap bertanggung jawab atas seluruh isi repository.
- Data sensitif wajib diminimalkan, dianonimkan, dan digunakan berdasarkan izin yang sah.
- Jangan menyimpulkan kausalitas hanya dari korelasi atau skor prediksi.
- LLM tidak boleh diposisikan sebagai sumber fakta bila jawabannya tidak ditopang evidence.
- Keterbatasan sistem harus ditulis sebagai hasil rekayasa yang penting, bukan disembunyikan.

## Hasil akhir minimum

Repository yang dikumpulkan harus berisi kode yang dapat dijalankan, dokumentasi setup, data card, konfigurasi eksperimen, metrik, analisis error, aplikasi/demo, daftar kontribusi, keterbatasan, dan laporan akhir. Detail penilaiannya ada pada [`rubrik_proyek.md`](rubrik_proyek.md).
