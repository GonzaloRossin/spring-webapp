CREATE TABLE IF NOT EXISTS customer (
  customerId SERIAL PRIMARY KEY,
  customerName varchar(50) NOT NULL,
  Phone varchar(50) NOT NULL,
  Mail varchar(50)
);

CREATE TABLE IF NOT EXISTS restaurant (
  restaurantId SERIAL PRIMARY KEY,
  restaurantName varchar(100) NOT NULL,
  phone varchar(100) NOT NULL,
  Mail varchar(50) NOT NULL,
  totalTables int NOT NULL
);

ALTER TABLE restaurant ADD COLUMN IF NOT EXISTS totalTables int DEFAULT 10 NOT NULL ;
ALTER TABLE restaurant ADD COLUMN IF NOT EXISTS openHour int DEFAULT '0';
ALTER TABLE restaurant ADD COLUMN IF NOT EXISTS closeHour int DEFAULT '0';

CREATE TABLE IF NOT EXISTS image
(
    imageId serial PRIMARY KEY,
    bitmap bytea
);

CREATE TABLE IF NOT EXISTS dish (
  dishId SERIAL PRIMARY KEY,
  restaurantId int NOT NULL,
  dishName varchar(100) NOT NULL,
  price int NOT NULL,
  dishDescription varchar(200) NOT NULL,
  FOREIGN KEY (restaurantId) REFERENCES restaurant (restaurantId)
);

ALTER TABLE dish ADD IF NOT EXISTS imageId integer default 1 NOT NULL;

CREATE TABLE IF NOT EXISTS reservation (
    reservationId   SERIAL PRIMARY KEY,
    restaurantId    integer NOT NULL,
    customerId      integer NOT NULL,
    reservationHour integer NOT NULL,
    reservationStatus integer,
    FOREIGN KEY (restaurantId) REFERENCES restaurant (restaurantId),
    FOREIGN KEY (customerId) REFERENCES customer (customerId)
);

ALTER TABLE reservation DROP COLUMN IF EXISTS reservationDate;

ALTER TABLE reservation ADD IF NOT EXISTS reservationHour integer default 0 NOT NULL;


CREATE TABLE IF NOT EXISTS users (
  userId SERIAL PRIMARY KEY,
  username varchar(100) UNIQUE,
  password varchar(100),
  role varchar(100)
);

ALTER TABLE users ADD IF NOT EXISTS role varchar(100) default 'ROLE_RESTAURANT' NOT NULL;

DROP TABLE orderItem;

CREATE TABLE IF NOT EXISTS orderItem
(
    id          serial PRIMARY KEY,
    dishId     integer NOT NULL,
    reservationId integer NOT NULL,
    unitPrice     decimal(12,2) NOT NULL,
    quantity      integer NOT NULL,
    status        integer NOT NULL,
    FOREIGN KEY ( reservationId ) REFERENCES reservation ( reservationId ) ON DELETE CASCADE ,
    FOREIGN KEY ( dishId ) REFERENCES dish ( dishId ) ON DELETE CASCADE
);


