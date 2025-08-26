SELECT t.Id,

       COALESCE(c.cnt, 0) AS child_count

FROM ECOLI_DATA t

LEFT JOIN (

    SELECT Parent_Id, COUNT(*) AS cnt

    FROM ECOLI_DATA

    WHERE Parent_Id IS NOT NULL

    GROUP BY Parent_Id

) c

ON t.Id = c.Parent_Id

ORDER BY t.Id;