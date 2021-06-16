# Pewlett-Hackard-Analysis

## Project Overview
This project helps Pewlett Hackard in determining retiring employees numbers to provide retirement package and identify the employees who are eligible to participate in a mentor ship program. Since many baby boomers are entering retirement, this analysis will help the Pwelett Hackard prepare for the “silver tsunami” as many current employees reach retirement age.

## Resources
- Data source : Employee database
- Software : PostgreSQL

## Results

Here are the highlights of this analysis:
- There are 90398 employees expected to retire from Pewlett Hackard. Its a really big number and the company need to find ways to fill the gaps before the silver tsunami. 
- As per the below retirement titles table data , most number of employees retiring are Senior Engineer and Senior Staff.

![image](https://user-images.githubusercontent.com/83181834/121790823-52d39e80-cb98-11eb-9675-dd0cfd44d033.png)

- While the company need to hire a lot of new professionals to fill the retirement position, they also need to look at possible mentor ship profiles for smoother transition after retirement. Mentorship_eligibilty table is created with the provided business rules to find qualified mentors.
- As per below group by data on mentor ship table, we have more employees avaialbe in Senior Staff , Engineer and Senior Engineer position. While this is not enough to fill the retirement gap, but they can get transition from the retirement professional and will be avaialbe as mentor for new professional.

![image](https://user-images.githubusercontent.com/83181834/121790834-667f0500-cb98-11eb-8c25-696146ec2eb6.png)


## Summary

How many roles will need to be filled as the "silver tsunami" begins to make an impact?
- Roughly 90398 employees are getting retired from Pwelett Hackard. They should fill up these positions before the "silver tsunami" will make big impact.

Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
- As per below grouped up data, we have enough retirement ready employees in all department except "Manager" to mentor the next generation of Pewlett Hackard.
<img width="890" alt="results" src="https://user-images.githubusercontent.com/83181834/121791346-c5934880-cb9d-11eb-8e43-e249d1622e4f.png">

### Additional insights
1. Lets look at "Manager" position. 
- There are 2 employees retiring in this position and no employee of this designation is found under mentorship table. As per below query & results, top 2 employees are retiring. Either we can pick bottom two employees as mentor ready although their birth_date cut off is close to our filter or promote existing employees who fits the birth_date criteria to "Manager" position and make them mentor ready.

					SELECT e.emp_no,
						e.first_name,
						e.last_name,
						e.birth_date,
						t.titles,
						t.from_date,
						t.to_date
					FROM employees e 
					INNER JOIN titles t
					ON e.emp_no = t.emp_no
					WHERE t.titles = 'Manager'
					AND to_date = '9999-01-01'
					ORDER BY e.birth_date, to_date desc;
![image](https://user-images.githubusercontent.com/83181834/121791487-fd4ec000-cb9e-11eb-9c59-e3a09903a06b.png)

2. Lets take a look at total titles in Pewlett Hackard. As per below query, we have total of 7 designations in Pewlett Hackard. We have employees retiring under 6 designations except "Technique Leader".  There are lot of potential employees avaialbe in this designation (~15159) who are eligible for promotion to fill any retirement roles. 

					SELECT t.titles,
					count(e.emp_no)
					FROM
					employees e INNER JOIN titles t
					ON e.emp_no = t.emp_no
					GROUP BY t.titles
					ORDER BY t.titles DESC
					
<img width="278" alt="results_2" src="https://user-images.githubusercontent.com/83181834/122168697-749b8280-ce31-11eb-8e23-b3748e45e112.png">

