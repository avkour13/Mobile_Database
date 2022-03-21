create database SellingMobiles
use SellingMobiles
go

-- Mobile Device table --
CREATE TABLE MobileDevice(
IMEI_Code Numeric(15) Primary Key NOT NULL,
Cust_ID Numeric(20) CONSTRAINT FK_MB FOREIGN KEY (Cust_ID)
REFERENCES Customer (Cust_ID), 
Year_Of_Manufacture DATE)


-- Mobile Specifications table --
CREATE TABLE MobileSpecification(
IMEI_Code Numeric(15) Primary Key NOT NULL,
Processor_id Numeric(6), 
Mobile_Brand VARCHAR(10),
Model VARCHAR(6),
Color VARCHAR(8), 
RAM VARCHAR(6) DEFAULT '4gb', 
MemoryInGB Numeric(4))


-- Supplier Table --
CREATE TABLE Supplier(
Supplier_ID Numeric(10) Primary Key NOT NULL, 
Supplier_Name VARCHAR (20), 
Contact VARCHAR (20), 
Mobile_Brand VARCHAR (20))

-- Supplier Address table --
CREATE TABLE SupplierAddress(
Postal_Code Numeric(6) Primary Key NOT NULL,
City VARCHAR(15), 
Country VARCHAR(15))

-- Supplier ZIP table --
CREATE TABLE SupplierZip(
Supplier_ID Numeric(10) Primary Key NOT NULL , 
Postal_Code Numeric(6))

-- Customer table --
CREATE TABLE Customer(
Cust_ID Numeric(20)Primary Key NOT NULL IDENTITY(1000,1), 
First_Name VARCHAR (10), 
Last_Name VARCHAR (10), 
Mobile_Number Numeric(12),
ZIP VARCHAR (6)
CONSTRAINT CK_Zip CHECK (ZIP LIKE REPLICATE ('[0-9]', 6)))


-- Address Table --
CREATE TABLE Address(
ZIP VARCHAR (6) Primary Key NOT NULL, 
City VARCHAR (15), 
Country VARCHAR (15))

-- Purchase Table --
CREATE TABLE Purchase(
Purchase_id Numeric(10) Primary Key NOT NULL, 
Mobile_Purchased VARCHAR (15), 
Purchase_Date DATE)

-- Network Carrier Table --
CREATE TABLE NetworkCarrier(
Network_ID VARCHAR (10)Primary Key NOT NULL, 
Network_Provider VARCHAR (15),
IP_Address VARCHAR (20) UNIQUE,
Network_Band VARCHAR (12))


-- Customer Network Table --
CREATE TABLE CustomerNetwork(
Network_ID VARCHAR (10) Primary Key NOT NULL, 
Cust_ID Numeric(20)
CONSTRAINT FK FOREIGN KEY (Cust_ID)
REFERENCES Customer (Cust_ID))

-- Price Table --
CREATE TABLE Price(
Model VARCHAR(6) Primary Key NOT NULL,
Mobile_Brand VARCHAR(10),
Price Numeric(6))




---------------------------------------------------------------------------------

-- Sequence for Supplier ID --
CREATE SEQUENCE SupplierID_Sequence
 AS INT
 START WITH 2000
 INCREMENT BY 1

 CREATE SEQUENCE SupplierID_Sequence1
 AS INT
 START WITH 2000
 INCREMENT BY 1

----------------------------------------------------------------------------------
drop table Address
drop table Customer
drop table CustomerNetwork
drop table MobileDevice
drop table MobileSpecification
drop table NetworkCarrier
drop table Purchase
drop table Supplier
drop table SupplierAddress
drop table SupplierZip
-----------------------------------------------------------------------------------------
-- Inserting data into Mobile Device table --

select * from MobileDevice
order by Cust_ID


