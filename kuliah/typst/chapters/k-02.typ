== Hasil akhir pertemuan
<hasil-akhir-pertemuan>
Mahasiswa mampu memeriksa provenance dan lisensi dataset, menetapkan unit observasi, membedakan target dari fitur, serta merumuskan problem ML yang terkait dengan keputusan stakeholder.

#strong[Artefak:] `DATA_DICTIONARY.md` dan problem framing canvas satu halaman.

== Persiapan
<persiapan>
=== Pengajar
<pengajar>
- Siapkan halaman sumber dataset beserta lisensi dan deskripsinya.
- Siapkan empat CSV proyek referensi dan masing-masing lima baris contoh.
- Buat dua framing dari data yang sama: satu layak dan satu kabur/tidak dapat diukur.
- Siapkan contoh kebocoran target yang mudah dikenali.
- Pastikan template data dictionary dapat disalin mahasiswa.

=== Mahasiswa
<mahasiswa>
- Membuka `customers.csv`, `orders.csv`, `product_summary.csv`, dan `monthly_revenue.csv`.
- Membawa satu kandidat dataset yang menarik bagi mereka.

== Agenda 150 menit
<agenda-150-menit>
#figure(
  align(center)[#table(
    columns: (30.77%, 23.08%, 23.08%, 23.08%),
    align: (right,auto,auto,auto,),
    table.header([Waktu], [Tahap 4P-R], [Kegiatan], [Bukti cepat],),
    table.hline(),
    [0--10], [Presentasi], [Retrieval minggu 1 dan target kelas], [diagram enam lapisan],
    [10--35], [Presentasi], [Pitch TAIDA dan bedah framing], [jawaban unit observasi],
    [35--55], [Presentasi], [Demo provenance, lisensi, target, fitur, leakage], [anotasi contoh],
    [55--105], [Praktik], [Audit empat CSV dan menyusun data dictionary], [draft tabel],
    [105--135], [Perform], [Pitch masalah 90 detik dan peer challenge], [canvas direvisi],
    [135--150], [Refleksi], [Exit ticket dan action item], [commit artefak],
  )]
  , kind: table
  )

== Pitch TAIDA
<pitch-taida>
=== Target
<target>
#quote(block: true)[
“Pada akhir kelas, Anda harus mampu menjawab lima pertanyaan sebelum menyentuh model: dari mana data berasal, apa izin penggunaannya, satu baris mewakili apa, apa targetnya, dan keputusan siapa yang akan dibantu.”
]

=== Atensi
<atensi>
Tampilkan `customers.csv` dan `orders.csv`, lalu tanyakan:

#quote(block: true)[
“Jika saya berkata ‘jumlah baris adalah jumlah pelanggan', apakah pernyataan itu benar untuk kedua tabel? Berapa besar kesalahan keputusan jika unit observasinya keliru?”
]

Minta mahasiswa memilih jawaban sebelum memperlihatkan skema lengkap.

=== Interest
<interest>
#quote(block: true)[
“Kaggle memberi file dan kadang memberi kompetisi. Ia tidak otomatis memberi masalah yang bermakna bagi stakeholder. Tanpa framing, target bisa tidak tersedia saat prediksi dilakukan, fitur bisa membocorkan masa depan, dan metrik bisa tidak mewakili biaya keputusan.”
]

Bedakan pertanyaan kabur “prediksi pelanggan” dengan pertanyaan operasional “pelanggan mana yang berisiko churn dalam horizon tertentu agar tim retensi dapat memprioritaskan intervensi?”.

=== Desire
<desire>
Jelaskan problem framing canvas:

+ #strong[Stakeholder:] siapa yang bertindak?
+ #strong[Keputusan:] tindakan apa yang berubah karena keluaran?
+ #strong[Unit observasi:] satu prediksi berlaku untuk apa/siapa?
+ #strong[Target dan horizon:] apa yang diprediksi dan kapan diketahui?
+ #strong[Fitur yang tersedia:] bukti apa yang ada pada waktu keputusan?
+ #strong[Biaya error:] lebih mahal false positive atau false negative?
+ #strong[Batasan:] lisensi, bias, privasi, dan penggunaan yang dilarang.

#quote(block: true)[
“Canvas ini menghemat waktu. Ia mencegah Anda membangun model bagus untuk pertanyaan yang salah.”
]

=== Action
<action>
#quote(block: true)[
“Audit empat tabel referensi. Tulis arti satu baris, kunci, waktu, target jika ada, dan larangan interpretasinya. Setelah itu rumuskan satu masalah keputusan dalam satu kalimat yang dapat diuji.”
]

== Praktik terbimbing
<praktik-terbimbing>
+ Catat sumber, URL, lisensi, tanggal akses, dan pemilik data.
+ Untuk setiap tabel, tulis unit observasi dan primary key yang diharapkan.
+ Klasifikasikan kolom sebagai identifier, fitur kandidat, target, waktu, atau metadata.
+ Tandai fitur yang tidak tersedia pada waktu prediksi.
+ Susun data dictionary: nama, tipe, makna, satuan, nilai hilang, dan batasan.
+ Lengkapi framing canvas dan periksa apakah target dapat diukur.

Pengajar menguji dengan pertanyaan “kapan kolom ini diketahui?” dan “tindakan apa yang benar-benar berubah?”.

== Perform
<perform>
Setiap kelompok menyampaikan pitch 90 detik: stakeholder → keputusan → unit → target → horizon → biaya error. Kelompok lain mengajukan satu serangan leakage atau asumsi domain.

#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([Kriteria], [Perlu revisi], [Memadai], [Kuat],),
    table.hline(),
    [Provenance dan izin], [tidak jelas], [sumber tercatat], [sumber, izin, batasan jelas],
    [Unit dan target], [ambigu], [dapat dikenali], [operasional dan berbatas waktu],
    [Hubungan dengan keputusan], [tidak ada], [umum], [tindakan stakeholder spesifik],
  )]
  , kind: table
  )

== Refleksi
<refleksi>
- Asumsi mana yang sebelumnya saya anggap fakta?
- Kolom apa yang paling berisiko menjadi leakage?
- Informasi apa yang harus saya cari dari pemilik domain?

Tutup dengan pesan: minggu depan mahasiswa akan membuktikan bahwa nama kolom tidak cukup; makna data ditentukan oleh proses pembentukannya.
