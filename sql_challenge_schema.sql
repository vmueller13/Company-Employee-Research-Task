DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id CHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(2) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE departments (
  dept_no CHAR(4),
  dept_name VARCHAR(30) NOT NULL,
  PRIMARY KEY (dept_no)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
DROP TABLE IF EXISTS dept_emp CASCADE;
CREATE TABLE dept_emp (
	emp_no INT   NOT NULL,
	dept_no VARCHAR(5)   NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (emp_no, dept_no)
); 

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
DROP TABLE IF EXISTS dept_manager CASCADE;
CREATE TABLE dept_manager (
    dept_no VARCHAR(5)   NOT NULL,
    emp_no INT  NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY (dept_no, emp_no)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
DROP TABLE IF EXISTS salaries CASCADE;
CREATE TABLE salaries (
	emp_no INT PRIMARY KEY NOT NULL,
    salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
DROP TABLE IF EXISTS titles CASCADE;
CREATE TABLE titles (
	title_id CHAR(5),
    title VARCHAR(30) NOT NULL,
	PRIMARY KEY (title_id)
);