--- 1. Find the revenue we got from each sales channel in a given year

SELECT sales_channel, SUM(amount) AS revenue
FROM clinic_sales
WHERE datetime >= '2021-01-01'
  AND datetime < '2022-01-01'
GROUP BY sales_channel;


--- 2. Find top 10 the most valuable customers for a given year

SELECT uid,
       SUM(amount) AS total_spent
FROM clinic_sales
WHERE datetime >= '2021-01-01'
  AND datetime < '2022-01-01'
GROUP BY uid
ORDER BY total_spent DESC
LIMIT 10;



--- 3. Find month wise revenue, expense, profit , status (profitable / not-profitable) for a given year

WITH revenue AS (
    SELECT 
        EXTRACT(MONTH FROM datetime) AS month,
        SUM(amount) AS total_revenue
    FROM clinic_sales
    WHERE datetime >= '2021-01-01'
      AND datetime < '2022-01-01'
    GROUP BY month
),
expenses_data AS (
    SELECT 
        EXTRACT(MONTH FROM datetime) AS month,
        SUM(amount) AS total_expense
    FROM expenses
    WHERE datetime >= '2021-01-01'
      AND datetime < '2022-01-01'
    GROUP BY month
)

SELECT 
    r.month,
    r.total_revenue,
    e.total_expense,
    (r.total_revenue - e.total_expense) AS profit,
    CASE 
        WHEN (r.total_revenue - e.total_expense) > 0 THEN 'Profitable'
        ELSE 'Not Profitable'
    END AS status
FROM revenue r
JOIN expenses_data e ON r.month = e.month
ORDER BY r.month;


--- 4. For each city find the most profitable clinic for a given month

WITH revenue AS (
    SELECT 
        cid,
        EXTRACT(MONTH FROM datetime) AS month,
        SUM(amount) AS total_revenue
    FROM clinic_sales
    WHERE datetime >= '2021-01-01'
      AND datetime < '2022-01-01'
    GROUP BY cid, month
),
expenses_data AS (
    SELECT 
        cid,
        EXTRACT(MONTH FROM datetime) AS month,
        SUM(amount) AS total_expense
    FROM expenses
    WHERE datetime >= '2021-01-01'
      AND datetime < '2022-01-01'
    GROUP BY cid, month
),
profit_data AS (
    SELECT 
        c.city,
        r.month,
        r.cid,
        r.total_revenue - COALESCE(e.total_expense, 0) AS profit
    FROM revenue r
    JOIN clinics c ON r.cid = c.cid
    LEFT JOIN expenses_data e 
        ON r.cid = e.cid AND r.month = e.month
)

SELECT city, month, cid, profit
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY city, month ORDER BY profit DESC) AS rank_no
    FROM profit_data
) t
WHERE rank_no = 1
ORDER BY city, month;



--- 5. For each state find the second least profitable clinic for a given month


WITH revenue AS (
    SELECT 
        cid,
        SUM(amount) AS total_revenue
    FROM clinic_sales
    WHERE datetime >= '2021-01-01'
      AND datetime < '2021-02-01'   -- given month
    GROUP BY cid
),
expenses_data AS (
    SELECT 
        cid,
        SUM(amount) AS total_expense
    FROM expenses
    WHERE datetime >= '2021-01-01'
      AND datetime < '2021-02-01'
    GROUP BY cid
),
profit_data AS (
    SELECT 
        c.state,
        r.cid,
        r.total_revenue - COALESCE(e.total_expense, 0) AS profit
    FROM revenue r
    JOIN clinics c ON r.cid = c.cid
    LEFT JOIN expenses_data e ON r.cid = e.cid
)

SELECT state, cid, profit
FROM (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY state ORDER BY profit ASC) AS rank_no
    FROM profit_data
) t
WHERE rank_no = 2
ORDER BY state;