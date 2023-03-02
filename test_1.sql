create table pilot(
pilot_id int primary key,
first_name Varchar(50) not null,
last_name Varchar(50) not null 
);

select * from pilot

drop table pilot 

insert into pilot (pilot_id, first_name, last_name)
values 
(1, 'Сергей', 'Шарапов'),
(2, 'Саня', 'Сыч'),
(3, 'Маша', 'Сыч'),
(4, 'Дима', 'Валиев'),
(5, 'Ира', 'Смирнова'); 


create table airplane(
airplane_id int,
model Varchar(100)
);

select * from airplane

drop table airplane 


insert into airplane (airplane_id, model)
values 
 (1, 'Boeing'),
 (2, 'Сухой'), 
 (2, 'Airbus');


create table airplane_pilot(
id int not null unique,
pilot_id int,
airplane_id int,
flight_date date);

select * from airplane_pilot


insert into airplane_pilot (id, pilot_id, airplane_id, flight_date)
values (1, 1, 1, '2022-02-28'),
(2, 2, 1, '2022-02-28'),
(3, 1, 1, '2022-02-28'),
(4, 3, 1, '2022-02-28'),
(5, 4, 2, '2022-02-28'),
(6, 5, 2, '2022-02-28'),
(7, 4, 2, '2022-02-28'),
(8, 1, 1, '2022-02-28');


//Исходя из описания таблиц базы данных, составьте SQL-запрос, в котором необходимо вывести Фамилию и количество полетов сделанных на самолетах модели “Cухой” с 01.02.22  по 28.02.22 числа .

   SELECT pilot.last_name, count (airplane_pilot.airplane_id) from pilot 
   join airplane_pilot on airplane_pilot.pilot_id = pilot.pilot_id 
   join airplane on airplane.airplane_id = airplane_pilot.airplane_id
   where airplane.model='Сухой' and airplane_pilot.flight_date between '2022-02-01' and '2022-02-28'
   group by pilot.last_name 












