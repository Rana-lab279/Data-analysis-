# Data-analysis- project-1#


# Malaria-incidence-between-2000-and-2024-analysis#


##project overview##

This project analyses the change in malaria incidence from 2000 to 2024 across 103 countries using the publicly available data from WHO website.
The goal was to examine how malaria incidence has changed across countries from 2000 to 2024, and determine which countries experienced the largest reductions or increases.


##Research question##

How has malaria incidence changed across countries from 2000 to 2024, and which countries experienced the largest reductions and increases?


##Key findings##

The results showed overall, reduction in malaria between 2000 and 2024 across 103 countries (median = -17.78, IQR = 109.76). A Wilcoxon Signed Rank Test was used to compare the difference in malaria incidence in 2000 and 2024. A statistically significant difference was observed in the results p-value < 0.001. The median of malaria incidence in 2024 (median = 7.1991, IQR = 179.67) was lower than the median of malaria incidence in 2000 (median = 31.7598, IQR = 325.95).
However, the change was not uniform across countries. The largest reduction in malaria incidence was observed in Solomon Islands, Guinea-Bissau and Burkina Faso with changes of -359.54, -286.34 and -243.68 cases per 1000 population, respectively. In contrast, Madagascar, Eritrea and Djibouti experienced the largest increases, with changes of 200.59, 83.43, and 42.02 cases per 1,000 population, respectively.


##Dataset##

Data source: [https://data.who.int/countries/729]

Original data set file: 📥 [Download Dataset](RELAY_WHS.csv)

Data after cleaning and removing unnecessary variables: 📥 [Download Dataset](cleaned%20malaria%20data.sav)

Time period: 2000 to 2024


##Methodology##

1. Data cleaning and editing:
   - Unnecessary variables (IND_ID, IND_CODE, IND_UUID, IND_PER_CODE, DIM_TIME_TYPE, DIM_GEO_CODE_M49, DIM_PUBLISH_STATE_CODE, IND_NAME) were deleted while (DIM_GEO_CODE_TYPE, GEO_NAME_SHORT, DIM_TIME, RATE_PER_1000_N, RATE_PER_1000_NL, RATE_PER_1000_NU) were kept, labeled, and aligned left.
  - All geographical units other than "COUNTRY" were filtered out.
  - Countries were aggregated by the number of cases then sorted to see the list of countries and know which had missing years.

2. Data analysis:
  - To calculate the overall change in malaria incidence from 2000 to 2024, 2 variables were created for incidence in 2024 and in 2000. Descriptive analysis was performed to see the median and IQR in 2000 and 2024.
  - Data was aggregate before calculating the change to combine incidence in 2000 and 2024 into one row per country. The change was calculated by subtracting 2024-2000.
  - Descriptive analysis was done on "Change" to see how malaria incidence has changed across countries from 2000 to 2024 and to check for normality.
  - The change in malaria incidence was sorted to see which countries experienced the largest reductions or increases.
  - Statistical analysis (Wilcoxon signed rank test) was performed because data was not normally distributed to determine if the change in malaria incidence across countries from 2000 to 2024 is significant.       

3. Visualization:
 - The geographical map showing the change in malaria incidence across countries was created using Excel.


##Tools used##
 - SPSS V.27 for data cleaning and analysis.
 - Excel for visualization.
