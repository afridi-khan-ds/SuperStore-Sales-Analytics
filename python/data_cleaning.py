import pandas as pd

print("Script started")

# Load raw dataset
df = pd.read_csv("data/raw/SuperStore_Sales_Dataset.csv")
print("Raw data loaded")

# Standardize column names
df.columns = (
    df.columns
    .str.strip()
    .str.lower()
    .str.replace(" ", "_")
)

# Convert date columns safely
df["order_date"] = pd.to_datetime(df["order_date"], errors="coerce")
df["ship_date"] = pd.to_datetime(df["ship_date"], errors="coerce")

# Drop invalid dates
df = df.dropna(subset=["order_date", "ship_date"])

# Create delivery days column
df["delivery_days"] = (df["ship_date"] - df["order_date"]).dt.days

# Ensure numeric columns
for col in ["sales", "profit", "quantity", "discount"]:
    if col in df.columns:
        df[col] = pd.to_numeric(df[col], errors="coerce").fillna(0)

# Remove duplicates
df = df.drop_duplicates()

# Save cleaned dataset
df.to_csv("data/cleaned/cleaned_superstore_sales.csv", index=False)

print("Cleaned file created successfully")
print("Rows:", df.shape[0])
