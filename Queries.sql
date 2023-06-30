-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT a.emp_no, a.first_name, a.last_name, a.sex, b.salary
FROM employees AS a
LEFT JOIN salaries AS b
ON a.emp_no = b.emp_no
ORDER BY a.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT a.first_name, a.last_name, a.hire_date
FROM employees AS a
WHERE a.hire_date BETWEEN '01/01/1986' AND '12/31/1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT a.dept_no, b.dept_name, c.emp_no, c.last_name, c.first_name
FROM dept_manager AS a
JOIN departments AS b ON a.dept_no = b.dept_no
JOIN employees AS c ON a.emp_no = c.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT a.dept_no, a.dept_name, c.emp_no, c.last_name, c.first_name
FROM departments AS a
JOIN dept_emp AS b ON a.dept_no=b.dept_no
JOIN employees AS c ON b.emp_no=c.emp_no
ORDER BY b.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT a.emp_no, b.last_name, b.first_name
FROM dept_emp AS a
JOIN employees AS b ON a.emp_no=b.emp_no
WHERE dept_no = 'd007'
ORDER BY a.emp_no;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT a.emp_no, a.last_name, a.first_name, c.dept_name
FROM employees AS a
JOIN dept_emp AS b ON a.emp_no=b.emp_no
JOIN departments AS c ON b.dept_no=c.dept_no
WHERE c.dept_name IN ('Sales', 'Development')
ORDER BY a.emp_no;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;