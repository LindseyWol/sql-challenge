--Data Analysis--
--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON
e.emp_no=s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
Where extract( year FROM hire_date) = 1986

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, dm.emp_no, d.dept_name, e.last_name, e.first_name
FROM dept_manager as dm
INNER JOIN departments as d ON dm.dept_no=d.dept_no
INNER JOIN employees as e ON e.emp_no=dm.emp_no

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
INNER JOIN employees as e ON de.emp_no=e.emp_no
INNER JOIN departments as d ON de.dept_no=d.dept_no

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
INNER JOIN employees as e ON de.emp_no=e.emp_no
INNER JOIN departments as d ON d.dept_no = de.dept_no
WHERE de.dept_no = 'd007'

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
INNER JOIN employees as e ON de.emp_no=e.emp_no
INNER JOIN departments as d ON d.dept_no = de.dept_no
WHERE de.dept_no = 'd007' OR
de.dept_no = 'd005'

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
Select last_name, count(last_name) as "frequency"
from employees
group by last_name
order by "frequency" desc