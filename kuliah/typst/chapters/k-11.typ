== Hasil akhir pertemuan
<hasil-akhir-pertemuan>
Mahasiswa mampu menjelaskan alur prompt--context--response, mengendalikan instruksi dan temperature, mengenali hallucination, serta merancang prompt grounded dengan keluaran terstruktur.

#strong[Artefak:] kumpulan prompt test beserta expected behavior dan hasil pengamatan.

== Persiapan
<persiapan>
=== Pengajar
<pengajar>
- Pastikan Ollama dan model lokal tersedia; siapkan output rekaman sebagai fallback.
- Siapkan satu prompt kabur, satu prompt terstruktur, dan satu prompt grounded.
- Siapkan demonstrasi perubahan temperature dengan input sama.
- Siapkan fakta yang tidak ada di context untuk menguji hallucination.
- Tandai pemanggilan `ollama.chat()` dan `build_prompt()`.

=== Mahasiswa
<mahasiswa>
- Membaca `simulation/vai_analyst.py`.
- Menjalankan `python vai_analyst.py --prompt-only` bila memungkinkan.

== Agenda 150 menit
<agenda-150-menit>
#figure(
  align(center)[#table(
    columns: (30.77%, 23.08%, 23.08%, 23.08%),
    align: (right,auto,auto,auto,),
    table.header([Waktu], [Tahap 4P-R], [Kegiatan], [Bukti cepat],),
    table.hline(),
    [0--15], [Presentasi], [Prediksi keluaran tiga prompt], [hipotesis mahasiswa],
    [15--45], [Presentasi], [Pitch TAIDA tentang pola bahasa dan grounding], [diagram alur],
    [45--60], [Presentasi], [Live demo prompt, temperature, format], [perbandingan output],
    [60--110], [Praktik], [Menulis prompt dan test cases], [prompt test table],
    [110--135], [Perform], [Adversarial prompt challenge], [hasil uji silang],
    [135--150], [Refleksi], [Exit ticket], [aturan penggunaan LLM],
  )]
  , kind: table
  )

== Pitch TAIDA
<pitch-taida>
=== Target
<target>
#quote(block: true)[
“Pada akhir kelas, Anda harus dapat membuat LLM menjawab tugas yang jelas dari context yang dibatasi, serta mengenali kapan jawaban lancar tidak didukung bukti.”
]

=== Atensi
<atensi>
Tanyakan fakta spesifik yang sengaja tidak ada di context, lalu tampilkan jawaban LLM yang percaya diri.

#quote(block: true)[
“Kalimatnya rapi, tetapi dari mana faktanya berasal? Apakah kelancaran bahasa merupakan bukti kebenaran?”
]

=== Interest
<interest>
#quote(block: true)[
“LLM memprediksi token berikutnya dari pola bahasa. Ia tidak otomatis memeriksa database kita, tidak mengetahui maksud bisnis yang tidak ditulis, dan dapat mengisi kekosongan dengan teks yang masuk akal. Karena itu prompt adalah kontrak tugas, bukan mantra.”
]

=== Desire
<desire>
Jelaskan komponen prompt yang dapat diuji:

+ #strong[Role/task:] pekerjaan spesifik yang harus dilakukan.
+ #strong[Context/evidence:] data yang boleh digunakan.
+ #strong[Boundary:] hal yang tidak boleh diasumsikan.
+ #strong[Output schema:] bagian dan format jawaban.
+ #strong[Uncertainty behavior:] cara merespons bukti kurang/bertentangan.
+ #strong[Parameters:] temperature rendah untuk konsistensi tugas analitis.
+ #strong[Test cases:] kasus normal, kosong, konflik, dan adversarial.

=== Action
<action>
#quote(block: true)[
“Perbaiki prompt yang kabur menjadi kontrak yang dapat diuji. Jalankan pada minimal empat kasus, termasuk satu kasus tanpa cukup bukti. Nilai bukan berdasarkan jawaban yang paling indah, melainkan perilaku yang paling dapat diprediksi dan dilacak.”
]

== Praktik terbimbing
<praktik-terbimbing>
+ Jalankan prompt-only dan identifikasi setiap bagian prompt.
+ Uji pertanyaan sama dengan instruksi dan format berbeda.
+ Bandingkan keluaran pada temperature rendah dan lebih tinggi.
+ Tambahkan aturan “jangan mengarang; nyatakan bukti tidak cukup”.
+ Tentukan output schema ringkas.
+ Buat test cases: normal, evidence minim, konflik, dan permintaan di luar scope.
+ Catat expected vs actual behavior, bukan hanya menyalin jawaban.

== Perform
<perform>
Kelompok bertukar prompt. Kelompok penguji mencoba membuat prompt gagal, lalu melaporkan input, expected behavior, actual behavior, severity, dan usulan perbaikan.

#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([Kriteria], [Perlu revisi], [Memadai], [Kuat],),
    table.hline(),
    [Instruksi], [kabur], [tugas jelas], [tugas, batas, format jelas],
    [Grounding], [tanpa evidence], [evidence dicantumkan], [penggunaan evidence dapat ditelusuri],
    [Evaluasi], [satu contoh], [beberapa kasus], [normal dan adversarial dengan expected result],
  )]
  , kind: table
  )

== Refleksi
<refleksi>
- Apa beda jawaban masuk akal dengan jawaban berbasis bukti?
- Parameter apa yang membantu konsistensi tetapi tidak menjamin kebenaran?
- Kapan LLM seharusnya menolak atau menyatakan tidak cukup data?

Tutup dengan jembatan: minggu depan skor ML dan bukti transaksi akan dikemas menjadi context yang tetap memisahkan fakta, prediksi, dan rekomendasi.
