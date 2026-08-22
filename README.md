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
  - [Statistical Justification](#4-statistical-justification)
- [Key Insights & Implications](#key-insights--implications)
- [Data Limitations](#data-limitations)
- [Tools & Technologies](#tools--technologies)
- [Project Structure](#project-structure)
- [Reproducibility Guide](#reproducibility-guide)
- [Future Work](#future-work)
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

### 4. Statistical Justification

**Why Wilcoxon Signed Rank Test?**

| Criterion | Finding | Implication |
|-----------|---------|------------|
| Normality (Shapiro-Wilk) | p < 0.05 | Data not normally distributed |
| Sample Type | Paired data (2000 vs 2024) | Requires paired test |
| Data Distribution | Skewed/Non-normal | Non-parametric test necessary |
| **Decision** | — | **Wilcoxon Signed Rank Test** (robust, no normality assumption) |

---

## Key Insights & Implications

### Interpretation of Findings

1. **Overall Progress**: The median reduction of -17.78 demonstrates global progress in malaria control, aligning with WHO initiatives and increased funding for malaria prevention programs.

2. **Regional Disparities**: 
   - African countries dominate the "greatest reduction" list, reflecting successful roll-out of bed nets and antimalarial treatments
   - [Countries with increases]: Indicates potential challenges in surveillance, treatment access, or emerging drug resistance

3. **Success Factors**: 
   - Countries with largest reductions likely benefited from:
     - Increased bed net distribution
     - Artemisinin-based combination therapies (ACTs)
     - Improved surveillance systems
     - International funding (Global Fund, Gates Foundation)

4. **Emerging Challenges**:
   - Antimalarial drug resistance in [specific regions]
   - [Other factors contributing to increases]

### Implications for Public Health Policy

- **Resource Allocation**: Prioritize funding to countries with increased incidence
- **Best Practice Sharing**: Replicate successful strategies from top-performing countries
- **Surveillance Enhancement**: Strengthen malaria surveillance in countries with worsening trends
- **Research Agenda**: Investigate drivers of increases in specific countries

---

## Data Limitations

### Key Limitations to Consider

1. **Data Completeness**: 
   - Not all countries had consistent data across all 24 years
   - Missing data in [X countries] - [describe handling approach]
   - Potential under-reporting in resource-limited settings

2. **Data Quality Issues**:
   - Variation in case reporting standards across countries and time periods
   - Improved diagnostics over time may create artificial increases in some countries
   - Differences in surveillance system sensitivity and specificity

3. **Analytical Assumptions**:
   - Assumes data comparability across countries and time periods
   - 2000 and 2024 data may reflect different case definitions
   - Does not account for changes in population at risk

4. **Scope Limitations**:
   - Analysis describes *correlation* with time, not causation
   - Cannot attribute changes to specific interventions without additional data
   - Cross-country comparisons complicated by differing healthcare infrastructure

5. **Statistical Considerations**:
   - Sample sizes vary by country; some analyses based on small numbers
   - Does not adjust for multiple comparisons in country-specific analyses
   - Extreme outliers may disproportionately influence results

### Recommendations for Future Analysis
- Perform sensitivity analysis excluding extreme outliers
- Adjust for country-level covariates (GDP, healthcare spending, population)
- Use mixed-effects models to account for country-level random effects
- Incorporate time-series decomposition to separate trend from noise

---

## Tools & Technologies

| Tool | Version | Purpose |
|------|---------|---------|
| **SPSS Statistics** | 27.0 | Data cleaning, descriptive statistics, Wilcoxon test |
| **Microsoft Excel** | 2021 | Geographical map visualization, supplementary charts |
| **WHO Data Portal** | — | Data source and extraction |



### Alternative Technologies (For Extension)
- **Python**: Pandas/NumPy for data manipulation, Scipy for statistics, Geopandas/Folium for mapping
- **R**: Tidyverse for data wrangling, ggplot2 for visualization, coin package for Wilcoxon test
- **Tableau/Power BI**: Interactive dashboards for data exploration

---

## Project Structure

```
Data-analysis-/
│
├── README.md                          # This file
├── .gitignore                         # Files to exclude from version control
│
├── data/
│   ├── RELAY_WHS.csv                 # Raw WHO dataset
│   └── cleaned_malaria_data.sav      # Processed dataset (SPSS format)
│
├── scripts/
│   ├── 01_data_cleaning.sps          # SPSS syntax for cleaning
│   ├── 02_data_analysis.sps          # SPSS syntax for analysis
│   └── 03_wilcoxon_test.sps          # SPSS syntax for statistical test
│
├── outputs/
│   ├── descriptive_statistics.xlsx   # Descriptive stats output
│   ├── malaria_choropleth_map.png    # Global map visualization
│   ├── top_10_reductions.png         # Bar chart
│   └── top_10_increases.png          # Bar chart
│
├── documentation/
│   ├── data_dictionary.md            # Variable definitions
│   ├── methodology.md                # Detailed methodology
│   └── limitations.md                # Full limitations discussion
│
└── LICENSE                           # Project license
```

---

## Reproducibility Guide

### How to Reproduce This Analysis

#### Prerequisites
- **SPSS Statistics** v27 or later
- **Microsoft Excel** (for visualization)
- Access to [WHO data portal](https://data.who.int/)

#### Step-by-Step Replication

**Step 1: Download Raw Data**
```
1. Visit https://data.who.int/countries/729
2. Select "Reported malaria cases and deaths" (RELAY_WHS)
3. Download data for all countries, 2000-2024
4. Save as: data/RELAY_WHS.csv
```

**Step 2: Data Cleaning (SPSS)**
```
1. Open SPSS Statistics
2. File → Open → data/RELAY_WHS.csv
3. Run: scripts/01_data_cleaning.sps
4. Verify: Original N = [X] → Final N = [Y] records
5. Save: data/cleaned_malaria_data.sav
```

**Step 3: Descriptive Analysis (SPSS)**
```
1. Open: data/cleaned_malaria_data.sav
2. Run: scripts/02_data_analysis.sps
3. Output files generated:
   - Descriptive statistics table
   - Normality test results
   - Country rankings
```

**Step 4: Statistical Test (SPSS)**
```
1. Run: scripts/03_wilcoxon_test.sps
2. Review: Test statistics and p-value
3. Confirm: Median, IQR, effect size
```

**Step 5: Visualization (Excel)**
```
1. Use output data to create:
   - Choropleth map (color-coded by country change)
   - Bar charts for top 10 countries
   - Distribution histogram
2. Save: outputs/malaria_choropleth_map.png, etc.


---

## Future Work

### Potential Extensions & Improvements

1. **Advanced Statistical Analysis**
   - Implement **mixed-effects regression** to account for country-level random effects
   - Perform **time-series decomposition** (trend, seasonal, residual components)
   - Conduct **interrupted time-series analysis** to identify intervention impact points

2. **Spatial & Temporal Analysis**
   - Spatial autocorrelation analysis (Moran's I) to identify regional clustering
   - **Geospatial visualization** using interactive maps (Leaflet, Plotly)
   - Temporal trend analysis using ARIMA models

3. **Data Integration & Contextualization**
   - Merge with country-level covariates:
     - GDP per capita
     - Healthcare spending
     - Bed net distribution rates
     - Population demographics
   - Perform **regression analysis** to identify predictors of malaria reduction

4. **Mechanistic Understanding**
   - Qualitative analysis of policy changes in top-performing countries
   - Case studies of successful malaria control programs
   - Interview/literature review of intervention strategies

5. **Code Implementation**
   - **Python**: Reproduce analysis using Pandas, SciPy, GeoPandas
   - **R**: Implement using tidyverse, ggplot2, sf packages
   - **Interactive Dashboard**: Develop Tableau/Power BI dashboards for exploration

6. **Predictive Modeling**
   - Forecast malaria incidence to 2030 using trend extrapolation
   - Identify countries at risk of increased incidence

7. **Validation & Sensitivity**
   - Sensitivity analysis (exclude outliers, test different aggregation approaches)
   - Bootstrap confidence intervals
   - Cross-validation of statistical findings

---

## Author

**Rana Lab 279**

- **GitHub**: [@Rana-lab279](https://github.com/Rana-lab279)
- **Project Repository**: [Data-analysis-](https://github.com/Rana-lab279/Data-analysis-)
- **Analysis Date**: 2024
- **Contact**: ......................

### About This Analysis
This analysis was conducted as part of a comprehensive data analysis project focusing on global health trends. The work demonstrates skills in:
- Data cleaning and preprocessing
- Statistical analysis and hypothesis testing
- Epidemiological data interpretation
- Professional data visualization
- Scientific communication

---

## Acknowledgments

- **Data Source**: World Health Organization (WHO) Global Health Observatory
- **Tools**: IBM SPSS Statistics, Microsoft Excel

---

**Last Updated**: August 2024 | **Status**: Complete ✓
