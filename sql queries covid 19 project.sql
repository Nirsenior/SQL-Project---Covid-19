-- General view
Select * from project1.covidvaccinations;
Select * from project1.coviddeaths;

-- select data im going to use
select location ,date,total_cases,new_cases,total_deaths,population
from project1.coviddeaths
order by 1,2;

-- lookinig at the total cases VS total deaths
-- shows likelihood of dying in ISRAEL
select location ,date,total_cases,new_cases,total_deaths,(total_deaths/total_cases)*100 as DeathsPrec
from project1.coviddeaths
where LOCATION like '%ISRAEL%'
order by 1,2;

-- looking at the total cases VS population
-- shows what precentage of population got covid in ISRAEL 2020 - 2021
select location ,date,total_cases,population,(total_cases/population)*100 as Prec_Of_Pop_Infected
from project1.coviddeaths
where LOCATION like '%ISRAEL%'
order by 1 desc;

-- looking at countries with highest infection rate compared to population
select location,population ,max(total_cases) as highestInfectionCount,max((total_cases/population))*100 as PrecOfPopInfected
from project1.coviddeaths
group by location,population
order by precOfpopInfected DESC ;

-- same but by date
select date,location,population ,max(total_cases) as highestInfectionCount,max((total_cases/population))*100 as PrecOfPopInfected
from project1.coviddeaths
group by date,location,population
order by precOfpopInfected DESC ;

-- Showing Countries with highets Death count per Population
select location,population ,max(total_deaths) as TotalDeathsCount
from project1.coviddeaths
group by location,population
order by TotalDeathsCount DESC ; 

-- Braking things by Continent
select sum(cast(total_deaths as SIGNED INTEGER))
from project1.coviddeaths
group by continent
order by TotalDeathsCount DESC;

-- Global numbers:
select date,
sum(new_cases) as TotalNewCases,
sum(cast(new_deaths as SIGNED INTEGER)) as TotalNewDeaths,
sum(cast(new_deaths as SIGNED INTEGER))/sum(new_cases) * 100 as DeatchPrec 
from project1.coviddeaths
where continent is not null
group by date;

 
 