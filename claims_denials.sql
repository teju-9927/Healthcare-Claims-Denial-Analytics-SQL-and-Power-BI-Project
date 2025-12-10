create database claims_denials;
use claims_denials;
create table patients(
patient_id varchar(20) primary key,
dob date,
gender char(1),
state char(2),
esrd_flag tinyint,
diabetes_flag tinyint,
chf_flag tinyint,
ckd_flag tinyint,
copd_flag tinyint);

create table providers(
provider_id varchar(20) primary key,
provider_name varchar(100),
state char(2),
speciality varchar(50));

create table claims(
claim_id varchar(20) primary key,
patient_id varchar(20),
provider_id varchar(20),
claim_type varchar(20),
claim_date date,
primary_diagnosis_code varchar(20),
primary_diagnosis_desc varchar(200),
billed_amount decimal(12,2),
allowed_amount decimal(12,2),
paid_amount decimal(12,2),
denial_flag tinyint,
denial_reason varchar(200),
foreign key (patient_id) references patients(patient_id),
foreign key (provider_id) references providers(provider_id));

use claims_denials;
drop table claims;

create table claims(
claim_id varchar(20) primary key,
patient_id varchar(20),
provider_id varchar(20),
claim_type varchar(20),
claim_date date,
primary_diagnosis_code varchar(20),
primary_diagnosis_desc varchar(200),
billed_amount decimal(12,2),
allowed_amount decimal(12,2),
paid_amount decimal(12,2),
denial_flag tinyint,
denial_reason varchar(200));

use claims_denials;

set global local_infile = 1;

load data local infile'C:/Cmysql_files/claims_project_patients.csv'
into table patients
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

load data local infile "C:/Cmysql_files/claims_project_providers.csv"
into table providers
fields terminated by ','
enclosed by '"'
lines terminated by'\n'
ignore 1 lines;
 
load data local infile "C:/Cmysql_files/claims_project_claims.csv"
into table claims
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;
use claims_denials;
select count(*) from patients;
select count(*) from providers;
select*from claims limit 10;

-- total number of denied claims
select count(*) from claims 
where denial_flag=1;

-- claim count by claims type
select
 claim_type,
 count(*) as total_claims,
 sum(denial_flag) as denied_claims,
 round((sum(denial_flag)/count(*)) * 100, 2) as denial_percent
from claims
group by claim_type;

-- find the top 5 providers with highest denial rate
USE claims_denials;
select
p.provider_name,
c.provider_id,
count(*) as total_claims,
sum(denial_flag) as denied_claims,
round((sum(denial_flag)/count(*))*100,2) as denial_percent
from claims c
join providers p
on c.provider_id =p.provider_id
group by p.provider_name,c.provider_id
having count(*)>=50
order by denial_percent desc
limit 5;

 -- calculate total billed, total paid, and payment rate by claim type
 select claim_type,
 sum(billed_amount) as total_billed_amount,
 sum(paid_amount) as total_paid_amount,
 round(sum(paid_amount)/sum(billed_amount)*100,2)as payment_rate
 from claims
 group by claim_type;
 
-- find the Top 5 most common diagnosis codes based on number of claims
select count(*) as total_claims,primary_diagnosis_desc from claims
group by primary_diagnosis_code,primary_diagnosis_desc
order by total_claims desc
limit 5;

-- Denial rate by patient state
select 
p.state,
round((sum(denial_flag)/count(*))*100,2) as denial_percent
from claims c
join patients p
on c.patient_id=p.patient_id
group by p.state;

-- Which denial reasons cause the most financial loss
select denial_reason ,
count(*) as total_claims,
sum(billed_amount) as total_billed_at_risk,
sum(allowed_amount) as financial_loss
from claims
where denial_flag=1
group by denial_reason
order by total_claims desc;

-- Which providers lose the most $$ due to denials
select pr.provider_name,
pr.state,
count(*) as total_claims,
sum(denial_flag) as denied_claims,
sum(allowed_amount) as actual_allowed_loss,
round(avg(billed_amount),2) as avg_billed_amount
from claims c
join providers pr
on c.provider_id=pr.provider_id
where denial_flag=1
group by pr.provider_id
order by actual_allowed_loss desc
limit 5;

-- Which expensive claims are denied the most
select claim_type,
count(*) as total_claims,
sum(denial_flag) as denied_claims,
round(avg(billed_amount),2) as avg_billed_amount
from claims
group by claim_type
having avg_billed_amount>1500
order by denied_claims desc;

-- chronic disease impact on denials
use claims_denials;
select p.esrd_flag,p.diabetes_flag,p.chf_flag,p.ckd_flag,p.copd_flag,
count(*) as total_claims,
sum(denial_flag) as denied_claims,
round((sum(denial_flag)/count(*))*100,2) as denial_percent
from claims c 
join patients p
on c.patient_id=p.patient_id
group by p.esrd_flag,p.diabetes_flag,p.chf_flag,p.ckd_flag,p.copd_flag
order by denial_percent desc;

-- Are denials increasing or decreasing month-by-month?
use claims_denials;
select
date_format(claim_date,'%y-%m')as claim_month,
count(*) as total_claims,
sum(denial_flag) as denied_claims,
round((sum(denial_flag)/count(*))*100,2) as denial_percent
from claims
group by claim_month
order by claim_month
























 




  














