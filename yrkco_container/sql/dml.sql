-- ==========================
-- SEED DATA som vanligt eftersom detta inte brukar vara av någon större vikt så bad jag en LLM ge mig seed data
-- gav min ddl till chat gpt o bad han skicka mig 3 av varje
-- ==========================
INSERT INTO country (name) VALUES
('Sweden'),
('Norway'),
('Finland');

INSERT INTO adress (street, postnumber, area, country_id) VALUES
('Sveavägen 12', '111 57', 'Stockholm', 1),
('Karl Johans gate 22', '0159', 'Oslo', 2),
('Mannerheimintie 45', '00100', 'Helsinki', 3);

INSERT INTO företag (name, orgnr, adress_id) VALUES
('Tech AB', '556677-1234', 1),
('Nordic Solutions AS', '987654-321', 2),
('EduConsult Oy', '1234567-9', 3);

INSERT INTO utbildare (firstname, lastname, socialnumber, email, role, företag_id) VALUES
('Anna', 'Berg', '850101-1234', 'anna.berg@techab.se', 'Senior Lecturer', 1),
('Lars', 'Nilsen', '900215-5678', 'lars.nilsen@nordicsolutions.no', 'Guest Lecturer', 2),
('Mia', 'Korhonen', '920301-9876', 'mia.korhonen@educonsult.fi', 'Program Instructor', 3);

INSERT INTO program (name, description) VALUES
('Systemutvecklare .NET', 'Utbildning inom backend, C#, SQL och moln.'),
('DevOps Engineer', 'CI/CD, Docker, Kubernetes och molnplattformar.'),
('Data Engineer', 'Databaser, ETL, Big Data och analys.');

INSERT INTO utbildningsledare (firstname, lastname, socialnumber, email) VALUES
('Eva', 'Svensson', '810522-1234', 'eva.svensson@yh.se'),
('Jonas', 'Andersen', '760923-4567', 'jonas.andersen@yh.se'),
('Tiina', 'Virtanen', '830110-9876', 'tiina.virtanen@yh.fi');

INSERT INTO anläggning (ort, adress_id) VALUES
('Stockholm', 1),
('Oslo', 2),
('Helsinki', 3);

INSERT INTO klass (program_id, utbildningsledare_id, facility_id, start_year) VALUES
(1, 1, 1, 2023),
(2, 2, 2, 2024),
(3, 3, 3, 2024);

INSERT INTO student (firstname, lastname, socialnumber, email, klass_id) VALUES
('Oskar', 'Lind', '010101-1234', 'oskar.lind@student.se', 1),
('Sara', 'Johansson', '020202-5678', 'sara.johansson@student.se', 1),
('Erik', 'Bergström', '990101-9876', 'erik.bergstrom@student.se', 2);

INSERT INTO kurs (name, coursecode, points, description) VALUES
('C# Backend Development', 'CSHARP01', 40, 'Grundkurs inom backendutveckling med C#.'),
('Databasteknik SQL', 'DBSQL01', 30, 'Databashantering och SQL-frågor.'),
('DevOps Pipelines', 'DEVOPS01', 35, 'CI/CD pipeline, Docker, Kubernetes.');

INSERT INTO programkurs (kurs_id, program_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(2, 3);

INSERT INTO kurs_utbildare (kurs_id, utbildar_id) VALUES
(1, 1),
(2, 1),
(2, 3),
(3, 2);
