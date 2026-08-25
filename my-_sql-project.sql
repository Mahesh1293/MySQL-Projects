--  Sprint 1: Business Understanding and Data Understanding------

-- 1.1 Company Background
/* A retail bank provides financial products and services to individual customers. These products
typically include savings and current accounts, debit and credit cards, personal loans, home loans,
and other financial services.

The bank operates through multiple branches and serves a large customer base. Customers regularly 
perform transactions such as deposits, withdrawals, transfers, payments, and loan repayments. Each 
customer may use multiple banking products, and their activity generates large amounts of operational
data.

From a business perspective, the bank needs to understand:

Customer behavior – who the customers are and how they use banking services.
Account activity – account balances, deposits, withdrawals, and transaction frequency.
Transaction patterns – transaction volumes, amounts, types, and trends.
Loan performance – loan amounts, repayments, outstanding balances, and repayment behavior.
Product usage – which banking products are most popular and which customers use multiple products.
Branch performance – customer activity and business performance across different branches.*/

-- 1.2 Role

/*As a Data Analyst supporting the Retail Banking team, my responsibility is to analyze banking data 
and convert it into meaningful business insights. The role involves understanding customer behavior,
 account activity, transaction patterns, loan performance, and banking product usage.
 
 The key responsibilities include:
-Analyzing customer and account data to understand customer behavior.
-Examining transaction data to identify spending, deposit, withdrawal, and transfer patterns.
-Monitoring loan performance and repayment behavior.
-Evaluating the usage and performance of different banking products.
-Comparing branch-level performance and identifying areas for improvement.
-Writing MySQL queries to answer business questions.
-Identifying trends, patterns, and unusual activities in the data.
-Providing data-driven insights and recommendations to support banking-related decisions.*/


-- 1.3 Understanding the ER Diagram

/*The ER diagram represents the structure of the Retail Banking database. 
It contains 7 main tables: customers, branches, accounts, cards, transactions, loans,
 and loan_payments.

-Customers
Customers table's main purpose is to store customer personal and demographic information. It contains 
information about bank customers.
It includes columns such as:
-customer_id – Primary Key
-first_name
-last_name
-date_of_birth
-gender
-city
-state
-customer_since
-kyc_status
-segment
-annual_income
-credit_score
-is_active
The customer_id uniquely identifies each customer and is referenced by other tables such as accounts
 and loans.
 
 - Branches
 The branches table stores information about the bank's branches.
It includes columns such as:
-branch_id – Primary Key
-branch_name
-city
-state
-region
-opening_date
-employee_count
The branch_id uniquely identifies each branch of the bank and is referenced by other tables such as accounts
and loans. A branch can serve many customers' accounts and can also manage multiple loans.

- Accounts
The accounts table contains information about customer bank accounts.

Important columns include:

-account_id – Primary Key
-customer_id – Foreign Key
-branch_id – Foreign Key
-account_type
-open_date
-close_date
-current_balance
-interest_rate
-overdraft_limit
-status
Account_id uniquely identifies each account of a customer. The customer_id connects an account to its
customer, while branch_id identifies the branch associated with the account.

- Cards
The cards table stores information about cards issued for bank accounts.
Important columns include:

-card_id – Primary Key
-account_id – Foreign Key
-card_type
-issue_date
-expiry_date
-credit_limit
-outstanding_balance
-reward_points
-is_active
-network
The account_id connects each card to an account.

- Transactions
The transactions table records financial activities performed through accounts.
Important columns include:

-transaction_id – Primary Key
-account_id – Foreign Key
-transaction_date
-transaction_time
-transaction_type
-amount
-channel
-description
-balance_after
-status
The account_id identifies the account associated with each transaction.This table is particularly
important for analyzing transaction volume, transaction value, customer activity, and transaction
trends.

- Loans
The loans table stores information about loans provided to customers.
Important columns include:

-loan_id – Primary Key
-customer_id – Foreign Key
-branch_id – Foreign Key
-loan_type
-principal_amount
-interest_rate
-tenure_months
-disbursement_date
-maturity_date
-emi_amount
-outstanding_balance
-loan_status
-purpose
A customer can have multiple loans, and a branch can manage multiple loans.

- Loan_payments
The loan_payments table records payments made toward loans.

Important columns include:

-payment_id – Primary Key
-loan_id – Foreign Key
-payment_date
-scheduled_amount
-paid_amount
-principal_paid
-interest_paid
-payment_due
-days_late
-payment_method
-status
The loan_id connects each payment to a specific loan. This table can be used to analyze repayment
behavior, late payments, payment amounts, and loan performance.*/

