== Hasil akhir pertemuan
<hasil-akhir-pertemuan>
Mahasiswa mampu membangun pipeline scikit-learn untuk fitur numerik dan kategorikal, menjelaskan imputation dan one-hot encoding, serta mencegah inkonsistensi preprocessing dan leakage.

#strong[Artefak:] pipeline reproducible yang dapat di-fit, disimpan, dimuat, dan digunakan untuk inference.

== Persiapan
<persiapan>
=== Pengajar
<pengajar>
- Siapkan satu baris inference dengan kategori yang tidak muncul saat training.
- Siapkan anti-pattern preprocessing seluruh data sebelum split.
- Tandai `ColumnTransformer`, `SimpleImputer`, `OneHotEncoder`, dan `Pipeline` pada kode.
- Siapkan diagram cabang numerik/kategorikal yang bergabung ke classifier.
- Verifikasi serialisasi pipeline dengan `joblib`.

=== Mahasiswa
<mahasiswa>
- Membawa baseline report.
- Membaca `simulation/ml_model.py` dan menandai komponen pipeline.

== Agenda 150 menit
<agenda-150-menit>
#figure(
  align(center)[#table(
    columns: (30.77%, 23.08%, 23.08%, 23.08%),
    align: (right,auto,auto,auto,),
    table.header([Waktu], [Tahap 4P-R], [Kegiatan], [Bukti cepat],),
    table.hline(),
    [0--15], [Presentasi], [Debug preprocessing manual], [daftar kegagalan],
    [15--40], [Presentasi], [Pitch TAIDA: satu kontrak transformasi], [diagram pipeline],
    [40--65], [Presentasi], [Code walkthrough dan live inference], [kategori baru berhasil],
    [65--110], [Praktik], [Membangun dan menguji pipeline], [model tersimpan],
    [110--135], [Perform], [Code defense dan negative test], [bukti test],
    [135--150], [Refleksi], [Exit ticket], [prinsip pipeline],
  )]
  , kind: table
  )

== Pitch TAIDA
<pitch-taida>
=== Target
<target>
#quote(block: true)[
“Pada akhir kelas, Anda harus memiliki satu objek pipeline yang membawa aturan preprocessing bersama model, sehingga training dan inference memperlakukan data dengan cara yang sama.”
]

=== Atensi
<atensi>
Masukkan kategori baru ke encoder manual dan tampilkan error.

#quote(block: true)[
“Aplikasi bekerja saat demo kemarin, tetapi gagal ketika pelanggan pertama dari kategori baru datang. Di mana kesalahannya---pada model, data, atau kontrak transformasi?”
]

=== Interest
<interest>
#quote(block: true)[
“Banyak model gagal di produksi bukan karena algoritmanya buruk, melainkan karena langkah manual saat training tidak identik dengan inference. Lebih serius lagi, preprocessing sebelum split dapat mempelajari informasi dari test set.”
]

=== Desire
<desire>
Jelaskan arsitektur:

+ Daftar fitur numerik dan kategorikal dinyatakan eksplisit.
+ Numerik diisi dengan strategi yang konsisten.
+ Kategorikal diimputasi dan di-one-hot encode.
+ `handle_unknown="ignore"` menangani kategori baru tanpa mengarang urutan.
+ `ColumnTransformer` menjalankan cabang sesuai tipe.
+ `Pipeline` menggabungkan preprocessing dan classifier.
+ Cross-validation/fit hanya mempelajari parameter dari training fold.

=== Action
<action>
#quote(block: true)[
“Bangun pipeline dari awal, simpan, muat kembali, lalu uji pada satu baris dengan missing value dan kategori baru. Jika berhasil, jelaskan mengapa keberhasilan itu berasal dari desain pipeline, bukan kebetulan.”
]

== Praktik terbimbing
<praktik-terbimbing>
+ Audit daftar fitur terhadap data dictionary.
+ Buat numeric dan categorical transformer.
+ Gabungkan dengan `ColumnTransformer`.
+ Tambahkan classifier ke `Pipeline`.
+ Fit hanya pada training data dan evaluasi pada test data.
+ Simpan serta muat pipeline dengan `joblib`.
+ Uji missing value, kategori baru, dan kolom hilang.

== Perform
<perform>
Pengajar memilih komponen secara acak. Mahasiswa menjelaskan apa yang dipelajari saat `fit`, apa yang terjadi saat `predict`, dan risiko bila komponen dikerjakan di luar pipeline.

#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([Kriteria], [Perlu revisi], [Memadai], [Kuat],),
    table.hline(),
    [Struktur], [preprocessing terpisah/tidak konsisten], [pipeline berjalan], [kontrak fitur jelas dan modular],
    [Leakage], [tidak dikenali], [split sebelum fit], [reasoning fold/inference benar],
    [Robustness], [hanya happy path], [satu negative test], [kategori baru, missing, schema diuji],
  )]
  , kind: table
  )

== Refleksi
<refleksi>
- Mengapa kategori tidak cukup diganti angka 0, 1, 2?
- Apa yang sebenarnya dipelajari oleh imputer dan encoder?
- Bagaimana memastikan input aplikasi identik dengan input training?

Tutup dengan pengingat: minggu 8 mahasiswa harus mampu mempertahankan kode ini secara lisan, bukan sekadar menjalankannya.
