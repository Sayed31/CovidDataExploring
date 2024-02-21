USE data_exploration_project;

SELECT 
    location,
    dates,
    total_cases,
    new_cases,
    total_deaths,
    population
FROM
    covid_deaths
ORDER BY location , dates; 


# death rate percentage in Egypt

SELECT 
    location,
    dates,
    total_cases,
    total_deaths,
    CONCAT(ROUND((total_deaths / total_cases) * 100, 2),
            '%') AS death_rate
FROM
    covid_deaths
WHERE
    location = 'Egypt'
ORDER BY location , dates; 



# percenetage of getting covid in Egypt

SELECT 
    location,
    dates,
    total_cases,
    total_deaths,
    CONCAT(ROUND((total_cases / population) * 100, 2),
            '%') AS infection_rate
FROM
    covid_deaths
WHERE
    location = 'Egypt'
ORDER BY location , dates; 


# countries with highest infection rates

SELECT 
    location,
    population,
    MAX(total_cases) AS highest_cases,
    CONCAT(MAX(ROUND((total_cases / population) * 100, 2)),
            '%') AS infection_rate
FROM
    covid_deaths
GROUP BY location , population
ORDER BY infection_rate DESC; 


# countries with highest deaths

SELECT 
    location, MAX(total_deaths) AS max_toal_deaths
FROM
    covid_deaths
WHERE
    continent IS NOT NULL
GROUP BY location
ORDER BY max_toal_deaths DESC; 


# Breaking by continent

SELECT 
    continent, MAX(total_deaths) AS max_toal_deaths
FROM
    covid_deaths
WHERE
    continent IS NOT NULL
GROUP BY continent
ORDER BY max_toal_deaths DESC;


# GLOBAL

SELECT 
    dates,
    SUM(new_cases) AS total_cases,
    SUM(new_deaths) AS total_deaths,
    CONCAT(ROUND(SUM(new_deaths) / SUM(new_cases) * 100,
                    2),
            '%') AS death_rate
FROM
    covid_deaths
WHERE
    continent IS NOT NULL
GROUP BY dates
ORDER BY dates;


SELECT 
    SUM(new_cases) AS total_cases,
    SUM(new_deaths) AS total_deaths,
    CONCAT(ROUND(SUM(new_deaths) / SUM(new_cases) * 100,
                    2),
            '%') AS death_rate
FROM
    covid_deaths
WHERE
    continent IS NOT NULL;


# TOTAL POPULATION VS VACCINATIONS

WITH pop_vac AS
(SELECT 
    dth.continent,
    dth.location,
    dth.dates,
    dth.population,
    vac.new_vaccinations,
    SUM(vac.new_vaccinations) OVER w AS vac_roll_up
FROM
    covid_deaths dth
        JOIN
    covid_vaccinations vac ON dth.location = vac.location
        AND dth.dates = vac.dates
WHERE
    dth.continent IS NOT NULL
WINDOW w AS (PARTITION BY dth.location ORDER BY dth.location, dth.dates))
SELECT 
    *,
    CONCAT(ROUND((vac_roll_up / population) * 100, 2), '%') AS vaccination_rate
FROM
    pop_vac;




# A view for later visualization

CREATE OR REPLACE VIEW population_vs_rollup_vaccinations_view AS
	SELECT 
    dth.continent,
    dth.location,
    dth.dates,
    dth.population,
    vac.new_vaccinations,
    SUM(vac.new_vaccinations) OVER w AS vac_roll_up
	FROM
    covid_deaths dth
        JOIN
    covid_vaccinations vac ON dth.location = vac.location
        AND dth.dates = vac.dates
	WHERE
    dth.continent IS NOT NULL
	WINDOW w AS (PARTITION BY dth.location ORDER BY dth.location, dth.dates);
    
    
SELECT 
    *
FROM
    population_vs_rollup_vaccinations_view; 