-- 1.4 Analytical Thinking from the ER Diagram

/*
1.The Customer team wants to identify customers and understand which customer segment they belong
to. What information would you need?

The Customer team just need the information from the customers table because the information about
the customer such as name,dob,gender,segment,credi score etc all are available in the customers table.
TO identify customers and understand which segment he belongs the team simply need segment information
and customer information form the customers table.

2.Management wants to identify customers who have more than one bank account. Which tables and columns
would you need?

To identify customers who have more than one account i need customers and accounts table's data. 
These tables have information about all customers, all accounts they have and IDs of that accounts.
So from this information i can identify which customer has more than one account.

3.The Branch team wants to compare the accounts associated with different branches. What information
 would you need from the database?

I would need information from accounts and branches table because the accounts table stores all the 
information about accounts and their customers, and which branch they are associated with. And the branches
table stores every information about different branches. So, from the database i would require information 
from accounts and branches table.

4.The bank wants to understand how customers are using their accounts through transactions. Which
tables would you need to connect?

I would need to connect three tables they are:
-customers
-accounts
-transactions
By connecting these three tables i can understand which customer has which accounts and all the 
transactions they have performed through those accounts.
This allows the bank to examine how frequently customers transact, transaction types, transaction
amounts, channels used, and changes in account balances.

5.Management wants to identify which types of transactions are most common and through which channels
they occur. Where would you find this information?

I would fine this information from the transactions table.No other table is required because both
transaction type and channel are directly available in the transactions table.

6.The Loans team wants to understand which customers have loans and what type of loans they have.
 Which tables and columns would you need?

The loans team would require two tables customers and loans and columns such as customer_id,first_name,
last_name from customers table and loan_id,loan_type from the loans table. By connecting these two 
tables the loans team can easily determine which customers have loans and what type of loans they hold.

7.The Loans team wants to examine whether loan customers are making their payments on time. What 
information would you need, and which tables would you connect?

I would require three tables customers,loans and loan_payments from the database.We would examine
days_late, payment_date, scheduled_amount, paid_amount, and status to determine whether payments were
made on time.

8.Management wants to compare loan performance across different branches. Which tables and columns
would you need?

I would need three tables:
1.branches:
branch_id – identifies the branch
branch_name – identifies the branch name
city
state
region

2.loans:
loan_id – identifies the loan
branch_id – links the loan to the branch
customer_id
loan_type
principal_amount
interest_rate
outstanding_balance
loan_status
disbursement_date
maturity_date

3.loan_payments:
payment_id
loan_id – links payments to loans
scheduled_amount
paid_amount
days_late
status

For each branch, we would examine information such as:

Number of loans
Total principal amount
Total outstanding balance
Loan status
Loan types
Total payments received
Late payments
Average days late

This would allow management to compare loan volume, outstanding loans, repayment behavior, and overall
loan performance across branches.

9.The bank wants to understand which customers have cards linked to their accounts. What information
would you need to connect customers, accounts, and cards?

First,i would identify the customer through customer_id. Then use the customer's customer_id to find
their accounts. Finally, use account_id to identify the cards linked to those accounts.

This allows the bank to determine which customers have cards, which accounts the cards are linked to,
and details such as card type, network, active status, and expiry date.

10.Management wants to understand how customers are using different banking products such as accounts,
cards, and loans. Which tables would you bring together?

I would connect four tables customers,accounts,cards and loans. We would examine the number and types
of accounts, cards, and loans held by each customer, along with relevant information such as account
balances, card activity/status, loan amounts, and loan status.

This would help management understand how customers use multiple banking products and identify customers 
with single-product versus multi-product relationships with the bank.*/



