SELECT
    skills AS skills_name,
    COUNT(skills_job_dim.skill_id) AS job_count,
    ROUND(AVG(salary_year_avg),2) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_country = 'Italy'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills_name
ORDER BY
    job_count DESC,
    avg_salary DESC
Limit 10;