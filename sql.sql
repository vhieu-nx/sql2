CREATE database MANAGERTOUR;
USE MANAGERTOUR;
create table city(
	id_city varchar(20) primary key,
    name_city varchar(255)
);
CREATE TABLE ADDRESSTOUR(
	id_addresstour varchar(20) primary key,
    name_addresstour varchar(250) not null,
    description_addresstour varchar(500),
    avg_ad float not null,
    id_city varchar(20),
    foreign key (id_city) references city(id_city)    
);
create table customer(
	id_customer varchar(20) primary key,
    name_customer varchar(20) not null,
    cmt int(12) not null unique,
    dateofbirth date,
    id_city varchar(20),
    foreign key (id_city) references city(id_city)
);
create table categorytour(
	id varchar(20) primary key,
    id_catetour varchar(20),
    name_catetour varchar(255)    
);

create table tour(
	id_tour varchar(20) primary key,
    id_Catetour varchar(20),
    price_tour float, 
   _start date,
    _end date,
    foreign key (id_catetour) references categorytour(id)
    
);
create table ordertour(
	idorder varchar(20) primary key,
    id_tour varchar(20),
    customer_id varchar(20),
    _status varchar(10),
    foreign key (id_tour) references tour(id_tour),
    foreign key (customer_id) references customer(id_customer)
);
insert into city value('CITY1','HN'),('CITY2','HY'),('CITY3','BN'),('CITY4','QN'),('CITY5','DN');
INSERT INTO ADDRESSTOUR VALUE('ADDRESS01','THIEN DUONG BAO SON','QUA DEP','200000','CITY1'),('ADDRESS02','KHU DU LICH DAI NAM','QUA DEP DEP','2000000','CITY2'),('ADDRESS03','SUOI TIEN ','QUA DEPDDD','300222','CITY3'),('ADDRESS04','SUOI TIEN','QUA DEPDEEEEAA','500000','CITY4'),('ADDRESS05','VINH HA LONG','QUAAAA DEPDEEE','700000','CITY5');
INSERT INTO CUSTOMER VALUE('CUSTOMER01','HIEU','125943768','2000-12-9','city1'),('CUSTOMER02','hung','125943769','2012-08-20','city2'),('CUSTOMER03','hien','121943766','2009/04/29','city3'),
('CUSTOMER04','hưng','125949768','1990-08-21','city4'),
('CUSTOMER05','hiệu','125921768','1990-08-22','city5'),
('CUSTOMER06','quang','122149768','1990-08-26','city5'),
('CUSTOMER07','đoán','122446768','1995-02-21','city3'),
('CUSTOMER08','anh','123945768','1995-03-12','city2'),
('CUSTOMER09','hoa','123949768','1992-04-10','city1'),
('CUSTOMER010','lan','125249768','1991-09-11','city5');
insert into categorytour value('CATEGORYTOUR01','DU LICH THAM QUAN'),('CATEGORYTOUR02','TEAMBUILDING');
insert into tour value('TOUR01','CATEGORYTOUR01',12000000,'2021-02-12','2021-02-28'),
('TOUR02','CATEGORYTOUR01',121100000,'2020-12-01','2021-01-1'),
('TOUR03','CATEGORYTOUR02',12120000,'2019-02-28','2019-03-11'),
('TOUR04','CATEGORYTOUR01',1201230000,'2018-01-28','2018-02-06'),
('TOUR05','CATEGORYTOUR02',12002100,'2017-02-1','2017-02-6'),
('TOUR06','CATEGORYTOUR02',120001200,'2016-02-12','2016-03-02'),
('TOUR07','CATEGORYTOUR02',120014000,'2015-02-12','2015-03-01'),
('TOUR08','CATEGORYTOUR02',12000800,'2011-02-12','2011-02-26'),
('TOUR09','CATEGORYTOUR02',12000600,'2001-02-01','2001-02-12'),
('TOUR010','CATEGORYTOUR01',12008000,'2013-02-12','2013-02-21'),
('TOUR011','CATEGORYTOUR01',12005000,'2012-02-12','2012-02-22'),
('TOUR012','CATEGORYTOUR02',12007000,'2021-04-12','2021-04-18'),
('TOUR013','CATEGORYTOUR01',12004000,'2021-03-12','2021-03-18'),
('TOUR014','CATEGORYTOUR01',120043000,'2021-05-12','2021-05-18'),
('TOUR015','CATEGORYTOUR01',12000400,'2021-01-12','2021-01-18');
insert into  ordertour value('order01','tour01','customer01','chưa đặt'),
('order02','tour015','customer09','đã đặt'),
('order03','tour011','customer02','đã đặt'),
('order04','tour012','customer03','đã đặt'),
('order05','tour014','customer04','chưa đặt'),
('order06','tour01','customer05','chưa đặt'),
('order07','tour02','customer07','chưa đặt'),
('order08','tour05','customer07','đã đặt'),
('order09','tour07','customer08','chưa đặt'),
('order10','tour09','customer010','chưa đặt');
/*thống kế số lượng tour của các thành phố */ 
select name_city,count(name_city) as SOLUONGTUOR from tour
	join addresstour as ADDRESSTOUR on tour.id_tour = ADDRESSTOUR.id_addresstour
	join City as c on ADDRESSTOUR.id_city = c.id_city group by name_city;
# tính số tour  bắt đàu trong tháng 3 năm 2020
select count(_start) as TOURIN32021 from Tour where (month(_start) = '3' and year(_start)=2021);
select * from Tour where (month(_start)=3 and year(_start)  = 2021);
#tính số tour kết thức  trong tháng 4 năm 2020
select count(_end) as Tourend42021 from tour where (month(_end) = '04' and year(_end) = '2020');