----- --------Sprint 2: Database Setup--------------

CREATE DATABASE retail_banking;
USE retail_banking;

CREATE TABLE branches (
    branch_id VARCHAR(20) PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL,
    opening_date DATE NOT NULL,
    employee_count INT NOT NULL
);

CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    customer_since DATE NOT NULL,
    kyc_status VARCHAR(20),
    segment VARCHAR(30),
    annual_income DECIMAL(15,2),
    credit_score INT,
    is_active VARCHAR(10)
);

CREATE TABLE accounts (
    account_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20) NOT NULL,
    branch_id VARCHAR(20) NOT NULL,
    account_type VARCHAR(30) NOT NULL,
    open_date DATE NOT NULL,
    close_date DATE,
    current_balance DECIMAL(15,2) DEFAULT 0.00,
    interest_rate DECIMAL(5,2),
    overdraft_limit DECIMAL(15,2) DEFAULT 0.00,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

CREATE TABLE loans (
    loan_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20) NOT NULL,
    branch_id VARCHAR(20) NOT NULL,
    loan_type VARCHAR(30) NOT NULL,
    principal_amount DECIMAL(15,2) NOT NULL,
    interest_rate DECIMAL(5,2),
    tenure_months INT,
    disbursement_date DATE,
    maturity_date DATE,
    emi_amount DECIMAL(15,2),
    outstanding_balance DECIMAL(15,2),
    loan_status VARCHAR(20),
    purpose VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

CREATE TABLE loan_payments (
    payment_id VARCHAR(20) PRIMARY KEY,
    loan_id VARCHAR(20) NOT NULL,
    payment_date DATE,
    scheduled_amount DECIMAL(15,2),
    paid_amount DECIMAL(15,2),
    principal_paid DECIMAL(15,2),
    interest_paid DECIMAL(15,2),
    penalty DECIMAL(15,2) DEFAULT 0.00,
    days_late INT DEFAULT 0,
    payment_method VARCHAR(30),
    status VARCHAR(20),
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);

