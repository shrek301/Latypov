CREATE TABLE IF NOT EXISTS Organization
(
  id        INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
  user_id INTEGER COMMENT 'Связь с таблицей Юзер',   FOREIGN KEY (user_id) REFERENCES User(id) ,
  office_id INTEGER COMMENT 'Связь с таблицей Офис', FOREIGN KEY (office_id) REFERENCES Office(id),
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
  user_id INTEGER COMMENT 'Связь с таблицей Юзер', FOREIGN KEY (user_id) REFERENCES User(id),
  organization_id INTEGER COMMENT 'Связь с таблицей Организация', FOREIGN KEY (organization_id) REFERENCES Organization(id),
  name      VARCHAR(50) NOT NULL COMMENT 'Наименование',
  address   VARCHAR(50) NOT NULL COMMENT 'Адрес',
  phone     VARCHAR(50) COMMENT 'Телефон',
  is_active BOOLEAN COMMENT 'Статус'
);
COMMENT ON TABLE Office IS 'Офис';

CREATE TABLE IF NOT EXISTS User
(
  id            INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
  doc_type_id   INTEGER COMMENT 'Связь с таблицей Тип Документа', FOREIGN KEY (doc_type_id) REFERENCES Document_Type(id),
  citizenship_id INTEGER COMMENT 'Связь с таблицей Гражданство', FOREIGN KEY (citizenship_id) REFERENCES Citizenship(id),
  office_id INTEGER COMMENT 'Связь с таблицей Офис', FOREIGN KEY (office_id) REFERENCES Office(id),
  organization_id INTEGER COMMENT 'Связь с таблицей Организация', FOREIGN KEY (organization_id) REFERENCES Organization(id),
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
  id       INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
  doc_code VARCHAR(2)  NOT NULL COMMENT 'код документа',
  doc_name VARCHAR(50) NOT NULL COMMENT 'имя документа',
);
COMMENT ON TABLE Document_Type IS 'Тип документа';


CREATE TABLE IF NOT EXISTS Document
(
  id         INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
   doc_type_id   INTEGER COMMENT 'Связь с таблицей Тип Документа', FOREIGN KEY (doc_type_id) REFERENCES Document_Type(id),
  doc_number INTEGER COMMENT 'номер документа',
  doc_date   TIMESTAMP COMMENT 'дата документа',

);
COMMENT ON TABLE Document IS 'Документ';

CREATE TABLE IF NOT EXISTS Citizenship
(
  id               INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
  citizenship_name VARCHAR(50) COMMENT 'гражданство',
  citizenship_code VARCHAR(3) COMMENT 'код гражданства'
);
COMMENT ON TABLE Citizenship IS 'Гражданство';



