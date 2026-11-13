
"""
HR EMPLOYEE ATTRITION ANALYSIS
Professional Data Cleaning Pipeline

Input:
data/raw/HR Employee Attrition.csv

Output:
data/processed/HR_Employee_Attrition_Cleaned.csv
reports/cleaning_summary.txt
"""

import pandas as pd
import numpy as np
import logging
from pathlib import Path


# ==========================================================
# 1. PROJECT PATH CONFIGURATION
# ==========================================================

BASE_DIR = Path(__file__).resolve().parent.parent

RAW_FILE = BASE_DIR / "data" / "raw" / "HR Employee Attrition.csv"

PROCESSED_DIR = BASE_DIR / "data" / "processed"
OUTPUT_FILE = PROCESSED_DIR / "HR_Employee_Attrition_Cleaned.csv"

REPORT_DIR = BASE_DIR / "reports"
REPORT_FILE = REPORT_DIR / "cleaning_summary.txt"

PROCESSED_DIR.mkdir(parents=True, exist_ok=True)
REPORT_DIR.mkdir(parents=True, exist_ok=True)


# ==========================================================
# 2. EXPECTED DATASET COLUMNS
# ==========================================================

EXPECTED_COLUMNS = [
    "Age", "Attrition", "BusinessTravel", "DailyRate",
    "Department", "DistanceFromHome", "Education",
    "EducationField", "EmployeeCount", "EmployeeNumber",
    "EnvironmentSatisfaction", "Gender", "HourlyRate",
    "JobInvolvement", "JobLevel", "JobRole",
    "JobSatisfaction", "MaritalStatus", "MonthlyIncome",
    "MonthlyRate", "NumCompaniesWorked", "Over18",
    "OverTime", "PercentSalaryHike", "PerformanceRating",
    "RelationshipSatisfaction", "StandardHours",
    "StockOptionLevel", "TotalWorkingYears",
    "TrainingTimesLastYear", "WorkLifeBalance",
    "YearsAtCompany", "YearsInCurrentRole",
    "YearsSinceLastPromotion", "YearsWithCurrManager"
]


# ==========================================================
# 3. MISSING VALUE MARKERS
# ==========================================================

MISSING_VALUES = [
    "", " ", "NA", "N/A", "na", "n/a",
    "NULL", "null", "None", "none",
    "NaN", "nan", "-", "--"
]


# ==========================================================
# 4. LOGGING CONFIGURATION
# ==========================================================

logging.basicConfig(
    level=logging.INFO,
    format="%(levelname)s: %(message)s"
)


# ==========================================================
# 5. LOAD DATASET
# ==========================================================

if not RAW_FILE.exists():
    raise FileNotFoundError(
        f"Dataset not found: {RAW_FILE}"
    )

df = pd.read_csv(RAW_FILE, low_memory=False)

original_rows = len(df)
original_columns = len(df.columns)

print("\n========== HR DATA CLEANING STARTED ==========")

print("Original Rows:", original_rows)
print("Original Columns:", original_columns)


# ==========================================================
# 6. CLEAN COLUMN NAMES
# ==========================================================

df.columns = df.columns.str.strip()

# Remove duplicate column names if present
if df.columns.duplicated().any():
    raise ValueError("Duplicate column names detected.")

# Validate expected columns
missing_columns = [
    col for col in EXPECTED_COLUMNS
    if col not in df.columns
]

if missing_columns:
    raise ValueError(
        f"Required columns missing: {missing_columns}"
    )

print("\nColumn validation completed.")


# ==========================================================
# 7. HANDLE MISSING VALUES
# ==========================================================

df.replace(MISSING_VALUES, np.nan, inplace=True)

# Strip unnecessary spaces from text columns
for col in df.select_dtypes(include="object").columns:
    df[col] = df[col].str.strip()

missing_before = int(df.isnull().sum().sum())

print("Missing values before cleaning:", missing_before)


# ==========================================================
# 8. REMOVE EMPTY ROWS AND COLUMNS
# ==========================================================

empty_rows = int(df.isnull().all(axis=1).sum())

df.dropna(how="all", inplace=True)

empty_columns = df.columns[df.isnull().all()].tolist()

df.drop(columns=empty_columns, inplace=True)

