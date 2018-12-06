CREATE TABLE IF NOT EXISTS Organization
(
  id        INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
  name      VARCHAR(50) NOT NULL COMMENT 'Имя',
  full_name VARCHAR(50) NOT NULL COMMENT 'Полное имя',
  inn       VARCHAR(10) NOT NULL COMMENT 'ИНН',
  kpp       VARCHAR(9)  NOT NULL COMMENT 'КПП',
  address   VARCHAR(50) COMMENT 'Адрес',
  phone     VARCHAR(50) COMMENT 'Телефон',
  is_active BOOLEAN COMMENT 'Статус'
);
COMMENT ON TABLE Organization IS 'Организация';

CREATE TABLE IF NOT EXISTS Office
(
  id              INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
  organization_id INTEGER COMMENT 'Связь с таблицей Организация',
  FOREIGN KEY (organization_id) REFERENCES Organization (id),
  name            VARCHAR(50) NOT NULL COMMENT 'Наименование',
  address         VARCHAR(50) NOT NULL COMMENT 'Адрес',
  phone           VARCHAR(50) COMMENT 'Телефон',
  is_active       BOOLEAN COMMENT 'Статус'
);
COMMENT ON TABLE Office IS 'Офис';


CREATE TABLE IF NOT EXISTS Document_Type
(
  id   INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
  code VARCHAR(2)  NOT NULL COMMENT 'код документа',
  name VARCHAR(50) NOT NULL COMMENT 'имя документа',
);
COMMENT ON TABLE Document_Type IS 'Тип документа';


CREATE TABLE IF NOT EXISTS Document
(
  id      INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
  type_id INTEGER COMMENT 'Связь с таблицей Тип Документа',
  FOREIGN KEY (type_id) REFERENCES Document_Type (id),
  number  INTEGER COMMENT 'номер документа',
  date    DATE COMMENT 'дата документа',

);
COMMENT ON TABLE Document IS 'Документ';

CREATE TABLE IF NOT EXISTS Country
(
  id   INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) COMMENT 'гражданство',
  code VARCHAR(3) COMMENT 'код гражданства'
);
COMMENT ON TABLE Country IS 'Страна';

CREATE TABLE IF NOT EXISTS User
(
  id            INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,

  document_id  INTEGER COMMENT 'Связь с таблицей  Документ',
  FOREIGN KEY (document_id) REFERENCES Document (id),
  сountry_id   INTEGER COMMENT 'Связь с таблицей Гражданство',
  FOREIGN KEY (country_id) REFERENCES Country (id),
  office_id    INTEGER COMMENT 'Связь с таблицей Офис',
  FOREIGN KEY   (office_id) REFERENCES Office (id),
  first_name    VARCHAR(50) NOT NULL COMMENT 'Имя',
  second_name   VARCHAR(50) COMMENT 'Фамилия',
  middle_name   VARCHAR(50) COMMENT 'Отчество',
  position      VARCHAR(50) NOT NULL COMMENT 'Позиция',
  phone         VARCHAR(50) COMMENT 'Телефон',
  is_identified BOOLEAN COMMENT 'Идентификация',
  is_active     BOOLEAN COMMENT 'Статус'
);
COMMENT ON TABLE User IS 'Пользователь';


CREATE INDEX I_Office ON Office (organization_id);
CREATE INDEX II_User ON User (сountry_id);
CREATE INDEX III_User ON User (office_id);
CREATE INDEX IV_User ON User (organization_id);
CREATE INDEX V_Document ON Document (type_id);
CREATE INDEX VI_User ON User (document_id);
