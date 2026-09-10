== Hasil akhir pertemuan
<hasil-akhir-pertemuan>
Mahasiswa mampu menjelaskan supervised learning, membedakan fitur, target, probabilitas, dan kelas; membangun baseline; serta menilai generalization dan risiko overfitting/leakage.

#strong[Artefak:] baseline report yang mencatat strategi, metrik test, dan keterbatasan.

== Persiapan
<persiapan>
=== Pengajar
<pengajar>
- Siapkan contoh klasifikasi churn beserta `X`, `y`, train, dan test.
- Siapkan tebakan mayoritas sebagai baseline dan Random Forest sebagai pembanding.
- Buat contoh probabilitas yang sama tetapi kelas berbeda akibat threshold.
- Siapkan kurva sederhana yang menggambarkan underfit dan overfit.
- Pastikan data hasil minggu 4 tersedia.

=== Mahasiswa
<mahasiswa>
- Membawa prepared train/test data.
- Mengingat kembali target, unit observasi, dan biaya error proyek.

== Agenda 150 menit
<agenda-150-menit>
#figure(
  align(center)[#table(
    columns: (30.77%, 23.08%, 23.08%, 23.08%),
    align: (right,auto,auto,auto,),
    table.header([Waktu], [Tahap 4P-R], [Kegiatan], [Bukti cepat],),
    table.hline(),
    [0--15], [Presentasi], [Dari pertanyaan BI ke pertanyaan prediktif], [klasifikasi pertanyaan],
    [15--40], [Presentasi], [Pitch TAIDA tentang belajar dari contoh], [diagram fit/predict],
    [40--60], [Presentasi], [Demo baseline, probabilitas, generalization], [prediksi manual],
    [60--110], [Praktik], [Melatih dan membandingkan baseline], [baseline report],
    [110--135], [Perform], [Model explanation tanpa jargon], [penjelasan dua menit],
    [135--150], [Refleksi], [Exit ticket], [risiko utama],
  )]
  , kind: table
  )

== Pitch TAIDA
<pitch-taida>
=== Target
<target>
#quote(block: true)[
“Pada akhir kelas, Anda harus mampu menjelaskan apa yang dipelajari model, dari data mana ia belajar, pada data mana ia diuji, dan mengapa model harus mengalahkan baseline sebelum disebut berguna.”
]

=== Atensi
<atensi>
Tampilkan dataset dengan sekitar 80--90% kelas negatif dan model yang selalu menjawab “tidak churn”.

#quote(block: true)[
“Model ini tidak belajar apa pun, tetapi accuracy-nya tinggi. Apakah ia cerdas? Siapa yang dirugikan oleh keputusan ini?”
]

=== Interest
<interest>
#quote(block: true)[
“Tanpa baseline dan pemisahan test, model kompleks dapat terlihat hebat hanya karena target tidak seimbang atau karena kita menilai pada data yang sudah dilihat. Tugas kita bukan membuat angka tinggi, melainkan mengukur kemampuan generalisasi.”
]

=== Desire
<desire>
Jelaskan siklus supervised learning:

+ `X` memuat bukti yang tersedia pada waktu prediksi.
+ `y` memuat jawaban historis yang ingin dipelajari.
+ `fit(X_train, y_train)` mencari pola pada data latihan.
+ `predict_proba(X_test)` memberi skor, bukan kepastian.
+ Threshold mengubah skor menjadi tindakan/kelas.
+ Metrik test membandingkan hasil dengan label yang tidak dipakai saat fit.
+ Baseline menetapkan batas minimum manfaat.

=== Action
<action>
#quote(block: true)[
“Bangun baseline paling sederhana yang masuk akal, catat kinerjanya pada test set, lalu bandingkan dengan model referensi. Jangan hanya laporkan model mana menang---jelaskan jenis kesalahan yang masih dibuat.”
]

== Praktik terbimbing
<praktik-terbimbing>
+ Pisahkan `X_train`, `y_train`, `X_test`, dan `y_test`.
+ Hitung prevalensi target dan tebakan kelas mayoritas.
+ Latih baseline yang sesuai.
+ Jalankan model referensi dan dapatkan probabilitas.
+ Bandingkan hasil train dan test untuk indikasi overfitting.
+ Ambil lima kasus dan bedakan probability dari predicted class.
+ Tulis keterbatasan: data, label, sampling, dan leakage yang masih mungkin.

== Perform
<perform>
Mahasiswa menjelaskan kepada pasangan yang berperan sebagai stakeholder:

- apa yang masuk dan keluar dari model;
- mengapa test set tidak dipakai untuk belajar;
- apakah model mengalahkan baseline;
- satu alasan model belum siap dipakai.

#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([Kriteria], [Perlu revisi], [Memadai], [Kuat],),
    table.hline(),
    [Konsep train/test], [tertukar], [benar], [benar dan terkait generalization],
    [Baseline], [tidak ada], [ada], [relevan dan dibandingkan adil],
    [Probability/class], [dianggap sama], [dibedakan], [dikaitkan dengan threshold/aksi],
  )]
  , kind: table
  )

== Refleksi
<refleksi>
- Mengapa model kompleks belum tentu lebih berguna?
- Apa tanda overfitting yang dapat saya periksa?
- Informasi apa yang tidak boleh masuk `X`?

Tutup dengan jembatan: minggu depan seluruh preprocessing dan model dirangkai agar proses training dan inference selalu konsisten.
