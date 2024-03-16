**Project Description**

This project involves preparing and analyzing COVID-19 datasets consisting of death and vaccination records. The following files detail the process:

1. **filling_null_values.ipynb**
   - Reads COVID-19 datasets from CSV files.
   - Fills null values with "\\N" to prevent errors during import into MySQL database.
   - Saves the cleaned datasets as CSV files.

2. **Importing CSVs.sql**
   - Creates tables for COVID-19 death and vaccination data in MySQL database.
   - Loads data from CSV files into respective tables.
   - Queries to verify data import and ensure correctness.

3. **Data Exploration.sql**
   - Conducts various analyses on the COVID-19 death dataset, including:
     - Examining total cases, deaths, and population by location and date.
     - Calculating death and infection rates in specific countries like Egypt.
     - Identifying countries with the highest infection rates and deaths.
     - Analyzing global trends in new cases, deaths, and death rates over time.
     - Investigating the relationship between population and vaccinations.

   - Creates a view for visualization purposes, combining population and vaccination data.

This project aims to provide insights into COVID-19 trends and vaccination progress, aiding in understanding and responding to the pandemic.
