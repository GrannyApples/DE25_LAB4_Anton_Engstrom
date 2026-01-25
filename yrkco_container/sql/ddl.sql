-- COUNTRY
CREATE TABLE IF NOT EXISTS country (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- ADRESS
CREATE TABLE IF NOT EXISTS adress (
    id SERIAL PRIMARY KEY,
    street VARCHAR(200) NOT NULL,
    postnumber VARCHAR(20) NOT NULL,
    area VARCHAR(100) NOT NULL,
    country_id INT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES country(id)
);

-- FÖRETAG
CREATE TABLE IF NOT EXISTS företag (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    orgnr VARCHAR(50) NOT NULL UNIQUE,
    adress_id INT NOT NULL,
    FOREIGN KEY (adress_id) REFERENCES adress(id)
);

-- UTBILDARE
CREATE TABLE IF NOT EXISTS utbildare (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    socialnumber VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL,
    role VARCHAR(100),
    företag_id INT NOT NULL,
    FOREIGN KEY (företag_id) REFERENCES företag(id)
);

-- PROGRAM
CREATE TABLE IF NOT EXISTS program (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT
);

-- UTBILDNINGSLEDARE
CREATE TABLE IF NOT EXISTS utbildningsledare (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    socialnumber VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL
);

-- ANLÄGGNING
CREATE TABLE IF NOT EXISTS anläggning (
    id SERIAL PRIMARY KEY,
    ort VARCHAR(100) NOT NULL,
    adress_id INT NOT NULL,
    FOREIGN KEY (adress_id) REFERENCES adress(id)
);

-- KLASS
CREATE TABLE IF NOT EXISTS klass (
    id SERIAL PRIMARY KEY,
    program_id INT NOT NULL,
    utbildningsledare_id INT NOT NULL,
    facility_id INT,
    start_year INT NOT NULL,
    FOREIGN KEY (program_id) REFERENCES program(id),
    FOREIGN KEY (utbildningsledare_id) REFERENCES utbildningsledare(id),
    FOREIGN KEY (facility_id) REFERENCES anläggning(id)
);

-- STUDENT
CREATE TABLE IF NOT EXISTS student (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    socialnumber VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL,
    klass_id INT NOT NULL,
    FOREIGN KEY (klass_id) REFERENCES klass(id)
);

-- KURS
CREATE TABLE IF NOT EXISTS kurs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    coursecode VARCHAR(50) NOT NULL UNIQUE,
    points INT NOT NULL,
    description TEXT
);

-- PROGRAMKURS (M:N)
CREATE TABLE IF NOT EXISTS programkurs (
    kurs_id INT NOT NULL,
    program_id INT NOT NULL,
    PRIMARY KEY (kurs_id, program_id),
    FOREIGN KEY (kurs_id) REFERENCES kurs(id),
    FOREIGN KEY (program_id) REFERENCES program(id)
);

-- KURS UTBILDARE (M:N)
CREATE TABLE IF NOT EXISTS kurs_utbildare (
    kurs_id INT NOT NULL,
    utbildar_id INT NOT NULL,
    PRIMARY KEY (kurs_id, utbildar_id),
    FOREIGN KEY (kurs_id) REFERENCES kurs(id),
    FOREIGN KEY (utbildar_id) REFERENCES utbildare(id)
);
