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


  CREATE TABLE IF NOT EXISTS User_Document (
  user_id   INTEGER  NOT NULL  ,
  document_id    INTEGER  NOT NULL  ,


  PRIMARY KEY (user_id, document_id)
  );
  CREATE TABLE IF NOT EXISTS User_Citizenship (
  user_id   INTEGER  NOT NULL ,
  citizenship_id    INTEGER  NOT NULL ,


  PRIMARY KEY (user_id, citizenship_id)
  );


  CREATE INDEX IX_User_Document_Id ON User_Document (document_id);
  ALTER TABLE User_Document
    ADD FOREIGN KEY (document_id) REFERENCES Document (id);


  CREATE INDEX IX_Document_User_Id ON User_Document (user_id);
 ALTER TABLE User_Document
    ADD FOREIGN KEY (user_id) REFERENCES User (id);


  CREATE INDEX IX_Citizenship_User_Id ON User_Citizenship ( citizenship_id );
  ALTER TABLE User_Citizenship
    ADD FOREIGN KEY ( citizenship_id ) REFERENCES Citizenship (id);


  CREATE INDEX IX_User_Citizenship_Id ON User_Citizenship (user_id);
  ALTER TABLE User_Citizenship
    ADD FOREIGN KEY (user_id) REFERENCES User (id);