print("Empty rows removed:", empty_rows)
print("Empty columns removed:", len(empty_columns))


# ==========================================================
# 9. REMOVE DUPLICATE RECORDS
# ==========================================================

duplicate_count = int(df.duplicated().sum())

df.drop_duplicates(inplace=True)

print("Duplicate records removed:", duplicate_count)


# ==========================================================
# 10. DATA TYPE CONVERSION
# ==========================================================

NUMERIC_COLUMNS = [
    "Age", "DailyRate", "DistanceFromHome",
    "Education", "EmployeeCount", "EmployeeNumber",
    "EnvironmentSatisfaction", "HourlyRate",
    "JobInvolvement", "JobLevel", "JobSatisfaction",
    "MonthlyIncome", "MonthlyRate", "NumCompaniesWorked",
    "PercentSalaryHike", "PerformanceRating",
    "RelationshipSatisfaction", "StandardHours",
    "StockOptionLevel", "TotalWorkingYears",
    "TrainingTimesLastYear", "WorkLifeBalance",
    "YearsAtCompany", "YearsInCurrentRole",
    "YearsSinceLastPromotion", "YearsWithCurrManager"
]

for col in NUMERIC_COLUMNS:
    if col in df.columns:
        converted = pd.to_numeric(df[col], errors="coerce")

        # These columns should contain whole numbers
        invalid_decimal = (
            converted.notna() & (converted % 1 != 0)
        )

        converted.loc[invalid_decimal] = np.nan

        df[col] = converted.astype("Int64")


# ==========================================================
# 11. STANDARDIZE CATEGORICAL VALUES
# ==========================================================

CATEGORICAL_COLUMNS = [
    "Attrition", "BusinessTravel", "Department",
    "EducationField", "Gender", "JobRole",
    "MaritalStatus", "Over18", "OverTime"
]

for col in CATEGORICAL_COLUMNS:
    if col in df.columns:
        df[col] = df[col].astype("string").str.strip()


# Standardize Yes / No
YES_NO_COLUMNS = ["Attrition", "OverTime", "Over18"]

for col in YES_NO_COLUMNS:
    if col in df.columns:
        df[col] = df[col].str.lower().map({
            "yes": "Yes",
            "no": "No"
        }).fillna(df[col])


# Standardize Gender
if "Gender" in df.columns:
    df["Gender"] = df["Gender"].str.lower().map({
        "male": "Male",
        "female": "Female"
    }).fillna(df["Gender"])


# ==========================================================
# 12. VALIDATE HR BUSINESS RULES
# ==========================================================

VALID_RANGES = {
    "Age": (18, 100),
    "Education": (1, 5),
    "EnvironmentSatisfaction": (1, 4),
    "JobInvolvement": (1, 4),
    "JobLevel": (1, 5),
    "JobSatisfaction": (1, 4),
    "PerformanceRating": (1, 4),
    "RelationshipSatisfaction": (1, 4),
    "WorkLifeBalance": (1, 4),
    "StockOptionLevel": (0, 3),
    "HourlyRate": (0, 100),
    "PercentSalaryHike": (0, 100),
    "DailyRate": (0, None),
    "DistanceFromHome": (0, None),
    "MonthlyIncome": (0, None),
    "MonthlyRate": (0, None),
    "NumCompaniesWorked": (0, None),
    "TotalWorkingYears": (0, None),
    "TrainingTimesLastYear": (0, None),
    "YearsAtCompany": (0, None),
    "YearsInCurrentRole": (0, None),
    "YearsSinceLastPromotion": (0, None),
    "YearsWithCurrManager": (0, None)
}

invalid_value_counts = {}

for col, (minimum, maximum) in VALID_RANGES.items():

    invalid = pd.Series(False, index=df.index)

    if minimum is not None:
        invalid |= df[col].notna() & (df[col] < minimum)

    if maximum is not None:
        invalid |= df[col].notna() & (df[col] > maximum)

    invalid_value_counts[col] = int(invalid.sum())

    df.loc[invalid, col] = pd.NA


# ==========================================================
# 13. HANDLE MISSING NUMERIC VALUES
# ==========================================================

# Do not invent EmployeeNumber values.
# Constant/reference columns are preserved without imputation.

