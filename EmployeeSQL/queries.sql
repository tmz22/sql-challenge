-- List the following details of each employee: employee number, 
-- last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
LEFT JOIN salaries AS s
	ON e.emp_no = s.emp_no;
	
-- List first name, last name, and hire date 
-- for employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- manager of each department: department number, department name,
-- manager's employee number, last name, first name.
SELECT d.dep_no, d.dep_name, m.emp_no, e.last_name, e.first_name
FROM dep_manager AS m
INNER JOIN departments AS d
	ON m.dep_no = d.dep_no
INNER JOIN employees AS e
	ON m.emp_no = e.emp_no;
	
-- List the department of each employee: 
-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dep_name
FROM employees AS e
JOIN dep_emp 
	ON e.emp_no = dep_emp.emp_no
JOIN departments AS d
	ON dep_emp.dep_no = d.dep_no;
	
-- List first name, last name, and sex for employees whose first name 
-- is "Hercules" and last names begin with "B."	
SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- employees in the Sales department, including their employee number,
-- last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dep_name
FROM employees AS e
JOIN dep_emp de
ON (e.emp_no = de.emp_no)
JOIN departments d
ON (de.dep_no = d.dep_no)
WHERE dep_name = 'Sales';

-- employees in the Sales and Development departments,
-- their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dep_name
FROM employees e
JOIN dep_emp de
ON (e.emp_no = de.emp_no)
JOIN departments d
ON (de.dep_no = d.dep_no)
WHERE dep_name = 'Sales' OR dep_name = 'Development';

-- In descending order, list the frequency count of employee 
-- last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "last_name_counts"
FROM employees 
GROUP BY last_name
ORDER BY "last_name_counts" DESC;