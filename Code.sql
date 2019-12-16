DROP TABLE broker_exchange_deals;
DROP TABLE account_info;
DROP TABLE transaction_info;
DROP TABLE stock_info;
DROP TABLE company_info;
DROP TABLE broker_info;
DROP TABLE exchange;
DROP TABLE trader_info;

create table company_info
(
  company_id char(10) primary key,
  company_name VARCHAR(30) NOT NULL,
  streetNo VARCHAR(30) NOT NULL,
  city VARCHAR (50) NOT NULL,
  c_state VARCHAR (50) NOT NULL,
  zipcode NUMERIC (10) NOT NULL,
  established_date DATETIME NOT NULL
);


create table exchange
(
exchange_id char(10) primary key,
exchange_name varchar(10) NOT NULL
);


CREATE TABLE broker_info(
broker_id char(10) primary key,
broker_fname varchar(30) NOT NULL,
broker_lname varchar(30) NOT NULL,
broker_contact varchar(12) NOT NULL,
broker_streetno numeric(10) NOT NULL,
broker_streetname varchar(50) NOT NULL,
broker_city varchar(30) NOT NULL,
broker_state varchar(30) NOT NULL, 
broker_zip numeric(10) NOT NULL
);


CREATE TABLE trader_info(
trader_id char(10) primary key NOT NULL,
trader_fname varchar(30) NOT NULL,
trader_lname varchar(30) NOT NULL,
account_no numeric(9) NOT NULL,
trader_contact varchar(12) NOT NULL,
trader_streetno numeric(10) NOT NULL,
trader_streetname varchar(50) NOT NULL,
trader_city varchar(30) NOT NULL,
trader_state varchar(30) NOT NULL, 
trader_zip numeric(10) NOT NULL
);


CREATE TABLE Account_info(
account_id char(10) primary key NOT NULL,
cash numeric(10) NOT NULL,
security numeric(10) NOT NULL,
trader_id char(10) FOREIGN KEY (trader_id) REFERENCES trader_info(trader_id),
broker_id char(10) FOREIGN KEY (broker_id) REFERENCES broker_info(broker_id)
);


CREATE TABLE broker_exchange_deals(
id char(10) primary key,
fees_given char(5),
broker_id char(10) FOREIGN KEY (broker_id) REFERENCES broker_info(broker_id),
exchange_id char(10) FOREIGN KEY (exchange_id) REFERENCES exchange(exchange_id)
);

create table stock_info
(
  stock_id char(10) primary key,  
  stock_name VARCHAR(20) NOT NULL,
  shares_no NUMERIC(10) NOT NULL,
  stock_symbol varchar(30) NOT NULL,
  stock_launchDate DATETIME NOT NULL,
  s_price NUMERIC(10) NOT NULL,
  company_id char(10) FOREIGN KEY (company_id) REFERENCES company_info(company_id),
  trade_exchange_id char(10) FOREIGN KEY (trade_exchange_id) REFERENCES exchange(exchange_id)
);


create table transaction_info
(
  order_id char(10) primary key,
  T_Price NUMERIC(10) NOT NULL,
  No_Of_Shares NUMERIC(10) NOT NULL,
  brokeragepaidby_seller NUMERIC(10) NOT NULL,
  brokeragepaidby_buyer NUMERIC(10) NOT NULL,
  id char(10) FOREIGN KEY (id) REFERENCES broker_exchange_deals(id),
  stock_id char(10) FOREIGN KEY (stock_id) REFERENCES Stock_info(stock_id),
  broker_id char(10) FOREIGN KEY (broker_id) REFERENCES broker_info(broker_id),
  exchange_id char(10) FOREIGN KEY (exchange_id) REFERENCES exchange(exchange_id),
  trader_id char(10) FOREIGN KEY (trader_id) REFERENCES trader_info(trader_id)
  
);
ALTER TABLE transaction_info
ADD account_id char(10) FOREIGN KEY (ACCOUNT_ID) REFERENCES Account_info(account_id);

insert into company_info values(1, 'Apple', '1', 'Cupertino', 'California', '95014', '1976-04-01');
insert into company_info values(2, 'Google', '1600', 'Menlo Park', 'California', '94043', '1998-09-04');
insert into company_info values(3, 'Amazon', '410', 'Seattle', 'Washington', '98109', '1994-07-05');

insert into broker_info values(1, 'Johnny', 'Walker', '315-555-5555', '45', 'Tiemann Place', 'Manhattan', 'New York', '10027');
insert into broker_info values(2, 'Paul', 'Smith', '315-545-6655', '7906', '5th Avenue', 'Brooklyn', 'New York', '11209');
insert into broker_info values(3, 'Marc', 'New York', '315-343-5566', '4322', 'Queens Street', 'Long Island City', 'New York', '11101');
insert into broker_info values(4, 'John', 'Hopkins', '315-343-7666', '4322', 'Queens Street', 'Long Island City', 'New York', '11101');


insert into  exchange values(1, 'NYSE');
insert into  exchange values(2, 'NASDAQ');
insert into  exchange values(3, 'CSE');
insert into  exchange values(4, 'ASE');

