
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

-- shows teacher + courses they teach
SELECT u.firstname || ' ' || u.lastname AS utbildare,
       k.name AS kurs
FROM utbildare u
JOIN kurs_utbildare ku ON u.id = ku.utbildar_id
JOIN kurs k ON ku.kurs_id = k.id;

-- Studenter + Klass + Program + Utbildningsledare
-- complete view over students and their connections
SELECT s.firstname || ' ' || s.lastname AS student,
       k.start_year,
       p.name AS program,
       ul.firstname || ' ' || ul.lastname AS utbildningsledare
FROM student s
JOIN klass k ON s.klass_id = k.id
JOIN program p ON k.program_id = p.id
JOIN utbildningsledare ul ON k.utbildningsledare_id = ul.id;

-- just a course count, agg + join

SELECT p.name AS program,
       COUNT(pk.kurs_id) AS antal_kurser
FROM program p
LEFT JOIN programkurs pk ON p.id = pk.program_id
GROUP BY p.name
ORDER BY antal_kurser DESC;
