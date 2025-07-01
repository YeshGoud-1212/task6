-- 1. Scalar Subquery in SELECT
SELECT emp_id, 
       (SELECT department_name FROM departments WHERE departments.department_id = employees.department_id) AS dept_name
FROM employees;

-- 2. Subquery in WHERE clause
SELECT * FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE location_id = 1700);

-- 3. Subquery in FROM clause (Derived Table)
SELECT dept_id, AVG(salary) as avg_salary
FROM (
    SELECT department_id as dept_id, salary 
    FROM employees
) AS emp_data
GROUP BY dept_id;

-- 4. Correlated Subquery
SELECT first_name, salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);

-- 5. EXISTS Clause
SELECT first_name, job_id
FROM employees e
WHERE EXISTS (
    SELECT 1 FROM jobs j
    WHERE j.job_id = e.job_id AND j.min_salary > 5000
);

-- 6. NOT EXISTS
SELECT department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1 FROM employees e
    WHERE e.department_id = d.department_id
);
