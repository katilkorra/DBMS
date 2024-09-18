create database gvp_pooja;
use gvp_pooja;

create table (
dept_id int primary key,
dept_name varchar(30),
dept_location varchar(50)
);
desc sp;
insert into s values
		("s1", "Smith",20,"London"),
		("s2","Jones",10,"Paris"),
		("s3","Black",10,"Paris"),
		("s4","Clark",20,"London"),
		("s5","Adams",30,"Athens");
CREATE TABLE p(
	pno CHAR(3) PRIMARY KEY,
	pname VARCHAR(20),
	color VARCHAR(10),
	weight FLOAT(5.3),
	p_city VARCHAR(25));

INSERT INTO p VALUES("p1","Nut","Red",12.0,"London"),
		("p2","Bolt","Green",17.0,"Paris"),
		("p3","Screw","Blue",17.0,"Oslo"),
		("p4","Screw","Red",14.0,"London"),
		("p5","Cush","Blue",12.0,"Paris"),
		("p6","C.9","Red",19.0,"London");
        

select * from s;
select * from p;
select * from sp;

#1. Show all parts located at Londan city. 
select p_name,p_city 
from p 
where p_city="London";

#2. Show maximum weight part name.
select p_name,weight 
from p 
order by weight desc limit 1;


#3. Show all parts name , part number for part color = Red.
select p_no,p_name,color 
from p 
where color="Red";

#4. Show suppler name , suppler city who supply part qty more then 200.
select distinct s.s_name,s.s_city
from s,sp 
where s.s_no=sp.s_no and sp.qty>200;

#5.Show second highest weight of part.
select distinct weight 
	from p 
	where weight=(select weight from p order by weight desc limit 1 offset 1);



select * from p;
update p set weight=12 where p_no = "p1";
#6. Show suppler no and qty for part supply for highest weight part.
select sp.s_no,sp.qty from sp,p where p.p_no=sp.p_no order by p.weight desc limit 1;

#7. Show suppler name and qty for part color is "Red" supply.
select s.s_name,sp.qty from s,sp,p where s.s_no=sp.s_no and p.p_no=sp.p_no and p.color="Red";

#8. Show suppler name , part city and qty for suppler status is less then 30 shipment supply.
select s.s_name,p.p_city,sp.qty from s,p,sp where s.s_no=sp.s_no and p.p_no=sp.p_no and s.s_status<30;

#9. Show each supplers total qty supply.
select s_no, sum(sp.qty) from sp group by s_no;

#10. Show each parts total qty supply.
select p_no, sum(sp.qty) from sp group by p_no;


#5. Write creat statement for creating following tables in SQL.create table dept.
create table dept(
dept_id int primary key,
dept_name varchar(30),
dept_location varchar(50)
);

insert into dept values(1,"Computer","Ahmedabad"),
(2,"Microbiology","Sadra"),
(3,"Management","Randheja"),
(4,"MainOffice","Ahmedabad");

# 1. show employee name , employee dept,  employee 



create table emp(
emp_id int primary key,
emp_name varchar(35),
emp_dept_id int,
emp_boss_id int,
emp_salary bigint,
foreign key(emp_dept_id) references dept(dept_id)
);

insert into emp values(101,"Nikhil",1,401,210000),
(102,"Satish",1,101,210000),
(103,"Vrushali",1,101,175000),
(201,"Archna",2,401,200000),
(202,"Tanvi",2,201,135000),
(203,"Dharti",2,201,175000),
(301,"Hemali",3,401,235000),
(302,"Vishal",3,301,180000),
(303,"Nafish",3,302,199000),
(401,"Registar",4,401,500000),
(402,"Bipin",4,401,490000),
(403,"Narendra",4,402,1000000),
(404,"Mohan",4,402,800000);


#QUESTION 3-------------------------
use gvp_pooja;
#6. Show suppler no and qty for part supply for highest weight part.
select sp.s_no,sp.qty from sp,p where p.p_no=sp.p_no order by p.weight desc limit 1;

#7. Show suppler name and qty for part color is "Red" supply.
select s.s_name,sp.qty from s,sp,p where s.s_no=sp.s_no and p.p_no=sp.p_no and p.color="Red";

#8. Show suppler name , part city and qty for suppler status is less then 30 shipment supply.
select s.s_name,p.p_city,sp.qty from s,p,sp where s.s_no=sp.s_no and p.p_no=sp.p_no and s.s_status<30;

#9. Show each supplers total qty supply.
select s_no, sum(sp.qty) as total_qty from sp group by s_no;

#10. Show each parts total qty supply.
select p_no, sum(sp.qty) as total_qty from sp group by p_no;



# QUESTION 4 ----------------------- 
#11.Show each part names total qty supply.
select p_name,sum(sp.qty) as total_qty from p,sp where p.p_no = sp.p_no group by p_name;

#12. Show each suppliers whose supply number is less then 's4'give total qty supply by each supplier.
SELECT s.s_no, SUM(sp.qty) AS Total_Qty_Supplied
FROM s, sp
WHERE s_no < 's4'
GROUP BY s_no;