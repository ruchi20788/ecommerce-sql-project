create database ecommerce;
use ecommerce;

create table customersp (
c_id int primary key,
c_name varchar(50),
c_mail varchar(100),
city varchar(50)
);

create table productsp(
p_id int primary key,
p_name varchar(50),
category varchar(50),
price decimal(10,5)
);

create table ordersp(
o_id int primary key,
order_date date,
c_id int,
foreign key (c_id) references customersp (c_id)
);

create table orderdetailssp(
o_id int,
p_id int,
quantity int,
primary key (o_id, p_id),
foreign key (o_id) references ordersp (o_id),
foreign key (p_id) references productsp (p_id)
);
