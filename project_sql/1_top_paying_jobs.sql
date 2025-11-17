-- Query 1 1_top_paying_jobs

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    CAST(job_posted_date AS DATE),
    company.name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim AS company ON job_postings_fact.company_id = company.company_id
WHERE
    job_title LIKE '%Data Analyst%' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10