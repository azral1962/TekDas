# Rubrik Proyek Teknologi Cerdas

## 1. Originality Gate

### Jalur C — REPRODUCE
Kriteria minimum:
- reference project berjalan end-to-end;
- hasil utama dapat direproduksi;
- mahasiswa menjelaskan kode;
- dua eksperimen perubahan parameter/threshold;
- paper dan demo lengkap.

**Nilai maksimum: C.**

### Jalur B — ADAPT
Tambahan:
- dataset Kaggle berbeda;
- target/problem baru;
- data semantics dan validation berubah;
- feature engineering relevan;
- model/evaluation disesuaikan;
- prompt dan dashboard diadaptasi.

**Nilai maksimum: B.**

### Jalur A — CREATE
Tambahan:
- problem dirumuskan sendiri;
- data sendiri dengan provenance, izin, dan dictionary;
- kode dikembangkan substantif;
- eksperimen dan baseline didesain sendiri;
- evaluasi technical + usefulness;
- kontribusi orisinal dijelaskan.

**Nilai maksimum: A.**

## 2. Quality Score 100

| Dimensi | Poin |
|---|---:|
| Problem formulation | 10 |
| Data provenance & semantics | 15 |
| Data engineering | 15 |
| ML design & baseline | 15 |
| Evaluation & error analysis | 15 |
| LLM grounding & evaluation | 10 |
| Integration / UX / software quality | 10 |
| Reproducibility & documentation | 5 |
| Paper & communication | 5 |

## 3. Critical failures

Pengurang serius:
- fabricated data/metric/experiment;
- test leakage;
- tidak dapat menjelaskan kode inti;
- LLM claim disajikan sebagai fakta tanpa evidence;
- tidak menyebut sumber data;
- repository tidak sesuai dengan paper.

## 4. Penentuan nilai

1. Hitung quality score.
2. Verifikasi critical failures.
3. Tetapkan originality gate.
4. Nilai akhir tidak boleh melebihi gate.

Contoh:
- quality 92 tetapi hanya menyalin reference project → maksimum C;
- quality 87 dan adaptasi Kaggle substantif → maksimum B;
- quality 87 dan create valid → dapat A sesuai kebijakan konversi dosen.
