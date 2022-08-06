select count(*) from data_analyst_jobs;
/* Question 1: 
answer: 1793*/

/* Question 2: Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?*/
select *
from data_analyst_jobs
limit 10;
--answer ExxonMobil

/* Question 3: How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?*/
select location
from data_analyst_jobs
where location = 'TN' or location = 'KY';
--answer 21 for TN, but 27 for TN AND KY.

/* Question 4: How many postings in Tennessee have a star rating above 4?*/
select location,star_rating
from data_analyst_jobs
where location = 'TN'
and star_rating >4;
--answer 3

/*Question 5: How many postings in the dataset have a review count between 500 and 1000?*/
Select review_count
from data_analyst_jobs
where review_count >500 and review_count <1000;
--answer 150

/* Question 6: Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?*/
select avg(star_rating) as avg_rating, location as state
from data_analyst_jobs
group by location
order by avg_rating desc;
--answer NE

/* Question 7: Select unique job titles from the data_analyst_jobs table. How many are there?*/
select distinct(title)
from data_analyst_jobs
order by title;
--answer 881

/* Question 8: How many unique job titles are there for California companies?*/
Select distinct(title), location
from data_analyst_jobs
where location = 'CA';
--answer 230

/* Question 9: Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?*/
Select DISTINCT(company), avg(star_rating), review_count
from data_analyst_jobs
where review_count >5000
and not company = '%null%'
group by company,review_count
order by review_count DESC;
--answer 41

/*Question 10: Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
*/
Select DISTINCT(company), avg(star_rating) as avg_rating, review_count
from data_analyst_jobs
where review_count >5000
and not company = '%null%'
group by company,review_count
order by avg_rating DESC;
--answer American Express, General Motors, Kaiser Permanente, Microsoft, Nike, Unilever.  Rating: 4.1999998090000000

/* Question 11: Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?*/
SELECT DISTINCT(title)
FROM data_analyst_jobs
where title LIKE '%Analyst%';
--answer 754

/*Question 12: How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common? except '%Analyst%'*/
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%' AND title NOT LIKE '%Analytics%' AND title NOT LIKE '%ANALYST%' AND title NOT LIKE '%ANALYTIC%' AND title NOT LIKE '%analyst%' AND title NOT LIKE '%analytics%';
--answer 4, Tableau


