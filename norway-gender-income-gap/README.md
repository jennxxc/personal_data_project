# Gender Income Gap & Labor Participation in Norway (1967–2024)

An independent SQL and Python project analyzing five decades of Statistics Norway (SSB) pensionable income data to uncover how economic gender equality has evolved across two dimensions: income and participation.

## 🛠️ Tech Stack
- **Database:** MySQL (CTEs, Window Functions, DDL, Indexing)
- **Data Processing:** Python (Pandas, SQLAlchemy)
- **Visualization:** Matplotlib

## 📌 Executive Summary
Between 1967 and 2024, the gender income gap in Norway narrowed substantially, yet significant disparities persist. While the female-to-male median income ratio improved markedly, the absolute NOK gap and compound wealth index reveal a persistent top-tier concentration among men. Furthermore, despite a massive influx of women into the taxable population, structural differences in the labor market remain. The distinct inflection points and cyclic fluctuations across the data strongly suggest that macroeconomic shifts and policy changes have continuously shaped these structural dynamics over the past five decades.

## 📊 Key Findings & Visualizations

### 1. Income Ratio: Median vs. Average
![Income Ratio](https://github.com/jennxxc/personal_data_project/tree/main/norway-gender-income-gap/figure/gender_income_gap.png)
**Insight:** The female-to-male median income ratio and the female-to-male average income ratio both exhibit a notable trough in 1974, followed by a long-term upward trend. A structural shift is evident around 1993: prior to this, the average ratio consistently exceeded the median ratio, but afterward, the median ratio overtook the average and remained higher.

### 2. Distribution Skewness: The Top-Tier Effect
![Skewness](https://github.com/jennxxc/personal_data_project/tree/main/norway-gender-income-gap/figure/income_skewness_trend.png)
**Insight:** The skewness (average income minus median income) explains the 1993 crossover. Prior to 1993, female income exhibited a higher absolute skewness than male income (female average > female median). After 1993, this reversed: male skewness surged dramatically, indicating that a growing concentration of high earnings among men pulled the male average up, while female skewness remained lower and relatively stable.

### 3. Absolute Gap: The NOK Reality
![Absolute Gap](https://github.com/jennxxc/personal_data_project/tree/main/norway-gender-income-gap/figure/gender_income_gap_median.png)
**Insight:** While the relative ratios suggest convergence, the absolute NOK gap remains large and highly cyclical. The gap shows distinct troughs (e.g., 2003, 2008, 2015) and sudden peaks (e.g., 2021). These fluctuations often coincide with macroeconomic cycles, such as the 2008 financial crisis and the post-pandemic energy boom in 2021, which disproportionately impact male-dominated sectors.

### 4. Decadal Shift: The Momentum
![Decadal Shift](https://github.com/jennxxc/personal_data_project/tree/main/norway-gender-income-gap/figure/decadal_trend.png)
**Insight:**  When aggregating by decade, the 1990s delivered the most aggressive improvement in the female-to-male ratio (+12 pp). This period aligns with the expansion of Norway's public sector and welfare services. However, since 2010, progress has plateaued, suggesting that earlier policy interventions may have reached their structural limits.

### 5. Indexed Growth: The Compounding Gap
![Indexed Growth](https://github.com/jennxxc/personal_data_project/tree/main/norway-gender-income-gap/figure/income_index.png)
**Insight:** By indexing to 1967 (female = 100), the compounding effect of economic growth becomes clear. While the female-to-male ratio improves, the absolute indexed income of males reached 4514, compared to 3773 for females. The shaded gap demonstrates that relative convergence does not prevent an exponential widening of the absolute monetary gap over time.

### 6. Participation: The Underlying Driver
![Participation](https://github.com/jennxxc/personal_data_project/tree/main/norway-gender-income-gap/figure/female_share.png)
**Insight:** The labor participation data provides context for the long-term trend. The primary chart shows female participation rising from 33.9% to 46.6%. Crucially, the inset reveals this was not a result of male withdrawal: both genders saw an increase in absolute taxable persons. However, female earners experienced a much steeper absolute growth (from ~0.4M to 1.65M), while male earners grew more gradually (from ~1.0M to 1.9M)

---

## 🔍 Data Quality & Interpretation

- **Data Quality Check:** I examined the dataset and discovered a micro-discrepancy (~0.0004%) between the official Both sexes and the sum of Females + Males. To ensure consistency, all calculations used Females + Males.
- **Handling Partial Windows:** For the 5-year moving average, years 1967-1970 did not have enough historical data. I handled this by setting early years to NULL in the SQL query, preventing AVG() calculating misleading partial averages.

## 📂 Repository Structure
- `data/`: Contains the raw and processed datasets.
- `figure/`: Contains the generated visualizations.
- `code/`: Contains the Python ETL scripts and the SQL queries used for the analysis.
