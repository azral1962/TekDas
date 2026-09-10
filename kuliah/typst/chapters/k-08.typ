== Hasil akhir pertemuan
<hasil-akhir-pertemuan>
Mahasiswa menunjukkan pemahaman individual terhadap pipeline referensi dengan menjelaskan input--proses--output, menemukan risiko, dan memprediksi konsekuensi perubahan kode.

#strong[Artefak:] lembar UTS/code defense dan umpan balik individual.

== Persiapan
<persiapan>
=== Pengajar
<pengajar>
- Siapkan beberapa paket potongan kode setara dari data prep, pipeline, metrik, dan LLM.
- Buat rubrik yang sama untuk seluruh mahasiswa.
- Siapkan pertanyaan utama dan probe lanjutan, bukan jawaban hafalan.
- Tentukan alur antrean/stasiun agar waktu individual efisien.
- Pastikan akomodasi dan aturan integritas akademik diumumkan.

=== Mahasiswa
<mahasiswa>
- Membawa repository yang telah dijalankan.
- Meninjau kode minggu 1--7; tidak perlu menghafal syntax.
- Siap menjelaskan dengan diagram atau contoh baris data.

== Agenda 150 menit
<agenda-150-menit>
#figure(
  align(center)[#table(
    columns: (30.77%, 23.08%, 23.08%, 23.08%),
    align: (right,auto,auto,auto,),
    table.header([Waktu], [Tahap 4P-R], [Kegiatan], [Bukti cepat],),
    table.hline(),
    [0--15], [Presentasi], [Briefing target, format, dan rubrik], [mahasiswa memahami aturan],
    [15--25], [Presentasi], [Contoh mini-defense dan cara berpikir keras], [respons contoh],
    [25--125], [Perform], [Defense individual/stasiun; tugas tertulis saat menunggu], [lembar penilaian],
    [125--140], [Praktik], [Perbaikan satu miskonsepsi dari feedback], [koreksi tertulis],
    [140--150], [Refleksi], [Refleksi individual], [rencana penguatan],
  )]
  , kind: table
  )

== Pitch TAIDA
<pitch-taida>
=== Target
<target>
#quote(block: true)[
“UTS hari ini mengukur apakah Anda memahami kode yang Anda jalankan. Anda akan menjelaskan aliran data, menemukan satu risiko, dan memprediksi dampak perubahan. Nilai diberikan pada alasan yang dapat diuji, bukan pada kecepatan menghafal syntax.”
]

=== Atensi
<atensi>
Tampilkan dua jawaban: satu penuh jargon tetapi tidak menjawab input/output, satu sederhana dengan contoh baris data dan konsekuensi jelas.

#quote(block: true)[
“Jawaban mana yang menunjukkan penguasaan? Dalam praktik profesional, kita harus dapat menjelaskan sistem saat dokumentasi tidak lengkap dan saat kode berubah.”
]

=== Interest
<interest>
#quote(block: true)[
“Kode hasil salin-tempel, tutorial, atau AI dapat berjalan tanpa dipahami. Ketika data bergeser atau error muncul, pemilik sistem tetap harus mempertanggungjawabkannya. Defense menguji kemampuan yang tidak terlihat dari screenshot aplikasi.”
]

=== Desire
<desire>
Berikan pola jawaban lima langkah:

+ Nyatakan tujuan blok kode.
+ Sebutkan bentuk dan makna input.
+ Jelaskan transformasi penting.
+ Sebutkan bentuk dan pengguna output.
+ Uji batas: apa yang gagal atau berubah bila asumsi diubah?

#quote(block: true)[
“Anda boleh berhenti sejenak, menggambar, dan memperbaiki jawaban. Yang dinilai adalah kualitas penalaran.”
]

=== Action
<action>
#quote(block: true)[
“Saat mendapat potongan kode, berpikirlah keras menggunakan lima langkah tadi. Setelah umpan balik, tulis satu koreksi yang menunjukkan apa yang sekarang Anda pahami lebih baik.”
]

== Perform
<perform>
=== Protokol
<protokol>
Setiap mahasiswa memperoleh kurang lebih 20 menit, disesuaikan dengan jumlah penguji/stasiun:

+ Dua menit membaca konteks.
+ Menjelaskan tujuan, input, proses, dan output.
+ Menjawab satu pertanyaan “mengapa?”.
+ Menemukan bug, risiko, atau asumsi.
+ Memprediksi konsekuensi satu perubahan kode.

Contoh probe:

- “Kapan informasi pada kolom ini tersedia?”
- “Apa yang dipelajari saat `fit`?”
- “Mengapa metrik dapat berubah walaupun model sama?”
- “Apa yang terjadi jika `stratify` dihapus?”
- “Bagaimana Anda membuktikan jawaban LLM memakai evidence?”

== Rubrik
<rubrik>
#figure(
  align(center)[#table(
    columns: (20%, 20%, 20%, 20%, 20%),
    align: (auto,auto,auto,auto,auto,),
    table.header([Kriteria], [1 --- Awal], [2 --- Berkembang], [3 --- Baik], [4 --- Kuat],),
    table.hline(),
    [Input--output], [tidak tepat], [sebagian], [runtut], [runtut dengan bentuk/makna],
    [Alasan teknis], [mengulang syntax], [alasan umum], [alasan sesuai konteks], [membandingkan trade-off],
    [Risiko/debugging], [tidak menemukan], [risiko kabur], [risiko relevan], [mengusulkan uji/perbaikan],
    [Konsekuensi perubahan], [menebak], [sebagian], [benar], [benar dan dapat diverifikasi],
  )]
  , kind: table
  )

== Praktik korektif
<praktik-korektif>
Setelah defense, mahasiswa menerima satu miskonsepsi prioritas. Mereka memperbaiki jawaban dalam format “sebelumnya saya mengira …; sekarang saya memahami …; bukti yang akan saya gunakan adalah ….”

== Refleksi
<refleksi>
- Bagian mana yang dapat saya jalankan tetapi belum dapat saya jelaskan?
- Pertanyaan penguji mana yang mengubah pemahaman saya?
- Satu latihan apa yang akan saya lakukan sebelum mengubah pipeline?

Tutup dengan arah minggu 9: setelah mampu mempertahankan pipeline, mahasiswa akan menguji apakah cara menilai model benar-benar sesuai biaya error.
