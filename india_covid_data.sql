-- For India
select cast(dea.date as date),dea.location,dea.population,cast(vac.people_vaccinated as bigint)
from covid_deaths dea
Join covid_vaccinated vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
and dea.location like 'india'
order by 4 desc


-- Now calculating the the percent of vaccinated to population 
select dea.date as date,dea.location,dea.population,cast(vac.people_vaccinated as bigint) as total_vaccinated,
(cast(vac.people_vaccinated as bigint)/dea.population)*100 as VacPerPop
from covid_deaths dea
Join covid_vaccinated vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
and dea.location like 'india'
order by 4 desc


-- Now calculating the maximum percentage for people vaccinated V/S population
select dea.location,dea.population,max(cast(vac.people_vaccinated as bigint)) as total_vaccination,
max(cast(vac.people_vaccinated as bigint)/dea.population)*100 as VacPerPop
from covid_deaths dea
Join covid_vaccinated vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
group by dea.location,dea.population
order by 4 desc


-- Vaccination Daily in India
select date,people_vaccinated from covid_vaccinated
where continent is not null 
and location like 'india'
and people_vaccinated is not null
order by 1 desc