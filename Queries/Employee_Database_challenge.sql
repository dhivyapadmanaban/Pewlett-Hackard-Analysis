SELECT emp_no,first_name,last_name FROM employees;

SELECT titles,from_date,to_date FROM titles;

--Creating retirement titles table 
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

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
titles
INTO retirement_unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;


--retrieve the number of employees by their most recent job title
SELECT titles, count(*)
INTO retiring_titles
FROM retirement_unique_titles
GROUP BY titles


ORDER BY count(*) DESC