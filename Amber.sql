/*
Amber's conglomerate corporation just acquired some new companies.
Each of the companies follows this hierarchy:

Given the table schemas below, write a query to print the company_code,
founder name, total number of lead managers,
total number of senior managers, total number of managers,
and total number of employees. Order your output by ascending company_code.

Note:
The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric.
For example, if the company_codes are C_1, C_2, and C_10,
then the ascending company_codes will be C_1, C_10, and C_2.
*/

select
Company.company_code,
Company.founder,
count(distinct Lead_Manager.lead_manager_code),
count(distinct Senior_Manager.senior_manager_code),
count(distinct Manager.manager_code),
count(distinct Employee.employee_code)
from Employee
inner join Manager on Manager.manager_code = Employee.manager_code and Manager.senior_manager_code = Employee.senior_manager_code and Manager.lead_manager_code = Employee.lead_manager_code and Manager.company_code = Employee.company_code
inner join Senior_Manager on Senior_Manager.Senior_manager_code = Employee.Senior_manager_code and Senior_Manager.lead_manager_code = Employee.lead_manager_code and Senior_Manager.company_code = Employee.company_code
inner join Lead_Manager on lead_Manager.lead_manager_code = Employee.lead_manager_code and lead_Manager.company_code = Employee.company_code
inner join Company on Company.company_code = Employee.company_code
group by Company.company_code, Company.founder
order by Company.company_code asc;
