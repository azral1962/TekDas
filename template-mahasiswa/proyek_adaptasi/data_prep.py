"""Validasi dan split dataset proyek Adapt.

Jalankan dari folder proyek_adaptasi:
    python data_prep.py
"""

from pathlib import Path
import json

import pandas as pd
from sklearn.model_selection import train_test_split

from config import (
    CATEGORICAL_COLUMNS,
    DATA_FILENAME,
    FEATURE_COLUMNS,
    ID_COLUMN,
    NUMERIC_COLUMNS,
    RANDOM_STATE,
    TARGET,
    TASK,
    TEST_SIZE,
)

BASE_DIR = Path(__file__).resolve().parent
RAW_DIR = BASE_DIR / "data" / "raw"
PROCESSED_DIR = BASE_DIR / "data" / "processed"


def validate_config() -> None:
    """Fail early when the student has not completed the data contract."""
    errors = []
    if "TODO" in DATA_FILENAME:
        errors.append("ganti DATA_FILENAME di config.py")
    if "TODO" in TARGET:
        errors.append("ganti TARGET di config.py")
    if not FEATURE_COLUMNS:
        errors.append("isi NUMERIC_COLUMNS dan/atau CATEGORICAL_COLUMNS")
    if set(NUMERIC_COLUMNS) & set(CATEGORICAL_COLUMNS):
        errors.append("fitur numerik dan kategorikal tidak boleh tumpang tindih")
    forbidden = {TARGET, ID_COLUMN} - {""}
    if forbidden & set(FEATURE_COLUMNS):
        errors.append("TARGET/ID_COLUMN tidak boleh menjadi fitur")
    if TASK != "classification":
        errors.append("scaffold hanya mendukung classification; adaptasikan kodenya untuk task lain")
    if errors:
        raise ValueError("Konfigurasi belum valid: " + "; ".join(errors))


def load_and_validate() -> pd.DataFrame:
    validate_config()
    path = RAW_DIR / DATA_FILENAME
    if not path.exists():
        raise FileNotFoundError(f"Dataset tidak ditemukan: {path}")

    df = pd.read_csv(path)
    required = set(FEATURE_COLUMNS + [TARGET] + ([ID_COLUMN] if ID_COLUMN else []))
    missing = sorted(required - set(df.columns))
    if missing:
        raise ValueError(f"Kolom wajib tidak ditemukan: {missing}")
    if df.empty:
        raise ValueError("Dataset kosong")
    if df[TARGET].nunique(dropna=True) < 2:
        raise ValueError("Target classification harus memiliki minimal dua kelas")
    return df


def clean_data(df: pd.DataFrame) -> pd.DataFrame:
    """Sesuaikan fungsi ini berdasarkan DATA_CARD, bukan asumsi proyek referensi."""
    selected = FEATURE_COLUMNS + [TARGET] + ([ID_COLUMN] if ID_COLUMN else [])
    clean = df[selected].drop_duplicates().copy()

    # Target yang kosong tidak dapat dipakai untuk supervised learning. Missing
    # pada fitur dibiarkan agar imputer belajar hanya dari train set.
    clean = clean.dropna(subset=[TARGET])
    return clean


def main() -> None:
    source = load_and_validate()
    clean = clean_data(source)

    # TODO: ganti dengan group/time split bila baris tidak independen atau data
    # memiliki urutan waktu. Jelaskan keputusan split pada laporan.
    train, test = train_test_split(
        clean,
        test_size=TEST_SIZE,
        random_state=RANDOM_STATE,
        stratify=clean[TARGET],
    )

    PROCESSED_DIR.mkdir(parents=True, exist_ok=True)
    train.to_csv(PROCESSED_DIR / "train.csv", index=False)
    test.to_csv(PROCESSED_DIR / "test.csv", index=False)

    report = {
        "source_rows": int(len(source)),
        "clean_rows": int(len(clean)),
        "duplicate_rows_removed": int(len(source) - len(source.drop_duplicates())),
        "train_rows": int(len(train)),
        "test_rows": int(len(test)),
        "target_distribution_train": train[TARGET].value_counts(normalize=True).to_dict(),
        "target_distribution_test": test[TARGET].value_counts(normalize=True).to_dict(),
        "missing_by_column_before_imputation": clean[FEATURE_COLUMNS].isna().sum().to_dict(),
    }
    (PROCESSED_DIR / "data_quality.json").write_text(
        json.dumps(report, indent=2, default=str), encoding="utf-8"
    )
    print(f"Selesai: {len(train):,} train dan {len(test):,} test")


if __name__ == "__main__":
    main()
