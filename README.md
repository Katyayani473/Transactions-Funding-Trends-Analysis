# Transactions & Funding Trends Analysis

## Project Overview
 This project analyzes funding received by Indian startups between 2015–2019 to uncover insights about:
- Top industries receiving funding
-	Leading startup locations
-	Most active investors
-	Preferred investment types
-	Funding trends over the years
-	Disclosed vs undisclosed deals
-	Largest individual deals
The analysis helps investors, startup founders, and financial analysts understand how funding flows in the Indian startup ecosystem.
This project demonstrates strong skills in **data cleaning (Python),data analysis (MySQL) and data visualization (Power BI)**

---

## 🎯 Business Problem
Funding information for Indian startups is often scattered and difficult to analyze. It is not easy
to identify funding trends, top industries, active investors, dominant locations, or understand
patterns such as disclosed vs undisclosed deals. This project aims to clean, analyze, and visualize
Indian startup funding data to uncover meaningful insights about where money is flowing and why.

---

## 🎯 Business Objectives
- Identify top industries by total funding and deal count
- Analyze funding trends across years
- Identify cities dominating startup funding
- Find the most active investors
- Analyze funding by investment type
- Identify startups receiving the highest funding
- Compare disclosed vs undisclosed deals
- Calculate average deal size

---

## 🗂 Dataset Description
- **Source:** Indian Startup Funding Dataset (Kaggle)  
- **Rows:** 3,044  
- **Columns:** 9  

**Key Columns:**
- SrNo – Serial number  
- Date – Funding date  
- StartupName – Startup receiving funding  
- IndustryVertical – Industry category  
- SubVertical – Sub-category  
- Location – City  
- InvestorsName – Investors involved  
- InvestmentType – Funding round type  
- Amount – Funding amount (USD)  
- IsAmountDisclosed – 1 = disclosed, 0 = undisclosed  

---

## 🧹 Data Cleaning (Python)
- Removed unwanted characters and extra spaces
- Filled missing text values with **"Unknown"**
- Cleaned Amount column by removing commas and currency symbols
- Converted Amount to numeric using `pd.to_numeric`
- Converted Date from **DD-MM-YYYY** to datetime format
- Removed duplicate records and ensured consistent formatting

---

## 📌 Business Problems and SQL Solutions

### 1. Total Number of Records
```sql
SELECT COUNT(*) AS total_records
FROM finance_data;
```

### 2.Top industry by funding
```sql
select IndustryVertical,sum(Amount) as TotalFunding
 from finance_data
 group by  IndustryVertical order by TotalFunding desc limit 1
 ```

### 3.Top Location by funding
```sql
select Location,sum(amount) as Total from finance_data group by Location order by Total desc limit 1
```
 
### 4.Top 10 Investors
```sql
select InvestorsName,sum(Amount) as TotalFunding
 from finance_data
 group by InvestorsName  order by TotalFunding desc limit 10
 ```


### 5.Top Investmenttype
```sql
select InvestmentType,count(*) as Total from finance_data group by InvestmentType order by Total desc limit 1
```

### 6.Top 5 Startups by funding
```sql
select startupName,sum(Amount) as TotalFunding
 from finance_data
 group by startupName  order by TotalFunding desc limit 5
 ```

### 7.Which year has highest funding
```sql
 select year(Date),sum(Amount) as TotalFunding
 from finance_data
 group by year(Date)  order by TotalFunding desc limit 1
```

 
 ### 8.What are the top 10 largest individual funding deals?
 ```sql
 select Date,startupname,IndustryVertical,Location,Amount from finance_data  order by amount desc limit 10
```
 
### 9. Which industries have the highest number of funded startups?
```sql
select IndustryVertical,count(*) as TotalStartups
 from finance_data group by IndustryVertical order by TotalStartups desc limit 5;
```
 
### 10.Which locations have the highest number of deals?
```sql
select Location,count(*) as Totaldeals from finance_data group by Location order by Totaldeals desc
```
 
### 11.Which startup received the single largest deal?
```sql
select startupName,Amount from finance_data order by amount desc limit 1
 ```


### 12.Which funding types have the highest total funding?
```sql
select Investmenttype,sum(Amount) as TotalFunding
 from finance_data
 group by Investmenttype  order by TotalFunding desc limit 1
```
 
 ### 13. Which industries have the highest undisclosed funding percentage?
 ```sql
select IndustryVertical,count(*) as Total
   from finance_data
   where Isamountdisclosed=0
   group by IndustryVertical order by Total desc
```
 

## 7. Power BI Dashboard Contents
## Dashboard Preview

![Dashboard](Finance_Dashboard.png)
KPIs
•	Total Funding
•	Total Deals
•	Total Investors
•	Average Deal Size
•	Total Startups
## 8 Key Insights
- Funding peaked in 2019
- Indicates strongest investor confidence.
- E-commerce & Technology received the highest funding
- These sectors dominate innovation.
- Bengaluru leads in number of deals
- It is India’s largest startup hub.
- Seed & Private Equity are most common investment types
- Early-stage funding dominates the ecosystem.
- Softbank & Tiger Global are top investors,They appear frequently in large deals.
- Many deals are undisclosed
 
## Conclusion
The Indian startup ecosystem grew rapidly between 2015-2019, with major funding concentrated in:
-	E-commerce
-	Technology
-	FinTech
-	Consumer Internet
- Bengaluru emerged as the strongest startup hub, attracting maximum funding and investor activity.
- The Power BI dashboard provides an interactive and visual understanding of:
- Funding trends
-	Investor behavior
-	Industry performance
-	Startup growth


