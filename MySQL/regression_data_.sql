-- 1 
create database if not exists house_price_regression;
use house_price_regression;

drop table if exists house_price_data;

-- 2
CREATE TABLE house_price_data (
  `id` varchar(11) UNIQUE NOT NULL,
  `date` varchar(10) DEFAULT NULL,
  `bedrooms` int(4) DEFAULT NULL,
  `bathrooms` float DEFAULT NULL,
  `sqft_living` float DEFAULT NULL,
  `sqft_lot` float DEFAULT NULL,
  `floors` int(4) DEFAULT NULL,
  `waterfront` int(4) DEFAULT NULL,
  `view` int(4) DEFAULT NULL,
  `condition` int(4) DEFAULT NULL,
  `grade` int(4) DEFAULT NULL,
  `sqft_above` float DEFAULT NULL,
  `sqft_basement` float DEFAULT NULL,
  `yr_built` int(11) DEFAULT NULL,
  `yr_renovated` int(11) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lon` float DEFAULT NULL,
  `sqft_living15` float DEFAULT NULL,
  `sqft_lot15` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  CONSTRAINT PRIMARY KEY (`id`)  -- constraint keyword is optional but its a good practice
);

-- 3
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

load data local infile 'C:/Users/Gabriel Valdes/Documents/Ironhack/mid-bootcamp-project-details/regression/regression_data.csv'
into table house_price_data
fields terminated BY ',';

-- 4 
select * from house_price_data;

-- 5
ALTER TABLE house_price_data
DROP COLUMN date;

select * from house_price_data
limit 10;

-- 6
select count(*) from house_price_data;

select id from house_price_data
order by price desc
limit 10;

-- 7 
select distinct(bedrooms) from house_price_data order by 1;
select distinct(bathrooms) from house_price_data order by 1;
select distinct(floors) from house_price_data order by 1;
select distinct(`condition`) from house_price_data order by 1;
select distinct(grade) from house_price_data order by 1;

-- 8
select id from house_price_data
order by price desc limit 10;

-- 9
select format(avg(price),2) from house_price_data;

-- 10
select bedrooms, format(avg(price),2) as avg_price from house_price_data
group by 1;
select bedrooms, avg(sqft_living) as avg_sqft_living from house_price_data
group by 1;
select waterfront, format(avg(price),2) as avg_price from house_price_data
group by 1;


with cte_a as
(
select `condition`, format(avg(price),2) as avg_price_con, count(*) as house_cnt_con from house_price_data
group by 1
order by 2 desc
), 
 cte_b as
(
select grade, format(avg(price),2) as avg_price_gr, count(*) as house_cnt_gr  from house_price_data
group by 1
order by 2 desc
)
select * from cte_a
cross join cte_b
order by `condition`, grade desc ;

-- 11
select * from house_price_data
where bedrooms in (3,4) and bathrooms > 3 and floors = 1 and waterfront = 0 and `condition` >= 3 and grade >= 5 and price < 300000;

-- 12
select * from house_price_data
where price > (select avg(price) from house_price_data); -- 540739.3039215687

-- 13
create view Houses_with_higher_than_double_average_price as
select * from house_price_data
where price > (select avg(price) from house_price_data);

-- 14
select bedrooms, format(avg(price),2) as avg_price from house_price_data
where bedrooms in (3,4)
group by bedrooms; -- difference = 169,267.01

-- 15
select distinct(zip_code) from house_price_data;

-- 16
select * from house_price_data
where yr_renovated > 0;

-- 17
select * from (select *, rank() over (order by price desc) as rank_ from house_price_data) sub
where rank_ = 11;
