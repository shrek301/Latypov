CREATE TABLE IF NOT EXISTS Organization
(
  id        INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
  name      VARCHAR(50)                      NOT NULL COMMENT 'Имя',
  full_name VARCHAR(50) COMMENT 'Имя' UNIQUE NOT NULL,
  inn       VARCHAR(10) COMMENT 'ИНН' UNIQUE NOT NULL,
  kpp       VARCHAR(9)                       NOT NULL COMMENT 'КПП',
  address   VARCHAR(50)                      NOT NULL COMMENT 'Адрес',
  phone     VARCHAR(50) COMMENT 'Телефон',
  is_active BOOLEAN COMMENT 'Статус'
);
COMMENT ON TABLE Organization IS 'Организация';

CREATE TABLE IF NOT EXISTS Office
(
  id        INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
  org_id    INTEGER     NOT NULL COMMENT 'Уникальный идентификатор Организация',
  name      VARCHAR(50) NOT NULL COMMENT 'Наименование',
  address   VARCHAR(50) NOT NULL COMMENT 'Адрес',
  phone     VARCHAR(50) COMMENT 'Телефон',
  is_active BOOLEAN COMMENT 'Статус'
);
COMMENT ON TABLE Office IS 'Офис';

CREATE TABLE IF NOT EXISTS User
(
  id            INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
  first_name    VARCHAR(50) NOT NULL COMMENT 'Имя',
  second_name   VARCHAR(50) COMMENT 'Фамилия',
  middle_name   VARCHAR(50) COMMENT 'Отчество',
  position      VARCHAR(50) NOT NULL COMMENT 'Позиция',
  phone         VARCHAR(50) COMMENT 'Телефон',
  is_identified BOOLEAN COMMENT 'Идентификация',
  is_active     BOOLEAN COMMENT 'Статус'
);
COMMENT ON TABLE User IS 'Пользователь';

CREATE TABLE IF NOT EXISTS Document_Type
(
  id       INTEGER COMMENT 'Возраст' PRIMARY KEY AUTO_INCREMENT,
  doc_code VARCHAR(2)  NOT NULL COMMENT 'типа документа',
  doc_name VARCHAR(50) NOT NULL COMMENT 'имя документа',
);
COMMENT ON TABLE Document_Type IS 'Тип документа';


CREATE TABLE IF NOT EXISTS Document
(
  id         INTEGER COMMENT 'Возраст' PRIMARY KEY AUTO_INCREMENT,
  doc_number INTEGER COMMENT 'номер документа',
  doc_date   TIMESTAMP COMMENT 'дата документа',

);
COMMENT ON TABLE Document IS 'Документ';

CREATE TABLE IF NOT EXISTS Citizenship
(
  id               INTEGER COMMENT 'Возраст' PRIMARY KEY AUTO_INCREMENT,
  citizenship_name VARCHAR(50) COMMENT 'гражданство',
  citizenship_code VARCHAR(3) COMMENT 'код гражданства'
);
COMMENT ON TABLE Citizenship IS 'Гражданство';


