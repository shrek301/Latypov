CREATE TABLE IF NOT EXISTS Organization (
      id   INTEGER  PRIMARY KEY AUTO_INCREMENT,
      name VARCHAR(50) NOT NULL,
      fullname VARCHAR(50) UNIQUE NOT NULL,
      inn INTEGER UNIQUE NOT NULL,
      kpp INTEGER NOT NULL,
      address VARCHAR(50) NOT NULL,
      phone VARCHAR(50) ,
      isActive  BOOLEAN
  );
  CREATE TABLE IF NOT EXISTS Office (
      id   INTEGER  PRIMARY KEY AUTO_INCREMENT,
      orgid  INTEGER NOT NULL,
      name VARCHAR(50) NOT NULL,
      address VARCHAR(50) NOT NULL,
      phone VARCHAR(50) ,
      isActive  BOOLEAN
  );

  CREATE TABLE IF NOT EXISTS User (
      id   INTEGER  PRIMARY KEY AUTO_INCREMENT,
      officeid  INTEGER NOT NULL,
      firstname VARCHAR(50) NOT NULL,
      secondname VARCHAR(50) ,
      middlename VARCHAR(50) ,
      position VARCHAR(50) NOT NULL,
      phone VARCHAR(50) ,
      docName VARCHAR(50) ,
      docNumber INTEGER ,
      docDate TIMESTAMP,
      citizenshipName VARCHAR(50) ,
      citizenshipCode INTEGER ,
      isIdentified BOOLEAN ,
      isActive  BOOLEAN
  );
  CREATE TABLE IF NOT EXISTS dosc (
      id      INTEGER  PRIMARY KEY AUTO_INCREMENT,
      name    VARCHAR(50) ,
      code    INTEGER
 );

  CREATE TABLE IF NOT EXISTS countries (
      id      INTEGER  PRIMARY KEY AUTO_INCREMENT,
      name    VARCHAR(50) ,
      code    INTEGER
 );

   CREATE TABLE IF NOT EXISTS User_Organization_Office (
      user_id   INTEGER  NOT NULL,
      org_id    INTEGER  NOT NULL,
      office_id INTEGER  NOT NULL,

      PRIMARY KEY (person_id, org_id, office_id)
  );

  CREATE INDEX IX_User_Organization_Office_Id ON User_Organization_Office (office_id);
  ALTER TABLE User_Organization_Office ADD FOREIGN KEY (office_id) REFERENCES Office(id);

  CREATE INDEX IX_Office_User_Organization_Id ON User_Organization_Office (user_id);
  ALTER TABLE User_Organization_Office ADD FOREIGN KEY (user_id) REFERENCES User(id);

  CREATE INDEX IX_Organization_User_Office_Id ON User_Organization_Office (org_id);
  ALTER TABLE User_Organization_Office ADD FOREIGN KEY (org_id) REFERENCES Organization(id);
