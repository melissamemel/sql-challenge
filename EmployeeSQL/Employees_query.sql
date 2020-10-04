-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT 
emp.emp_no, 
emp.last_name, 
emp.first_name, 
emp.sex,
sal.salary
FROM employees as emp
JOIN salaries as sal
ON (emp.emp_no = sal.emp_no)
ORDER BY emp_no 

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT 
emp_no, 
first_name, 
last_name, 
hire_date 
FROM Employees
WHERE hire_date >= '12/31/1985'
AND hire_date < '01/01/1987';

-- 3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT
depts.dept_no,
depts.dept_name,
dman.emp_no,
emp.last_name,
emp.first_name
FROM dept_manager as dman
JOIN departments as depts
ON (dman.dept_no = depts.dept_no)
JOIN employees as emp
on (emp.emp_no = dman.emp_no)

-- 4. List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
SELECT 
emp.emp_no, 
emp.last_name, 
emp.first_name, 
depts.dept_name
FROM dept_manager as dman
JOIN employees as emp
ON (emp.emp_no = dman.emp_no)
JOIN departments as depts
ON (dman.dept_no = depts.dept_no)

-- 5. List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."
SELECT  
first_name, 
last_name, 
sex 
FROM Employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT
emp.emp_no,
emp.last_name,
emp.first_name,
depts.dept_name
FROM employees as emp
JOIN dept_emp as demp
ON (emp.emp_no = demp.emp_no)
JOIN departments as depts
ON (depts.dept_no = demp.dept_name)
WHERE depts.dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, including 
-- their employee number, last name, first name, and department name.
SELECT
emp.emp_no,
emp.last_name,
emp.first_name,
depts.dept_name
FROM employees as emp
JOIN dept_emp as demp
ON (emp.emp_no = demp.emp_no)
JOIN departments as depts
ON (depts.dept_no = demp.dept_name)
WHERE depts.dept_name = 'Sales' OR depts.dept_name = 'Development'

-- 8. In descending order, list the frequency count of employee 
-- last names, i.e., how many employees share each last name.
SELECT last_name, 
COUNT(last_name) 
FROM Employees
GROUP BY last_name
ORDER BY count(last_name) desc;

