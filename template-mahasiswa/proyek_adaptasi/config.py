"""Kontrak dataset untuk proyek Adapt.

Isi seluruh TODO sebelum menjalankan pipeline. Jangan memilih kolom hanya agar
kode berjalan; setiap fitur harus dapat dijelaskan secara semantik.
"""

DATA_FILENAME = "TODO_dataset.csv"
TARGET = "TODO_target"
ID_COLUMN = ""  # Boleh kosong bila dataset tidak memiliki identifier.

# Daftar harus saling lepas dan tidak boleh memuat TARGET/ID_COLUMN.
NUMERIC_COLUMNS = [
    # "age",
]

CATEGORICAL_COLUMNS = [
    # "category",
]

FEATURE_COLUMNS = NUMERIC_COLUMNS + CATEGORICAL_COLUMNS

# Ubah bila random split tidak sah, misalnya data time-series atau banyak baris
# berasal dari orang yang sama. Implementasikan strategi tersebut di data_prep.py.
TEST_SIZE = 0.20
RANDOM_STATE = 42

# Hanya classification yang disediakan scaffold ini. Untuk regression/clustering,
# mahasiswa wajib mengganti model, baseline, metrik, dan tampilan secara relevan.
TASK = "classification"
