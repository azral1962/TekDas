== Hasil akhir pertemuan
<hasil-akhir-pertemuan>
Mahasiswa mampu mengintegrasikan data, BI, pipeline ML, LLM, dan UI dalam aplikasi Streamlit yang modular, memiliki evidence trace, kontrol threshold, caching tepat, serta failure state yang jelas.

#strong[Artefak:] integrated prototype yang dapat didemonstrasikan end-to-end.

== Persiapan
<persiapan>
=== Pengajar
<pengajar>
- Jalankan aplikasi lengkap dan versi dengan model/LLM sengaja tidak tersedia.
- Siapkan user journey dari pemilihan pelanggan hingga rekomendasi.
- Tandai `st.cache_data`, `st.cache_resource`, tab, threshold, dan error state.
- Siapkan contoh UI output-first dan evidence-first.
- Buat checklist demo end-to-end dan aksesibilitas dasar.

=== Mahasiswa
<mahasiswa>
- Membawa pipeline tersimpan, metrics, dan grounded analyst.
- Memastikan komponen dapat dijalankan terpisah sebelum integrasi.

== Agenda 150 menit
<agenda-150-menit>
#figure(
  align(center)[#table(
    columns: (30.77%, 23.08%, 23.08%, 23.08%),
    align: (right,auto,auto,auto,),
    table.header([Waktu], [Tahap 4P-R], [Kegiatan], [Bukti cepat],),
    table.hline(),
    [0--15], [Presentasi], [Bandingkan dua user journey], [pilihan desain],
    [15--40], [Presentasi], [Pitch TAIDA: integrasi adalah kontrak], [diagram modul],
    [40--60], [Presentasi], [Walkthrough app, caching, dan failure state], [trace satu kasus],
    [60--110], [Praktik], [Integrasi prototype dan negative test], [aplikasi berjalan],
    [110--135], [Perform], [Demo berbasis tugas pengguna], [checklist observer],
    [135--150], [Refleksi], [Exit ticket], [backlog prioritas],
  )]
  , kind: table
  )

== Pitch TAIDA
<pitch-taida>
=== Target
<target>
#quote(block: true)[
“Pada akhir kelas, pengguna harus dapat memilih satu kasus, melihat bukti, memahami skor dan threshold, meminta bantuan LLM, serta mengetahui apa yang terjadi ketika model atau layanan LLM tidak tersedia.”
]

=== Atensi
<atensi>
Tampilkan chatbot yang langsung memberi rekomendasi tanpa profil, transaksi, skor, atau status model.

#quote(block: true)[
“Jika rekomendasi ini salah, di layar mana pengguna dapat memeriksanya? Jika jawabannya ‘tidak bisa', masalah kita bukan tampilan---masalahnya adalah akuntabilitas.”
]

=== Interest
<interest>
#quote(block: true)[
“Komponen yang benar dapat menghasilkan aplikasi yang salah ketika schema tidak cocok, preprocessing berbeda, cache usang, error ditelan, atau UI menyembunyikan uncertainty. Integrasi adalah pengujian kontrak antar-lapisan.”
]

=== Desire
<desire>
Jelaskan user journey evidence-first:

+ #strong[Data:] arti dan kualitas sumber terlihat.
+ #strong[BI:] konteks populasi dan perilaku historis.
+ #strong[ML:] probability, threshold, class, metrik, dan keterbatasan.
+ #strong[LLM:] prompt/evidence dan rekomendasi terpisah.
+ #strong[Action:] pengguna dapat menerima, menolak, atau meminta pemeriksaan.
+ #strong[Failure:] model/LLM hilang menghasilkan pesan dan langkah pemulihan.

Jelaskan bahwa data dan resource memiliki pola cache berbeda; cache tidak boleh menyembunyikan perubahan penting.

=== Action
<action>
#quote(block: true)[
“Integrasikan satu perjalanan pengguna lengkap. Setelah happy path berhasil, matikan atau pindahkan satu dependency dan buktikan aplikasi gagal dengan pesan yang jujur, bukan layar kosong atau rekomendasi palsu.”
]

== Praktik terbimbing
<praktik-terbimbing>
+ Gambar modul load data, feature engineering, model, prompt, dan UI.
+ Pastikan inference memakai `FEATURE_COLUMNS` dan pipeline yang sama.
+ Buat overview BI lalu drill-down kasus.
+ Tampilkan probability dan threshold secara berdampingan.
+ Berikan akses ke evidence/prompt tanpa membocorkan data sensitif.
+ Gunakan cache sesuai sifat data/resource.
+ Uji model hilang, LLM offline, input kosong, dan schema tidak cocok.

== Perform
<perform>
Observer memberi tugas: “pilih pelanggan, pahami konteks, nilai risiko, dan tentukan tindakan”. Pengembang tidak boleh memberi instruksi selama tiga menit pertama. Observer mencatat kebingungan, evidence yang hilang, dan failure state.

#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([Kriteria], [Perlu revisi], [Memadai], [Kuat],),
    table.hline(),
    [End-to-end], [komponen terputus], [happy path berjalan], [alur runtut dan modular],
    [Evidence trace], [output saja], [bukti tersedia], [bukti mudah ditelusuri],
    [Failure handling], [crash/diam], [pesan error], [pesan, dampak, pemulihan jelas],
  )]
  , kind: table
  )

== Refleksi
<refleksi>
- Langkah mana yang paling membingungkan pengguna?
- State apa yang berisiko usang karena cache?
- Jika hanya sempat memperbaiki satu hal, mana yang paling mengurangi risiko keputusan?

Tutup dengan jembatan: minggu depan mahasiswa menetapkan jalur Reproduce, Adapt, atau Create dan mengubah prototype menjadi kontribusi proyek yang dapat dipertahankan.
