== Hasil akhir pertemuan
<hasil-akhir-pertemuan>
Mahasiswa mampu membedakan tabel entitas, transaksi, dan agregat; memeriksa join serta missing value; dan menemukan sedikitnya satu jebakan semantik yang dapat menghasilkan kesimpulan BI yang salah.

#strong[Artefak:] audit note berisi temuan, bukti kode, dampak, dan perbaikan.

== Persiapan
<persiapan>
=== Pengajar
<pengajar>
- Siapkan contoh satu pelanggan dengan banyak order untuk menunjukkan perubahan grain.
- Siapkan perbandingan revenue pada `orders.csv` dan `monthly_revenue.csv`.
- Siapkan demo join benar dan many-to-many join yang menggandakan nilai.
- Siapkan contoh missing value yang berarti “tidak tercatat”, bukan nol.
- Tandai anomali `monthly_revenue.return_rate` sebagai semantics trap.

=== Mahasiswa
<mahasiswa>
- Membawa data dictionary minggu 2.
- Dapat menjalankan Pandas dan membuka notebook/terminal interaktif.

== Agenda 150 menit
<agenda-150-menit>
#figure(
  align(center)[#table(
    columns: (30.77%, 23.08%, 23.08%, 23.08%),
    align: (right,auto,auto,auto,),
    table.header([Waktu], [Tahap 4P-R], [Kegiatan], [Bukti cepat],),
    table.hline(),
    [0--15], [Presentasi], [Retrieval unit observasi dan diagnostic join], [prediksi jumlah baris],
    [15--40], [Presentasi], [Pitch TAIDA tentang grain dan agregasi], [hipotesis jebakan],
    [40--55], [Presentasi], [Live demo audit semantik], [hasil perhitungan],
    [55--105], [Praktik], [Audit tabel, join, missing, dan agregat], [notebook/catatan],
    [105--135], [Perform], [Presentasi “klaim--bukti--dampak--perbaikan”], [audit note],
    [135--150], [Refleksi], [Exit ticket], [aturan audit pribadi],
  )]
  , kind: table
  )

== Pitch TAIDA
<pitch-taida>
=== Target
<target>
#quote(block: true)[
“Hari ini Anda akan belajar membaca data sebagai jejak proses, bukan sekadar tabel. Pada akhir kelas, Anda harus dapat menjelaskan grain setiap tabel dan membuktikan satu kesimpulan yang akan salah jika tabel atau agregasinya dipakai tanpa konteks.”
]

=== Atensi
<atensi>
Tampilkan nilai `return_rate = 0` pada seluruh baris agregat bulanan.

#quote(block: true)[
“Apakah ini berarti bisnis tidak pernah mengalami retur? Jika dashboard menampilkan nol persen, apakah dashboard itu benar, salah, atau hanya menjawab pertanyaan yang berbeda?”
]

=== Interest
<interest>
#quote(block: true)[
“Kesalahan BI yang mahal sering bukan syntax error. Kodenya berjalan dan grafiknya indah, tetapi penyebutnya salah, join menggandakan baris, missing dianggap nol, atau agregat telah membuang kejadian yang ingin kita ukur. Komputer tidak akan memperingatkan kita tentang makna.”
]

=== Desire
<desire>
Ajarkan urutan pemeriksaan:

+ Tentukan grain sebelum menghitung.
+ Periksa key unik dan relasi antar-key.
+ Prediksi jumlah baris sebelum join.
+ Bandingkan jumlah baris dan total sebelum/sesudah join.
+ Bedakan missing, nol, dan tidak berlaku.
+ Telusuri definisi filter pada tabel agregat.
+ Tulis klaim hanya sebesar bukti yang tersedia.

#quote(block: true)[
“Dengan tujuh langkah ini, Anda dapat menghentikan angka yang tampak sah tetapi sebenarnya menjawab pertanyaan lain.”
]

=== Action
<action>
#quote(block: true)[
“Bekerjalah sebagai auditor. Cari satu jebakan semantik pada data referensi, buktikan dengan kode, jelaskan keputusan apa yang bisa salah, lalu usulkan sumber atau perhitungan yang benar.”
]

== Praktik terbimbing
<praktik-terbimbing>
+ Tulis grain keempat tabel tanpa melihat catatan minggu sebelumnya.
+ Uji uniqueness untuk setiap key yang dianggap primary key.
+ Hitung jumlah customer dan order sebelum melakukan join.
+ Join customer--order; verifikasi jumlah baris dan total revenue.
+ Profilkan missing value dan jelaskan kemungkinan maknanya.
+ Bandingkan `monthly_revenue.return_rate` dengan perhitungan return dari `orders.csv`.
+ Susun audit note: klaim awal, query/kode, hasil, interpretasi, dampak.

== Perform
<perform>
Kelompok menyajikan satu temuan dalam dua menit dengan format:

#quote(block: true)[
“Kami menguji …; bukti menunjukkan …; jika diabaikan, keputusan … dapat salah; perbaikannya adalah ….”
]

#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([Kriteria], [Perlu revisi], [Memadai], [Kuat],),
    table.hline(),
    [Grain dan join], [tidak dipahami], [benar sebagian], [benar dan terverifikasi],
    [Bukti], [opini], [hasil tanpa kontrol], [kode serta cek silang],
    [Dampak], [abstrak], [masuk akal], [terkait keputusan spesifik],
  )]
  , kind: table
  )

== Refleksi
<refleksi>
- Kapan agregat berguna, dan kapan ia berbahaya?
- Pemeriksaan apa yang paling cepat mengungkap join salah?
- Tuliskan satu aturan yang akan selalu dilakukan sebelum membuat grafik.

Tutup dengan jembatan: setelah makna sumber dipahami, minggu depan data dipersiapkan secara reproducible tanpa membocorkan masa depan.
