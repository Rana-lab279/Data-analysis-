# CLINICAL TRIAL FOR TREATMENT X

![Status](https://img.shields.io/badge/Status-Complete-brightgreen)
![Last Updated](https://img.shields.io/badge/Last%20Updated-2026-blue)
![Number of the Participants](https://img.shields.io/badge/Number%20of%20the%20participants-350-orange)
![Data Source](https://img.shields.io/badge/Data%20Source-N/A-red)


## Table of Contents

- [Project Overview](#project-overview)
- [Research Question](#research-question)
- [Key Findings](#key-findings)
- [Dataset](#dataset)
- [Methodology](#methodology)
- [Data Limitations](#data-limitations)
- [Author](#author)


---


## Project Overview

This project included 350 participants with a median age of 50 (24.50) years and a mean BMI of 27.27 ± 4.52 kg/m². Of the participants, 56.6% were female and 43.4% were male. Regarding comorbidities, 39.1% had hypertension, 30.3% had diabetes, and 13.4% had chronic kidney disease. The study aimed to assess the effect of Treatment X on systolic blood pressure, diastolic blood pressure, and fasting blood glucose, and to determine if age, gender, BMI, and comorbidities influenced these changes.


**Project Goal**: 1. To detect the effect of treatment X on blood pressure BP and fasting blood glucose FBG of the participants Z. 2. To assess the relationship between the changes in fasting blood glucose FBG and blood pressure (Systolic blood pressure SBP and diastolic blood pressure DBP) of the participants with age and BMI in both males and females. 3. To determine the relationship between age, gender, BMI, hypertension, diabetes, and CKD with the changes in blood pressure and blood glucose.


---


## Research Question

**What is the effect of treatment X on blood pressure and fasting blood glucose of the participants Z?**


---


## Key Findings

1. **Treatment X was effective**: Significant reductions were seen in all outcomes after treatment. SBP decreased by 11.95 mmHg, DBP by 7.04 mmHg, and FBG by 18.25 mg/dl. All changes were statistically significant, p < 0.001.
2. **Effect was consistent across groups**: There was no significant correlation between the changes in SBP, DBP, or FBG and age or BMI. 
3. **No predictors identified**: In both simple and multiple regression, age, gender, BMI, hypertension, diabetes, and CKD were not significant predictors of change in SBP, DBP, or FBG. The only exception was a weak correlation between change in DBP and age in males.



### Complete file for results interpretation
📥 [Download](Results%20Interpretation.pdf)


---


## Dataset

### Data Source
- **Primary Source**: N/A
- **Dataset Name**: participant_clinical_dataset_350_raw_data.xlsx
- **Dataset file**: 📥 [Download](participant_clinical_dataset_350_raw_data.xlsx) 
- **Number of participants**: 350



---


## Methodology

**1- Data Cleaning & Editing** 
    - Responses were standardized, e.g. "ye" was changed to "yes"  
- Autumaticly recode `Gender`, `Hx Diabetes` `Hx Hypertension', `HxCKD' from string to numeric. 
- Recode the new variables (1=0), (2=1) to the new variables `Gender3`, `Hypertension3`, `Diabetes3`, and `CKD3'.
- Delete the variables created from automatic recoding to avoid confusion. 
    - The variable "FastingSugarChange" was deleted due to missing data and a new one was created with the same name using the formula ` FastingSugarChange = FastingSugarPost - FastingBloodSugarPre`  
- Variables were aligned, values labeled and decimals were removed from some variables 

 **2- Descriptive Statistics**  
    - Frequencies and percentages were calculated for gender and comorbidities  
    - Age was reported as Median (IQR) as it was not normally distributed  
    - BMI was reported as Mean +/- SD as it was normally distributed  

**3- Paired t-test**  
    - Normality of the change variables was tested  
    - Paired t-test was used to compare before and after values  
    - Box plots were created for BP and FBG before and after  

 **4- Correlation**  
    - Pearson correlation was used between changes in SBP, DBP, FBG and age, BMI  
    - No significant correlations were found overall  
    - Analysis was stratified by gender. A weak significant correlation was found in males between change in DBP and age, and change in DBP and change in SBP  

**5- Regression**  
    - Simple and multiple linear regression were performed to assess predictors of change in SBP, DBP, and FBG  
    - Age, gender, BMI, hypertension, diabetes, and CKD were not significant predictors  
    - The analysis was repeated after stratification by gender and results remained non-significant  


### Analysis tools
- SPSS V.27 for data cleaning, editing, analysis and visualization.


**SPSS syntax file for reproducibility**: 📥 [Download](First%20data%20analysis%20project_MALARIA.sps) 


---


## Data Limitations

### Key Limitations to Consider

- Results may not be generalizable.
- No control group. Cannot confirm if changes were due only to Treatment X.
- Only pre and post measurements. No long-term follow-up data.
- Comorbidities were likely self-reported, risk of misclassification.
- Potential confounders not measured, e.g. medication adherence, diet, lifestyle.


---


## Author

**Rana Lab 279**

- **GitHub**: [@Rana-lab279](https://github.com/Rana-lab279)
- **Project Repository**: [Data-analysis-](https://github.com/Rana-lab279/Data-analysis-)
- **Analysis Date**: 2026
- **Contact**: www.linkedin.com/in/rana-hakim-5161b5204

### About This Analysis
This was the second analysis conducted as part of a comprehensive data analysis training. The work demonstrates skills in:

- Data cleaning and editing
- Descriptive statistics
- Normality testing
- Paired t-test
- Pearson correlation analysis
- Linear regression: simple and multiple
- Stratified analysis by gender
- Data visualization with box plots


---


**Last Updated**: September 2026 | **Status**: Complete ✓










