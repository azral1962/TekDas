# Teknologi Cerdas — Project-First Course Package

Paket ini menjadikan proyek rujukan **Kaggle → Business Intelligence → Machine Learning → LLM → Streamlit**
sebagai "reference implementation" untuk satu semester.

## Berkas utama

- `RPS_Teknologi_Cerdas.qmd` — Rencana Pembelajaran Semester lengkap.
- `slides/01_...qmd` s.d. `slides/16_...qmd` — 16 deck RevealJS Quarto.
- `paper_akhir_template.qmd` — template laporan akhir berbentuk paper Quarto.
- `rubrik_proyek.md` — rubrik rinci dan aturan originality ladder C/B/A.
- `references.bib` — referensi awal.
- `_quarto.yml` — konfigurasi proyek Quarto.

## Originality ladder

- **Jalur C — Reproduce:** mengulangi proyek rujukan dengan benar dan mampu menjelaskan kode.
- **Jalur B — Adapt:** mengganti dataset dengan dataset Kaggle lain dan menyesuaikan problem, skema data,
  preprocessing, fitur, target, model, prompt, serta dashboard.
- **Jalur A — Create:** merumuskan problem sendiri, mengembangkan kode secara substantif, dan
  membangun/mengumpulkan data sendiri secara sah dan terdokumentasi.

Jalur menentukan **batas maksimum nilai**; kualitas implementasi, pemahaman, validitas evaluasi,
dokumentasi, dan ujian lisan tetap harus memenuhi rubrik.

## Menjalankan slides

```bash
quarto preview slides/01_orientasi.qmd
```

atau render semua:

```bash
quarto render
```

## Prinsip kuliah

> Data memberi bukti. BI mendeskripsikan keadaan. ML mempelajari pola untuk prediksi/estimasi.
> LLM membantu penalaran berbasis bahasa dan komunikasi, tetapi tidak menggantikan bukti maupun evaluasi model.
