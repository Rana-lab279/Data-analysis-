# Global Malaria Incidence Analysis (2000-2024)

![Status](https://img.shields.io/badge/Status-Complete-brightgreen)
![Last Updated](https://img.shields.io/badge/Last%20Updated-2026-blue)
![Countries Analyzed](https://img.shields.io/badge/Countries%20Analyzed-103-orange)
![Data Source](https://img.shields.io/badge/Data%20Source-WHO-red)

## Table of Contents

- [Project Overview](#project-overview)
- [Background & Significance](#background--significance)
- [Research Question](#research-question)
- [Key Findings](#key-findings)
- [Dataset](#dataset)
- [Methodology](#methodology)
  - [Data Cleaning & Editing](#1-data-cleaning--editing)
  - [Data Analysis](#2-data-analysis)
  - [Visualization](#3-visualization)
- [Data Limitations](#data-limitations)
- [Author](#author)

---

## Project Overview

This project **analyzes the change in malaria incidence from 2000 to 2024 across 103 countries** using publicly available data from the WHO website. The analysis examines temporal trends in malaria epidemiology and identifies countries with the most significant reductions and increases over this 25-year period.

**Project Goal**: To determine how malaria incidence has changed across countries from 2000 to 2024, and identify which countries experienced the largest reductions or increases.

---

## Background & Significance

Malaria remains a leading cause of morbidity and mortality in low- and middle-income countries, particularly in sub-Saharan Africa. Understanding temporal trends in malaria incidence across diverse geographical contexts is critical for:

- Evaluating the effectiveness of malaria control interventions (bed nets, antimalarial drugs, vaccines)
- Identifying countries needing targeted public health interventions
- Informing resource allocation for global health initiatives
- Supporting evidence-based policymaking

This analysis contributes to understanding the global malaria burden trajectory and regional disparities in disease control progress.

---

## Research Question

**How has malaria incidence changed across countries from 2000 to 2024, and which countries experienced the largest reductions and increases?**

---

## Key Findings

### Overall Trend
- **Median change in malaria incidence (2000-2024)**: -17.78 cases per 1,000 population at risk
- **Interquartile Range (IQR)**: 109.76
- **Direction**: Overall reduction across the majority of countries analyzed
- **Statistical Significance**: Wilcoxon Signed Rank Test (p < 0.001) 

### Countries with Largest Reductions

| Rank | Country | Change (cases per 1,000) | 
|------|---------|--------------------------|
| 1 | Solomon Islands | -359.54 | 
| 2 | Guinea-Bissau | -286.34 | 
| 3 | Burkina Faso | -243.68 | 

### Countries with Largest Increases

| Rank | Country | Change (cases per 1,000) | 
|------|---------|--------------------------|
| 1 | Madagascar | 200.59 | 
| 2 | Eritrea | 83.43 | 
| 3 | Djibouti | 42.02 | 

### Complete file for results interpretation
📥 [Download](Results%20Interpretation.pdf)
---

## Dataset

### Data Source
- **Primary Source**: [WHO](https://data.who.int/countries/729)
- **Dataset Name**: RELAY_WHS
- **Dataset file**: 📥 [Download](RELAY_WHS.csv) 
- **Time Period**: 2000 to 2024 (25 years)
- **Countries in the file**: 108



---

## Methodology

### 1. Data Cleaning & Editing

Prepare raw WHO data for analysis by removing irrelevant variables and filtering to country-level units.

**Variables Removed** (n=8):
- `IND_ID`, `IND_CODE`, `IND_UUID`, `IND_PER_CODE`,`DIM_TIME_TYPE`, `DIM_GEO_CODE_M49`, `DIM_PUBLISH_STATE_CODE`, `IND_NAME`

**Variables Retained** (n=6): 
- `DIM_GEO_CODE_TYPE`, `DIM_TIME`, `GEO_NAME_SHORT`, `RATE_PER_1000_N`, `RATE_PER_1000_NL`, `RATE_PER_1000_NU`

 **Data after removing variables, labeling and left alignment**: 📥 [Download](cleaned%20malaria%20data.sav)   Documentation of the file 📥 [Download](10th%20AUGUST%202026.pdf) 



**Data Filtering & Aggregation**:
- Filtered to include only "COUNTRY" geographical units (excluded regional/continental aggregates)
- Aggregated malaria incidence by country across all regions within each country
- Sorted by number of cases to identify missing data patterns across years

**Data Completeness**: 
- Countries with complete 2000 and 2024 data: 103
- Countries with missing data for 2000 and/or 2024: 5
- Handling strategy: Missing countries were excluded from the analysis

### 2. Data Analysis

**Step 1: Variable Creation**
- Created `year_2000_max_1`: Malaria incidence in 2000 for each country
- Created `year_2024_max`: Malaria incidence in 2024 for each country

**Step 2: Change Calculation**
- Data was aggregated before calculating the change to combine incidence in 2000 and 2024 into one row per country.
- The change was calculated using the formula: `Change = year_2024_max - year_2000_max_1`
- Interpretation: Negative values = reduction; Positive values = increase

**Step 3: Descriptive Statistics**
- Descriptives on Change, year_2024_max, and year_2000_max_1 to know the median, IQR and to check for normality

### 3. Visualization
- Tables: Table 1: Showing the median, IQR, p-value and z-score of malaria incidence
          Table 2: Malaria incidence in 2000 and 2024 across 108 countries, organized by the difference in incidence from the highest increase to the highest                         decrease.
- Figures: Geographical map (country-level color-coded by change magnitude)

### Analysis tools
- SPSS V.27 for data cleaning, editing and analysis
- Microsoft Excel 2024 for Visualization

**SPSS syntax file for reproducibility**: 📥 [Download](First%20data%20analysis%20project_MALARIA.sps) 

---

## Data Limitations

### Key Limitations to Consider

   - Not all countries had consistent data across all 24 years. And not all countries were included in the original file
   - Missing information such as population at risk may prevent performing other types of analysis.
     
   - Variation in case reporting standards across countries and time periods
   - Improved diagnostics over time may create artificial increases in some countries
   - Differences in surveillance system sensitivity and specificity

   - Assumes data comparability across countries and time periods
   - 2000 and 2024 data may reflect different case definitions
   - Does not account for changes in population at risk

   - Analysis describes correlation with time, not causation
   - Cannot attribute changes to specific interventions without additional data
   - Cross-country comparisons complicated by differing healthcare infrastructure

   - Sample sizes vary by country; some analyses based on small numbers
   - Does not adjust for multiple comparisons in country-specific analyses
   - Extreme outliers may disproportionately influence results

---

## Author

**Rana Lab 279**

- **GitHub**: [@Rana-lab279](https://github.com/Rana-lab279)
- **Project Repository**: [Data-analysis-](https://github.com/Rana-lab279/Data-analysis-)
- **Analysis Date**: 2026
- **Contact**: www.linkedin.com/in/rana-hakim-5161b5204

### About This Analysis
This analysis was conducted as part of a comprehensive data analysis training project focusing on global malaria incidence. The work demonstrates skills in:
- Data cleaning and preprocessing
- Statistical analysis and hypothesis testing
- Epidemiological data interpretation
- Professional data visualization
- Scientific communication

---

**Last Updated**: August 2026 | **Status**: Complete ✓
