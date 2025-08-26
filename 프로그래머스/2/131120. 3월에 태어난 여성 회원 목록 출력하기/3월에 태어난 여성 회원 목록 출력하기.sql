-- 코드를 입력하세요
SELECT member_id
,member_name
,gender
,DATE_FORMAT(date_of_birth, '%Y-%m-%d') as DATE_OF_BIRTH
FROM member_profile
WHERE MONTH(date_of_birth) = '03'
AND TLNO is not null
AND GENDER = 'W'
ORDER BY member_id asc