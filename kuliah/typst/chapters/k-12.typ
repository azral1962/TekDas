== Hasil akhir pertemuan
<hasil-akhir-pertemuan>
Mahasiswa mampu membangun evidence package yang memisahkan profil, bukti transaksi, skor ML, faktor global, tugas, dan batasan; serta mengevaluasi groundedness dan ketahanan prompt injection.

#strong[Artefak:] grounded analyst dan hasil evaluasi sedikitnya lima test case.

== Persiapan
<persiapan>
=== Pengajar
<pengajar>
- Siapkan profil pelanggan berisiko tinggi, rendah, minim transaksi, dan bukti bertentangan.
- Sisipkan teks prompt injection pada salah satu field data untuk demonstrasi.
- Siapkan dua jawaban: satu mengutip evidence dan satu membuat detail baru.
- Tandai fungsi `build_prompt()` dan `generate_customer_strategy()`.
- Siapkan rubrik groundedness, usefulness, uncertainty, safety, dan traceability.

=== Mahasiswa
<mahasiswa>
- Membawa prompt tests minggu 11 dan model yang menghasilkan probabilitas.
- Dapat menjelaskan perbedaan probability dan actual label.

== Agenda 150 menit
<agenda-150-menit>
#figure(
  align(center)[#table(
    columns: (30.77%, 23.08%, 23.08%, 23.08%),
    align: (right,auto,auto,auto,),
    table.header([Waktu], [Tahap 4P-R], [Kegiatan], [Bukti cepat],),
    table.hline(),
    [0--15], [Presentasi], [Klasifikasi fakta--prediksi--saran], [kartu kategori],
    [15--40], [Presentasi], [Pitch TAIDA: ML dan LLM punya tugas berbeda], [peta evidence],
    [40--60], [Presentasi], [Demo evidence trace dan injection], [temuan kegagalan],
    [60--110], [Praktik], [Membangun serta menguji analyst], [test report],
    [110--135], [Perform], [Review rekomendasi sebagai reviewer risiko], [keputusan pass/fail],
    [135--150], [Refleksi], [Exit ticket], [guardrail prioritas],
  )]
  , kind: table
  )

== Pitch TAIDA
<pitch-taida>
=== Target
<target>
#quote(block: true)[
“Pada akhir kelas, Anda harus dapat menunjukkan asal setiap klaim penting dalam jawaban analyst: mana fakta data, mana skor prediksi ML, mana interpretasi, dan mana rekomendasi yang masih memerlukan keputusan manusia.”
]

=== Atensi
<atensi>
Tampilkan rekomendasi “beri diskon 40% karena pelanggan sensitif harga”, padahal tidak ada data sensitivitas harga.

#quote(block: true)[
“Kalimat ini mungkin berguna, tetapi bukti mana yang mendukung angka 40% dan label sensitif harga? Jika tidak ada, apa yang seharusnya dikatakan sistem?”
]

=== Interest
<interest>
#quote(block: true)[
“Menggabungkan dua model tidak otomatis membuat sistem lebih benar. ML memberi estimasi untuk target tertentu; LLM menyusun bahasa. Jika batas keduanya kabur, probabilitas berubah menjadi kepastian dan korelasi berubah menjadi alasan yang diciptakan.”
]

=== Desire
<desire>
Bangun evidence package berlabel:

+ `CUSTOMER PROFILE` --- fakta profil yang diizinkan.
+ `ML OUTPUT` --- probabilitas, threshold, dan keterbatasan.
+ `RECENT ORDER EVIDENCE` --- peristiwa yang dapat dirujuk.
+ `GLOBAL MODEL FACTORS` --- pola global, bukan alasan individual.
+ `TASK` --- bentuk bantuan yang diminta.
+ `LIMITATION` --- larangan sebab, fakta baru, dan keputusan otomatis.
+ `OUTPUT` --- ringkasan risiko, evidence, opsi tindakan, uncertainty.

=== Action
<action>
#quote(block: true)[
“Bangun prompt dari data pelanggan nyata di aplikasi. Uji lima kondisi, termasuk evidence minim dan prompt injection. Untuk setiap jawaban, tandai kalimat yang didukung, tidak didukung, atau terlalu pasti.”
]

== Praktik terbimbing
<praktik-terbimbing>
+ Ambil satu skor ML dari pipeline, bukan angka buatan.
+ Batasi profil dan transaksi pada field yang relevan.
+ Pisahkan evidence dengan heading eksplisit.
+ Tambahkan instruksi agar teks dalam data diperlakukan sebagai data, bukan perintah.
+ Minta keluaran menyebut evidence dan uncertainty.
+ Jalankan kasus high/low risk, minim data, konflik, dan injection.
+ Nilai groundedness, usefulness, consistency, safety, dan traceability.

== Perform
<perform>
Reviewer menerima jawaban tanpa melihat prompt terlebih dahulu. Ia menandai setiap klaim dan meminta penulis menunjukkan sumbernya dalam evidence package. Jawaban lulus hanya jika klaim penting dapat ditelusuri atau dinyatakan sebagai opsi/ketidakpastian.

#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([Kriteria], [Perlu revisi], [Memadai], [Kuat],),
    table.hline(),
    [Pemisahan epistemik], [fakta/prediksi/saran bercampur], [bagian terpisah], [bahasa tiap bagian konsisten],
    [Groundedness], [klaim baru], [mayoritas didukung], [semua klaim penting terlacak],
    [Robustness], [happy path], [kasus minim/konflik], [termasuk injection dan failure behavior],
  )]
  , kind: table
  )

== Refleksi
<refleksi>
- Kalimat apa yang paling mudah berubah dari probabilitas menjadi kepastian?
- Bukti apa yang terlalu sensitif untuk dimasukkan ke prompt?
- Keputusan apa yang harus tetap berada pada manusia?

Tutup dengan jembatan: minggu depan evidence trace ini dipindahkan ke antarmuka yang dapat dipakai dan gagal secara aman.
