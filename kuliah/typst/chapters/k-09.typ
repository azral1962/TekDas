== Hasil akhir pertemuan
<hasil-akhir-pertemuan>
Mahasiswa mampu membaca confusion matrix, menghitung dan menafsirkan precision, recall, F1, dan ROC-AUC, serta memilih threshold berdasarkan biaya false positive/false negative.

#strong[Artefak:] threshold experiment dan error analysis berbasis test set.

== Persiapan
<persiapan>
=== Pengajar
<pengajar>
- Siapkan confusion matrix model referensi dan kasus bisnis retensi.
- Siapkan tabel probabilitas agar threshold dapat dipindahkan secara manual.
- Buat dua skenario biaya: intervensi murah dan intervensi mahal.
- Pastikan probabilitas prediksi test tersedia.
- Siapkan template tabel threshold, precision, recall, F1, FP, dan FN.

=== Mahasiswa
<mahasiswa>
- Membawa metrik model dan baseline.
- Menuliskan siapa yang menanggung FP dan FN pada framing mereka.

== Agenda 150 menit
<agenda-150-menit>
#figure(
  align(center)[#table(
    columns: (30.77%, 23.08%, 23.08%, 23.08%),
    align: (right,auto,auto,auto,),
    table.header([Waktu], [Tahap 4P-R], [Kegiatan], [Bukti cepat],),
    table.hline(),
    [0--15], [Presentasi], [Accuracy trap dan prediksi awal], [pilihan model],
    [15--45], [Presentasi], [Pitch TAIDA serta confusion matrix manusia], [klasifikasi empat kasus],
    [45--60], [Presentasi], [Demo kurva threshold], [hipotesis trade-off],
    [60--110], [Praktik], [Eksperimen beberapa threshold], [tabel dan grafik],
    [110--135], [Perform], [Rekomendasi threshold kepada stakeholder], [memo singkat],
    [135--150], [Refleksi], [Exit ticket], [batas rekomendasi],
  )]
  , kind: table
  )

== Pitch TAIDA
<pitch-taida>
=== Target
<target>
#quote(block: true)[
“Pada akhir kelas, Anda harus dapat menolak kalimat ‘model terbaik adalah yang accuracy-nya paling tinggi' bila konteks tidak mendukungnya. Anda akan memilih threshold berdasarkan jenis kesalahan dan kapasitas tindakan.”
]

=== Atensi
<atensi>
Tawarkan dua model: A ber-accuracy tinggi tetapi hampir tidak menangkap churn; B ber-accuracy sedikit lebih rendah tetapi menemukan lebih banyak churn.

#quote(block: true)[
“Tim retensi hanya dapat menghubungi 100 pelanggan. Model mana yang dipilih? Informasi apa yang masih kurang untuk menjawab secara bertanggung jawab?”
]

=== Interest
<interest>
#quote(block: true)[
“Metrik bukan nilai moral dan tidak ada satu metrik yang selalu benar. Pada target tidak seimbang, accuracy dapat menyembunyikan kegagalan kelas penting. Threshold default 0,5 juga bukan hukum alam; ia adalah keputusan.”
]

=== Desire
<desire>
Bangun pemahaman dari confusion matrix:

+ TP: kasus positif yang berhasil ditemukan.
+ FP: intervensi kepada kasus yang sebenarnya negatif.
+ FN: kasus positif yang terlewat.
+ TN: kasus negatif yang tidak diintervensi.
+ Precision menjawab ketepatan daftar tindakan.
+ Recall menjawab cakupan kasus positif.
+ F1 menyeimbangkan precision--recall; ROC-AUC menilai ranking lintas threshold.
+ Threshold dipilih bersama biaya, kapasitas, dan tujuan stakeholder.

=== Action
<action>
#quote(block: true)[
“Ubah threshold dari 0,3 hingga 0,7. Untuk setiap nilai, hitung TP, FP, FN, TN, precision, recall, dan F1. Pilih satu threshold untuk skenario bisnis yang diberikan dan pertahankan keputusan Anda.”
]

== Praktik terbimbing
<praktik-terbimbing>
+ Pastikan evaluasi hanya memakai test set.
+ Simpan probabilitas, label aktual, dan ID kasus.
+ Hitung confusion matrix pada minimal lima threshold.
+ Plot precision dan recall terhadap threshold.
+ Inspeksi contoh false positive dan false negative.
+ Hubungkan jumlah kasus yang ditandai dengan kapasitas intervensi.
+ Tulis rekomendasi serta asumsi biaya yang digunakan.

== Perform
<perform>
Kelompok menyampaikan memo satu menit:

#quote(block: true)[
“Kami merekomendasikan threshold … karena …; konsekuensinya adalah … FP dan … FN; keputusan ini harus ditinjau ulang jika ….”
]

#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([Kriteria], [Perlu revisi], [Memadai], [Kuat],),
    table.hline(),
    [Perhitungan], [salah/tidak test set], [benar], [benar dan dapat direproduksi],
    [Alasan threshold], [default/metric shopping], [terkait satu metrik], [terkait biaya dan kapasitas],
    [Error analysis], [tidak ada], [menghitung error], [memeriksa kasus dan pola error],
  )]
  , kind: table
  )

== Refleksi
<refleksi>
- Siapa yang dirugikan oleh false positive dan false negative?
- Apa yang tidak dapat disimpulkan dari ROC-AUC?
- Kapan threshold perlu dikalibrasi ulang?

Tutup dengan jembatan: minggu depan mahasiswa belajar menjelaskan faktor model tanpa mengubah korelasi menjadi klaim sebab.
