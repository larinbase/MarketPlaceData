-- Сгруппировать по приоритету и цене и остортировать по возрастанию по приоритету
SELECT priority, name
FROM tasks
GROUP BY priority, name
ORDER BY priority;

-- Вернуть 2 строки, где тип проекта IT
SELECT *
FROM projects
WHERE project_type = 'IT'
LIMIT 2;