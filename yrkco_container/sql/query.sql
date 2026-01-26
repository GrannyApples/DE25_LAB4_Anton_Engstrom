
-- 3NF relation
SELECT u.firstname || ' ' || u.lastname AS utbildare,
       f.name AS foretag,
       a.street,
       a.area,
       c.name AS land
FROM utbildare u
JOIN foretag f ON u.foretag_id = f.id
JOIN adress a ON f.adress_id = a.id
JOIN country c ON a.country_id = c.id;


-- specifik search for program name
SELECT p.name AS program,
       k.name AS kurs,
       k.coursecode,
       k.points
FROM program p
JOIN programkurs pk ON p.id = pk.program_id
JOIN kurs k ON pk.kurs_id = k.id
WHERE p.name = 'Systemutvecklare .NET';
