--------------************ DELIVERABLE 1 QUERIES *************--------------------

SELECT emp_no,first_name,last_name FROM employees;

SELECT titles,from_date,to_date FROM titles;

--QUERY 1 : Creating retirement titles table 
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.titles,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees e 
INNER JOIN titles t
ON e.emp_no = t.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

SELECT * FROM retirement_titles;

--QUERY 2 :  Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
titles
INTO retirement_unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM retirement_unique_titles;

-- QUERY 3 : retrieve the number of employees by their most recent job title
SELECT titles, count(*)
INTO retiring_titles
FROM retirement_unique_titles
GROUP BY titles
ORDER BY count(*) DESC;


SELECT * FROM retiring_titles;


------------------***************** DELIVERABLE 2 ***************---------------------

SELECT emp_no, first_name, last_name, birth_date from employees;

SELECT from_date,to_date from dept_emp ORDER BY to_date desc;

SELECT titles from titles;


-- Query 1 : Create mentorship eligibility table
SELECT DISTINCT ON(e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.titles
INTO mentorship_eligibilty
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN titles t
ON e.emp_no = t.emp_no
WHERE de.to_date = '9999-01-01'
AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no;

--Querying from new table
SELECT * FROM mentorship_eligibilty;