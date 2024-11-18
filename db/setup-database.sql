create database is not exists db_kuramura;

CREATE TABLE t_box(
   idBox INT AUTO_INCREMENT,
   boxLabel VARCHAR(50) NOT NULL,
   boxColor INT,
   boxDescription VARCHAR(512),
   PRIMARY KEY(idBox),
   UNIQUE(boxLabel)
);

CREATE TABLE t_category(
   idCategory INT AUTO_INCREMENT,
   catName VARCHAR(64) NOT NULL,
   catDescription VARCHAR(256),
   PRIMARY KEY(idCategory),
   UNIQUE(catName)
);

CREATE TABLE t_brand(
   idBrand INT AUTO_INCREMENT,
   braName VARCHAR(75) NOT NULL,
   PRIMARY KEY(idBrand),
   UNIQUE(braName)
);

CREATE TABLE t_house(
   idHouse INT AUTO_INCREMENT,
   houCity VARCHAR(256) NOT NULL,
   houZip SMALLINT NOT NULL,
   houStreet VARCHAR(128) NOT NULL,
   houNumber SMALLINT NOT NULL,
   houCountry VARCHAR(128) NOT NULL,
   PRIMARY KEY(idHouse)
);

CREATE TABLE t_tag(
   idTag INT AUTO_INCREMENT,
   tagName VARCHAR(50) NOT NULL,
   PRIMARY KEY(idTag),
   UNIQUE(tagName)
);

CREATE TABLE t_item(
   idItem INT AUTO_INCREMENT,
   iteDescription VARCHAR(512),
   itePrice DECIMAL(19,4),
   itePurchaseDate DATE,
   iteAttributes JSON,
   idBrand INT NOT NULL,
   PRIMARY KEY(idItem),
   FOREIGN KEY(idBrand) REFERENCES t_Brand(idBrand)
);

CREATE TABLE t_room(
   idRoom INT AUTO_INCREMENT,
   romName VARCHAR(64) NOT NULL,
   idHouse INT NOT NULL,
   PRIMARY KEY(idRoom),
   UNIQUE(romName),
   FOREIGN KEY(idHouse) REFERENCES t_house(idHouse)
);

CREATE TABLE belongs(
   idItem INT,
   idCategory INT,
   PRIMARY KEY(idItem, idCategory),
   FOREIGN KEY(idItem) REFERENCES t_item(idItem),
   FOREIGN KEY(idCategory) REFERENCES t_category(idCategory)
);

CREATE TABLE contains(
   idBox INT,
   idItem INT,
   PRIMARY KEY(idBox, idItem),
   FOREIGN KEY(idBox) REFERENCES t_box(idBox),
   FOREIGN KEY(idItem) REFERENCES t_item(idItem)
);

CREATE TABLE residesin(
   idBox INT,
   idRoom INT,
   PRIMARY KEY(idBox, idRoom),
   FOREIGN KEY(idBox) REFERENCES t_box(idBox),
   FOREIGN KEY(idRoom) REFERENCES t_room(idRoom)
);

CREATE TABLE stores(
   idBox INT,
   idCategory INT,
   PRIMARY KEY(idBox, idCategory),
   FOREIGN KEY(idBox) REFERENCES t_box(idBox),
   FOREIGN KEY(idCategory) REFERENCES t_category(idCategory)
);

CREATE TABLE labeledas(
   idItem INT,
   idTag INT,
   PRIMARY KEY(idItem, idTag),
   FOREIGN KEY(idItem) REFERENCES t_item(idItem),
   FOREIGN KEY(idTag) REFERENCES t_tag(idTag)
);