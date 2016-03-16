Definitions:
A household includes all the people who occupy a housing unit.
Householder.  One person in each household is designated as the householder (Person 1).  In most cases, the householder is the person, or one of the people, in whose name the home is owned, being bought, or rented.  If there is no such person in the household, any adult household member 15 years old and over could be designated as the householder (i.e., Person 1).
2000 Census Definitions of Households and Families
http://cber.cba.ua.edu/asdc/households_families.html


Educational attainment refers to the highest level of education that an individual has completed. This is distinct from the level of schooling that an individual is attending.
http://www.census.gov/hhes/socdemo/education/


Descriptions: 
There are four compress file in the data folder and one readme file. "census_tract_level.zip", "county_level.zip", "state_level.zip" are the compressed files contain the csv files. "easy_to_understand_form.zip" is the file which contains the xls files. The readme file contains some definitions that will help us to understand the data. 

In each of the compressed file, there will be six files, each recording one different features at that geographical scale. The six features we are investigating are race, age, marital status, education attainment, income and occupation. The data are collected from United States Census Bureau. http://factfinder.census.gov/faces/nav/jsf/pages/index.xhtml. 

The naming criteria for each file is like this "ACS_14_5YR_DataCode_GeographicalScale_GeographicalRange_Feature.csv"
For the geographical scale, "c" stands for county, "ct" stands for census tract, "s" stands for state. In this three scales, census tract is the smallest and state is the largest by area. The area of census tract depends on the population density. In a place with high population density like New York, one census tract contains a region of a few blocks. For census tract level, we are looking at only New York State. For the other two scales, we are looking at the six features of the whole US. 
For the geographical range, "ny" stands for New York State. "us" stands for the United States. 

Once you open the csv files, you will noticed that it is hard to tell what are the features (columns) in the file. Thus for each of the six categories, a xls format is provided. These xls files are contained in the "easy_to_understand_form.zip" . In the xls files, the rows are the columns in the corresponding csv files. From the xls files we can easily tell what is included in the file and what features will be important. Then you can get the cooresponding features through the csv file using R or Python. 

Below is the file structure of "data":

census_tract_level
~~~ACS_14_5YR_B25006_ct_ny_race.zip
~~~ACS_14_5YR_S0101_ct_ny_age.zip
~~~ACS_14_5YR_S1201_ct_ny_marital.zip
~~~ACS_14_5YR_S1501_ct_ny_education.zip
~~~ACS_14_5YR_S1902_ct_ny_income.zip
~~~ACS_14_5YR_S2401_ct_ny_occupation.zip

county_level
~~~ACS_14_5YR_B25006_c_us_race.zip
~~~ACS_14_5YR_S0101_c_us_age.zip
~~~ACS_14_5YR_S1201_c_us_marital.zip
~~~ACS_14_5YR_S1501_c_us_education.zip
~~~ACS_14_5YR_S1902_c_us_income.zip
~~~ACS_14_5YR_S2401_c_us_occupation.zip

state_level
~~~ACS_14_5YR_B25006_s_us_race.zip
~~~ACS_14_5YR_S0101_s_us_age.zip
~~~ACS_14_5YR_S1201_s_us_marital.zip
~~~ACS_14_5YR_S1501_s_us_education.zip
~~~ACS_14_5YR_S1902_s_us_income.zip
~~~ACS_14_5YR_S2401_s_us_occupation.zip

easy_to_understand_form
~~~ACS_14_5YR_B25006_s_us_race.xls
~~~ACS_14_5YR_S0101_s_us_age.xls
~~~ACS_14_5YR_S1201_s_us_marital.xls
~~~ACS_14_5YR_S1501_s_us_education.xls
~~~ACS_14_5YR_S1902_s_us_income.xls
~~~ACS_14_5YR_S2401_s_us_occupation.xls