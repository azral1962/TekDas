== Hasil akhir pertemuan
<hasil-akhir-pertemuan>
Mahasiswa mampu memverifikasi reproducibility, integritas hasil, leakage, failure state, grounding LLM, risiko etis, dan kesesuaian paper dengan artefak aktual; lalu menghasilkan final candidate.

#strong[Artefak:] verification report, issue prioritas, dan final candidate yang siap menuju defense.

== Persiapan
<persiapan>
=== Pengajar
<pengajar>
- Siapkan checklist reproducibility, data, ML, LLM, UI, etika, dan laporan.
- Siapkan repository contoh yang tampak selesai tetapi gagal dari clean setup.
- Buat paket negative tests: file hilang, schema berubah, model hilang, LLM offline, input injection.
- Atur pasangan peer audit yang tidak berasal dari kelompok sama.
- Tentukan severity: blocker, major, minor, dan evidence needed.

=== Mahasiswa
<mahasiswa>
- Membawa beta release dan instruksi menjalankan proyek dari awal.
- Menutup secret serta memastikan data/model boleh dibagikan.
- Menyiapkan paper draft dan daftar klaim hasil.

== Agenda 150 menit
<agenda-150-menit>
#figure(
  align(center)[#table(
    columns: (30.77%, 23.08%, 23.08%, 23.08%),
    align: (right,auto,auto,auto,),
    table.header([Waktu], [Tahap 4P-R], [Kegiatan], [Bukti cepat],),
    table.hline(),
    [0--15], [Presentasi], [Failure demo dari proyek “selesai”], [daftar red flag],
    [15--40], [Presentasi], [Pitch TAIDA: percaya setelah verifikasi], [verification map],
    [40--50], [Presentasi], [Brief peer audit dan severity], [pembagian auditor],
    [50--105], [Praktik], [Re-run, negative tests, ethics review], [log audit],
    [105--130], [Perform], [Audit defense dan triage issue], [pass/conditional/fail],
    [130--145], [Praktik], [Memperbaiki satu blocker/major issue], [bukti perbaikan],
    [145--150], [Refleksi], [Go/no-go statement], [action terakhir],
  )]
  , kind: table
  )

== Pitch TAIDA
<pitch-taida>
=== Target
<target>
#quote(block: true)[
“Pada akhir kelas, kata ‘selesai' harus memiliki bukti. Orang lain harus dapat menjalankan proyek, menelusuri metrik ke test set, memeriksa ground LLM, melihat failure state, dan menemukan bahwa paper sesuai dengan artefak aktual.”
]

=== Atensi
<atensi>
Jalankan repository contoh yang memiliki screenshot bagus tetapi gagal karena dependency, path absolut, atau model yang tidak tersedia.

#quote(block: true)[
“Apakah proyek ini selesai jika hanya berjalan di laptop pembuatnya? Apakah angka di slide dapat dipercaya jika tidak dapat ditelusuri ke script dan output?”
]

=== Interest
<interest>
#quote(block: true)[
“Bug yang paling berbahaya menjelang demo adalah bug yang belum kita cari: hasil dari train set disebut test, seed tidak tercatat, leakage, cache usang, klaim kausal, prompt injection, atau data sensitif di repository. Verifikasi adalah bagian dari produk, bukan pekerjaan administratif.”
]

=== Desire
<desire>
Gunakan enam lapisan verification:

+ #strong[Reproducibility:] setup bersih, dependency, seed, perintah, path.
+ #strong[Data integrity:] provenance, izin, schema, grain, quality report.
+ #strong[ML integrity:] split, baseline, test metric, threshold, error analysis.
+ #strong[LLM integrity:] evidence trace, unsupported claim, injection, uncertainty.
+ #strong[UX and safety:] failure state, human override, privasi, aksesibilitas.
+ #strong[Claim consistency:] README, app, output, paper, dan demo menyatakan hal yang sama.

#quote(block: true)[
“Tujuannya bukan menemukan bahwa proyek sempurna. Tujuannya mengetahui batasnya sebelum pengguna atau penguji menemukannya.”
]

=== Action
<action>
#quote(block: true)[
“Serahkan proyek kepada auditor tanpa instruksi lisan. Auditor mengikuti README, menjalankan satu happy path dan dua negative tests, lalu menelusuri satu klaim paper hingga data atau artefak. Tim pemilik memperbaiki issue dengan severity tertinggi.”
]

== Praktik peer audit
<praktik-peer-audit>
+ Clone/copy ke lokasi bersih dan ikuti README secara literal.
+ Rekam environment, perintah, waktu, dan error pertama.
+ Verifikasi ukuran data, split, seed, baseline, dan sumber metrik.
+ Telusuri satu prediksi dari input hingga tampilan.
+ Uji model hilang, LLM offline, dan data teks adversarial.
+ Periksa secret, data sensitif, lisensi, dan kelompok terdampak.
+ Cocokkan tiga klaim paper dengan kode/output aktual.
+ Catat issue, severity, evidence, dan langkah reproduksi.

== Perform
<perform>
Auditor memberikan keputusan:

- #strong[Pass:] tidak ada blocker; klaim utama terbukti.
- #strong[Conditional pass:] ada major issue dengan perbaikan yang jelas.
- #strong[Fail/re-audit:] proyek tidak dapat dijalankan atau klaim inti tidak dapat diverifikasi.

Pemilik melakukan defense singkat: menerima/menolak temuan dengan bukti, menetapkan prioritas, dan memperbaiki minimal satu blocker atau major issue.

#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([Kriteria], [Perlu revisi], [Memadai], [Kuat],),
    table.hline(),
    [Reproducibility], [tidak dapat dijalankan], [alur utama dapat diulang], [clean run dan failure path tercatat],
    [Integritas klaim], [angka tidak terlacak], [klaim utama cocok], [seluruh klaim penting memiliki evidence],
    [Risiko/etika], [tidak dibahas], [checklist dasar], [dampak, mitigasi, human override jelas],
    [Respons audit], [defensif/tanpa bukti], [memperbaiki issue], [triage berbasis severity dan bukti],
  )]
  , kind: table
  )

== Refleksi
<refleksi>
Minta setiap tim menulis go/no-go statement:

#quote(block: true)[
“Proyek kami \[siap/belum siap\] untuk final defense karena …; bukti terkuat kami adalah …; keterbatasan yang akan kami nyatakan adalah …; tindakan terakhir sebelum minggu 16 adalah ….”
]

Tutup dengan pengingat bahwa final defense bukan pertunjukan kesempurnaan. Defense adalah kemampuan menghubungkan kontribusi, keputusan teknis, hasil, keterbatasan, dan bukti secara konsisten.