Insert into MobileDevice values(5847426545,1003,'2017-11-18')
Insert into MobileDevice values(5847426596,1006,'2019-05-02')
Insert into MobileDevice values(5847426521,1009,'2017-12-02')
Insert into MobileDevice values(5847426526,1011,'2017-07-05')
Insert into MobileDevice values(5847426535,1002,'2021-02-05')
Insert into MobileDevice values(5847428744,1004,'2014-05-31')
Insert into MobileDevice values(5849655847,1005,'2018-05-25')
Insert into MobileDevice values(5984426584,1008,'2017-08-19')
Insert into MobileDevice values(5885475584,1010,'2017-07-26')
Insert into MobileDevice values(5885477465,1007,'2019-07-31')
-------------------------------------------------------------------------------------
-- Inserting Data into Mobile Sepcification table --

select * from MobileSpecification

Insert into MobileSpecification(IMEI_Code,Processor_id, Mobile_Brand,Model, Color, MemoryInGB) 
values(5847426584,798451,'Oneplus','9 pro','White',64)
Insert into MobileSpecification values(5847426545,854741,'Apple','11','black','6gb',64)
Insert into MobileSpecification values(5847426596,987462,'Samsung','S5','blue','8gb',16)
Insert into MobileSpecification values(5847426521,965412,'LG','G3','rosegold','8gb',32)
Insert into MobileSpecification values(5847426526,621455,'Vivo','Y51','silver','3gb',32)
Insert into MobileSpecification values(5848547435,965479,'Oppo','Reno','red','6gb',128)
Insert into MobileSpecification values(5847454144,963146,'Poco','P5','yellow','8gb',64)
Insert into MobileSpecification values(5849654847,845288,'Xiomi','Note','green','8gb',128)
Insert into MobileSpecification values(5989654784,844518,'Blackberry','B59','black','4gb',64)
Insert into MobileSpecification values(5889654584,849654,'Asus','Rog 3','grey','12gb',256)


-----------------------------------------------------------------------------------------------
-- Inserting Data into Supplier table --

select * from Supplier

Insert into Supplier values(NEXT VALUE FOR SupplierID_Sequence, 'TokyoSupliers','89741212','OnePlus')
Insert into Supplier values(NEXT VALUE FOR SupplierID_Sequence, 'CloudTail','89748547','Huawei')
Insert into Supplier values(NEXT VALUE FOR SupplierID_Sequence, 'MarinaShipers','96547154','Apple')
Insert into Supplier values(NEXT VALUE FOR SupplierID_Sequence, 'LotMobiles','89741212','Samsung')
Insert into Supplier values(NEXT VALUE FOR SupplierID_Sequence, 'NationalMobiles','96547156','Vivo')
Insert into Supplier values(NEXT VALUE FOR SupplierID_Sequence, 'SangeethaMobiles','96541478','Oppo')
Insert into Supplier values(NEXT VALUE FOR SupplierID_Sequence, 'Universal','96521478','Poco')
Insert into Supplier values(NEXT VALUE FOR SupplierID_Sequence, 'PoorvikaMobiles','78501456','Xiomi')
Insert into Supplier values(NEXT VALUE FOR SupplierID_Sequence, 'FedEx','96541452','Blackberry')
Insert into Supplier values(NEXT VALUE FOR SupplierID_Sequence, 'HongkongShipping','32165498','Asus')

--------------------------------------------------------------------------------------------------------
-- Inserting Data into Supplier Address --

select * from SupplierAddress

Insert into SupplierAddress values(563130,'Bangalore','India')
Insert into SupplierAddress values(487651,'Mumbai','India')
Insert into SupplierAddress values(965471,'Chennai','India')
Insert into SupplierAddress values(324589,'Delhi','India')
Insert into SupplierAddress values(964514,'Hyderabad','India')
Insert into SupplierAddress values(001248,'Dhaka','Bangladesh')
Insert into SupplierAddress values(965441,'Panjim','India')
Insert into SupplierAddress values(365414,'Colombo','Srilanka')
Insert into SupplierAddress values(965412,'Mysore','India')
Insert into SupplierAddress values(545112,'Dubai','UAE')
----------------------------------------------------------------------------------------------------------
-- Inserting Data into Supplier Zip table --

