# Data Design

## Healthcare Analytics Platform:
## Monitoring Capacity, Performance and Regional Differences in Norway

---

# 1. Data Design Objective

The objective of this data design is to define the data structure required to build a healthcare analytics platform supporting healthcare resource monitoring, regional comparison and management decision-making.

The data model is designed to integrate multiple healthcare-related datasets into a structured analytical environment.

The design follows a simplified data warehouse approach, where raw data from different sources are transformed into standardized analytical tables that support reporting and dashboard development.

---

# 2. Data Architecture Overview

The analytical workflow follows a BI data pipeline:
Public Healthcare Data Sources - Data Extraction - Data Cleaning and Transformation(Python) - Relational Database (SQLite) - Healthcare KPI Layer(SQL) - Power BI Reporting Layer - Decision Support Insights

---

# 3. Business Data Domains

The healthcare analytics platform consists of three main data domains:

## 3.1 Population Demand

Purpose:

To understand healthcare demand and demographic pressure.

Key questions:

- How many people require healthcare services?
- Which regions have higher ageing pressure?
- How is population structure changing over time?

Main indicators:

- Total population
- Elderly population
- Population growth
- Age distribution

---

## 3.2 Healthcare Capacity

Purpose:

To measure available healthcare resources.

Key questions:

- How many healthcare professionals are available?
- Are resources evenly distributed across regions?
- Which areas experience workforce pressure?

Main indicators:

- Number of physicians
- Number of nurses
- Healthcare workforce density
- Healthcare institutions

---

## 3.3 Healthcare Performance

Purpose:

To monitor healthcare service outcomes and operational pressure.

Key questions:

- Which regions experience longer waiting times?
- How does healthcare activity vary?
- Which areas require improvement?

Main indicators:

- Waiting time
- Hospital activity
- Patient volume
- Healthcare service utilization

---

# 4. Data Model Design

The database follows a star schema design commonly used in business intelligence solutions.
                dim_region

                     |

                     |
dim_time -------- fact_healthcare_metrics -------- dim_indicator
                     |

                     |

             dim_population


The model separates:

- Dimension tables: descriptive information
- Fact tables: measurable healthcare metrics

This structure improves:

- Data consistency
- Query performance
- Reporting flexibility

---

# 5. Fact Table Design

## fact_healthcare_metrics

## Purpose

The central analytical table containing healthcare-related measurements.

## Grain

One row represents:

> One geographic region during one year

Example:


| Region | Year | Doctors | Nurses | Waiting Time |
|---|---|---|---|---|
| Trøndelag | 2022 | xxx | xxx | xx |
| Oslo | 2022 | xxx | xxx | xx |

---

## Schema

| Column | Description |
|---|---|
| region_id | Unique geographic identifier |
| year_id | Reference to time dimension |
| population | Total population |
| elderly_population | Population above defined elderly threshold |
| doctors | Number of physicians |
| nurses | Number of nurses |
| hospital_activity | Healthcare activity measure |
| waiting_time | Average waiting time indicator |

---

# 6. Dimension Table Design

# 6.1 dim_region

## Purpose

Stores geographic information used for regional analysis.

Schema:

| Column | Description |
|---|---|
| region_id | Unique region identifier |
| region_name | Municipality/region name |
| county | County classification |
| health_region | Healthcare administrative region |

Example:

|region_name|health_region|
|-|-|
|Trøndelag|Helse Midt-Norge|
|Oslo|Helse Sør-Øst|

---

# 6.2 dim_time

## Purpose

Provides standardized time information.

Schema:

| Column | Description |
|---|---|
| year_id | Unique year identifier |
| year | Calendar year |


Example:
|year_id|year|
|-|-|
|1|2015|
|2|2016|
|...|...|
|11|2025|

---

# 6.3 dim_indicator

## Purpose

Defines healthcare metrics and business concepts.

This supports consistent KPI definitions and data governance.

Schema:

| Column | Description |
|---|---|
| indicator_id | Unique indicator identifier |
| indicator_name | KPI name |
| definition | Business definition |
| unit | Measurement unit |

Example:

|Indicator|Definition|
|-|-|
|Doctor density|Doctors per 1000 inhabitants|
|Elderly ratio|Population above elderly threshold divided by total population|
|Healthcare pressure index|Composite measure of healthcare demand and capacity pressure|

---

# 7. Data Sources

The project integrates publicly available Norwegian healthcare datasets.

## Population Data

Source:

Statistics Norway (SSB)

Purpose:

Population size and demographic structure.

Required variables:

- Region
- Year
- Total population
- Age groups

---

## Healthcare Workforce Data

Source:

Statistics Norway and Norwegian health statistics

Purpose:

Healthcare resource availability.

Required variables:

- Region
- Year
- Occupation group
- Number of healthcare professionals

---

## Healthcare Activity and Performance Data

Source:

Norwegian health authorities

Purpose:

Healthcare service monitoring.

Required variables:

- Region
- Year
- Waiting time
- Patient activity
- Service utilization

---

# 8. Key Performance Indicators (KPIs)

## KPI 1: Healthcare Workforce Density

Definition:

Number of healthcare professionals per population size.

Purpose:

Measure healthcare resource availability.

---

## KPI 2: Ageing Pressure

Definition:

Share of elderly population compared with total population.

Purpose:

Measure demographic healthcare demand.

---

## KPI 3: Healthcare Pressure Index

Definition:

Composite indicator combining:

- Demographic pressure
- Healthcare demand
- Workforce availability

Purpose:

Identify regions requiring attention.

---

## KPI 4: Waiting Time Trend

Definition:

Change in healthcare waiting time over time.

Purpose:

Monitor healthcare service performance.

---

# 9. Regional Analysis Strategy

The analysis will include two levels:

## National Overview

Purpose:

Understand healthcare variation across Norway.

Analysis:

- Regional comparison
- Ranking
- Geographic visualization

---

## Central Norway Case Study

Focus region:

Helse Midt-Norge

Including:

- Trøndelag
- Møre og Romsdal

Purpose:

Provide a detailed regional analysis relevant to healthcare digitalization and management needs.

---

# 10. Data Quality Considerations

The following data quality aspects will be evaluated:

## Completeness

Are all regions and years represented?

## Consistency

Are definitions consistent across datasets?

## Comparability

Can indicators be compared between regions?

## Reproducibility

Can the data pipeline reproduce the final analytical dataset?

---

# 11. Expected Data Outputs

The final analytical database will support:

## Management Reporting

- Healthcare capacity overview
- Regional comparison
- Trend monitoring

## Analytical Exploration

- Workforce pressure analysis
- Demographic impact analysis
- Performance evaluation

## Power BI Dashboard

- Interactive healthcare overview
- Regional drill-down
- KPI monitoring

---

# Summary

This data design provides the foundation for a healthcare analytics platform that transforms heterogeneous healthcare datasets into structured, standardized and decision-oriented information.

The design demonstrates principles of:

- Data modelling
- Data integration
- KPI governance
- Business intelligence reporting
- Decision-support analytics