SELECT  project_name.name, DATEDIFF(MONTH,start_date,finish_date) as mounth_count 
FROM project 
JOIN project_name ON project_name.project_id = project.id
GROUP BY id
HAVING mounth_count IN (
	SELECT MAX(DATEDIFF(MONTH,start_date,finish_date))
	FROM project
)