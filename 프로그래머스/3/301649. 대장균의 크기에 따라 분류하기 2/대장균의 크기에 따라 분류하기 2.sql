WITH CTE AS (
    SELECT
        ID,
        SIZE_OF_COLONY,
        ROW_NUMBER() OVER (ORDER BY SIZE_OF_COLONY DESC) AS num,
        COUNT(*) OVER () AS total_count
    FROM ECOLI_DATA
)
SELECT 
    ID,
    CASE 
        WHEN num / total_count <= 0.25 THEN 'CRITICAL'
        WHEN num / total_count <= 0.5  THEN 'HIGH'
        WHEN num / total_count <= 0.75 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS COLONY_NAME
FROM CTE
ORDER BY ID ASC;