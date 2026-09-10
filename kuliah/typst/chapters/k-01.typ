== Hasil akhir pertemuan
<hasil-akhir-pertemuan>
Mahasiswa mampu menjelaskan hubungan data, BI, ML, LLM, aplikasi, dan manusia dalam satu sistem; menjalankan proyek referensi; serta menunjukkan bukti lingkungan kerja yang siap digunakan.

#strong[Artefak:] environment checklist dan tangkapan layar aplikasi/proses yang berhasil dijalankan.

== Persiapan
<persiapan>
=== Pengajar
<pengajar>
- Pastikan repository, Python 3.11+, dan paket pada `requirements.txt` dapat dipasang.
- Siapkan dua contoh: chatbot tanpa data dan aplikasi referensi dengan evidence trace.
- Siapkan diagram `data → BI → ML → LLM → UI → keputusan manusia`.
- Jalankan `simulation/data_prep.py`, `simulation/ml_model.py`, dan aplikasi Streamlit sebelum kelas.
- Siapkan alternatif berupa tangkapan layar jika instalasi mahasiswa bermasalah.

=== Mahasiswa
<mahasiswa>
- Membawa laptop, akun GitHub, dan akses terminal.
- Mengunduh atau melakukan clone repository.
- Membaca bagian awal `README.md` dan `PANDUAN_MAHASISWA.md`.

== Agenda 150 menit
<agenda-150-menit>
#figure(
  align(center)[#table(
    columns: (30.77%, 23.08%, 23.08%, 23.08%),
    align: (right,auto,auto,auto,),
    table.header([Waktu], [Tahap 4P-R], [Kegiatan], [Bukti cepat],),
    table.hline(),
    [0--10], [Presentasi], [Pembukaan, kontrak, dan diagnosis pengalaman awal], [jawaban polling],
    [10--35], [Presentasi], [Pitch TAIDA: apa yang membuat teknologi “cerdas”], [peta konsep awal],
    [35--50], [Presentasi], [Demo alur proyek referensi], [mahasiswa menyebutkan lima lapisan],
    [50--100], [Praktik], [Menyiapkan environment dan menjalankan pipeline], [terminal tanpa error],
    [100--130], [Perform], [Demo berpasangan dan penjelasan alur], [checklist tervalidasi],
    [130--150], [Refleksi], [Exit ticket dan komitmen minggu berikutnya], [refleksi tiga kalimat],
  )]
  , kind: table
  )

== Pitch TAIDA
<pitch-taida>
=== Target
<target>
#quote(block: true)[
“Hari ini target kita bukan menghafal definisi AI. Pada akhir kelas, Anda harus mampu menunjukkan satu sistem cerdas yang berjalan dan menjelaskan fungsi data, BI, ML, LLM, antarmuka, serta keputusan manusia di dalamnya.”
]

Tampilkan target di layar dan minta mahasiswa menggarisbawahi dua kata kerja: #strong[menjalankan] dan #strong[menjelaskan].

=== Atensi
<atensi>
Tampilkan dua keluaran: jawaban chatbot yang terdengar meyakinkan tetapi tanpa sumber, lalu rekomendasi pelanggan dari aplikasi yang menyertakan profil, transaksi, dan skor model.

#quote(block: true)[
“Keduanya terdengar cerdas. Mana yang lebih layak dipakai untuk mengambil keputusan bisnis? Jika jawabannya salah, siapa yang bertanggung jawab?”
]

Tahan jawaban selama 30 detik. Ambil tiga pendapat yang berbeda.

=== Interest
<interest>
#quote(block: true)[
“Masalah utama bukan kekurangan model canggih. Masalahnya adalah kita sering tidak bisa menelusuri dari mana sebuah jawaban berasal. Dashboard dapat terlihat hebat tetapi salah membaca agregat; model dapat akurat tetapi bocor; LLM dapat lancar tetapi mengarang. Karena itu teknologi cerdas harus dipahami sebagai sistem bukti.”
]

Hubungkan kebutuhan ini dengan proyek semester: mahasiswa akan membangun rantai yang dapat diperiksa dari data hingga keputusan.

=== Desire
<desire>
Jelaskan cara kerja sistem secara singkat:

+ Data merekam fakta dengan unit observasi tertentu.
+ BI mendeskripsikan apa yang terjadi.
+ ML mempelajari pola untuk memprediksi target.
+ LLM mengomunikasikan dan mengontekstualkan bukti.
+ UI membuat alur dapat digunakan.
+ Manusia memeriksa risiko dan mengambil keputusan.

#quote(block: true)[
“Jika Anda menguasai rantai ini, Anda tidak hanya dapat membuat demo AI. Anda dapat mempertanggungjawabkan mengapa keluaran muncul, kapan ia berguna, dan kapan ia tidak boleh dipercaya.”
]

=== Action
<action>
#quote(block: true)[
“Sekarang buktikan sistemnya. Dalam kelompok dua orang, siapkan environment, jalankan data preparation dan model, lalu buka aplikasi. Setelah berhasil, tunjuk satu elemen data, satu keluaran BI, satu prediksi ML, dan satu bagian yang masih memerlukan keputusan manusia.”
]

== Praktik terbimbing
<praktik-terbimbing>
+ Buat dan aktifkan virtual environment.
+ Instal dependensi dari `requirements.txt`.
+ Masuk ke `simulation/` dan jalankan `python data_prep.py`.
+ Jalankan `python ml_model.py` dan periksa artefak metrik.
+ Jalankan `streamlit run app.py`.
+ Telusuri empat tab aplikasi dan catat fungsi tiap tab.

Pengajar berkeliling menggunakan urutan diagnosis: versi Python → environment aktif → lokasi folder → paket → pesan error pertama. Hindari mengambil alih keyboard mahasiswa.

== Perform
<perform>
Setiap pasangan melakukan demo dua menit:

- menunjukkan aplikasi atau keluaran pipeline;
- menjelaskan alur data--BI--ML--LLM--manusia tanpa membaca slide;
- menyebutkan satu risiko jika salah satu lapisan dilewati.

#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Kriteria], [0], [1], [2],),
    table.hline(),
    [Sistem berjalan], [belum], [sebagian], [end-to-end],
    [Penjelasan lapisan], [keliru], [sebagian benar], [runtut dan benar],
    [Kesadaran risiko], [tidak ada], [umum], [spesifik pada sistem],
  )]
  , kind: table
  )

== Refleksi
<refleksi>
Minta mahasiswa menulis exit ticket:

+ Lapisan mana yang paling saya pahami?
+ Lapisan mana yang masih saya campuradukkan?
+ Bukti apa yang membuat sebuah sistem layak disebut “cerdas” dan bertanggung jawab?

Tutup dengan pengantar: minggu depan mahasiswa tidak langsung memilih algoritma; mereka belajar mengubah dataset menjadi masalah yang sah dan terukur.
