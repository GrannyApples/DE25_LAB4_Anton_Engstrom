SELECT u.firstname || ' ' || u.lastname AS utbildare,
       f.name AS foretag,
       a.street,
       a.area,
       c.name AS land
FROM utbildare u
JOIN foretag f ON u.foretag_id = f.id
JOIN adress a ON f.adress_id = a.id
JOIN country c ON a.country_id = c.id;
