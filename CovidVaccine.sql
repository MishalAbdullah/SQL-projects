SELECT *
FROM owidcoviddata

SELECT location,
       date,
    total_cases,
    new_cases,
    total_deaths,
    population
FROM owidcoviddata

--loking at total cases vs total_deaths

SELECT  location,date,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM owidcoviddata


-- lets look the data on a continent level

SELECT  continent,MAX(CAST(total_deaths as int))as Totaldeathcount
FROM owidcoviddata
where continent is not null
GROUP BY continent
--showing continents with highest death count

SELECT  continent,MAX(CAST(total_deaths as int))as Totaldeathcount,(total_deaths/total_cases)*100 as DeathPercentage
FROM owidcoviddata
where continent is not null
group by  continent


--showing countries with highest death count per population
SELECT  location,MAX(CAST(total_deaths as int))as Totaldeathcount
FROM owidcoviddata
GROUP BY location
--this shows the percentage of death if you get covid in the respective country
--I will be focusing on my own country-india
WHERE location like 'india'


-- now let us find the percentage of people infected by  fom covid
SELECT  location,date,total_deaths, (total_deaths/population)*100 as Percentage
FROM owidcoviddata
WHERE location like 'india'
