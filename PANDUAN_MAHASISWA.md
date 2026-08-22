# Panduan Mahasiswa

## 1. Fork dan identitas

1. Klik **Fork** pada repository kelas.
2. Gunakan nama repository sesuai format yang ditetapkan dosen.
3. Clone fork ke komputer.
4. Tambahkan identitas di bawah ini.

| Item | Isi mahasiswa |
|---|---|
| Nama | TODO |
| NIM | TODO |
| Kelas | TODO |
| URL repository | TODO |
| Jalur | Reproduce / Adapt / Create |
| Judul sementara | TODO |

Jangan mengubah riwayat Git repository sumber. Simpan pekerjaan pada fork sendiri dan commit secara berkala.

## 2. Branch dan commit

Branch `main` harus selalu berisi versi yang dapat diperiksa. Untuk perubahan besar, gunakan branch fitur, misalnya:

```bash
git switch -c feat/data-preparation
git add .
git commit -m "feat: tambah validasi dan pembersihan data"
git switch main
git merge feat/data-preparation
```

Pesan commit yang disarankan: `docs:`, `data:`, `feat:`, `fix:`, `test:`, atau `experiment:`.

## 3. Memilih jalur

### Reproduce

Kerjakan langsung pada salinan folder `simulation/`. Catat environment, output, dua eksperimen perubahan parameter/threshold, dan penjelasan kode. Mengubah warna dashboard atau nama variabel saja bukan adaptasi substantif.

### Adapt

Kerjakan pada `proyek_adaptasi/`. Dataset, target/problem, semantik, validasi, fitur, evaluasi, prompt, dan tampilan harus disesuaikan. Ikuti README di folder tersebut.

### Create

Kerjakan pada `proyek_orisinal/`. Mulai dari proposal dan data card sebelum menulis sistem. Problem, provenance data, baseline, eksperimen, evaluasi, dan kontribusi harus dirancang sendiri.

## 4. Bukti perkembangan

Setiap milestone minimal menghasilkan:

| Milestone | Bukti yang disimpan |
|---|---|
| Problem framing | problem statement, stakeholder, keputusan, success criteria |
| Data | tautan/sumber, lisensi, data dictionary, pemeriksaan kualitas |
| BI | tabel/grafik dan interpretasi yang menjawab pertanyaan |
| ML baseline | konfigurasi, split, metrik, confusion matrix/error analysis |
| Model lanjut | perbandingan adil terhadap baseline |
| LLM | prompt, evidence yang dikirim, uji groundedness/usefulness |
| Aplikasi | instruksi menjalankan dan screenshot/demo |
| Final | paper, daftar kontribusi, keterbatasan, commit/tag rilis |

## 5. Checklist sebelum pengumpulan

- [ ] Identitas, judul, dan jalur sudah diisi.
- [ ] README proyek menjelaskan setup dan perintah menjalankan.
- [ ] Sumber, lisensi/izin, dan tanggal akses data terdokumentasi.
- [ ] Tidak ada password, token, API key, atau data pribadi di Git.
- [ ] Train/test split dilakukan sebelum transformasi yang dapat menyebabkan leakage.
- [ ] Baseline dan metrik sesuai dengan problem serta distribusi target.
- [ ] Hasil dapat dibuat ulang dari source code.
- [ ] Klaim paper sama dengan output kode terakhir.
- [ ] Penggunaan AI dan kontribusi pihak lain diungkapkan.
- [ ] Keterbatasan dan risiko etika ditulis.
- [ ] Aplikasi berhasil dijalankan pada environment bersih.
- [ ] Versi final diberi Git tag sesuai aturan kelas.

## 6. Yang dikumpulkan

Kumpulkan URL fork dan tag/commit final. Dataset besar, model, atau video dapat disimpan di penyimpanan eksternal; repository tetap harus memuat tautan, checksum/versi, serta instruksi untuk memperolehnya secara sah.
