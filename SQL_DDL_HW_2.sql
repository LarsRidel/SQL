-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employee_name as "Worker's name", 
       monthly_salary as "employee salary" 
from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id;


-- 2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name as "Worker's name", 
       monthly_salary as "employee salary < 2000" 
from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
	where salary.monthly_salary < 2000;
	
-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select monthly_salary as "Salary",
	   employee_name as "employee"
from salary
join employee_salary on salary.id = employee_salary.salary_id
left join employees on employee_salary.employee_id = employees.id
	where employee_name is null;
	

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select monthly_salary as "Salary < 2000",
	   employee_name as "employee"
from salary
join employee_salary on salary.id = employee_salary.salary_id
left join employees on employee_salary.employee_id = employees.id
	where employee_name is null 
	and monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.

select employee_name as "employee", 
       monthly_salary as "Salary"
from salary
join employee_salary on employee_salary.employee_id = salary.id
right join employees on employee_salary.employee_id = employees.id
	where monthly_salary is null;
	
-- 6. Вывести всех работников с названиями их должности.

select employee_name as "employee",
       role_name     as "job title"
from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id;

-- 7. Вывести имена и должность только Java разработчиков.

select employee_name as "Name Java developer",
       role_name     as "job title"
from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
	where role_name like '%Java %';

-- 8. Вывести имена и должность только Python разработчиков.

select employee_name as "Name Python developer",
       role_name     as "job title"
from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
	where role_name like '%Python%';

 -- 9. Вывести имена и должность всех QA инженеров.
	 
select employee_name as "Name QA engineer",
       role_name     as "job title"
from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
	where role_name like '%QA%';	 

-- 10. Вывести имена и должность ручных QA инженеров.

select employee_name as "Manual QA engineer",
       role_name     as "job title"
from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
	where role_name like '%Manual%QA%';

-- 11. Вывести имена и должность автоматизаторов QA

select employee_name as "Automation QA engineer",
       role_name     as "job title"
from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
	where role_name like '%Automation%QA%';

-- 12. Вывести имена и зарплаты Junior специалистов

select employees.employee_name as "Name", 
	   roles.role_name "Junior", 
	   salary.monthly_salary as "Salary" 
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
	where role_name like '%Junior%';

-- 13. Вывести имена и зарплаты Middle специалистов

select employees.employee_name as "Name", 
	   roles.role_name "Middle", 
	   salary.monthly_salary as "Salary" 
from employees
left join employee_salary on employees.id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
	where role_name like '%Middle%';


-- 14. Вывести имена и зарплаты Senior специалистов

select employees.employee_name as "Name", 
	   roles.role_name "Senior", 
	   salary.monthly_salary as "Salary" 
from employees
left join employee_salary on employees.id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
	where role_name like '%Senior%';


-- 15. Вывести зарплаты Java разработчиков

select salary.monthly_salary as "Salary Java developer" 
from employees
left join employee_salary on employees.id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
	where role_name like '%Java %';

-- 16. Вывести зарплаты Python разработчиков

select salary.monthly_salary as "Salary Python developer" 
from employees
left join employee_salary on employees.id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
	where role_name like '%Python %';

-- 17. Вывести имена и зарплаты Junior Python разработчиков

select employee_name as "Name",
	   monthly_salary as "Salary Junior Python developer"
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
	where role_name like '%Junior Python developer%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков

select employee_name as "Name",
	   monthly_salary as "Salary Middle JS developer"
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
	where role_name like '%Middle JavaScript developer%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков

select employee_name as "Name",
	   monthly_salary as "Salary Senior Java developer"
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
	where role_name like '%Senior Java developer%';

-- 20. Вывести зарплаты Junior QA инженеров

select monthly_salary as "Salary Junior QA engineer"
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
	where role_name like '%Junior%QA%';

-- 21. Вывести среднюю зарплату всех Junior специалистов

select  avg(monthly_salary) as "average salary"
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
	where role_name like '%Junior%';

-- 22. Вывести сумму зарплат JS разработчиков

select sum(monthly_salary) as "amount of salaries"
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
	where role_name like '%JavaScript%';

-- 23. Вывести минимальную ЗП QA инженеров

select  min(monthly_salary) as "min salary"
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
	where role_name like '%QA%';

-- 24. Вывести максимальную ЗП QA инженеров

select  max(monthly_salary) as "max salary"
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
	where role_name like '%QA%';

-- 25. Вывести количество QA инженеров

select count(employees.id) as "amount QA"
from roles
join roles_employee on roles_employee.role_id = roles.id 
join employees on roles_employee.employee_id = employees.id
	where role_name like '%QA%';
-- 26. Вывести количество Middle специалистов.

select count(employees.id) as "amount Middle"
from roles
join roles_employee on roles_employee.role_id = roles.id 
join employees on roles_employee.employee_id = employees.id
	where role_name like '%Middle%';

-- 27. Вывести количество разработчиков

select count(employees.id) as "amount developer"
from roles
join roles_employee on roles_employee.role_id = roles.id 
join employees on roles_employee.employee_id = employees.id
	where role_name like '%developer%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(monthly_salary) as "sum salary"
from employees
join employee_salary on employees.id = employee_salary.employee_id 
join salary on salary.id = employee_salary.salary_id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
	where role_name like '%developer%';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select employee_name as "name",
       role_name as "employee",
       monthly_salary as "salary"
from employees
left join employee_salary on employees.id = employee_salary.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
	order by monthly_salary;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select employee_name as "name",
       role_name as "employee",
       monthly_salary as "salary"
from employees
join employee_salary on employees.id = employee_salary.employee_id 
join salary on salary.id = employee_salary.salary_id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
	where monthly_salary between 1700 and 2300
	order by monthly_salary;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employee_name as "name",
       role_name as "employee",
       monthly_salary as "salary"
from employees
join employee_salary on employees.id = employee_salary.employee_id 
join salary on salary.id = employee_salary.salary_id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
	where monthly_salary < 2300
	order by monthly_salary;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select employee_name as "name",
       role_name as "employee",
       monthly_salary as "salary"   
from employees
join employee_salary on employees.id = employee_salary.employee_id 
join salary on salary.id = employee_salary.salary_id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
	where monthly_salary in (1100, 1500, 2000)
	order by monthly_salary;