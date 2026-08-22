# Proyek Orisinal — Create

Folder ini adalah workspace jalur **Create**. Tidak ada pipeline siap pakai karena arsitektur harus lahir dari masalah, data, risiko, dan kebutuhan pengguna yang Anda rumuskan sendiri.

## Urutan kerja wajib

1. Isi [`PROPOSAL.md`](PROPOSAL.md) dan sepakati scope.
2. Isi [`DATA_CARD.md`](DATA_CARD.md), termasuk provenance, izin, dan risiko.
3. Tentukan baseline dan protokol evaluasi sebelum mengejar model kompleks.
4. Rancang struktur modul pada `src/` dan pengujian pada `tests/`.
5. Catat setiap eksperimen pada [`EXPERIMENT_LOG.md`](EXPERIMENT_LOG.md).
6. Bangun aplikasi/demo yang sesuai dengan tugas stakeholder.
7. Sinkronkan hasil terakhir dengan laporan akhir.

## Struktur yang disarankan

```text
proyek_orisinal/
├── data/
│   ├── raw/          # sumber asli; jangan ditimpa
│   └── processed/    # hasil pipeline yang dapat dibuat ulang
├── artifacts/        # model, metrik, tabel, dan gambar hasil
├── notebooks/        # eksplorasi; logika final tetap dipindah ke src
├── src/              # package/kode produksi milik mahasiswa
├── tests/            # pengujian validasi dan fungsi kritis
├── PROPOSAL.md
├── DATA_CARD.md
└── EXPERIMENT_LOG.md
```

## Kontrak reproduksibilitas

README final proyek harus memberi perintah eksplisit untuk:

```text
1. memperoleh data secara sah
2. menyiapkan environment
3. memvalidasi dan memproses data
4. melatih baseline dan model
5. mengevaluasi serta membuat artefak
6. menjalankan aplikasi/demo
7. menjalankan tests
```

Tambahkan versi package pada `requirements.txt` atau `pyproject.toml`. Jangan commit secret, data sensitif, dataset/model besar, atau artefak yang tidak boleh didistribusikan.

## Kriteria orisinalitas

Jelaskan dengan bukti apa yang benar-benar dibuat sendiri: rumusan masalah, proses memperoleh data, schema/data dictionary, feature engineering, arsitektur, eksperimen, evaluasi usefulness, UX, dan kontribusi teknis. Menggabungkan tutorial atau kode hasil AI tanpa pemahaman dan atribusi tidak memenuhi jalur Create.
