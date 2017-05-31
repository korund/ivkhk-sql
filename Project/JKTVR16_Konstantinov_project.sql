use master;
if DB_ID('cars') is not null
	drop database cars;
go
--1
create database cars on (
NAME=cars,
FILENAME='d:\cars.mdf'
);
go
use cars;
--2
create table cars(
	brand varchar(30) NOT NULL,
	model varchar(30) NOT NULL,
	production_year int NOT NULL,
	price int NOT NULL
);
insert into cars values ('Opel', 'ModelO1', 2000, 500);
insert into cars values ('Opel', 'ModelO2', 2002, 700);
insert into cars values ('Opel', 'ModelO3', 2004, 1000);
--3
alter table cars add car_state varchar(10) null;
alter table cars add constraint state_const default 'fine' for car_state;
insert into cars values ('Ford', 'ModelF1', 2001, 800, default);
insert into cars values ('Ford', 'ModelF2', 2003, 1000, 'used');
--4
alter table cars alter column car_state varchar(15);
insert into cars values ('Ford', 'ModelF3', 2004, 1500, default);
--5
alter table cars drop constraint state_const;
alter table cars add constraint state_const default 'great' for car_state;
insert into cars values ('Renault', 'ModelR1', 2000, 550, default);
insert into cars values ('Renault', 'ModelR2', 2002, 750, 'bad');
--6
alter table cars add reg_no int not null identity(20150001,1);
insert into cars values ('Renault', 'ModelR3', 2001, 950, default);
insert into cars values ('Renault', 'ModelR4', 2003, 1500, 'perfect');
--7
dbcc checkident(cars,reseed,20160000);
insert into cars values ('Volvo', 'ModelV1', 2002, 2500, default);
insert into cars values ('Volvo', 'ModelV2', 2004, 1500, 'bad');
insert into cars values ('Volvo', 'ModelV3', 2006, 4000, default);
insert into cars values ('Volvo', 'ModelV4', 2008, 5000, 'good');
--8
alter table cars add constraint PK_cars primary key (reg_no);
--9
update cars set price=price-75 where production_year=(select min(production_year) from cars);
go
--10
create table owners(
	ID varchar(11) not null primary key,
	name varchar(100) not null,
	email varchar(100),
	phone varchar(15)
);
insert into owners values ('37208090001', 'John Johnson', 'john@host.com', '+37250123456'); 
insert into owners values ('48601010001', 'Ann Anderson', 'anna@host.com', '+37257890123'); 
go
--11
create table properties(
	reg_no int not null,
	ID varchar(11) not null,
	reg_date date 
);
alter table properties add constraint reg_date_const default getdate() for reg_date;
insert into properties values (20150010, '37208090001', '07-23-2016');
insert into properties values (20160003, '48601010001', default);
--12
alter table properties add constraint FK_cars_reg_no foreign key (reg_no) references cars(reg_no);
--13
alter table properties add constraint FK_owners_ID foreign key (ID) references owners(ID);
