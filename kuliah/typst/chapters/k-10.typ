== Hasil akhir pertemuan
<hasil-akhir-pertemuan>
Mahasiswa mampu membedakan interpretasi global dan bukti lokal, membaca feature importance secara hati-hati, menganalisis error, serta menyatakan apa yang diketahui dan tidak diketahui model.

#strong[Artefak:] interpretation note “What the model knows / does not know”.

== Persiapan
<persiapan>
=== Pengajar
<pengajar>
- Siapkan grafik feature importance model referensi.
- Siapkan contoh korelasi kuat yang bukan sebab.
- Pilih beberapa FP/FN dengan profil berbeda.
- Siapkan skenario distribution shift dan pertanyaan fairness.
- Buat contoh klaim interpretasi yang terlalu kuat untuk dikritik.

=== Mahasiswa
<mahasiswa>
- Membawa error analysis minggu 9.
- Memilih satu fitur penting dan menulis dugaan maknanya.

== Agenda 150 menit
<agenda-150-menit>
#figure(
  align(center)[#table(
    columns: (30.77%, 23.08%, 23.08%, 23.08%),
    align: (right,auto,auto,auto,),
    table.header([Waktu], [Tahap 4P-R], [Kegiatan], [Bukti cepat],),
    table.hline(),
    [0--15], [Presentasi], [Kritik klaim kausal], [versi klaim diperbaiki],
    [15--40], [Presentasi], [Pitch TAIDA: interpretasi bukan sebab], [batas inferensi],
    [40--60], [Presentasi], [Demo global importance dan local evidence], [dua level dibedakan],
    [60--110], [Praktik], [Error slicing, shift, dan fairness review], [interpretation note],
    [110--135], [Perform], [Red-team klaim antarkelompok], [revisi note],
    [135--150], [Refleksi], [Exit ticket], [kalimat batasan],
  )]
  , kind: table
  )

== Pitch TAIDA
<pitch-taida>
=== Target
<target>
#quote(block: true)[
“Pada akhir kelas, Anda harus mampu menjelaskan faktor yang digunakan model tanpa mengatakan bahwa faktor itu menyebabkan target. Anda juga harus menyatakan data, populasi, waktu, dan kondisi di luar pengetahuan model.”
]

=== Atensi
<atensi>
Tampilkan kalimat “pelanggan churn karena jumlah transaksinya rendah” di samping grafik feature importance.

#quote(block: true)[
“Apakah grafik ini benar-benar membuktikan kata ‘karena'? Eksperimen apa yang dibutuhkan untuk membuat klaim sebab?”
]

=== Interest
<interest>
#quote(block: true)[
“Interpretasi yang berlebihan dapat mengubah pola statistik menjadi kebijakan yang salah. Feature importance bersifat global dan bergantung pada model serta data; ia bukan penjelasan individual, bukan arah pengaruh, dan bukan bukti kausal.”
]

=== Desire
<desire>
Ajarkan empat lapisan kehati-hatian:

+ #strong[Global:] fitur apa yang banyak dipakai model secara keseluruhan?
+ #strong[Local:] bukti apa pada kasus tertentu yang tersedia di input?
+ #strong[Error:] kelompok kasus mana yang sering salah?
+ #strong[Boundary:] populasi, periode, label, variabel, dan kondisi apa yang tidak tercakup?

Tambahkan pemeriksaan drift, fairness, dan calibration sebagai alasan monitoring, bukan dekorasi laporan.

=== Action
<action>
#quote(block: true)[
“Pilih satu klaim tentang model. Lampirkan bukti yang benar-benar mendukungnya, ubah bahasa kausal menjadi bahasa asosiasi bila perlu, lalu tulis pasangan kalimat: model mengetahui …; model tidak mengetahui ….”
]

== Praktik terbimbing
<praktik-terbimbing>
+ Baca top global feature importance dan cek definisi fiturnya.
+ Nyatakan apa yang dapat dan tidak dapat disimpulkan dari ranking.
+ Bandingkan bukti input pada beberapa TP, FP, FN, dan TN.
+ Iris error menurut kategori yang relevan dan cukup besar.
+ Identifikasi proxy sensitif atau kelompok yang mungkin dirugikan.
+ Bayangkan satu distribution shift dan gejala yang perlu dipantau.
+ Tulis interpretation note dengan evidence dan limitation.

== Perform
<perform>
Kelompok lain berperan sebagai red team dan mengajukan tiga pertanyaan: “buktinya apa?”, “apakah ini sebab?”, dan “siapa yang tidak terwakili?”. Penulis merevisi satu klaim secara langsung.

#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([Kriteria], [Perlu revisi], [Memadai], [Kuat],),
    table.hline(),
    [Interpretasi], [kausal/berlebihan], [bahasa asosiasi], [sesuai jenis bukti dan level],
    [Batas model], [tidak ada], [umum], [data, waktu, populasi spesifik],
    [Error/fairness], [agregat saja], [satu slice], [pola, risiko, tindak lanjut],
  )]
  , kind: table
  )

== Refleksi
<refleksi>
- Kata apa yang akan saya hindari saat menjelaskan feature importance?
- Bukti lokal apa yang sebenarnya tersedia bagi pengguna?
- Kondisi apa yang membuat model harus ditinjau ulang?

Tutup dengan jembatan: minggu depan fokus berpindah ke LLM---model yang sangat lancar berbahasa tetapi juga memerlukan grounding dan batas klaim.
