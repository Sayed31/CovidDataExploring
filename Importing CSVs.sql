use data_exploration_project;




CREATE TABLE IF NOT EXISTS covid_vaccinations (
    iso_code VARCHAR(255),
    continent VARCHAR(255),
    location VARCHAR(255),
    dates DATE,
    new_tests INT NULL,
    total_tests BIGINT NULL,
    total_tests_per_thousand DOUBLE NULL,
    new_tests_per_thousand DOUBLE NULL,
    new_tests_smoothed DOUBLE NULL,
    new_tests_smoothed_per_thousand DOUBLE NULL,
    positive_rate DOUBLE NULL,
    tests_per_case DOUBLE NULL,
    tests_units VARCHAR(255) NULL,
    total_vaccinations DOUBLE NULL,
    people_vaccinated DOUBLE NULL,
    people_fully_vaccinated DOUBLE NULL,
    new_vaccinations INT NULL,
    new_vaccinations_smoothed INT NULL,
    total_vaccinations_per_hundred DOUBLE NULL,
    people_vaccinated_per_hundred DOUBLE NULL,
    people_fully_vaccinated_per_hundred DOUBLE NULL,
    new_vaccinations_smoothed_per_million BIGINT NULL,
    stringency_index DOUBLE NULL,
    population_density FLOAT NULL,
    median_age DOUBLE NULL,
    aged_65_older DOUBLE NULL,
    aged_70_older DOUBLE NULL,
    gdp_per_capita DOUBLE NULL,
    extreme_poverty DOUBLE NULL,
    cardiovasc_death_rate DOUBLE NULL,
    diabetes_prevalence DOUBLE NULL,
    female_smokers DOUBLE NULL,
    male_smokers DOUBLE NULL,
    handwashing_facilities DOUBLE NULL,
    hospital_beds_per_thousand DOUBLE NULL,
    life_expectancy DOUBLE NULL,
    human_development_index DOUBLE NULL
);






LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/covid_vaccinations.csv' INTO TABLE covid_vaccinations
FIELDS TERMINATED BY ',' enclosed by '"' lines terminated by '\r\n'
IGNORE 1 LINES;

SELECT 
    *
FROM
    covid_vaccinations
ORDER BY location, dates
LIMIT 100;

COMMIT;


CREATE TABLE IF NOT EXISTS covid_deaths (
    iso_code VARCHAR(255),
    continent VARCHAR(255),
    location VARCHAR(255),
    dates DATE,
    total_cases INT NULL,
    new_cases INT NULL,
    new_cases_smoothed FLOAT NULL,
    total_deaths INT NULL,
    new_deaths INT NULL,
    new_deaths_smoothed FLOAT NULL,
    total_cases_per_million FLOAT NULL,
    new_cases_per_million FLOAT NULL,
    new_cases_smoothed_per_million FLOAT NULL,
    total_deaths_per_million FLOAT NULL,
    new_deaths_per_million FLOAT NULL,
    new_deaths_smoothed_per_million FLOAT NULL,
    reproduction_rate FLOAT NULL,
    icu_patients INT NULL,
    icu_patients_per_million FLOAT NULL,
    hosp_patients INT NULL,
    hosp_patients_per_million FLOAT NULL,
    weekly_icu_admissions INT NULL,
    weekly_icu_admissions_per_million FLOAT NULL,
    weekly_hosp_admissions INT NULL,
    weekly_hosp_admissions_per_million FLOAT NULL,
    new_tests INT NULL,
    total_tests BIGINT NULL,
    total_tests_per_thousand DOUBLE NULL,
    new_tests_per_thousand DOUBLE NULL,
    new_tests_smoothed DOUBLE NULL,
    new_tests_smoothed_per_thousand DOUBLE NULL,
    positive_rate DOUBLE NULL,
    tests_per_case DOUBLE NULL,
    tests_units VARCHAR(255) NULL,
    total_vaccinations DOUBLE NULL,
    people_vaccinated DOUBLE NULL,
    people_fully_vaccinated DOUBLE NULL,
    new_vaccinations INT NULL,
    new_vaccinations_smoothed INT NULL,
    total_vaccinations_per_hundred DOUBLE NULL,
    people_vaccinated_per_hundred DOUBLE NULL,
    people_fully_vaccinated_per_hundred DOUBLE NULL,
    new_vaccinations_smoothed_per_million BIGINT NULL,
    stringency_index DOUBLE NULL,
    population BIGINT,
    population_density FLOAT NULL,
    median_age DOUBLE NULL,
    aged_65_older DOUBLE NULL,
    aged_70_older DOUBLE NULL,
    gdp_per_capita DOUBLE NULL,
    extreme_poverty DOUBLE NULL,
    cardiovasc_death_rate DOUBLE NULL,
    diabetes_prevalence DOUBLE NULL,
    female_smokers DOUBLE NULL,
    male_smokers DOUBLE NULL,
    handwashing_facilities DOUBLE NULL,
    hospital_beds_per_thousand DOUBLE NULL,
    life_expectancy DOUBLE NULL,
    human_development_index DOUBLE NULL
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/covid_deaths.csv' INTO TABLE covid_deaths
FIELDS TERMINATED BY ',' enclosed by '"' lines terminated by '\r\n'
IGNORE 1 LINES;

SELECT 
    *
FROM
    covid_deaths
ORDER BY location , dates
LIMIT 100;


COMMIT;
    
   