select * from SupplierZip

Insert into SupplierZip values(NEXT VALUE FOR SupplierID_Sequence1,563130)
Insert into SupplierZip values(NEXT VALUE FOR SupplierID_Sequence1,852014)
Insert into SupplierZip values(NEXT VALUE FOR SupplierID_Sequence1,654125)
Insert into SupplierZip values(NEXT VALUE FOR SupplierID_Sequence1,632547)
Insert into SupplierZip values(NEXT VALUE FOR SupplierID_Sequence1,963214)
Insert into SupplierZip values(NEXT VALUE FOR SupplierID_Sequence1,325489)
Insert into SupplierZip values(NEXT VALUE FOR SupplierID_Sequence1,998745)
Insert into SupplierZip values(NEXT VALUE FOR SupplierID_Sequence1,666555)
Insert into SupplierZip values(NEXT VALUE FOR SupplierID_Sequence1,222544)
Insert into SupplierZip values(NEXT VALUE FOR SupplierID_Sequence1,321456)
--------------------------------------------------------------------------------------------------------
-- Inserting Data into Customer Table --

select * from Customer

Insert into Customer( First_Name,Last_Name, Mobile_Number, ZIP) values('James','Ryan','6541185471','963214')
Insert into Customer( First_Name,Last_Name, Mobile_Number, ZIP) values('Steve','King','6521485518','563214')
Insert into Customer( First_Name,Last_Name, Mobile_Number, ZIP) values('David','Austin','9632145789','632145')
Insert into Customer( First_Name,Last_Name, Mobile_Number, ZIP) values('Alex','Hunold','9632145478','632546')
Insert into Customer( First_Name,Last_Name, Mobile_Number, ZIP) values('Broos','Ernst','2589631478','023145')
Insert into Customer( First_Name,Last_Name, Mobile_Number, ZIP) values('Caran','Chen','96325647891','632245')
Insert into Customer( First_Name,Last_Name, Mobile_Number, ZIP) values('Luis','James','6316578941','321459')
Insert into Customer( First_Name,Last_Name, Mobile_Number, ZIP) values('Hezel','Ruth','3215047952','256314')
Insert into Customer( First_Name,Last_Name, Mobile_Number, ZIP) values('Stephen','Clara','3201250547','965489')
Insert into Customer( First_Name,Last_Name, Mobile_Number, ZIP) values('Donald','Patrick','6321454780','231456')
------------------------------------------------------------------------------------------------------------------
-- Inserting Data into Customer Address --

Select * from Address

Insert into Address values(545112,'Dubai','UAE')
Insert into Address values(963465,'Newyork','USA')
Insert into Address values(456123,'Durban','SouthAfrica')
Insert into Address values(963254,'Melbourne','Australia')
Insert into Address values(963252,'Toronto','Canada')
Insert into Address values(321469,'Seoul','NorthKorea')
Insert into Address values(852456,'Amsterdam','Netherland')
Insert into Address values(963546,'London','UnitedKingdom')
Insert into Address values(964452,'France','Paris')
Insert into Address values(789642,'Rome','Italy')
--------------------------------------------------------------------------------------------------------------
-- Inserting Data into Purchase Table --

select * from Purchase

Insert into Purchase values(8895,'OnePlus','2021-02-25')
Insert into Purchase values(5246,'Nokia','2021-12-06')
Insert into Purchase values(9654,'Samsung','2020-11-14')
Insert into Purchase values(2314,'Apple','2020-05-14')
Insert into Purchase values(6324,'Huawei','2019-10-31')
Insert into Purchase values(2365,'Vivo','2021-05-25')
Insert into Purchase values(9655,'LG','2021-03-12')
Insert into Purchase values(3021,'Oppo','2021-01-01')
Insert into Purchase values(6589,'Poco','2021-01-25')
Insert into Purchase values(3214,'Realme','2021-02-28')
--------------------------------------------------------------------------------------------------------
-- Inserting Data into Network Carrier Table --

