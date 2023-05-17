-- create table electricity
create database electricity
-- use 
use electricity

-- create table tbl_electricity_connection_type

create table tbl_electricity_connection_type(id int not null,connection_name varchar(20) not null,primary key(id))

-- insert data into tbl_electricity_connection_type

insert into tbl_electricity_connection_type values(1,'name1')
insert into tbl_electricity_connection_type values(2,'name2')
insert into tbl_electricity_connection_type values(3,'name2')
insert into tbl_electricity_connection_type values(4,'name2')
insert into tbl_electricity_connection_type values(5,'name2')

-- view tbl_electricity_connection_type table

select * from tbl_electricity_connection_type

-- create slab table

create table tbl_slab(id int primary key ,from_unit int not null,to_unit int not null,rate double precision not null,connection_type_id int foreign key references tbl_electricity_connection_type(id) not null)

--insert data into slab 
insert into tbl_slab values(1,0,33,432.2,3)
insert into tbl_slab values(2,22,33,432.2,3)

-- view slab

select * from tbl_slab

-- create building table

create table tbl_building_type(id int primary key ,building_name varchar(30),connection_type_id int foreign key references tbl_electricity_connection_type(id))

-- insert data into building_type table

insert into tbl_building_type values(1,'goa building',1)
insert into tbl_building_type values(2,'marina building',2)
insert into tbl_building_type values(3,'kodai building',3)
insert into tbl_building_type values(4,'Ss building',4)
insert into tbl_building_type values(5,'Vv building',5)

-- show building_type table 
select * from tbl_building_type

-- update slab table from_unit = 1

update tbl_slab set from_unit = 1 where id = 1

-- change column name

-- show table
select * from tbl_slab 

-- change column name
exec sp_rename 'tbl_building_type.building_name' , 'Mall' , 'column'

-- delete column

delete from tbl_building_type where connection_type_id = 1

-- sort tbl_building_type in asc order by mall 

select * from tbl_building_type order by Mall asc

-- create table building

create table tbl_building(id int primary key,owner_name varchar(100),building_address varchar(100),	building_type_id int foreign key references tbl_building_type(id),contact_number varchar(100),email_address varchar(100))

-- insert into tbl_building

insert into tbl_building values(1,'siva','denmark',2,'8876567542','siva@mail.me')
insert into tbl_building values(2,'vijay','new york',3,'8876567142','vijay@mail.me')
insert into tbl_building values(3,'rohi','paris',4,'8876522542','rohi@mail.me')
insert into tbl_building values(4,'karthic','perth',5,'8876522542','')
insert into tbl_building values(5,'satha','sydney',6,'8876522542','')


-- sort tbl_building by owner name

select * from tbl_building order by owner_name asc

-- show building table

select * from tbl_building 



-- create table meter 

create table tbl_meter(id int primary key,meter_number varchar(100),building_id int foreign key references tbl_building(id))

-- insert table tbl_meter;
insert into tbl_meter values(1,'meter1',1)
insert into tbl_meter values(2,'meter2',2)
insert into tbl_meter values(3,'meter3',3)

-- show meter table

select * from tbl_meter

-- create table electricity reading

create table tbl_electricity_reading(id int primary key,meter_id int foreign key references tbl_meter(id) not null,reading_day datetime default GETDATE(), h1 int , h2 int , h3 int , h4 int ,h5 int,h6 int,h7 int,h8 int,h9 int , h10 int , h11 int ,h12 int,total_unit int not null)

-- insert into tbl_electricity_reading
insert into tbl_electricity_reading values(1,1,1,1,2,3,4,5,6,7,8,9,10,11,12,2)
insert into tbl_electricity_reading values(2,2,1,1,2,3,4,5,6,7,8,9,10,11,12,1)
insert into tbl_electricity_reading values(3,3,1,1,2,3,4,5,6,7,8,9,10,11,12,3)

-- sort tbl_electricity_reading by total_unit
select * from tbl_electricity_reading order by total_unit

-- show tbl_electricity_reading
select * from tbl_electricity_reading

-- select column from table tb_meter
select meter_number from tbl_meter

