--Module 7 Challenge
--Deliverable 1: The Number of Retiring Employees by Title

--Create a new table to hold the information
SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	t.title, 
	t.from_date, 
	t.to_date
INTO retirement_titles
FROM employees AS e
JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

--View the table
SELECT * FROM retirement_titles;

--Use Dictinct On statement to remove duplicates and keep only the most recent title of each employee
SELECT DISTINCT ON (rt.emp_no)rt.emp_no,
	rt.first_name, 
	rt.last_name, 
	rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE rt.to_date  = '9999-01-01'
ORDER BY rt.emp_no, rt.from_date DESC;

--View the table
SELECT * FROM unique_titles;

--Retrieve the number of titles from the Unique Titles table (for cross-checking with retiring_titles tables)
--SELECT COUNT(ut.title) AS title_number
--FROM unique_titles AS ut;

--Create a Retiring Titles table to hold the required information
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY  ut.title
ORDER BY COUNT(ut.title) DESC;

--View the retiring_titles table
SELECT * FROM retiring_titles;


--Deliverable 2: The Employees Eligible for the Mentorship Program
--Create a table named mentorship_eligibilty
SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date, 
	de.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE (de.to_date  = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

--View the mentorship_eligibilty table
SELECT * FROM mentorship_eligibilty;


--Deliverable 3: 
--Create a table to calculate the titles for mentorship_eligibilty
SELECT COUNT(me.title), me.title
INTO mentorship_eligibilty_count
FROM mentorship_eligibilty AS me
GROUP BY me.title
ORDER BY COUNT(me.title) DESC;

--View the mentorship_eligibilty_count table
SELECT * FROM mentorship_eligibilty_count;

--Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
--Create a table to find out which department the retirement-ready employees belong to
SELECT DISTINCT ON (rt.emp_no)rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title,
	rt.to_date,
	d.dept_name
INTO retiring_emp_dept
FROM retirement_titles AS rt
	JOIN dept_emp AS de
		ON (rt.emp_no = de.emp_no)
	JOIN departments AS d
		ON (de.dept_no = d.dept_no)
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no

--View the retiring_emp_dept table
SELECT * FROM retiring_emp_dept

--Calculate how many retirement-ready employees in each department
SELECT COUNT(red.dept_name), red.dept_name
INTO retiring_emp_dept_count
FROM retiring_emp_dept AS red
GROUP BY red.dept_name
ORDER BY COUNT(red.dept_name) DESC;

--View the retiring_emp_dept_count table
SELECT * FROM retiring_emp_dept_count

--Create a table to find out which department the mentorship eligible staff beong to
SELECT DISTINCT ON (me.emp_no)me.emp_no,
	me.first_name,
	me.last_name,
	me.title,
	me.to_date,
	d.dept_name
INTO mentorship_eligibilty_dept
FROM mentorship_eligibilty AS me
	JOIN dept_emp AS de
		ON (me.emp_no = de.emp_no)
	JOIN departments AS d
		ON (de.dept_no = d.dept_no)
WHERE me.to_date = '9999-01-01'
ORDER BY me.emp_no

SELECT * FROM mentorship_eligibilty_dept

--Calculate how many retirement-ready employees in each department
SELECT COUNT(med.dept_name), med.dept_name
INTO mentorship_eligibilty_dept_count
FROM mentorship_eligibilty_dept AS med
GROUP BY med.dept_name
ORDER BY COUNT(med.dept_name) DESC;

--View the mentorship_eligibilty_dept_count table
SELECT * FROM mentorship_eligibilty_dept_count