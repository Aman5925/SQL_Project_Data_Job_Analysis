SELECT
    skills AS skills_name,
    COUNT(skills_job_dim.skill_id)
FROM
    skills_job_dim
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
INNER JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = 'TRUE'
GROUP BY
    skills
ORDER BY
 COUNT(skills_job_dim.skill_id) DESC
LIMIT 5