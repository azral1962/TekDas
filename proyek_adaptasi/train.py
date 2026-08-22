"""Baseline, training, dan evaluasi proyek Adapt."""

from pathlib import Path
import json

import joblib
import pandas as pd
from sklearn.compose import ColumnTransformer
from sklearn.dummy import DummyClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn.impute import SimpleImputer
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix, f1_score
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import OneHotEncoder

from config import CATEGORICAL_COLUMNS, FEATURE_COLUMNS, NUMERIC_COLUMNS, RANDOM_STATE, TARGET

BASE_DIR = Path(__file__).resolve().parent
PROCESSED_DIR = BASE_DIR / "data" / "processed"
ARTIFACT_DIR = BASE_DIR / "artifacts"


def build_preprocessor() -> ColumnTransformer:
    numeric = Pipeline([("imputer", SimpleImputer(strategy="median"))])
    categorical = Pipeline([
        ("imputer", SimpleImputer(strategy="most_frequent")),
        ("onehot", OneHotEncoder(handle_unknown="ignore")),
    ])
    return ColumnTransformer([
        ("numeric", numeric, NUMERIC_COLUMNS),
        ("categorical", categorical, CATEGORICAL_COLUMNS),
    ])


def build_pipeline(model) -> Pipeline:
    return Pipeline([
        ("preprocess", build_preprocessor()),
        ("model", model),
    ])


def evaluate(model: Pipeline, X_test: pd.DataFrame, y_test: pd.Series) -> dict:
    prediction = model.predict(X_test)
    return {
        "accuracy": float(accuracy_score(y_test, prediction)),
        "f1_macro": float(f1_score(y_test, prediction, average="macro")),
        "confusion_matrix": confusion_matrix(y_test, prediction).tolist(),
        "classification_report": classification_report(
            y_test, prediction, output_dict=True, zero_division=0
        ),
    }


def main() -> None:
    train_path = PROCESSED_DIR / "train.csv"
    test_path = PROCESSED_DIR / "test.csv"
    if not train_path.exists() or not test_path.exists():
        raise FileNotFoundError("Jalankan `python data_prep.py` terlebih dahulu")

    train = pd.read_csv(train_path)
    test = pd.read_csv(test_path)
    X_train, y_train = train[FEATURE_COLUMNS], train[TARGET]
    X_test, y_test = test[FEATURE_COLUMNS], test[TARGET]

    baseline = build_pipeline(DummyClassifier(strategy="most_frequent"))
    model = build_pipeline(RandomForestClassifier(
        n_estimators=300,
        class_weight="balanced",
        random_state=RANDOM_STATE,
        n_jobs=-1,
    ))

    baseline.fit(X_train, y_train)
    model.fit(X_train, y_train)
    metrics = {
        "baseline": evaluate(baseline, X_test, y_test),
        "model": evaluate(model, X_test, y_test),
        "metric_note": "TODO: tetapkan metrik utama dan alasan berdasarkan biaya error stakeholder",
    }

    ARTIFACT_DIR.mkdir(parents=True, exist_ok=True)
    joblib.dump(model, ARTIFACT_DIR / "model.joblib")
    (ARTIFACT_DIR / "metrics.json").write_text(
        json.dumps(metrics, indent=2), encoding="utf-8"
    )

    prediction = test.copy()
    prediction["prediction"] = model.predict(X_test)
    prediction.to_csv(ARTIFACT_DIR / "predictions.csv", index=False)

    print(json.dumps(metrics, indent=2))
    print("Simpan: artifacts/model.joblib, metrics.json, predictions.csv")


if __name__ == "__main__":
    main()
