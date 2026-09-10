#let navy = rgb("#17324d")
#let accent = rgb("#087e8b")
#let pale = rgb("#eaf5f6")
#let ink = rgb("#202833")
#let muted = rgb("#687582")

#set document(
  title: "Teknologi Cerdas - Agenda Kelas dan Pitch Pengajar",
  author: "Armein Z. R. Langi",
  keywords: ("Teknologi Cerdas", "4P-R", "TAIDA", "BI", "ML", "LLM"),
)

#set page(
  paper: "a4",
  margin: (top: 24mm, bottom: 23mm, left: 25mm, right: 21mm),
)
#set text(
  font: ("Libertinus Serif", "Noto Serif", "Times New Roman"),
  size: 10.5pt,
  fill: ink,
  lang: "id",
)
#set par(justify: true, leading: 0.68em)
#set list(indent: 1.2em, body-indent: 0.55em, spacing: 0.35em)
#set enum(indent: 1.2em, body-indent: 0.55em, spacing: 0.35em)
#set table(
  inset: 5pt,
  stroke: 0.45pt + rgb("#cad3da"),
  fill: (x, y) => if y == 0 { navy } else { none },
)
#show table.cell: set par(justify: false)
#show table.cell.where(y: 0): set text(weight: "bold", fill: white)
#show raw: set text(font: ("DejaVu Sans Mono", "Courier New"), size: 8.7pt)
#show link: set text(fill: accent)
#show quote: set block(
  width: 100%,
  fill: pale,
  stroke: (left: 3pt + accent),
  inset: (x: 11pt, y: 8pt),
  radius: 2pt,
)

// Sampul
#align(center)[
  #v(22mm)
  #text(size: 12pt, weight: "bold", tracking: 0.12em, fill: accent)[BUKU PEGANGAN PENGAJAR]
  #v(10mm)
  #text(size: 31pt, weight: "bold", fill: navy)[Teknologi Cerdas]
  #v(5mm)
  #text(size: 17pt, fill: ink)[Agenda Kelas dan Pitch Pengajar]
  #v(5mm)
  #text(size: 13pt, style: "italic", fill: muted)[Pendekatan 4P-R + TAIDA]
  #v(18mm)
  #rect(width: 72%, height: 2.5pt, fill: accent, radius: 2pt)
  #v(18mm)
  #box(
    width: 76%,
    fill: pale,
    inset: 14pt,
    radius: 5pt,
  )[
    #text(size: 11pt)[
      Panduan operasional untuk 15 pertemuan: target kompetensi, persiapan, agenda 150 menit, pitch TAIDA, praktik, perform, dan refleksi.
    ]
  ]
  #v(1fr)
  #text(size: 12pt, weight: "bold", fill: navy)[Armein Z. R. Langi]
  #v(4mm)
  #text(size: 9.5pt, fill: muted)[Mata Kuliah Teknologi Cerdas]
  #v(18mm)
]

#pagebreak()

#set page(
  header: context {
    set text(size: 8pt, fill: muted)
    grid(
      columns: (1fr, 1fr),
      align(left)[#smallcaps[TEKNOLOGI CERDAS]],
      align(right)[Agenda dan Pitch Pengajar],
    )
    v(2pt)
    line(length: 100%, stroke: 0.35pt + rgb("#c5ced5"))
  },
  footer: context {
    set text(size: 8pt, fill: muted)
    align(center)[#counter(page).display("1")]
  },
)
#counter(page).update(1)

#show heading: set block(above: 1.15em, below: 0.65em)
#show heading.where(level: 1): set block(
  width: 100%,
  above: 0.5em,
  below: 1em,
  inset: (bottom: 6pt),
  stroke: (bottom: 1.2pt + accent),
)
#show heading.where(level: 1): set text(size: 21pt, weight: "bold", fill: navy)
#show heading.where(level: 2): set text(size: 14pt, weight: "bold", fill: navy)
#show heading.where(level: 3): set text(size: 11pt, weight: "bold", fill: accent)

#heading(numbering: none)[Cara Menggunakan Buku Ini]

Buku ini mengompilasi agenda dan naskah pitch pengajar untuk pertemuan 1 sampai 15 mata kuliah Teknologi Cerdas. Setiap bab dirancang sebagai panduan yang dapat digunakan sebelum, selama, dan setelah kelas.

Pendekatan *4P-R* mengatur pengalaman belajar:

- *Persiapan* memastikan materi, hook, contoh, perangkat, dan tugas siap.
- *Presentasi* memutar TAIDA untuk membangun arah dan alasan belajar.
- *Praktik* memberi kesempatan mencoba dengan bimbingan dan umpan balik.
- *Perform* meminta mahasiswa menunjukkan kompetensi dengan kriteria transparan.
- *Refleksi* mengubah pengalaman menjadi pemahaman dan tindakan berikutnya.