CREATE TABLE cards (
    card_id VARCHAR(20) PRIMARY KEY,
    account_id VARCHAR(20) NOT NULL,
    card_type VARCHAR(20),
    issue_date DATE,
    expiry_date DATE,
    credit_limit DECIMAL(15,2),
    outstanding_balance DECIMAL(15,2),
    reward_points INT DEFAULT 0,
    is_active VARCHAR(10),
    network VARCHAR(30),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE transactions (
    transaction_id VARCHAR(20) PRIMARY KEY,
    account_id VARCHAR(20) NOT NULL,
    transaction_date DATE NOT NULL,
    transaction_time TIME,
    transaction_type VARCHAR(30),
    amount DECIMAL(15,2),
    channel VARCHAR(30),
    description VARCHAR(100),
    balance_after DECIMAL(15,2),
    status VARCHAR(20),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

select * from customers;
select * from accounts;
select * from branches;
select * from loans;
select * from cards;
select * from loan_payments;


-- ---------------------------------------------------------
-- Sprint 3: Basic Analysis / Data Exploration
-- ---------------------------------------------------------
USE retail_banking;

-- 11.What is the total number of customers?
SELECT COUNT(*) AS total_customers
FROM customers;

-- 12.What is the total number of accounts?
SELECT COUNT(*) AS total_accounts
FROM accounts;

-- 13.What are the different account types available?
SELECT DISTINCT account_type
FROM accounts;

-- 14.How many customers are currently active?
SELECT COUNT(*) AS active_customers
FROM customers
WHERE is_active = 'Yes';

-- 15.What are the different transaction types available?
SELECT DISTINCT transaction_type
FROM transactions;

-- 16.What is the total amount of completed transactions?
SELECT SUM(amount) AS total_completed_transaction_amount
FROM transactions
WHERE status = 'Completed';

-- 17.What are the different loan types available?
SELECT DISTINCT loan_type
FROM loans;

-- 18.What are the different loan types available?
SELECT COUNT(*) AS total_loans
FROM loans;

-- 19.What are the different card types available?
SELECT DISTINCT card_type
FROM cards;

-- 20.What are the different card types available?
SELECT SUM(outstanding_balance) AS total_outstanding_loan_balance
FROM loans;




-- --------------------------------------- Sprint 4: Objective-Based Analysis --------------------------

-- 4.1 Understand Customer Profile and Segmentation
-- Compare customers across different segments.

-- 1. How many customers belong to each customer segment?
select segment, count(customer_id) as customer_count from customers group by segment;

-- 2. Which customer segment has the highest average annual income?
select segment, avg(annual_income) as Avg_Annual_Income from customers group by segment ORDER BY avg_annual_income DESC LIMIT 1;

-- 3. Which customer segment has the highest average credit score?
select segment, avg(credit_score) as Avg_credit_score from customers group by segment order by avg_credit_score desc limit 1;

-- 4. Which segment has both the highest average income and credit score?
select segment, avg(annual_income) as Average_income, avg(credit_score) as Average_credit_score from customers group by segment order by Average_income desc, 
Average_credit_score desc limit 1;

-- Look at customer demographics.

-- 1. What is the distribution of customers by gender?
select gender, count(customer_id) as customer_count from customers group by gender;

-- 2. Which gender has the highest average annual income?
select gender, avg(annual_income) as Average_Income from customers group by gender order by Average_Income desc;

-- 3. How is gender distributed across different customer segments?
select segment, gender, count(customer_id) as customer_count from customers group by segment, gender order by segment, customer_count desc;

-- Compare customers across cities and states.

-- Which cities have the highest number of customers?
select city,count(customer_id) as highest_number from customers group by city order by highest_number desc;

-- Which states have the highest number of customers?
select state,count(customer_id) from customers group by state order by count(customer_id) desc limit 1;

-- Which customer segments are most common in each state?
select state,segment,count(customer_id) as common from customers group by state,segment order by common desc;

-- Which cities have the highest average annual income?
select city, avg(annual_income) as avg_annual_income from customers group by city order by avg_annual_income desc limit 1;

-- KYC & Activity

-- How does KYC status vary across customer segments?
select kyc_status,segment,count(customer_id) from customers group by segment,kyc_status;

-- Which customer segment has the highest KYC completion?
SELECT segment, COUNT(kyc_status) AS kyc_completion_percentage
FROM customers
where kyc_status='verified'
GROUP BY segment
ORDER BY kyc_completion_percentage DESC
limit 1;

-- Which segments have the highest proportion of inactive customers?
SELECT segment, COUNT(customer_id) AS count_inactive
FROM customers
where is_active='no'
GROUP BY segment
ORDER BY count_inactive DESC
LIMIT 1;

-- Customer Tenure

-- Which customer segment has the longest average relationship with the bank?
SELECT segment, AVG(DATEDIFF(CURDATE(), customer_since) / 365.25) AS avg_relationship_years
FROM customers
GROUP BY segment
ORDER BY avg_relationship_years DESC
LIMIT 1;

-- How does average customer tenure vary across different states?
SELECT state, AVG(DATEDIFF(CURDATE(), customer_since) / 365.25) AS avg_tenure_years
FROM customers
GROUP BY state
ORDER BY avg_tenure_years DESC;


-- Sprint 4.2 — Account Usage and Branch Activity

-- Account Types

-- How many accounts exist for each account type?
select account_type,count(account_id) as total_accounts from accounts group by account_type;

-- Which account type has the highest average balance?
select account_type,avg(current_balance) as avg_balance from accounts group by account_type order by avg_balance desc limit 1;

-- Which account type has the highest total balance?
select account_type, sum(current_balance) as total_balance from accounts group by account_type order by total_balance desc limit 1;

-- What is the average account balance by account status?
select status,avg(current_balance) as avg_balance from accounts group by status;

-- Which account types are most popular among customers?
SELECT account_type, COUNT(*) AS total_accounts
FROM accounts
GROUP BY account_type
ORDER BY total_accounts DESC;

-- Branch Activity

-- Which branches have the highest number of accounts?
SELECT b.branch_id, COUNT(a.account_id) AS account_count
FROM accounts a
join branches b on a.branch_id= b.branch_id
GROUP BY b.branch_id
ORDER BY account_count DESC limit 1;

-- Which branches have the lowest number of accounts?
SELECT b.branch_id, COUNT(a.account_id) AS lowest_account_count
FROM accounts a
join branches b on a.branch_id= b.branch_id
GROUP BY b.branch_id
ORDER BY lowest_account_count limit 1;

-- Which branches have the highest total account balance?
select b.branch_id,sum(a.current_balance) as total_balance
from accounts a
join branches b on a.branch_id=b.branch_id
group by b.branch_id
order by total_balance desc limit 1;

-- Which customers own more than one account?
SELECT customer_id, COUNT(account_id) AS total_accounts
FROM accounts
GROUP BY customer_id
HAVING COUNT(account_id)>1
ORDER BY total_accounts DESC;

-- Which account types offer the highest average interest rate?
SELECT account_type, AVG(interest_rate) AS average_interest_rate
FROM accounts
GROUP BY account_type
ORDER BY average_interest_rate DESC;

-- 4.3 Analyze Transaction Patterns

-- Which transaction types are most frequently used?
SELECT transaction_type, COUNT(*) AS total_transactions
FROM transactions
GROUP BY transaction_type
ORDER BY total_transactions DESC;

-- Which transaction types generate the highest total transaction value?
SELECT 
    transaction_type,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount,
    AVG(amount) AS average_amount
FROM transactions
GROUP BY transaction_type
ORDER BY total_amount DESC;

-- Which transaction channels are most commonly used?
SELECT 
    channel,
    COUNT(*) AS total_transactions
FROM transactions
GROUP BY channel
ORDER BY total_transactions DESC;

-- What are the most common transaction descriptions?
SELECT 
    description,
    COUNT(*) AS transaction_count
FROM transactions
GROUP BY description
ORDER BY transaction_count DESC
LIMIT 10;

-- Which accounts have the highest transaction activity?
SELECT 
    account_id,
    COUNT(transaction_id) AS total_transactions,
    SUM(amount) AS total_transaction_amount
FROM transactions
GROUP BY account_id
ORDER BY total_transactions DESC;

-- What is the average transaction amount for each transaction type?
SELECT 
    transaction_type,
    AVG(amount) AS average_transaction_amount
FROM transactions
GROUP BY transaction_type
ORDER BY average_transaction_amount DESC;

-- Which transaction channels are most commonly used?
SELECT 
    channel,
    COUNT(*) AS total_transactions
FROM transactions
GROUP BY channel
ORDER BY total_transactions DESC;

-- Which customers have the highest transaction value?
SELECT 
    a.customer_id,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(t.amount) AS total_transaction_amount
FROM accounts a
JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY a.customer_id
ORDER BY total_transaction_amount DESC;

-- 4.4 Evaluate Loan Performance and Repayment Behaviour

-- Which loan types are most commonly issued?
SELECT 
    loan_type,
    COUNT(loan_id) AS total_loans
FROM loans
GROUP BY loan_type
ORDER BY total_loans DESC;

-- Which loans have the highest outstanding balances?
SELECT 
    loan_id,
    customer_id,
    loan_type,
    outstanding_balance
FROM loans
ORDER BY outstanding_balance DESC
LIMIT 10;

-- What is the distribution of loans by status?
SELECT 
    loan_status,
    COUNT(loan_id) AS total_loans
FROM loans
GROUP BY loan_status
ORDER BY total_loans DESC;

-- Which loan types generate the highest penalties?
SELECT 
    loan_type,
    SUM(principal_amount) AS total_penalties,
    AVG(principal_amount) AS average_penalty
FROM loans
GROUP BY loan_type
ORDER BY total_penalties DESC;

-- Which customers have multiple loans?
SELECT 
    customer_id,
    COUNT(loan_id) AS total_loans,
    SUM(principal_amount) AS total_borrowed,
    SUM(outstanding_balance) AS total_outstanding
FROM loans
GROUP BY customer_id
HAVING COUNT(loan_id) > 1
ORDER BY total_loans DESC;

-- Which customers have the highest total outstanding loan amount?
SELECT 
    customer_id,
    SUM(outstanding_balance) AS total_outstanding
FROM loans
GROUP BY customer_id
ORDER BY total_outstanding DESC
LIMIT 10;

-- Which loans are fully repaid?
SELECT loan_id,customer_id,loan_type,principal_amount,outstanding_balance,loan_status
FROM loans
WHERE outstanding_balance = 0;

-- Which loans have no outstanding balance but are still marked as active?
SELECT loan_id,customer_id,loan_type,principal_amount,outstanding_balance,loan_status
FROM loans
WHERE outstanding_balance = 0
  AND loan_status = 'Active';
  
  -- 4.5 Understand Card Usage and Product Engagement
  
  -- Which card types are most popular?
SELECT 
    card_type,
    COUNT(card_id) AS total_cards
FROM cards
GROUP BY card_type
ORDER BY total_cards DESC;

-- Which card types have the highest average credit limit?
SELECT 
    card_type,
    AVG(credit_limit) AS average_credit_limit,
    MAX(credit_limit) AS maximum_credit_limit
FROM cards
GROUP BY card_type
ORDER BY average_credit_limit DESC;

-- Which card types have the highest outstanding balances?
SELECT 
    card_type,
    SUM(outstanding_balance) AS total_outstanding,
    AVG(outstanding_balance) AS average_outstanding
FROM cards
GROUP BY card_type
ORDER BY total_outstanding DESC;

-- Which customers have both cards and loans?
SELECT DISTINCT
    a.customer_id,
    c.first_name,
    c.last_name
FROM accounts a
JOIN cards cd
    ON a.account_id = cd.account_id
JOIN customers c
    ON a.customer_id = c.customer_id
JOIN loans l
    ON a.customer_id = l.customer_id;
    
-- Which card types generate the highest total reward points?
SELECT
    card_type,
    SUM(reward_points) AS total_reward_points,
    AVG(reward_points) AS average_reward_points
FROM cards
GROUP BY card_type
ORDER BY total_reward_points DESC;

-- Which accounts have multiple cards?
SELECT 
    account_id,
    COUNT(card_id) AS total_cards
FROM cards
GROUP BY account_id
HAVING COUNT(card_id) > 1
ORDER BY total_cards DESC;

-- Which customers have multiple cards?
SELECT a.customer_id, COUNT(c.card_id) AS total_cards
FROM accounts a
JOIN cards c ON a.account_id = c.account_id
GROUP BY a.customer_id
HAVING COUNT(c.card_id) > 1
ORDER BY total_cards DESC;

-- Which account types have the highest number of cards?
SELECT a.account_type, COUNT(c.card_id) AS total_cards
FROM accounts a
JOIN cards c ON a.account_id = c.account_id
GROUP BY a.account_type
ORDER BY total_cards DESC;

-- Which branches have the highest card activity?
SELECT a.branch_id, COUNT(c.card_id) AS total_cards
FROM accounts a
JOIN cards c ON a.account_id = c.account_id
GROUP BY a.branch_id
ORDER BY total_cards DESC;


-- SQL Deliverable

-- ER diagram interpretation and Sprint 1.4 logical solutions.
/*
Explained the purpose of all 7 tables: customers, branches, accounts, cards, transactions, loans,
and loan_payments.
Identified primary keys, foreign keys, and relationships between tables.
Answered the 10 logical business questions in Sprint 1.4 by identifying the required tables and 
columns.


-- MySQL database created from the provided ER diagram.

Created the retail_banking_db database.

Created all 7 tables based on the ER diagram.
Applied:
-Primary keys
-Foreign keys
-NOT NULL constraints
-CHECK constraints
-Default values
Established relationships between customers, accounts, cards, transactions, loans, branches, and 
loan payments.


-- Imported and verified project data.

Imported project data into the respective tables.
Verified the imported data using SELECT * queries for:
-Customers
-Branches
-Accounts
-Cards
-Transactions
-Loans
-Loan payments


-- SQL queries for Sprint 3.

Performed basic analysis to understand:

-Total customers and accounts
-Active customers
-Available account types
-Transaction types
-Total transaction amount
-Loan types and total loans
-Card types
-Total outstanding loan balance.


-- Your analytical questions for each Sprint 4 objective.

4.1 Customer Profile and Segmentation

Analyzed:

Customer distribution across segments
Income differences between segments
Active/inactive customers
Customer demographics
State and city distribution
Income and credit-score differences
KYC status
Customer tenure

4.2 Account Usage and Branch Activity

Analyzed:

Account types and their usage
Number of accounts per customer
Transaction activity per customer
Account balances
Branch-level account activity
Branch transaction activity
Interest rates
Active vs. closed accounts

4.3 Transaction Patterns

Analyzed:

Transaction types
Transaction channels
Failed transactions
Transaction amounts
Transaction descriptions
Transaction activity over time
Transaction activity across customer groups
Relationship between transaction activity and account balances

4.4 Loan Performance and Repayment Behaviour

Analyzed:

Loan types
Loan purposes
Interest rates
Principal and outstanding balances
Loan statuses
Loans in arrears
Delayed payments
Penalties
Repayment behavior by loan type
Branch-level late repayments
Payment methods
Pending payments

4.5 Card Usage and Product Engagement

Analyzed:

Card types
Active cards
Credit limits
Outstanding balances
Card networks
Reward points
Card usage across accounts
Customers using multiple banking products
Relationships between cards, accounts, and loans


-- Findings and business insights.

For each objective, the SQL results should be converted into business insights, rather than simply 
presenting query outputs.

For example:

Finding: The analysis shows that one particular account type has the highest number of customers.

Business insight: The bank could focus on retaining customers using this account type while
identifying opportunities to cross-sell other financial products.

Another example from your multi-product analysis:

Finding: Customers with multiple banking products can be identified by connecting customers,
accounts, cards, and loans.

Business insight: These customers represent opportunities for cross-selling and deeper customer 
engagement.


-- Final conclusions and recommendations wherever appropriate.

My final section summarizes the major findings across all objectives and provide actionable 
recommendations, such as:

1. Customer segmentation: Target different customer segments with appropriate banking products.
2. Account management: Focus on account types with high usage and investigate inactive/closed 
accounts.
3. Transaction optimization: Monitor failed transactions and high-volume channels to improve 
customer experience.
4. Loan management: Closely monitor loan types and branches with high delayed repayments or 
penalties.
5. Product engagement: Identify customers using multiple products and target them for cross-selling.
6. Card management: Evaluate card types based on usage, credit limits, outstanding balances, and 
reward engagement.
7. Branch performance: Compare branches based on account activity, transactions, loan volume, and 
repayment behavior.
