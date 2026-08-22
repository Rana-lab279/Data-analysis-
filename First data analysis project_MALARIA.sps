* Encoding: UTF-8.



******This analysis of the "Malaria" data******


*****Research question: How has malaria incidence changed across countries from 2000 to 2024, and which countries experienced the largest reductions and increases?*****
    
*First import data*

*Delete unnecessary variables (IND_ID, IND_CODE, IND_UUID, IND_PER_CODE, DIM_TIME_TYPE, DIM_GEO_CODE_M49, DIM_PUBLISH_STATE_CODE, IND_NAME)
    and keep (DIM_GEO_CODE_TYPE, GEO_NAME_SHORT, DIM_TIME,    RATE_PER_1000_N,    RATE_PER_1000_NL,   RATE_PER_1000_NU)                                       
    

**Label and edit variables**

 

* Filter out any geographical unit other than "COUNTRY"*

DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(DIM_GEO_CODE_TYPE = "COUNTRY").
VARIABLE LABELS filter_$ 'DIM_GEO_CODE_TYPE = "COUNTRY" (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.




*Aggregate the countries by number of cases then sort to see list of countries and know which has missing years*

DATASET DECLARE Malaria_aggregate_by_country.
SORT CASES BY GEO_NAME_SHORT.
AGGREGATE
  /OUTFILE='Malaria_aggregate_by_country'
  /PRESORTED
  /BREAK=GEO_NAME_SHORT
  /N_BREAK=N.


*To calculate the overall change in malaria incidence from 2000 to 2024, create 2 variables for incdence in 2024 and in 2000 and then subtract to calculate the change*
    
*Create new variable for incidence in 2024 across countries*
    
IF  (DIM_TIME = 2024) year_2024=RATE_PER_1000_N.
VARIABLE LABELS  year_2024 'IF (DIM_TIME = 2024) year_2024=RATE_PER_1000_N '.
EXECUTE.

*Create new variable for incidence in 2000 across countries*

IF  (DIM_TIME = 2000) year_2000=RATE_PER_1000_N.
VARIABLE LABELS  year_2000 'IF (DIM_TIME = 2000) year_2000=RATE_PER_1000_N '.
EXECUTE.

*Discriptive analysis to see the median in 2000 and 2024*


DATASET ACTIVATE DataSet1.
EXAMINE VARIABLES=year_2024
  /PLOT BOXPLOT STEMLEAF
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

EXAMINE VARIABLES=year_2000
  /PLOT BOXPLOT STEMLEAF
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.



*Aggregate before calculating the change to combine incidence in 2000 and 2024 into one row per country*

DATASET DECLARE Aggregate_malaria2.
AGGREGATE
  /OUTFILE='Aggregate_malaria2'
  /BREAK=GEO_NAME_SHORT
  /year_2000_max_1=MAX(year_2000) 
  /year_2024_max=MAX(year_2024).

*Calculate the change by subtracting 2024-2000*

DATASET ACTIVATE Aggregate_malaria2.
COMPUTE Change=year_2024_max - year_2000_max_1.
VARIABLE LABELS  Change 'COMPUTE Change=year_2024_max - year_2000_max_1'.
EXECUTE.


*Examine "Change" descriptives to see how has malaria incidence changed across countries from 2000 to 2024 and to check for normality*

EXAMINE VARIABLES=Change
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.


*Sort "Change" to see which countries experienced the largest reductions or increases*
    


*Statistical analysisi to determine if the change in malaria incidence across countries from 2000 to 2024 is significant*

*Nonparametric Tests: Related Samples. 
NPTESTS 
  /RELATED TEST(year_2000_max_1 year_2024_max) WILCOXON 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05  CILEVEL=95.



