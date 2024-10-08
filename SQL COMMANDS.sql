use Bank_loan;

select * from Bank_loan_data

select count(id)as total_Loan_application
from Bank_loan_data


select count(id)as last_month_Loan_application
from Bank_loan_data where MONTH(issue_date)=10 and YEAR(issue_date)=2021

select sum(loan_amount)as total_funded_amt
from Bank_loan_data

select sum(loan_amount)as monthly_total_funded_amt
from Bank_loan_data
where MONTH(issue_date)=12 and year(issue_date)=2021


select sum(loan_amount)as PMTFA
from Bank_loan_data
where MONTH(issue_date)=11 and year(issue_date)=2021


select sum(total_payment) as total_amount_received
from bank_loan_data

select sum(total_payment) as M_total_amount_received
from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

select sum(total_payment) as PM_total_amount_received
from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021


select round( AVG(int_rate),4)*100 as avr_interset_rate
from bank_loan_data

select round(AVG(int_rate),4)*100 as monthly_avr_interset_rate
from bank_loan_data
where month(issue_date)=12 and year (issue_date) = 2021

select round(AVG(int_rate),4)*100 as P_monthly_avr_interset_rate
from bank_loan_data
where month(issue_date)=11 and year (issue_date) = 2021


select round(AVG(dti),4)*100 as avg_dti
from bank_loan_data

select round(AVG(dti),4)*100 as mtd_avg_dti
from bank_loan_data
where month(issue_date)=12 and year(issue_date)=2021

select round(AVG(dti),4)*100 as Pmtd_avg_dti
from bank_loan_data
where month(issue_date)=11 and year(issue_date)=2021



select
(count(Case when loan_status = 'Fully Paid' or loan_status = 'Current' THEN id END)*100)
/
count(id) as Good_loan_percentage
from bank_loan_data

select count( id) as Good_loan_application
from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'

select sum(loan_amount) as Good_loan_funded_amt
from bank_loan_data
where loan_status = 'fully paid' or loan_status = 'current'


select sum(total_payment) as Good_loan_Total_recieved_amt
from bank_loan_data
where loan_status = 'fully paid' or loan_status = 'current'


select 
count(case when loan_status = 'charged off' then id  end)*100
/
count(id)as Bad_loan_Total_recieved_amt
from bank_loan_data


select count(id)as Bad_loan_Total_application
from bank_loan_data
where loan_status ='charged off'


select sum(loan_amount) as Bad_loan_total_funded_amt
from bank_loan_data
where loan_status = 'charged off'

 

 select sum(total_payment) as Bad_loan_total_recieved_amt
from bank_loan_data
where loan_status = 'charged off'


select
loan_status,
count(id) as total_loan_application,
sum(total_payment) as total_amount_recieved,
sum(loan_amount) as total_loan_amount,
avg(int_rate*100) as interest_rate,
avg(dti*100) as dti  
from bank_loan_data
group by loan_status




select
loan_status,
sum(total_payment)as mtd_total_recieved_amount,
sum(loan_amount) as mtd_total_funded_amount
from bank_loan_data
where month(issue_date)=12 and year(issue_date)=2021
group by loan_status



select
loan_status,
sum(total_payment)as pmtd_total_recieved_amount,
sum(loan_amount) as pmtd_total_funded_amount
from bank_loan_data
where month(issue_date)=11 and year(issue_date)=2021
group by loan_status





select*from bank_loan_data



select
month(issue_date) as Month_Number,
DATENAME(MONTH,issue_date) as Month_Name ,
count(id) as Total_Loan_Application,
sum(loan_amount)as Total_Funded_Amount,
sum(Total_payment)as Total_Amount_Received
from bank_loan_data
group by month(issue_date),DATENAME(MONTH,issue_date)
order by month(issue_date)





select
address_state as Regional_state ,
count(id) as Total_Loan_Application,
sum(loan_amount)as Total_Funded_Amount,
sum(Total_payment)as Total_Amount_Received
from bank_loan_data
group by address_state
order by address_state





select
term as long_term ,
count(id) as Total_Loan_Application,
sum(loan_amount)as Total_Funded_Amount,
sum(Total_payment)as Total_Amount_Received
from bank_loan_data
group by term
order by sum(loan_amount)desc

select*from bank_loan_data

select
emp_length as Employee_length ,
count(id) as Total_Loan_Application,
sum(loan_amount)as Total_Funded_Amount,
sum(Total_payment)as Total_Amount_Received
from bank_loan_data
group by emp_length
order by emp_length





select
home_ownership,
count(id) as Total_Loan_Application,
sum(loan_amount)as Total_Funded_Amount,
sum(Total_payment)as Total_Amount_Received
from bank_loan_data
group by home_ownership
order by count(id )desc






select
purpose as loan_breakdown_purpose ,
count(id) as Total_Loan_Application,
sum(loan_amount)as Total_Funded_Amount,
sum(Total_payment)as Total_Amount_Received
from bank_loan_data
group by purpose
order by count(id)








