PROTECTED_COLUMNS = [
    "EmployeeNumber",
    "EmployeeCount",
    "StandardHours",
    "Over18"
]

numeric_cols = df.select_dtypes(
    include=["number"]
).columns.tolist()

imputation_log = {}

for col in numeric_cols:

    if col in PROTECTED_COLUMNS:
        continue

    if df[col].isnull().any():

        median_value = df[col].median()

        if pd.notna(median_value):

            count = int(df[col].isnull().sum())

            df[col] = df[col].fillna(median_value)

            imputation_log[col] = {
                "method": "Median",
                "filled": count
            }


# ==========================================================
# 14. HANDLE MISSING CATEGORICAL VALUES
# ==========================================================

categorical_cols = df.select_dtypes(
    include=["object", "string"]
).columns.tolist()

for col in categorical_cols:

    if col in PROTECTED_COLUMNS:
        continue

    if df[col].isnull().any():

        mode_values = df[col].mode(dropna=True)

        if not mode_values.empty:

            count = int(df[col].isnull().sum())

            df[col] = df[col].fillna(
                mode_values.iloc[0]
            )

            imputation_log[col] = {
                "method": "Mode",
                "filled": count
            }


# ==========================================================
# 15. EMPLOYEE NUMBER VALIDATION
# ==========================================================

duplicate_employee_numbers = (
    int(
        (
            df["EmployeeNumber"].notna()
            & df["EmployeeNumber"].duplicated(keep=False)
        ).sum()
    )
    if "EmployeeNumber" in df.columns
    else 0
)

print(
    "Duplicate Employee Numbers:",
    duplicate_employee_numbers
)


# ==========================================================
# 16. FINAL DATA VALIDATION
# ==========================================================

missing_after = int(df.isnull().sum().sum())

final_duplicates = int(df.duplicated().sum())

final_rows = len(df)
final_columns = len(df.columns)

print("\n========== FINAL DATA VALIDATION ==========")

print("Final Rows:", final_rows)
print("Final Columns:", final_columns)
print("Remaining Missing Values:", missing_after)
print("Remaining Duplicate Rows:", final_duplicates)


# ==========================================================
# 17. EXPORT CLEANED CSV
# ==========================================================

df.to_csv(
    OUTPUT_FILE,
    index=False,
    encoding="utf-8-sig"
)

print("\nCleaned CSV successfully exported!")


# ==========================================================
# 18. GENERATE CLEANING SUMMARY REPORT
# ==========================================================

report = []

report.append("=" * 55)
report.append("HR EMPLOYEE ATTRITION CLEANING REPORT")
report.append("=" * 55)

report.append(f"Original Rows: {original_rows}")
report.append(f"Original Columns: {original_columns}")

report.append(f"Final Rows: {final_rows}")
report.append(f"Final Columns: {final_columns}")

report.append(f"Empty Rows Removed: {empty_rows}")
report.append(f"Empty Columns Removed: {len(empty_columns)}")

report.append(f"Duplicate Rows Removed: {duplicate_count}")
report.append(f"Missing Before Cleaning: {missing_before}")
report.append(f"Missing After Cleaning: {missing_after}")

report.append(
    f"Duplicate Employee Numbers: {duplicate_employee_numbers}"
)

report.append("\nInvalid Values Detected:")

for col, count in invalid_value_counts.items():
    if count > 0:
        report.append(f"{col}: {count}")

report.append("\nImputation Details:")

for col, details in imputation_log.items():
    report.append(
        f"{col}: {details['method']} - "
        f"{details['filled']} values filled"
    )

report.append("\nRemaining Missing Values by Column:")

remaining = df.isnull().sum()

for col, count in remaining.items():
    if count > 0:
        report.append(f"{col}: {count}")

report.append("\n" + "=" * 55)
report.append("DATA CLEANING COMPLETED SUCCESSFULLY")
report.append("=" * 55)

REPORT_FILE.write_text(
    "\n".join(report),
    encoding="utf-8"
)

print(f"\nCleaned Dataset:\n{OUTPUT_FILE}")
print(f"Cleaning Report:\n{REPORT_FILE}")

print("\n========== PROCESS COMPLETED ==========")
