# Global Malaria Incidence Analysis (2000-2024)

![Status](https://img.shields.io/badge/Status-Complete-brightgreen)
![Last Updated](https://img.shields.io/badge/Last%20Updated-2024-blue)
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
- [Key Insights & Implications](#key-insights--implications)
- [Data Limitations](#data-limitations)
- [Tools & Technologies](#tools--technologies)
- [Author](#author)

---

## Project Overview

This project **analyzes the change in malaria incidence from 2000 to 2024 across 103 countries** using publicly available data from the WHO website. The analysis examines temporal trends in malaria epidemiology and identifies countries with the most significant reductions and increases over this 25-year period.

**Project Goal**: Determine how malaria incidence has changed across countries from 2000 to 2024, and identify which countries experienced the largest reductions or increases, providing insights for public health policy and intervention planning.

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
1. **Solomon Islands**: -359.54 cases per 1,000
2. **Guinea-Bissau**: -286.34 cases per 1,000
3. **Burkina Faso**: -243.68 cases per 1,000 

| Rank | Country | Change (cases per 1,000) | 
|------|---------|--------------------------|
| 1 | Solomon Islands | -359.54 | 
| 2 | Guinea-Bissau | -286.34 | 
| 3 | Burkina Faso | -243.68 | 

### Countries with Largest Increases
1. **Madagascar**: 200.59 cases per 1,000
2. **Eritrea**: 83.43 cases per 1,000
3. **Djibouti**: 42.02 cases per 1,000 

| Rank | Country | Change (cases per 1,000) | 
|------|---------|--------------------------|
| 1 | Madagascar | 200.59 | 
| 2 | Eritrea | 83.43 | 
| 3 | Djibouti | 42.02 | 

### Complete file for results interpretation
📥 [Download](Results%Interpretation.pdf)

---

## Dataset

### Data Source
- **Primary Source**: [WHO Global Health Observatory](https://data.who.int/countries/729)
- **Dataset Name**: RELAY_WHS
- **Dataset file**: 📥 [Download](RELAY_WHS.csv) 
- **Time Period**: 2000 to 2024 (25 years)
- **Countries Analyzed**: 108



---

## Methodology

### 1. Data Cleaning & Editing

**Objective**: Prepare raw WHO data for analysis by removing irrelevant variables and filtering to country-level units.

**Variables Removed** (n=8):
- `IND_ID`, `IND_CODE`, `IND_UUID`, `IND_PER_CODE`,`DIM_TIME_TYPE`, `DIM_GEO_CODE_M49`, `DIM_PUBLISH_STATE_CODE`, `IND_NAME`

**Variables Retained** (n=6): 
- `DIM_GEO_CODE_TYPE`, `DIM_TIME`, `GEO_NAME_SHORT`,`RATE_PER_1000_N', 'RATE_PER_1000_NL', 'RATE_PER_1000_NU'

 **Data after removing variables, labeling and left alignment**: 📥 [Download](cleaned%20malaria%20data.sav) 

**Data Filtering & Aggregation**:
- Filtered to include only "COUNTRY" geographical units (excluded regional/continental aggregates)
- Aggregated malaria incidence by country across all regions within each country
- Sorted by number of cases to identify missing data patterns across years

**Data Completeness**: 
- Countries with complete 2000-2024 data: 103
- Countries with missing years: 5
- Handling strategy: Missing countries were excluded from the analysis

### 2. Data Analysis

**Step 1: Variable Creation**
- Created `INCIDENCE_2000`: Malaria incidence in 2000 for each country
- Created `INCIDENCE_2024`: Malaria incidence in 2024 for each country

**Step 2: Change Calculation**
- Formula: `CHANGE = INCIDENCE_2024 - INCIDENCE_2000`
- Interpretation: Negative values = reduction; Positive values = increase

**Step 3: Descriptive Statistics**
Analyzed the `CHANGE` variable:
- **Mean**: [Insert value]
- **Median**: -17.78
- **Standard Deviation**: [Insert value]
- **IQR**: 109.76
- **Range**: [Min to Max]
- **Skewness**: [Insert value] (indicates data distribution shape)
- **Kurtosis**: [Insert value]

**Step 4: Normality Testing**
- **Test Used**: Shapiro-Wilk Test or Q-Q Plot
- **Result**: Data **NOT normally distributed** (p < 0.05)
- **Justification for Wilcoxon Test**: Non-parametric test appropriate for non-normal data

**Step 5: Ranking & Sorting**
- Ranked countries by magnitude of change (largest reductions to largest increases)
- Identified top 10 countries with greatest reductions
- Identified top 10 countries with greatest increases

**Step 6: Statistical Inference**
- **Test**: Wilcoxon Signed Rank Test (non-parametric alternative to paired t-test)
- **Null Hypothesis** (H₀): The median change in malaria incidence = 0 (no overall change)
- **Alternative Hypothesis** (H₁): The median change ≠ 0 (significant change exists)
- **Result**: [Insert p-value and conclusion]
- **Effect Size**: [Insert Z-score or r value]

### 3. Visualization

**Geographical Map**: 
- Visualization type: Choropleth map (country-level color-coded by change magnitude)
- Tool: Microsoft Excel
- Shows spatial distribution of malaria incidence changes globally
- Color scale: Red (increases) → Yellow (minimal change) → Green (reductions)

**Supporting Visualizations Created**:
- Top 10 countries with largest reductions (bar chart)
- Top 10 countries with largest increases (bar chart)
- Distribution histogram of all country changes
- Time-series trend lines for select countries


---

## Data Limitations

### Key Limitations to Consider

   - Not all countries had consistent data across all 24 years. And not all countries were included in the analysis
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

### Recommendations for Future Analysis
- Perform sensitivity analysis excluding extreme outliers
- Adjust for country-level covariates (GDP, healthcare spending, population)
- Use mixed-effects models to account for country-level random effects
- Incorporate time-series decomposition to separate trend from noise

---

## Author

**Rana Lab 279**

- **GitHub**: [@Rana-lab279](https://github.com/Rana-lab279)
- **Project Repository**: [Data-analysis-](https://github.com/Rana-lab279/Data-analysis-)
- **Analysis Date**: 2024
- **Contact**: ......................

### About This Analysis
This analysis was conducted as part of a comprehensive data analysis training project focusing on global malaria incidence. The work demonstrates skills in:
- Data cleaning and preprocessing
- Statistical analysis and hypothesis testing
- Epidemiological data interpretation
- Professional data visualization
- Scientific communication

---

**Last Updated**: August 2024 | **Status**: Complete ✓
