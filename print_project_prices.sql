SELECT project_name.name, SUM(salary * DATEDIFF(MONTH,start_date,finish_date)) as price
FROM project_worker
JOIN worker ON project_worker.worker_id = worker.id
JOIN project ON project_worker.project_id = project.id
JOIN project_name ON project_worker.project_id = project_name.project_id
GROUP BY  project_name.name
ORDER BY price DESC