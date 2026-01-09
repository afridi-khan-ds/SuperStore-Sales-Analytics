import pandas as pd

df = pd.read_csv("data/processed/cleaned_superstore_sales.csv")

print("Total Sales:", round(df["sales"].sum(), 2))
print("Total Profit:", round(df["profit"].sum(), 2))
print("Total Orders:", df["order_id"].nunique())
print("Average Delivery Days:", round(df["delivery_days"].mean(), 2))

# Sales by Region
print(df.groupby("region")["sales"].sum())

# Sales by Segment
print(df.groupby("segment")["sales"].sum())

# Sales by Category
print(df.groupby("category")["sales"].sum())