-- select column from table tbl_building and sort by owner name in ascending order
select owner_name,contact_number from tbl_building order by owner_name asc

-- select all from tbl_slab by from_unit
select * from tbl_slab order by from_unit

-- select tbl_building by owner_name = rohi
select * from tbl_building where owner_name = 'rohi'

-- create table tbl_bill

create table tbl_bill(id int primary key,meter_id int foreign key references tbl_meter(id),bill_month int not null,bill_year int not null,bill_due_date date not null,bill_total_units int not null,payment_amount double precision not null ,bill_is_payed tinyint not null,bill_payment_date date,bill_fine_amount double precision)

-- insert data 
insert into tbl_bill values(1,1,2,2023,'2023-02-12',12000,4000.0,1,'2023-01-10',100)
insert into tbl_bill values(2,2,2,2023,'2023-12-12',20001,6000.0,1,'2023-08-10',100)
insert into tbl_bill values(3,3,2,2023,'2023-12-12',1221,1000.0,1,'2023-11-10',100)

-- select tbl_bill where 
select * from tbl_bill where bill_total_units > 10000

-- view table tbl_bill

select * from tbl_bill

-- select tbl_bill by date
select * from tbl_bill where bill_due_date = '2023-12-12' order by payment_amount desc

-- sort table tbl_building by owner_name
select owner_name , building_address,contact_number from tbl_building where email_address = '' order by owner_name asc

-- select tbl_building where owner name start with s

select * from tbl_building where owner_name like 's%' order by owner_name asc	

-- display table where id = 2 

select * from tbl_building where building_type_id = 2 order by owner_name 

-- display table tbl_electricity_reading whose total_unit >= 0 and <= 1000

select * from tbl_electricity_reading where total_unit >= 0 and total_unit <= 1000

-- display tbl_electricity_reading whose h1 < h2 

select meter_id , total_unit from tbl_electricity_reading where h1 < h2 order by total_unit desc




-- String


select * from tbl_building

select owner_name , LEN(owner_name) as 'name_length' from tbl_building order by owner_name asc

select owner_name , LEN(owner_name) as 'name_length', contact_number from tbl_building order by owner_name asc

select owner_name , CONCAT(contact_number , '-' , email_address ) from tbl_building order by owner_name desc

select * from tbl_building_type

SELECT Mall
FROM tbl_building_type
WHERE Mall LIKE '%g'
ORDER BY Mall ASC;





-- Order 


create table tbl_Salesman(salesman_id int primary key , name varchar(100),city varchar(100),commission double precision)

drop table tbl_Salesman

insert into tbl_Salesman values(1,'vijay shanker','covai',2.0)
insert into tbl_Salesman values(2,'dhoni','chennai',4.0)
insert into tbl_Salesman values(3,'virat','covai',3.0)
insert into tbl_Salesman values(4,'shanker','madurai',4.0)
insert into tbl_Salesman values(5,'vivek','madurai',2.0)

select * from tbl_Salesman where city = 'chennai' or city = 'madurai'

select * from tbl_Salesman where city = 'chennai' and city = 'madurai'

select * from tbl_Salesman where  city not in ('chennai','madurai')

create table tbl_customer(customer_id int primary key,cust_name varchar(100) ,city varchar(100),grade int ,salesman_id int)

insert into tbl_customer values(1,'siva','cbe',100,1)
insert into tbl_customer values(2,'praveen','chennai',200,2)
insert into tbl_customer values(3,'kavin','dindukal',400,3)
insert into tbl_customer values(4,'suraj','karur',300,4)


select * from tbl_customer where customer_id in (1,2, 3)

-- Data and time

select * from tbl_bill

SELECT COUNT(*) AS bills_paid_withoutfine
FROM tbl_bill
WHERE bill_is_payed = 1
  AND bill_fine_amount = 0
  AND MONTH(bill_payment_date) = 2
  AND YEAR(bill_year) = 2023;


SELECT SUM(bill_fine_amount) as 'Total_fine' from tbl_bill where bill_payment_date between '2022-02-10' and '2023-11-10'

SELECT bill_due_date, payment_amount, bill_payment_date from tbl_bill where bill_payment_date not between '2022-02-10' and '2023-11-10'	

















