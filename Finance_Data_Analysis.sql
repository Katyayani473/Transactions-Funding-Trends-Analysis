
use krishna
create table finance_data(
SrNo int,
Date date,
startupName varchar(170),
IndustryVertical varchar(170),	
SubVertical	varchar(170),
Location	varchar(170),
InvestorsName	varchar(270),
InvestmentType	varchar(170),
Amount	BIGint,
IsAmountDisclosed int
);


LOAD DATA INFILE 'E:/DA/projects/p1/FINANCE/Funding_data.csv'
INTO TABLE finance_data
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
 @SrNo,
 @Date,
 @startupName,
 @IndustryVertical,
 @SubVertical,
 @Location,
 @InvestorsName,
 @InvestmentType,
 @Amount,
 @IsAmountDisclosed
)
SET
 SrNo = NULLIF(@SrNo, ''),
 Date = STR_TO_DATE(NULLIF(@Date, ''), '%d-%m-%Y'),
 startupName = NULLIF(@startupName, ''),
 IndustryVertical = NULLIF(@IndustryVertical, ''),
 SubVertical = NULLIF(@SubVertical, ''),
 Location = NULLIF(@Location, ''),
 InvestorsName = NULLIF(@InvestorsName, ''),
 InvestmentType = NULLIF(@InvestmentType, ''),
 Amount = NULLIF(@Amount, ''),
 IsAmountDisclosed = NULLIF(@IsAmountDisclosed, '');
 
 
 select * from finance_data

1.Total Rows
 select count(*) as Total from finance_data

2.Top industry by funding
select IndustryVertical,sum(Amount) as TotalFunding 
 from finance_data 
 group by  IndustryVertical order by TotalFunding desc limit 1
 
 
3.Top Location by funding
select Location,sum(amount) as Total from finance_data group by Location order by Total desc limit 1

4.Top 10 Investors
select InvestorsName,sum(Amount) as TotalFunding 
 from finance_data 
 group by InvestorsName  order by TotalFunding desc limit 10
 
   
 5.Top Investmenttype  
select InvestmentType,count(*) as Total from finance_data group by InvestmentType order by Total desc limit 1


6.Top 5 Startups by funding
select startupName,sum(Amount) as TotalFunding 
 from finance_data 
 group by startupName  order by TotalFunding desc limit 5
 
 7.Which year has highest funding
 select year(Date),sum(Amount) as TotalFunding 
 from finance_data 
 group by year(Date)  order by TotalFunding desc limit 1
 
  8.What are the top 10 largest individual funding deals?
 select Date,startupname,IndustryVertical,Location,Amount from finance_data  order by amount desc limit 10
 
 
 9. Which industries have the highest number of funded startups?
select IndustryVertical,count(*) as TotalStartups
 from finance_data group by IndustryVertical order by TotalStartups desc limit 5
 
10.Which locations have the highest number of deals?
select Location,count(*) as Totaldeals from finance_data group by Location order by Totaldeals desc

 11.Which startup received the single largest deal?
 select startupName,Amount from finance_data order by amount desc limit 1
 

 

 
14.Which funding types have the highest total funding?
 select Investmenttype,sum(Amount) as TotalFunding 
 from finance_data 
 group by Investmenttype  order by TotalFunding desc limit 1
 
 15.Investors and thier investmenttype
 select InvestorName,InvestmentType,count(*) as Total
   from finance_data group by ,InvestmentType order by Total desc 
   
 16. Which industries have the highest undisclosed funding percentage?
 select IndustryVertical,count(*) as Total
   from finance_data
   where Isamountdisclosed=0
   group by IndustryVertical order by Total desc
   
   