insert into trader_info values(1, 'Yash', 'Pasar', '987651819', '315-450-1430', '212', 'Westcott Street', 'Syracuse', 'New York', '13210');
insert into trader_info values(2, 'Amit', 'Jadhav', '984321819', '315-395-7948', '141', 'Avondale Place', 'Syracuse', 'New York', '13210');
insert into trader_info values(3, 'Devansh', 'Khakkar', '787673219', '315-378-9014', '716', 'South Beech Street', 'Syracuse', 'New York', '13210');
insert into trader_info values(4, 'Manan', 'Dedhia', '654651819', '315-395-7788', '400', 'Westcott Street', 'Syracuse', 'New York', '13210');

insert into account_info values(1, '1800', '1500', '1', '3');
insert into account_info values(2, '2800', '1000', '1', '2');
insert into account_info values(3, '800', '3500', '2', '1');
insert into account_info values(4, '400', '2500', '2', '2');
insert into account_info values(5, '900', '1500', '2', '3');
insert into account_info values(6, '800', '1500', '3', '1');
insert into account_info values(7, '800', '500', '4', '2');

insert into broker_exchange_deals values(1, '0.15', '1', '1');
insert into broker_exchange_deals values(2, '0.25', '1', '2');
insert into broker_exchange_deals values(3, '0.10', '1', '3');
insert into broker_exchange_deals values(4, '0.15', '2', '1');
insert into broker_exchange_deals values(5, '0.25', '2', '2');
insert into broker_exchange_deals values(6, '0.10', '3', '3');

insert into stock_info values(1,'Apple Inc.', '1300', 'AAPL', '1980-12-12', '203.86', '1', '1' );
insert into stock_info values(2,'Apple Inc.', '1300', 'AAPL', '1980-12-12', '203.86', '1', '2' );
insert into stock_info values(3,'Apple Inc.', '1300', 'AAPL', '1980-12-12', '203.86', '1', '3' );
insert into stock_info values(4,'Alphabet Inc.', '1267', 'GOOGL', '1998-09-04', '1241.47', '2', '1' );
insert into stock_info values(5,'Alphabet Inc.', '1267', 'GOOGL', '1998-09-04', '1241.47', '2', '2' );
insert into stock_info values(6,'Alphabet Inc.', '1267', 'GOOGL', '1998-09-04', '1241.47', '2', '3' );
insert into stock_info values(7,'Amazon.com Inc.', '900', 'AMZN', '1997-11-11', '1861.69', '3', '1' );
insert into stock_info values(8,'Amazon.com Inc.', '900', 'AMZN', '1997-11-11', '1861.69', '3', '2' );
insert into stock_info values(9,'Amazon.com Inc.', '900', 'AMZN', '1997-11-11', '1861.69', '3', '3' );
insert into stock_info values(10,'Amazon.com Inc.', '900', 'AMZN', '1997-11-11', '1861.69', '3', '4' );

insert into transaction_info values(1,20400,100,12,30,1,1,1,1,1,1 );
insert into transaction_info values(2,10200,50,6,15,2,2,2,2,2,4 );
insert into transaction_info values(3,16728,82,42,30,1,3,2,1,3,6 );
insert into transaction_info values(4,16728,82,42,30,1,3,2,1,3,6 );
insert into transaction_info values(5,11120,55,42,30,1,3,2,1,3,6 );
insert into transaction_info values(17,1320,5,42,30,1,3,2,1,3,6 );



SELECT * FROM company_info;
SELECT * FROM broker_info;
SELECT * FROM exchange;
SELECT * FROM trader_info;
SELECT * FROM account_info;
SELECT * FROM broker_exchange_deals;
SELECT * FROM stock_info;
SELECT * FROM transaction_info;

drop trigger S_Quantity
create trigger S_Quantity 
ON transaction_info
AFTER INSERT 
AS
DECLARE @No_Of_Shares AS INT
DECLARE @T_Price AS INT
SET @No_Of_Shares = (SELECT TOP 1 inserted.No_Of_Shares FROM inserted)
SET @T_Price = (SELECT TOP 1 inserted.T_Price FROM inserted)
IF @No_Of_Shares<50 
BEGIN 
 RAISERROR  ('Number of shares should be greater than or equal to 50',15,1);
  ROLLBACK
END
if @T_Price < 10000
BEGIN 
 RAISERROR  ('Total transaction value has to be greater than or equal to 10000',15,1);
  ROLLBACK
END

/* 1. For each public company list the number of exchanges which its stock trades on */
select s.stock_name, count(s.trade_exchange_id) as No_of_exchanges
from stock_info s
group by s.stock_name
ORDER BY No_of_exchanges;

/* 2. List all Exchanges who have stock from the public company established before “Jan01,1982” */
select e.exchange_name
from exchange e 
inner join stock_info s on s.trade_exchange_id = e.exchange_id
inner join company_info c on c.company_id = s.company_id
where c.established_date < '1982-01-01';

/* 3. Find each Trader who has exactly one account */
select a.trader_id
from account_info a
group by a.trader_id
having count(a.account_id) = 1;

/* 4. Find all Brokerages who do not have any accounts */
select b.broker_fname,b.broker_lname, b.broker_id 
from broker_info b
left join account_info as a
on b.broker_id = a.broker_id 
where b.broker_id 
not in (select distinct(broker_id) from account_info);

/* 5. List all stocks belonging to each Exchange */
Select stock_name, exchange_name 
from stock_info as s 
join exchange as e on s.trade_exchange_id = e.exchange_id 
order by s.stock_name