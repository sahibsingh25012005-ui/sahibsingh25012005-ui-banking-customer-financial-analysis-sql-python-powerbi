-- =====================================
-- 1. CUSTOMER ANALYSIS
-- =====================================

-- Q1. Find the total number of customers

SELECT
    COUNT(*) AS "Total Customers"
FROM customers;

-- Q2. Calculate the number and percentage of customers by gender

SELECT
    gender,
    COUNT(*) AS Number,
    COUNT(*) * 100 / (
        SELECT COUNT(*)
        FROM customers
    ) AS Percentage
FROM customers
GROUP BY gender;

-- Q3. Calculate customer distribution by occupation

SELECT
    occupation AS Occupation,
    COUNT(*) AS Number,
    COUNT(*) * 100 / (
        SELECT COUNT(*)
        FROM customers
    ) AS Percentage
FROM customers
GROUP BY occupation
ORDER BY Percentage DESC;

-- =====================================
-- ACCOUNT ANALYSIS
-- =====================================

-- Q4. Calculate account distribution by account type
SELECT
    account_type AS "Account Type",
    COUNT(*) AS Number,
    COUNT(*) * 100 / (SELECT COUNT(*) FROM accounts) AS Percentage
FROM accounts
GROUP BY account_type
ORDER BY Percentage DESC;

-- Q5. Calculate total account balance by account type

SELECT
    account_type,
        ROUND(SUM(account_balance) / 100000, 2) AS "Total Balance Lakh"
FROM accounts
GROUP BY account_type;

-- Q8. Calculate total account balance by city using CTE

WITH cte AS (
    SELECT
        c.city,
        SUM(a.account_balance) AS total_balance
    FROM customers c
    LEFT JOIN accounts a
        USING (customer_id)
    GROUP BY c.city
)
SELECT
    city,
    ROUND(total_balance / 100000, 2) AS total_balance_lakh
FROM cte
ORDER BY total_balance DESC;

-- Q9. Calculate account distribution by account status

SELECT
    account_status,
    COUNT(*) * 100 / (
        SELECT COUNT(*)
        FROM accounts
    ) AS percentage
FROM accounts
GROUP BY account_status;

-- Q10. Find the top 3 branches by total account balance

SELECT
    branch_name,
    SUM(account_balance) AS total_balance
FROM branches
LEFT JOIN accounts USING (branch_id)
GROUP BY branch_name,branch_id
ORDER BY total_balance DESC
LIMIT 3;

-- Q13. Calculate total account balance for each customer

SELECT
    customer_id,
    SUM(account_balance) AS total_account_balance
FROM accounts
GROUP BY customer_id
ORDER BY total_account_balance DESC;

-- Q14. Find the customer with the highest combined account balance in each city
WITH customer_balance AS (
    SELECT
        c.city,
        c.customer_id,
        SUM(a.account_balance) AS total_balance
    FROM customers c
    LEFT JOIN accounts a
        USING (customer_id)
    GROUP BY c.city, c.customer_id
),
ranked_customers AS (
    SELECT
        city,
        customer_id,
        total_balance,
        ROW_NUMBER() OVER (
            PARTITION BY city
            ORDER BY total_balance DESC
        ) AS rnk
    FROM customer_balance
)
SELECT
    city,
    customer_id,
    total_balance
FROM ranked_customers
WHERE rnk = 1;

-- =====================================
-- LOAN ANALYSIS
-- =====================================

-- Q6. Find the total number of loans

SELECT
    COUNT(*) AS "Total Loans"
FROM loans;

-- Q7. Calculate the number of loans by loan type

SELECT
    loan_type,
    COUNT(loan_type) AS number_of_loans
FROM loans
GROUP BY loan_type
ORDER BY number_of_loans DESC;

-- Q11. Rank loan types based on total loan amount

SELECT
    loan_type,
    ROUND(SUM(loan_amount) / 100000, 2) AS total_loan_amount_lakh,
    DENSE_RANK() OVER (
        ORDER BY SUM(loan_amount) DESC
    ) AS ranking
FROM loans
GROUP BY loan_type;

-- Q12. Find the top 5 ages with the highest number of loans

SELECT
    age,
    COUNT(loan_id) AS total_loans
FROM customers
LEFT JOIN loans USING (customer_id)
GROUP BY age
ORDER BY total_loans DESC
LIMIT 5;


-- =====================================
-- TRANSACTION ANALYSIS
-- =====================================


-- Q15. Calculate total transaction amount for each customer
SELECT
    c.customer_id,
    COALESCE(SUM(t.transaction_amount), 0) AS total_transaction_amount
FROM customers c
LEFT JOIN transactions t
    USING (customer_id)
GROUP BY c.customer_id
ORDER BY total_transaction_amount DESC;