# Template Proyek Teknologi Cerdas

Repository ini adalah template kerja satu semester yang **di-fork oleh setiap mahasiswa**. Alur proyeknya bertahap:

```text
pelajari materi → jalankan proyek referensi → adaptasi dataset → proyek orisinal → laporan akhir
```

## Mulai di sini

1. Dosen menerbitkan folder ini sebagai repository GitHub mengikuti [`GITHUB_SETUP.md`](GITHUB_SETUP.md).
2. Fork repository tersebut ke akun GitHub Anda.
3. Clone hasil fork, lalu buat virtual environment Python.
4. Baca [Panduan Mahasiswa](PANDUAN_MAHASISWA.md) dan [Pengantar Kuliah](PENGANTAR_KULIAH.md).
5. Ikuti slide pada folder [`slides/`](slides/).
6. Jalankan proyek referensi pada folder [`simulation/`](simulation/).
7. Kerjakan jalur yang disepakati pada [`proyek_adaptasi/`](proyek_adaptasi/) atau [`proyek_orisinal/`](proyek_orisinal/).
8. Tulis hasilnya menggunakan [`paper_akhir_template.qmd`](paper_akhir_template.qmd).

## Isi repository

| Bagian | Fungsi | Boleh diubah mahasiswa? |
|---|---|---|
| `PENGANTAR_KULIAH.md` | tujuan, capaian, dan alur kuliah | tidak perlu |
| `slides/` | slide pertemuan 1–16 | tidak perlu |
| `PENJELASAN_KODE_REFERENSI.md` | peta dan penjelasan kode contoh | tidak perlu |
| `simulation/` | proyek Python referensi end-to-end | untuk eksperimen jalur Reproduce |
| `proyek_adaptasi/` | scaffold untuk dataset berbeda | ya, untuk jalur Adapt |
| `proyek_orisinal/` | proposal, data card, dan log eksperimen | ya, untuk jalur Create |
| `paper_akhir_template.qmd` | template laporan akhir | ya, salin/ubah untuk laporan |
| `rubrik_proyek.md` | rubrik dan originality gate | tidak |
| `RPS_Teknologi_Cerdas.qmd` | rencana pembelajaran semester | tidak |

## Jalur penilaian

- **Reproduce (maksimum C):** jalankan proyek referensi, pahami kode, dan lakukan eksperimen terkontrol.
- **Adapt (maksimum B):** gunakan dataset berbeda serta ubah problem, validasi, fitur, model, evaluasi, prompt, dan dashboard secara relevan.
- **Create (maksimum A):** rumuskan masalah, data, metode, eksperimen, dan aplikasi secara orisinal serta terdokumentasi.

Jalur hanya menentukan batas maksimum. Kualitas teknis, pemahaman, validitas evaluasi, etika, dokumentasi, demo, dan laporan tetap dinilai menggunakan [`rubrik_proyek.md`](rubrik_proyek.md).

## Instalasi cepat

Persyaratan: Python 3.11+ dan Git. Quarto hanya diperlukan untuk merender materi/laporan.

```bash
python -m venv .venv
```

Aktifkan environment:

```bash
# Windows PowerShell
.venv\Scripts\Activate.ps1

# macOS/Linux
source .venv/bin/activate
```

Kemudian:

```bash
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

Jalankan proyek referensi:

```bash
cd simulation
python data_prep.py
python ml_model.py
streamlit run app.py
```

LLM lokal melalui Ollama bersifat opsional pada tahap awal. Petunjuknya tersedia di [`simulation/README.md`](simulation/README.md).

## Materi dan laporan Quarto

```bash
quarto preview
quarto render
quarto render paper_akhir_template.qmd
```

Hasil website kuliah berada di `docs/`. Jangan menyunting file hasil render secara langsung; ubah berkas sumber `.qmd` atau `.md`.

## Aturan repository mahasiswa

- Jangan commit `.venv`, token, kata sandi, API key, model berukuran besar, atau dataset yang lisensinya melarang redistribusi.
- Cantumkan sumber, lisensi/izin, tanggal akses, unit observasi, target, dan data dictionary.
- Simpan kode dan konfigurasi agar eksperimen dapat direproduksi.
- Gunakan commit kecil dengan pesan yang menjelaskan perubahan.
- Isi checklist pada [`PANDUAN_MAHASISWA.md`](PANDUAN_MAHASISWA.md) sebelum pengumpulan.

> Prinsip kuliah: data memberi bukti; BI mendeskripsikan keadaan; ML mempelajari pola; LLM membantu interpretasi berbasis bukti; manusia tetap bertanggung jawab atas keputusan.
