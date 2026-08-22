# Laporan Akhir

Gunakan [`../paper_akhir_template.qmd`](../paper_akhir_template.qmd) sebagai naskah utama. Anda boleh menyalinnya ke folder ini bila dosen meminta pemisahan artefak mahasiswa, tetapi pertahankan struktur wajib dan tautan ke evidence.

## Alur kerja

1. Ganti metadata judul, nama, afiliasi, dan track.
2. Tulis research/engineering questions yang benar-benar diuji.
3. Masukkan tabel/gambar dari output kode, bukan angka yang diketik tanpa sumber.
4. Cantumkan konfigurasi, baseline, split, metrik, dan analisis error.
5. Jelaskan evidence yang diberikan kepada LLM dan cara mengevaluasi keluarannya.
6. Tulis kontribusi orisinal, penggunaan bantuan AI, keterbatasan, dan risiko etika.
7. Periksa seluruh klaim terhadap commit final.

Render HTML:

```bash
quarto render paper_akhir_template.qmd --to html
```

Render PDF memerlukan distribusi LaTeX:

```bash
quarto render paper_akhir_template.qmd --to pdf
```

Simpan gambar pada `laporan_akhir/assets/` dengan nama deskriptif dan resolusi yang memadai. Jangan memasukkan screenshot tabel bila tabel Quarto dapat dibuat dari data.

## Checklist paper

- [ ] Abstract memuat angka hasil utama.
- [ ] Sumber, versi, lisensi/izin, dan unit observasi data jelas.
- [ ] Split dan pencegahan leakage dijelaskan.
- [ ] Model dibandingkan dengan baseline.
- [ ] Metrik utama sesuai biaya error stakeholder.
- [ ] Ada error analysis, bukan hanya skor agregat.
- [ ] Klaim LLM diuji terhadap evidence.
- [ ] Kontribusi sendiri dibedakan dari library/referensi/bantuan AI.
- [ ] Keterbatasan dan risiko ditulis secara spesifik.
- [ ] Semua tabel, gambar, dan referensi dirujuk dalam teks.
