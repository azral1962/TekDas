# Memasang Template di GitHub

Folder `template-mahasiswa/` sudah mandiri dan dapat dijadikan root repository baru. Jalankan perintah berikut **dari dalam folder tersebut**, bukan dari repository induk.

## 1. Buat repository kosong di GitHub

Buat repository baru pada akun/organisasi kelas. Jangan tambahkan README, `.gitignore`, atau license dari GitHub karena semuanya sudah tersedia di folder ini.

Contoh nama:

```text
template-proyek-teknologi-cerdas
```

## 2. Inisialisasi dan unggah

```bash
cd template-mahasiswa
git init
git add .
git commit -m "chore: initialize student project template"
git branch -M main
git remote add origin https://github.com/USERNAME/template-proyek-teknologi-cerdas.git
git push -u origin main
```

Ganti `USERNAME` dan nama repository sesuai tujuan sebenarnya.

## 3. Penggunaan oleh mahasiswa

Mahasiswa membuka repository kelas, memilih **Fork**, lalu bekerja hanya pada fork masing-masing. Dosen membagikan URL repository sumber yang sama kepada seluruh kelas.

Setelah fork:

```bash
git clone https://github.com/USERNAME-MAHASISWA/NAMA-FORK.git
cd NAMA-FORK
python -m venv .venv
```

Instruksi berikutnya berada di [`README.md`](README.md) dan [`PANDUAN_MAHASISWA.md`](PANDUAN_MAHASISWA.md).

## 4. Pemeriksaan sebelum publikasi

```bash
python -m compileall -q simulation proyek_adaptasi
quarto render --to html
```

Pastikan repository tidak memuat token, password, `.env`, data sensitif, virtual environment, model besar, atau dataset yang tidak boleh didistribusikan.

## 5. Memperbarui template

Perubahan materi dilakukan pada repository sumber dosen. Mahasiswa tidak wajib menarik perubahan setelah proyek dimulai kecuali ada instruksi khusus, karena merge besar dapat menimpa pekerjaan mereka.
