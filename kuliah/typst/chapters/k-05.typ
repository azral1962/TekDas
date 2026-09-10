== Hasil akhir pertemuan
<hasil-akhir-pertemuan>
Mahasiswa mampu memilih KPI berdasarkan keputusan stakeholder, menghitungnya dari grain yang tepat, membuat tren dan drill-down, serta membedakan klaim deskriptif dari prediksi.

#strong[Artefak:] BI mini-dashboard dengan definisi KPI dan satu insight yang dapat diverifikasi.

== Persiapan
<persiapan>
=== Pengajar
<pengajar>
- Siapkan dashboard yang ramai tetapi tidak memiliki pertanyaan keputusan.
- Siapkan versi ringkas dengan empat KPI, tren waktu, dan drill-down.
- Verifikasi definisi customer count, order count, delivered revenue, return rate, dan churn rate.
- Siapkan contoh perubahan filter yang mengubah penyebut KPI.
- Siapkan checklist dashboard: audience, question, metric, grain, filter, action.

=== Mahasiswa
<mahasiswa>
- Membawa prepared dataset dan audit semantik.
- Menuliskan satu keputusan stakeholder dari framing minggu 2.

== Agenda 150 menit
<agenda-150-menit>
#figure(
  align(center)[#table(
    columns: (30.77%, 23.08%, 23.08%, 23.08%),
    align: (right,auto,auto,auto,),
    table.header([Waktu], [Tahap 4P-R], [Kegiatan], [Bukti cepat],),
    table.hline(),
    [0--15], [Presentasi], [Kritik dua dashboard], [alasan pilihan],
    [15--40], [Presentasi], [Pitch TAIDA: BI sebelum prediksi], [pertanyaan bisnis],
    [40--60], [Presentasi], [Demo groupby, tren, filter, drill-down], [rekonsiliasi angka],
    [60--110], [Praktik], [Membangun mini-dashboard], [tampilan berjalan],
    [110--135], [Perform], [Walkthrough keputusan tiga menit], [insight + bukti],
    [135--150], [Refleksi], [Exit ticket], [revisi definisi KPI],
  )]
  , kind: table
  )

== Pitch TAIDA
<pitch-taida>
=== Target
<target>
#quote(block: true)[
“Pada akhir kelas, setiap grafik Anda harus memiliki alasan keberadaan. Anda akan membuat dashboard yang menjawab pertanyaan stakeholder, memakai grain yang benar, dan membedakan dengan tegas apa yang terjadi dari apa yang mungkin terjadi.”
]

=== Atensi
<atensi>
Tampilkan dashboard dengan banyak warna dan grafik, tetapi tanpa judul operasional atau definisi metrik.

#quote(block: true)[
“Anda adalah manajer retensi dan hanya punya tiga menit. Keputusan apa yang dapat Anda ambil dari layar ini? Grafik mana yang sebenarnya tidak membantu?”
]

=== Interest
<interest>
#quote(block: true)[
“Dashboard bukan koleksi grafik. KPI yang tidak punya definisi, penyebut, rentang waktu, dan tindakan dapat menciptakan ilusi pemahaman. Lebih berbahaya lagi, tren deskriptif sering disampaikan seolah-olah prediksi atau sebab.”
]

=== Desire
<desire>
Berikan pola perancangan:

+ Mulai dari audience dan keputusan.
+ Rumuskan pertanyaan deskriptif.
+ Pilih metrik dan tulis definisinya.
+ Ambil data pada grain yang tepat.
+ Tampilkan overview, tren, perbandingan, lalu drill-down.
+ Rekonsiliasi angka terhadap sumber.
+ Tulis insight dengan batas klaim dan tindakan berikutnya.

#quote(block: true)[
“Dashboard yang baik memperpendek jarak antara pertanyaan, bukti, dan tindakan---bukan sekadar memperindah tabel.”
]

=== Action
<action>
#quote(block: true)[
“Bangun mini-dashboard untuk satu stakeholder. Batasi pada empat KPI, satu tren, satu perbandingan kategori, dan satu drill-down. Di bawah setiap komponen, tulis keputusan apa yang dibantu.”
]

== Praktik terbimbing
<praktik-terbimbing>
+ Tulis audience, keputusan, dan tiga pertanyaan BI.
+ Buat tabel definisi KPI: nama, rumus, grain, filter, periode, sumber.
+ Hitung customer count, order count, delivered revenue, return rate, dan churn rate.
+ Rekonsiliasi revenue agregat dengan transaksi delivered.
+ Buat tren bulanan dan kinerja kategori.
+ Tambahkan drill-down pelanggan atau order.
+ Tulis satu insight: observasi → bukti angka → batasan → tindakan.

== Perform
<perform>
Mahasiswa melakukan walkthrough tiga menit tanpa menjelaskan kode terlebih dahulu: siapa pengguna, apa pertanyaannya, apa bukti utamanya, dan tindakan apa yang mungkin dilakukan.

#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([Kriteria], [Perlu revisi], [Memadai], [Kuat],),
    table.hline(),
    [Relevansi], [grafik tanpa keputusan], [sebagian terkait], [seluruh elemen mendukung tugas],
    [Validitas KPI], [definisi/grain salah], [benar tetapi kurang eksplisit], [terdefinisi dan direkonsiliasi],
    [Klaim], [prediktif/kausal tanpa bukti], [deskriptif], [deskriptif dengan batasan jelas],
  )]
  , kind: table
  )

== Refleksi
<refleksi>
- Grafik apa yang saya hapus, dan mengapa?
- KPI mana yang paling mudah disalahartikan?
- Pertanyaan stakeholder mana yang tidak dapat dijawab oleh BI deskriptif?

Gunakan pertanyaan terakhir sebagai jembatan ke minggu 6: ketika keputusan membutuhkan estimasi untuk kasus yang belum diketahui, kita memerlukan supervised machine learning.
