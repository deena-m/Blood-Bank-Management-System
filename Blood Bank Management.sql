create database Blood_Bank;
use Blood_Bank;

create table donors(Donor_id int Primary Key,
Name varchar(100),
Age int ,
Gender varchar(10),
Phone varchar(15),
Blood_Group varchar(5),
Last_donation date);

create table donations(
Donations_Id int auto_increment Primary Key,
Donor_id int ,
Donation_date date ,
Volume_ml int ,
Foreign Key (Donor_id)References donors(Donor_id)
);

create table requests(
Request_id int Primary Key ,
Requester_Name varchar(100) ,
Blood_Group varchar(5),
Required_units int ,
Request_Date date  ,
Request_status varchar(20));

create table stock(
Blood_Group varchar(5)Primary key,
Available_units int , 
Reserved_units int Default 15,
Last_updated date ,
Safe_Level int Default 20);


select * from donors;
select * from donations;
select * from requests;
select * from stock;

#How many donors are there in each blood group
select Blood_Group,count(*)as Total_donors from Blood_Bank.donors group by Blood_Group;

#How many donors belong to the A+ blood group
select Blood_Group,count(*) from Blood_Bank.donors where Blood_Group='A+';

#List all donations made in the last 6 months.
select * from donations 
where Donation_date >= curdate() - interval 6 month ;

#Retrieve all pending blood requests.
select * from requests where Request_status='Pending';

#Retrieve all fulfilled blood requests.
select * from requests where Request_status='Fulfilled';

#Show blood groups where the available stock is below or equal to 70 units.
select * from stock where Available_units <=70;

#What is the total volume of blood donated per blood group.
select d.Blood_Group,sum(n.Volume_ml) 
as Total_volume from donors d 
join donations n on d.Donor_id = n.Donor_id 
group by d.Blood_Group;

#Count of pending requests for each blood group.
select Blood_group,count(*) from requests 
where Request_status='Pending' group by Blood_group;

#Total required units per blood group in all requests, sorted by blood group (descending)
select Blood_group,sum(Required_units) 
as Total_Required from requests 
group by Blood_group order by Blood_group desc ;

#What is the average volume of donations?
select d.Blood_Group, avg(n.Volume_ml) as Average_Volume from donations n
join donors d on d.Donor_id = n.Donor_id
group by d.Blood_Group;


#What is the date of the latest donation
select max(donation_date) as Latest_Donation from donations;

#List donor names with their contact and donation details.
select d.Name ,d.Phone,n.Donation_Date,n.Volume_ml 
from donors d join donations n on d.Donor_id;


# Find donors who have never donated blood.
select d.Name,Age,Blood_group,Phone from donors d 
Left Join donations n on d.Donor_id = n.Donor_id where n.Donor_id is null;

# Show total donation volume grouped by blood group.
select d.Blood_group,sum(n.Volume_ml) as Total_Donation 
from donors d join donations n on d.Donor_id = n.Donor_id group by Blood_group;

#List donor names along with their donation dates and volumes.
select d.Name,n.Donation_date,n.Volume_ml 
from donors d join donations n on d.donor_id = n.Donor_id;

# Which donor has donated the most blood (by total volume)?
select d.Name ,sum(n.Volume_ml) as Total_Donated from donors d 
join donations n on d.Donor_id = n.Donor_id 
group by d.Donor_id order by Total_Donated desc limit 2;

#Which blood group has the highest number of fulfilled requests
select Blood_Group, COUNT(*) as Fulfilled_Count from requests 
where Request_status = 'Fulfilled' group by Blood_Group
order by  Fulfilled_Count desc limit 1;

#how many donors are male vs female 
select Gender,count(*) as Gener_count 
from donors Group by Gender;

#List the donors whose last donation was more than 6 months ago
select * from donors where Last_donation <= curdate() - Interval 6 Month;

#What is the total number of donation records in the system?
select count(*) as Total_Donations from donations;

#Total number of unique donors who donated this year
select count(distinct Donor_id) as Yearly_Donors 
from donations where year(Donation_date) = year(curdate());

#Most requested blood group
select Blood_Group, sum(Required_units) as Total_Requested 
from requests group by Blood_Group order by Total_Requested desc limit 1;

#Average time gap between donations for each donor
SELECT 
    d.Donor_id,
    d.Name,
    ROUND(AVG(DATEDIFF(n2.Donation_date, n1.Donation_date)), 1) AS Avg_Days_Between_Donations
FROM 
    donations n1
JOIN 
    donations n2 ON n1.Donor_id = n2.Donor_id AND n2.Donation_date > n1.Donation_date
JOIN 
    donors d ON d.Donor_id = n1.Donor_id
GROUP BY 
    d.Donor_id, d.Name
HAVING 
    COUNT(*) > 1;
