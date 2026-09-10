== Hasil akhir pertemuan
<hasil-akhir-pertemuan>
Mahasiswa menetapkan jalur Reproduce, Adapt, atau Create secara jujur; mendefinisikan kontribusi dan eksperimen; serta menghasilkan beta release dengan keputusan arsitektur terdokumentasi.

#strong[Artefak:] beta release, architecture decision record, dan rencana eksperimen minimum.

== Persiapan
<persiapan>
=== Pengajar
<pengajar>
- Siapkan contoh perubahan kosmetik versus adaptasi substantif.
- Siapkan checklist originality ladder dan bukti untuk tiap jalur.
- Buat papan klinik: data, framing, pipeline, evaluasi, LLM, UI, reproducibility.
- Siapkan format architecture decision record (context, options, decision, consequence).
- Tinjau status proyek sebelum kelas untuk menentukan kelompok berisiko.

=== Mahasiswa
<mahasiswa>
- Memilih sementara jalur C, B, atau A.
- Membawa repository, issue/backlog, dan demo prototype terbaru.
- Menyiapkan satu blocker yang spesifik.

== Agenda 150 menit
<agenda-150-menit>
#figure(
  align(center)[#table(
    columns: (30.77%, 23.08%, 23.08%, 23.08%),
    align: (right,auto,auto,auto,),
    table.header([Waktu], [Tahap 4P-R], [Kegiatan], [Bukti cepat],),
    table.hline(),
    [0--15], [Presentasi], [Gallery perubahan kosmetik/substantif], [klasifikasi alasan],
    [15--35], [Presentasi], [Pitch TAIDA: fork your intelligence], [kontribusi satu kalimat],
    [35--50], [Presentasi], [Brief sprint, DoD, dan clinic lanes], [sprint goal],
    [50--110], [Praktik], [Sprint terfokus dengan konsultasi], [commit/artefak],
    [110--135], [Perform], [Sprint review dan challenge orisinalitas], [beta checklist],
    [135--150], [Refleksi], [Retrospektif dan rencana finalisasi], [tiga action items],
  )]
  , kind: table
  )

== Pitch TAIDA
<pitch-taida>
=== Target
<target>
#quote(block: true)[
“Pada akhir kelas, Anda harus dapat menunjukkan apa yang direproduksi, apa yang diubah, apa yang dibuat sendiri, dan bukti bahwa perubahan itu memengaruhi keputusan teknis---bukan hanya nama, warna, atau file CSV.”
]

=== Atensi
<atensi>
Tampilkan dua proyek: satu mengganti dataset tetapi mempertahankan semua asumsi churn; satu mengubah unit, target, split, metrik, prompt, dan UI sesuai domain.

#quote(block: true)[
“Keduanya memakai dataset baru. Mana yang benar-benar beradaptasi? Tunjukkan bukti pada keputusan pipeline, bukan pada judul proyek.”
]

=== Interest
<interest>
#quote(block: true)[
“Orisinalitas tidak berarti semuanya harus diciptakan dari nol. Orisinalitas berarti kontribusi dinyatakan jujur dan keputusan baru dapat dipertanggungjawabkan. Menggabungkan kode tanpa memahami asumsi justru memperbesar risiko.”
]

=== Desire
<desire>
Jelaskan ladder dan bukti:

+ #strong[Reproduce:] menjalankan, menjelaskan, dan melakukan eksperimen terkontrol.
+ #strong[Adapt:] domain/data baru mengubah framing, validasi, fitur, split, metrik, model, prompt, atau UX secara relevan.
+ #strong[Create:] masalah, pengadaan data, arsitektur, eksperimen, dan usefulness lahir dari rumusan sendiri.
+ Setiap keputusan besar memiliki ADR.
+ Setiap klaim hasil memiliki artefak dan eksperimen.
+ Scope kecil yang selesai lebih kuat daripada klaim luas tanpa bukti.

=== Action
<action>
#quote(block: true)[
“Tulis kontribusi Anda dalam satu kalimat. Pilih satu risiko terbesar yang menghalangi klaim itu, lalu gunakan sprint ini untuk menghasilkan bukti: kode, test, metrik, atau keputusan arsitektur.”
]

== Praktik sprint
<praktik-sprint>
+ Tetapkan sprint goal yang dapat didemonstrasikan hari ini.
+ Tulis definition of done dan bukti yang akan dihasilkan.
+ Prioritaskan satu vertical slice, bukan banyak fitur setengah jadi.
+ Catat keputusan besar dalam ADR.
+ Jalankan minimal baseline dan satu eksperimen utama secara adil.
+ Commit kecil dengan pesan yang menjelaskan perubahan.
+ Perbarui README/status artefak agar sesuai implementasi.

Pengajar melakukan konsultasi singkat dengan urutan: klaim kontribusi → bukti saat ini → risiko terbesar → eksperimen berikutnya.

== Perform
<perform>
Sprint review lima menit per kelompok:

+ Kontribusi yang diklaim.
+ Demo vertical slice.
+ Bukti eksperimen/perubahan.
+ Hal yang belum bekerja.
+ Keputusan berikutnya.

#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([Kriteria], [Perlu revisi], [Memadai], [Kuat],),
    table.hline(),
    [Klaim jalur], [berlebihan/kabur], [sesuai artefak], [batas kontribusi eksplisit],
    [Adaptasi/kreasi], [kosmetik], [beberapa keputusan berubah], [perubahan sistemik dan beralasan],
    [Beta], [tidak dapat didemo], [alur utama berjalan], [alur, bukti, dan limitation jelas],
  )]
  , kind: table
  )

== Refleksi
<refleksi>
- Apa yang akan saya hentikan agar proyek selesai dengan kuat?
- Bukti apa yang masih kurang untuk klaim kontribusi?
- Keputusan mana yang harus dicatat sebelum saya lupa alasannya?

Tutup dengan arah minggu 15: beta tidak langsung menjadi final; seluruh klaim, pipeline, UX, reproducibility, dan etika harus diaudit.
