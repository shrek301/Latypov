CREATE TABLE IF NOT EXISTS Organization
(
  id        INTEGER PRIMARY KEY AUTO_INCREMENT,
  name      VARCHAR(50)        NOT NULL,
  full_name VARCHAR(50) UNIQUE NOT NULL,
  inn       VARCHAR(50) UNIQUE NOT NULL,
  kpp       VARCHAR(50)        NOT NULL,
  address   VARCHAR(50)        NOT NULL,
  phone     VARCHAR(50),
  is_active BOOLEAN
);
CREATE TABLE IF NOT EXISTS Office
(
  id        INTEGER PRIMARY KEY AUTO_INCREMENT,
  org_id    INTEGER     NOT NULL,
  name      VARCHAR(50) NOT NULL,
  address   VARCHAR(50) NOT NULL,
  phone     VARCHAR(50),
  is_active BOOLEAN
);

CREATE TABLE IF NOT EXISTS User
(
  id               INTEGER PRIMARY KEY AUTO_INCREMENT,
  office_id        INTEGER     NOT NULL,
  first_name       VARCHAR(50) NOT NULL,
  second_name      VARCHAR(50),
  middle_name      VARCHAR(50),
  position         VARCHAR(50) NOT NULL,
  phone            VARCHAR(50),
  doc_name         VARCHAR(50),
  doc_number       INTEGER,
  doc_date         TIMESTAMP,
  doc_code         INTEGER,
  citizenship_name VARCHAR(50),
  citizenship_code INTEGER,
  is_identified    BOOLEAN,
  is_active        BOOLEAN
);

CREATE TABLE IF NOT EXISTS Document
(
  id   INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  code VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Citizenship
(
  id   INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  code INTEGER
);



ALTER TABLE User
  ADD FOREIGN KEY (doc_code) REFERENCES Document (id);

ALTER TABLE User
  ADD FOREIGN KEY (citizenship_code) REFERENCES Citizenship (id);