Di dalam tahap Presentasi, pitch *TAIDA* bergerak dari *Target*, *Atensi*, *Interest*, *Desire*, hingga *Action*. Kutipan berwarna pada setiap bab adalah kalimat yang dapat langsung digunakan atau disesuaikan pengajar.

#heading(numbering: none)[Peta 15 Pertemuan]

#figure(
  table(
    columns: (10%, 34%, 24%, 32%),
    align: (center, left, left, left),
    table.header([Mg], [Tema], [Fokus], [Artefak]),
    [1], [Teknologi Cerdas sebagai Sistem], [Data-BI-ML-LLM-App], [Environment checklist],
    [2], [Kaggle dan Problem Framing], [Unit, target, provenance], [Data dictionary],
    [3], [Data Semantics dan Audit BI], [Grain, join, agregat], [Audit note],
    [4], [Data Preparation], [Validasi, fitur, split], [Prepared dataset],
    [5], [Business Intelligence], [KPI, tren, drill-down], [Mini-dashboard],
    [6], [Dasar Machine Learning], [Baseline, generalization], [Baseline report],
    [7], [ML Pipeline Engineering], [Preprocessing konsisten], [Pipeline reproducible],
    [8], [UTS Code Defense], [Explain before modify], [Defense individual],
    [9], [Evaluasi dan Imbalance], [Metrik dan threshold], [Error analysis],
    [10], [Interpretasi Model], [Importance dan batas klaim], [Interpretation note],
    [11], [Fundamental LLM], [Prompt dan grounding], [Prompt tests],
    [12], [Grounded ML + LLM], [Evidence trace], [Grounded analyst],
    [13], [Integrasi Streamlit], [UI dan failure state], [Integrated prototype],
    [14], [Adapt/Create Sprint], [Kontribusi dan eksperimen], [Beta release],
    [15], [Verification Clinic], [Audit dan etika], [Final candidate],
  ),
  kind: table,
)

#pagebreak()
#heading(numbering: none)[Daftar Isi]
#outline(title: none, depth: 2, indent: auto)

#set heading(numbering: "1.1")

#pagebreak(weak: true)
= Kuliah 01 - Teknologi Cerdas sebagai Sistem
#include "chapters/k-01.typ"

#pagebreak(weak: true)
= Kuliah 02 - Kaggle dan Problem Framing
#include "chapters/k-02.typ"

#pagebreak(weak: true)
= Kuliah 03 - Data Semantics dan Audit BI
#include "chapters/k-03.typ"

#pagebreak(weak: true)
= Kuliah 04 - Data Preparation dan Feature Engineering
#include "chapters/k-04.typ"

#pagebreak(weak: true)
= Kuliah 05 - Descriptive Business Intelligence
#include "chapters/k-05.typ"

#pagebreak(weak: true)
= Kuliah 06 - Dasar Machine Learning
#include "chapters/k-06.typ"

#pagebreak(weak: true)
= Kuliah 07 - ML Pipeline Engineering
#include "chapters/k-07.typ"

#pagebreak(weak: true)
= Kuliah 08 - UTS Code Reading dan Oral Defense
#include "chapters/k-08.typ"

#pagebreak(weak: true)
= Kuliah 09 - Evaluasi, Imbalance, dan Threshold
#include "chapters/k-09.typ"

#pagebreak(weak: true)
= Kuliah 10 - Interpretasi dan Batas Model
#include "chapters/k-10.typ"

#pagebreak(weak: true)
= Kuliah 11 - Fundamental LLM
#include "chapters/k-11.typ"

#pagebreak(weak: true)
= Kuliah 12 - Grounded ML + LLM Analyst
#include "chapters/k-12.typ"

#pagebreak(weak: true)
= Kuliah 13 - Integrasi Aplikasi Streamlit
#include "chapters/k-13.typ"

#pagebreak(weak: true)
= Kuliah 14 - Adapt/Create Sprint
#include "chapters/k-14.typ"

#pagebreak(weak: true)
= Kuliah 15 - Verification Clinic dan Etika
#include "chapters/k-15.typ"

#pagebreak(weak: true)
#heading(numbering: none)[Catatan Penutup Pengajar]

Gunakan buku ini sebagai naskah kerja, bukan naskah yang harus dibaca kata demi kata. Pertahankan urutan kebutuhan belajar: mahasiswa mengetahui target, tertarik pada masalah yang nyata, memahami cara kerja, melakukan tindakan, menunjukkan performa, lalu merefleksikan buktinya. Adaptasikan contoh dan tempo berdasarkan kesiapan kelas tanpa mengurangi standar bukti dan tanggung jawab.
