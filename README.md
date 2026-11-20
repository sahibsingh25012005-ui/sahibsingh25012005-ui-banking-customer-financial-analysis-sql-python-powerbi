# Banking Customer & Financial Analysis

An end-to-end banking data analytics project using **MySQL, Python,
SQLAlchemy, Pandas, and Power BI**. The project explores customer
demographics, account balances, transaction activity, branch
performance, and loan portfolio status to turn banking data into
business insights.

## Project Overview

Banks work with large amounts of customer, account, transaction, and
loan data. This project brings these datasets together to answer
practical business questions:

-   Who are the bank's customers, and how are they distributed by age,
    gender, and occupation?
-   How are account types and account balances distributed?
-   Which branches have the highest account balances?
-   How much transaction activity is recorded, and which channels are
    used?
-   What is the size and status of the loan portfolio?
-   How much loan amount is still outstanding?

The analysis uses SQL for querying and aggregation, Python for data
handling and exploratory analysis, and Power BI for interactive
reporting.

## Dataset Overview

The project works with five related tables:

  -----------------------------------------------------------------------
  Table                               Description
  ----------------------------------- -----------------------------------
  `customers`                         Customer details such as customer
                                      ID, age, gender, occupation, city,
                                      and annual income

  `accounts`                          Account details such as account
                                      type, account status, account
                                      balance, and branch ID

  `branches`                          Branch information, including
                                      branch name, city, and branch type

  `transactions`                      Customer transaction records,
                                      including transaction amount, date,
                                      type, and channel

  `loans`                             Loan records, including loan type,
                                      loan amount, interest rate, and
                                      loan status
  -----------------------------------------------------------------------

The dashboards show approximately **50K customers, 50K accounts, 300K
transactions, and 18K loans**.

## Tools & Technologies

-   **MySQL** -- relational database and SQL analysis
-   **Python** -- data processing and exploratory data analysis
-   **Pandas** -- data extraction and manipulation
-   **SQLAlchemy** -- Python-to-MySQL database connection
-   **Power BI** -- interactive dashboards and KPI reporting
-   **Jupyter Notebook / VS Code** -- analysis environment

## Project Workflow

1.  **Database analysis:** Connected to MySQL and explored the five
    related tables.
2.  **SQL analysis:** Used joins, aggregate functions, subqueries, CTEs,
    and window functions to answer business questions.
3.  **Python analysis:** Connected to MySQL with SQLAlchemy, loaded data
    into Pandas, and carried out data checks and exploratory analysis.
4.  **Dashboard development:** Built Power BI report pages to present
    customer, account, transaction, and loan insights.
5.  **Reporting:** Summarized the main findings and recommendations in a
    PDF project report.

## Power BI Dashboards

The Power BI report is organized into three dashboard pages:

### 1. Customer & Account Analysis

-   Average customer age and average annual income
-   Average account balance
-   Active and inactive account indicators
-   Account balance by account type
-   Account distribution by status
-   Top five cities by branch account balance
-   Customer count trend by customer-since date

### 2. Executive Overview

-   Total customers, accounts, and account balance
-   Total and outstanding loan amount
-   Monthly transaction trend
-   Loan amount by gender
-   Customer distribution by age group
-   Accounts and average balance by branch type
-   Account balance by account type

### 3. Transaction & Loan Analysis

-   Total transactions, transaction value, and average transaction value
-   Total number of loans
-   Loan amount and average interest rate by loan type
-   Transactions by channel
-   Debit and credit transaction value
-   Loan distribution by status
-   Loans by city
-   Loan-level detail table

## Key Findings

The following figures are displayed in the supplied Power BI dashboards:

  Metric                        Dashboard value
  --------------------------- -----------------
  Total customers                           50K
  Total accounts                            50K
  Total account balance          ₹3.720 billion
  Total transactions                       300K
  Total transaction value         ₹1.83 billion
  Average transaction value              ₹6.08K
  Total loans                               18K
  Total loan amount             ₹11.874 billion
  Outstanding loan amount        ₹4.337 billion
  Average customer age                       38
  Average annual income                ₹48.885K

Additional observations:

-   Savings accounts hold the largest account balance, approximately
    **₹2.328 billion**, compared with current accounts (approximately
    ₹806 million) and salary accounts (approximately ₹586 million).
-   The account-status visual shows approximately **91.04% active**,
    **5.96% dormant**, and **2.99% closed** accounts.
-   The loan-status visual shows **6.07% defaulted loans**; active loans
    account for 58.21%, closed loans 27.22%, and pending loans 8.49%.
-   Personal loans have the largest loan amount among the loan types
    shown in the dashboard.
-   Debit transactions represent approximately **55.97%** of transaction
    value, while credit transactions represent approximately **44.03%**.
-   Mobile Banking and UPI are the leading channels by transaction value
    in the channel chart.

*Dashboard values are rounded as displayed. KPI definitions and filters
should be checked in the Power BI report before using these figures for
operational decisions.*

## SQL Analysis

The SQL folder contains 15 business-focused queries grouped into:

-   Customer analysis
-   Account analysis
-   Loan analysis
-   Transaction analysis

SQL concepts demonstrated include:

-   `SELECT`, `ORDER BY`, and `LIMIT`
-   Aggregate functions such as `COUNT()` and `SUM()`
-   `GROUP BY`
-   `LEFT JOIN`
-   Subqueries
-   Common Table Expressions (CTEs)
-   Window functions such as `DENSE_RANK()` and `ROW_NUMBER()`
-   `COALESCE()`

## Business Recommendations

Based on the patterns visible in the dashboards:

1.  **Monitor loan repayment performance:** Review defaulted and
    outstanding loan amounts regularly, and compare results by loan
    type, city, and loan status.
2.  **Review personal loan exposure:** Personal loans have the largest
    loan amount in the displayed loan-type analysis, so their
    outstanding balances and repayment performance deserve attention.
3.  **Understand dormant accounts:** Study the customers and account
    characteristics associated with dormant accounts before designing
    re-engagement activities.
4.  **Support digital transaction channels:** Continue monitoring Mobile
    Banking and UPI activity and use transaction trends to guide
    improvements to the digital banking experience.
5.  **Use customer segments carefully:** Explore age, occupation,
    income, and account-type patterns to support relevant customer
    communication and service planning.

These are analysis-based recommendations, not claims that the dashboards
establish the causes of customer behavior or loan defaults.

## Repository Structure

``` text
banking-customer-financial-analysis-sql-python-powerbi/
│
├── Python/
│   └── updated_main.ipynb
│
├── SQL/
│   └── banking_analysis.sql
│
├── Reports/
│   └── Banking_Customer_Financial_Analysis_Report.pdf
│
└── README.md
```

## How to Use

1.  Clone or download this repository.
2.  Open the project in VS Code or Jupyter Notebook.
3.  Set up a MySQL database containing the five project tables.
4.  Update the database connection details in the notebook for your
    local environment.
5.  Run the notebook cells in order.
6.  Open `SQL/banking_analysis.sql` to review and run the SQL analysis
    queries.
7.  Open the Power BI report to explore the dashboards.

> **Note:** Database credentials and other private connection details
> should not be committed to GitHub. Use your own local configuration.

## Project Report

The `Reports` folder contains a PDF report with the business problem,
key findings, patterns, recommendations, and limitations.

## Author

**Sahib Singh**\
B.Sc. (Hons.) Artificial Intelligence & Data Science\
[GitHub Profile](https://github.com/sahibsingh25012005-ui)

------------------------------------------------------------------------

*This project was created for learning and portfolio purposes to
demonstrate practical skills in SQL, Python-based data analysis, and
Power BI reporting.*
