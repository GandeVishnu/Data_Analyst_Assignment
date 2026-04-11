--- 1. For every user in the system, get the user_id and last booked room_no

SELECT b.user_id, b.room_no
FROM bookings b
WHERE b.booking_date = (
    SELECT MAX(b2.booking_date)
    FROM bookings b2
    WHERE b2.user_id = b.user_id
);

--- 2. Get booking_id and total billing amount of every booking created in November, 2021

SELECT b.booking_id,
       SUM(bc.item_quantity * i.item_rate) AS total_amount
FROM bookings b
JOIN booking_commercials bc ON b.booking_id = bc.booking_id
JOIN items i ON bc.item_id = i.item_id
WHERE b.booking_date >= '2021-11-01'
AND b.booking_date < '2021-12-01'
GROUP BY b.booking_id;

--- 3. Get bill_id and bill amount of all the bills raised in October, 2021 having bill amount >1000

SELECT bc.bill_id,
       SUM(bc.item_quantity * i.item_rate) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE bc.bill_date >= '2021-10-01'
AND bc.bill_date < '2021-11-01'
GROUP BY bc.bill_id
HAVING SUM(bc.item_quantity * i.item_rate) > 1000;



--- 4. Determine the most ordered and least ordered item of each month of year 2021

WITH item_sales AS (
    SELECT 
        EXTRACT(MONTH FROM bill_date) AS month,
        item_id,
        SUM(item_quantity) AS total_qty
    FROM booking_commercials
    WHERE EXTRACT(YEAR FROM bill_date) = 2021
    GROUP BY month, item_id
)

SELECT *
FROM (
    SELECT *,
           MAX(total_qty) OVER (PARTITION BY month) AS max_qty,
           MIN(total_qty) OVER (PARTITION BY month) AS min_qty
    FROM item_sales
) t
WHERE total_qty = max_qty
   OR total_qty = min_qty
ORDER BY month;




--- 5. Find the customers with the second highest bill value of each month of year 2021

WITH bill_data AS (
    SELECT EXTRACT(MONTH FROM bc.bill_date) AS month,
           b.user_id,
           bc.bill_id,
           SUM(bc.item_quantity * i.item_rate) AS bill_amount
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    JOIN bookings b ON bc.booking_id = b.booking_id
    WHERE EXTRACT(YEAR FROM bc.bill_date) = 2021
    GROUP BY month, bc.bill_id, b.user_id
)
SELECT *
FROM (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY month ORDER BY bill_amount DESC) AS rnk
    FROM bill_data
) t
WHERE rnk = 2;


