# Gender Income Gap & Labor Participation in Norway (1967–2024)

An independent SQL and Python project analyzing five decades of Statistics Norway (SSB) pensionable income data to uncover how economic gender equality has evolved across two dimensions: income and participation.

🔗 **[Read the full data story and view interactive visualizations on my Portfolio Website](https://xiuxianjenniferc.vercel.app/projects/norway-gender-income-gap)**

---
## 🛠️ Tech Stack
- **Database:** MySQL (CTEs, Window Functions, DDL, Indexing)
- **Data Processing:** Python (Pandas, SQLAlchemy)
- **Visualization:** Matplotlib
---
## 📂 Repository Structure
```text
├── data/                  
│   ├── raw/               # Original SSB dataset (CSV)
│   └── processed/         # Cleaned and pivoted dataset ready for SQL import
├── sql/                   
│   ├── Create_DataBase_Pensionable_Income_norge.sql  # DDL for MySQL schema setup
│   ├── 01_gender_income_ratio.sql    # Q1: Median/Average ratio trends
│   ├── 02_absolute_gap.sql           # Q2: Absolute NOK gap & YoY changes
│   ├── 03_decadal_shift.sql          # Q3: Decadal aggregation & momentum
│   ├── 04_income_index.sql           # Q4: Indexing to 1967 baseline
│   └── 05_participation_share.sql    # Q5: Female participation & 5-year moving average
├── scripts/               
│   ├── clean_income.ipynb            # Python ETL: parsing, melting, and cleaning
│   └── visualized_income.ipynb       # Python visualization connected via SQLAlchemy
└── README.md

## 💻 Technical Implementation

### 1. Data Pipeline & Engineering
- **ETL (Extract, Transform, Load):** Raw SSB data was parsed from a wide format CSV using Pandas, unpivoted (melted) into a long format, cleaned of missing values, and exported to a processed CSV (`clean_income.ipynb`).
- **Database Design:** A normalized MySQL database schema was designed with a primary key on `(sex, year)` and an index on `year` to optimize time-series queries.
- **Data Quality Check:** Discovered a micro-discrepancy (~0.0004%) between the official `Both sexes` aggregate and the sum of `Females + Males`. To ensure mathematical consistency, all downstream SQL calculations explicitly filter and aggregate only `Males` and `Females`.

### 2. SQL Techniques Demonstrated
- **Conditional Aggregation (Pivoting):** Used `MAX(CASE WHEN sex='Males' THEN ... END)` to pivot rows into columns, allowing simultaneous calculation of male and female metrics per year.
- **Window Functions:** Used `LAG()` to calculate Year-over-Year (YoY) changes for the absolute gap, and `AVG() OVER (ORDER BY year ROWS BETWEEN 4 PRECEDING AND CURRENT ROW)` to calculate the 5-year moving average for female participation.
- **Handling Partial Windows:** For the 5-year moving average, years 1967-1970 did not have enough historical data. Handled by setting early years to `NULL` in the SQL query via conditional logic, preventing `AVG()` from calculating misleading partial averages.
- **Common Table Expressions (CTEs):** Used to modularize complex queries, such as calculating decadal averages and joining them back to yearly data for momentum analysis.
