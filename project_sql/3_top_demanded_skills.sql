SELECT
    skills AS skills_name,
    COUNT(skills_job_dim.skill_id) AS demand_count
FROM
    skills_job_dim
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
INNER JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_country = 'Italy'
GROUP BY
    skills
ORDER BY
 demand_count DESC
LIMIT 5;