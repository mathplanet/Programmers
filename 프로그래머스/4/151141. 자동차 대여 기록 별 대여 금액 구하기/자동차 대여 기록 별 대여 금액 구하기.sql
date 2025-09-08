WITH rental AS (
    SELECT h.HISTORY_ID,
           h.CAR_ID,
           DATEDIFF(h.END_DATE, h.START_DATE) + 1 AS days
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY h
    JOIN CAR_RENTAL_COMPANY_CAR c
      ON h.CAR_ID = c.CAR_ID
    WHERE c.CAR_TYPE = '트럭'
),
discount AS (
    SELECT r.HISTORY_ID,
           r.days,
           c.DAILY_FEE,
           MAX(p.DISCOUNT_RATE) AS discount_rate
    FROM rental r
    JOIN CAR_RENTAL_COMPANY_CAR c
      ON r.CAR_ID = c.CAR_ID
    LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN p
      ON c.CAR_TYPE = p.CAR_TYPE
     AND r.days >= p.DURATION_TYPE
    GROUP BY r.HISTORY_ID, r.days, c.DAILY_FEE
)
SELECT HISTORY_ID,
       ROUND(days * DAILY_FEE * (100 - IFNULL(discount_rate,0)) / 100, 0) AS FEE
FROM discount
ORDER BY FEE DESC, HISTORY_ID DESC;
