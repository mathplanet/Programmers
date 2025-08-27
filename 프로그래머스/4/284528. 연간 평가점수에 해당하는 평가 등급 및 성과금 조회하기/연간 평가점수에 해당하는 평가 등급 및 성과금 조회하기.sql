WITH CTE AS(
    SELECT EMP_NO
    ,AVG(SCORE) as avg_score
    FROM HR_GRADE
    GROUP BY EMP_NO
)

SELECT c.EMP_NO
, a.EMP_NAME
, c.GRADE
, CASE WHEN c.GRADE = 'S' then a.SAL * 0.2
WHEN c.GRADE = 'A' then a.SAL * 0.15
WHEN c.GRADE = 'B' then a.SAL * 0.1
ELSE a.SAL * 0 END as BONUS

FROM (SELECT EMP_NO, CASE WHEN avg_score >= 96 then 'S'
WHEN avg_score >= 90 then 'A'
WHEN avg_score >= 80 then 'B'
ELSE 'C' END AS GRADE
FROM CTE) as c
JOIN HR_EMPLOYEES a on a.EMP_NO = c.EMP_NO
ORDER BY a.EMP_NO ASC;