select * from NetworkCarrier

Insert into NetworkCarrier values(147,'Airtel','192.168.1.1','4G')
Insert into NetworkCarrier values(547,'Vodafone','192.168.1.2','5G')
Insert into NetworkCarrier values(324,'Idea','192.168.1.3','3G')
Insert into NetworkCarrier values(698,'Jio','192.168.1.4','4G')
Insert into NetworkCarrier values(852,'Airtel','192.168.1.5','4G')
Insert into NetworkCarrier values(258,'Jio','192.168.1.6','2G')
Insert into NetworkCarrier values(369,'Rogers','192.168.1.7','5G')
Insert into NetworkCarrier values(484,'ATNT','192.168.1.8','4G')
Insert into NetworkCarrier values(254,'Act','192.168.1.9','6G')
Insert into NetworkCarrier values(658,'Verizon','192.168.1.10','5G')
--------------------------------------------------------------------------------------------------------

-- Inserting Data into Customer Network Table --

select * from CustomerNetwork
order by Cust_ID

Insert into CustomerNetwork values(147,1009)
Insert into CustomerNetwork values(547,1000)
Insert into CustomerNetwork values(324,1003)
Insert into CustomerNetwork values(698,1005)
Insert into CustomerNetwork values(852,1007)
Insert into CustomerNetwork values(258,1008)
Insert into CustomerNetwork values(369,1006)
Insert into CustomerNetwork values(484,1002)
Insert into CustomerNetwork values(254,1004)
Insert into CustomerNetwork values(658,1001)

-- Inserting Data Price Table --

select * from Price

Insert into Price values('5s','Samsung',800)
Insert into Price values('Rog3','Asus',600)
Insert into Price values('3T','OnePlus',550)
Insert into Price values('M31','Samsung',780)
Insert into Price values('P3','Huawei',400)
Insert into Price values('Note9','Xiomi',480)
Insert into Price values('X3','Realme',300)
Insert into Price values('Y51','Vivo',500)
Insert into Price values('Reno5','Oppo',560)
Insert into Price values('P5','Poco',450)



---------------------------------------------------------------------------------------------------------

-- Not Null Constraint --
Insert into MobileDevice (Cust_ID,Year_Of_Manufacture) values(84522,'2017-11-18')

-- Default Constraint --
Insert into MobileSpecification(IMEI_Code,Processor_id, Mobile_Brand,Model, Color, Memory) values(5847426584,798451,'Oneplus','9 pro','White','64gb')
select * from MosbileSpecification

-- Primary Key Contraint --
Insert into SupplierAddress values(563130,'Bangalore','India')

-- Check Constraint --
Insert into Customer( First_Name,Last_Name, Mobile_Number, ZIP) values('James','Ryan','6541185471',9632174)

-- Foreign Key Contraint --
Insert into CustomerNetwork values(888,1000)
-------------------------------------------------------------------------------------------------------------------

-- Views and Indexes --
-- 1) View on only one table --

CREATE VIEW vMobileDevice
AS
SELECT * FROM MobileDevice


select * from vMobileDevice
group by IMEI_Code


-- 2) Complex View on one or more tables --

CREATE VIEW vMobile_Device_Specification
AS SELECT md.IMEI_Code, ms.Mobile_Brand, ms.Color,ms.RAM
FROM MobileDevice md, MobileSpecification ms
WHERE md.IMEI_Code=ms.IMEI_Code
       
select * from vMobile_Device_Specification

-- 3) Create two indexes for two different tables -- 

CREATE INDEX idx_cname
ON Customer (First_Name,Last_Name);

CREATE INDEX idx_MobileSpec
ON MobileSpecification (Mobile_Brand,RAM);

-- 4) Modify one of your views by adding one more column -- 

ALTER VIEW vMobileDevice
AS
SELECT IMEI_Code,Year_Of_Manufacture FROM MobileDevice

select * from vMobileDevice
 
 -- 5) Drop one of your indexes -- 
 drop index idx_MobileSpec
 on MobileSpecification





