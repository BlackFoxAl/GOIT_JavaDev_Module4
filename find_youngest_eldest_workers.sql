SELECT 'YOUNGEST' as TYPE, name, birthday
FROM worker
WHERE birthday IN (
   SELECT MAX(birthday)
   FROM worker)
UNION
SELECT 'OLDEST' as TYPE, name, birthday
FROM worker
WHERE birthday IN (
   SELECT MIN(birthday)
   FROM worker)