
--YSQL
--Schema: retail
Create schema retail;

--Tables to support Microservices
--1. Products: Product Catalog Publishing Microservice
Drop table if exists retail.products cascade;
CREATE TABLE retail.products 
(
   sku UUID PRIMARY KEY,
   title VARCHAR(64),
   author VARCHAR(64),
   description VARCHAR(200),
   categories VARCHAR(64),
   price numeric,
   imurl VARCHAR(200),
   discount numeric
);

--2. Product Inventory: Inventory Service
Drop table if exists retail.inventory cascade;
CREATE TABLE retail.inventory 
(
     sku UUID PRIMARY KEY,
     store_num  int,
     store_region VARCHAR(64), --east, west, etc
     onhand int,
     available_to_promise int,
     allocated int,
     reserved int,   
     virtual_hold int
);
  
--2. Transactions: Shopping Service / POS Service
 Drop table if exists retail.orders cascade;
 CREATE TABLE retail.orders 
 (
      order_id  UUID PRIMARY KEY,
      sku       UUID NOT NULL,
      accountid CHAR(10) NOT NULL,
      order_details jsonb,
      order_time TIMESTAMP,
      order_total int,
      store_num int,
      store_region VARCHAR(64) --east, west, etc
);
 
--User
Drop table if exists retail.users cascade;
create table users
(
  accountid UUID PRIMARY KEY,
  username VARCHAR(64) UNIQUE NOT NULL,
  passhash BYTEA NOT NULL,
  firstname VARCHAR(64) NOT NULL,
  lastname VARCHAR(64) NOT NULL,
  state VARCHAR(2) NOT NULL
);
    	 