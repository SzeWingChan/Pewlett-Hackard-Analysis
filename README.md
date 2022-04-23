# Pewlett-Hackard-Analysis

## Overview of the Pyber Analysis
- After importing data into the SQL database, queries could be performed to understand employees' profiles and forecast the number of retiring employees (employees who were born between January 1, 1952 and December 31, 1955), their tiles and which department they belong.  

- The company will also be able to identify talents who will be eligible for a mentorship program and prepare them for taking up the roles when the employees reach the retirement age.


## Results

- Retiring Employees by Title 
    - It is estimated that 72,458 employees, who were born between January 1, 1952 and December 31, 1955, will start reaching their retirement age.
    - Majority of them are senior engineers (35.8%) and senior staff (34.4%), followed by engineers (12.8%), staff (10.5%), technique leaders (5.0%), assistant engineers (1.5%) and managers (0.0%). 
    - There are only two managers that are expected to retire and the number is extremely small compare to other groups.
    ![retiring_titles](https://github.com/SzeWingChan/Pewlett-Hackard-Analysis/blob/main/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/retiring_titles.png)

- Employees Eligible for the Mentorship Program
    - There are 1,549 employees who are eligible for the mentorship program.  The number is derived by the set criteria – employees who are born between January 1, 1965 and December 31, 1965.
    ![mentorship_eligibilty](https://github.com/SzeWingChan/Pewlett-Hackard-Analysis/blob/main/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/mentorship_eligibilty.png)
    - Majority of them are current senior staff (28.5%) and engineers (25.6%), followed by senior engineers (18.5%), staff (18.2%), technique leaders (5.0%) and assistant engineers (4.2%).  
   

## Summary
- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
    - There are 72, 458 employees that are retirement-ready.
    - Assuming all the employees who are eligible for the mentor ship program will take up the roles of the retired employees, there will be 70,909 roles that will need to be filled in the coming three years.
    ![mentorship_eligibilty_count](https://github.com/SzeWingChan/Pewlett-Hackard-Analysis/blob/main/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/mentorship_eligibilty_count.png)
    - Below is the breakdown of the roles needed to be filled and this is calculated based on the difference between retirement-ready employees and those who are eligible for the mentorship program.
        Senior Engineer: 25,630
        Senior Staff: 24,484
        Engineer: 8,888
        Staff: 7,354
        Technique Leader: 3,526
        Assistant Engineer: 1,025
    - The roles of those who will be promoted will needed to be backfill at some point as well.
    
- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
    - There are enough qualified, retirement-ready employees in the departments to mentor the next generation employees.  
    - Below is the breakdown of the employees of which department that they belong to.  From it we can see there are more than enough mentors in all departments.
    ![dept_count](https://github.com/SzeWingChan/Pewlett-Hackard-Analysis/blob/main/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/dept_count.png)
   