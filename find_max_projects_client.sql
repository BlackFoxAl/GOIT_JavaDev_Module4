SELECT client.name, COUNT(project.id) as project_count 
FROM project 
JOIN client ON project.client_id = client.id
GROUP BY client.name
HAVING project_count IN (
	SELECT COUNT(id) as project_count 
	FROM project
	GROUP BY client_id
	ORDER BY project_count DESC
	LIMIT 1
)