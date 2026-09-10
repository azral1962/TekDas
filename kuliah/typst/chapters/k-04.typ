== Hasil akhir pertemuan
<hasil-akhir-pertemuan>
Mahasiswa mampu memvalidasi sumber, membersihkan data, membuat fitur beralasan, menentukan snapshot waktu, dan menghasilkan train/test split yang reproducible tanpa leakage.

#strong[Artefak:] prepared dataset, data-quality report, dan catatan alasan split.

== Persiapan
<persiapan>
=== Pengajar
<pengajar>
- Siapkan versi data dengan kolom hilang, tanggal rusak, dan duplikasi key.
- Tandai fungsi utama pada `simulation/data_prep.py`.
- Siapkan demo hasil split dengan dan tanpa `random_state` serta `stratify`.
- Siapkan contoh fitur yang sah dan fitur yang memakai informasi masa depan.
- Pastikan artefak keluaran dapat dihapus/dibuat ulang untuk demonstrasi.

=== Mahasiswa
<mahasiswa>
- Membawa audit note minggu 3.
- Membaca `data_prep.py` dan menandai bagian yang belum dipahami.

== Agenda 150 menit
<agenda-150-menit>
#figure(
  align(center)[#table(
    columns: (30.77%, 23.08%, 23.08%, 23.08%),
    align: (right,auto,auto,auto,),
    table.header([Waktu], [Tahap 4P-R], [Kegiatan], [Bukti cepat],),
    table.hline(),
    [0--15], [Presentasi], [Retrieval semantik dan prediksi risiko], [daftar leakage],
    [15--40], [Presentasi], [Pitch TAIDA: data prep adalah bagian model], [flow pipeline],
    [40--60], [Presentasi], [Code walkthrough dan demo split], [penjelasan parameter],
    [60--110], [Praktik], [Modifikasi terkontrol dan validasi output], [artefak reproducible],
    [110--135], [Perform], [Code defense per kelompok], [alasan fitur/split],
    [135--150], [Refleksi], [Exit ticket dan commit], [catatan keputusan],
  )]
  , kind: table
  )

== Pitch TAIDA
<pitch-taida>
=== Target
<target>
#quote(block: true)[
“Pada akhir kelas, Anda tidak hanya memiliki CSV yang ‘bersih'. Anda harus memiliki proses yang dapat dijalankan ulang, menolak sumber yang tidak valid, membuat fitur dengan alasan waktu yang benar, dan memisahkan train/test secara dapat dipertanggungjawabkan.”
]

=== Atensi
<atensi>
Jalankan model dua kali dengan split acak tanpa seed, lalu tampilkan metrik berbeda.

#quote(block: true)[
“Jika hasil berubah setiap kali laporan dirender, hasil mana yang harus dipercaya? Sekarang bayangkan satu fitur diam-diam berisi informasi setelah pelanggan churn---metrik akan membaik, tetapi apakah modelnya menjadi lebih cerdas?”
]

=== Interest
<interest>
#quote(block: true)[
“Data preparation menentukan apa yang model boleh ketahui. Kesalahan di tahap ini tidak dapat diperbaiki oleh algoritma yang lebih canggih. Leakage bahkan sering memberi hasil yang sangat bagus, sehingga tampak seperti keberhasilan.”
]

=== Desire
<desire>
Jelaskan kontrak pipeline:

+ #strong[Load:] baca sumber tanpa mengubah file asli.
+ #strong[Validate:] pastikan kolom, tipe, key, rentang, dan aturan domain.
+ #strong[Clean:] ubah dengan aturan eksplisit dan terukur.
+ #strong[Engineer:] turunkan fitur yang tersedia pada snapshot prediksi.
+ #strong[Split:] pisahkan data sebelum pembelajaran; gunakan strategi sesuai unit/waktu.
+ #strong[Report:] catat kualitas, seed, ukuran, dan distribusi target.
+ #strong[Persist:] hasil turunan dapat dibuat ulang dari sumber dan kode.

=== Action
<action>
#quote(block: true)[
“Jalankan `data_prep.py`, lalu lakukan satu eksperimen terkendali: ubah atau rusakkan satu asumsi, prediksi akibatnya, jalankan validasi, dan dokumentasikan apakah pipeline gagal dengan cara yang benar.”
]

== Praktik terbimbing
<praktik-terbimbing>
+ Petakan input dan output setiap fungsi `data_prep.py`.
+ Jalankan pipeline dan catat ukuran serta prevalensi target pada setiap split.
+ Jelaskan fungsi `random_state=42` dan `stratify`.
+ Uji satu skenario negatif: kolom wajib hilang, key duplikat, atau tanggal invalid.
+ Audit setiap fitur turunan: sumber, formula, waktu tersedia, alasan.
+ Bandingkan random split dengan time/group split secara konseptual untuk dataset pilihan.
+ Commit prepared data yang diizinkan dan data-quality report.

== Perform
<perform>
Pengajar memilih satu bagian kode secara acak. Kelompok menjelaskan input, transformasi, output, risiko, dan konsekuensi bila satu baris diubah.

#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([Kriteria], [Perlu revisi], [Memadai], [Kuat],),
    table.hline(),
    [Reproducibility], [hasil berubah/tidak tercatat], [seed dan perintah ada], [proses penuh dapat diulang],
    [Leakage reasoning], [tidak dikenali], [mengenali contoh], [memakai snapshot dan konteks],
    [Validasi], [hanya happy path], [cek dasar], [negative test bermakna],
  )]
  , kind: table
  )

== Refleksi
<refleksi>
- Fitur mana yang paling sulit dipastikan waktu ketersediaannya?
- Apa beda membersihkan error dengan menghapus data yang tidak nyaman?
- Jika memakai dataset sendiri, split apa yang paling valid dan mengapa?

Tutup dengan jembatan: prepared data bukan tujuan akhir; minggu depan mahasiswa mengubahnya menjadi informasi BI yang dapat ditindaklanjuti.
