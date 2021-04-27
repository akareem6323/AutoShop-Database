Drop database if exists CompanyDatabase;
GO
Create database CompanyDatabase
GO

Use CompanyDatabase
GO

Create Table Login (
    loginid INT NOT NULL IDENTITY(1,1),
    username varchar(15),
    password varchar(12),
    Primary Key (loginid)
);


Create Table Employee(
    employeeid INT NOT NULL IDENTITY(1000,1),
	firstname varchar(30),
	lastname varchar(30),
	email varchar(30),
	phonenumber varchar(30),
	office varchar(30),
	primary key (employeeid)

);

Create Table CustomerLogin(
    customerloginid INT NOT NULL IDENTITY(1,1),
	customerfname varchar(15),
	customerlname varchar(15),
	customeremail varchar(30),
	customerusername nvarchar(20),
	customerpassword nvarchar(15),
	primary key (customerloginid)

);
Create Table ServiceOrder(
    serviceID INT NOT NULL IDENTITY(1,1),
	serviceType varchar(12),
	nameInfo varchar(30),
	emailInfo varchar(30),
	phoneInfo varchar(10),
	cardtype varchar(10),
	cardnumber varchar(16),
	expiration varchar(5),
	cvv int,
	date date
	primary key (serviceID)

);
GO

CREATE PROCEDURE showCustomerPayments
AS
Select serviceID, nameInfo, cardtype, cardnumber, expiration,cvv 
from ServiceOrder;
Go

CREATE PROCEDURE showCustomerDetails
AS
Select serviceID, nameInfo, emailInfo, phoneInfo 
from ServiceOrder;
GO

CREATE PROCEDURE showCustomerOrders
AS
Select serviceID, serviceType, nameInfo, date 
from ServiceOrder;
GO

Exec showCustomerDetails

Exec showCustomerOrders

Exec showCustomerPayments


CREATE ROLE [Admin]
CREATE ROLE [Employees]
CREATE ROLE [Customer]
GO

GRANT ALL ON [ServiceOrder] to [Admin]
GRANT SELECT, INSERT, REFERENCES ON [ServiceOrder] to [Employees]
GRANT SELECT ON [ServiceOrder] to [Customer]
go

CREATE USER [mike] WITHOUT LOGIN
ALTER ROLE [Admin] ADD MEMBER [mike]
SET IDENTITY_INSERT [dbo].[Login] ON
GO
INSERT INTO [dbo].[Login] ([loginid], [username], [password])
VALUES ( 1001, 'mike', '12345')
GO

CREATE USER [john] WITHOUT LOGIN
ALTER ROLE [Employees] ADD MEMBER [john]
SET IDENTITY_INSERT [dbo].[Login] ON
GO
INSERT INTO [dbo].[Login] ([loginid], [username], [password])
VALUES ( 1002, 'john', '12345')
GO

CREATE USER [andy] WITHOUT LOGIN
ALTER ROLE [Customer] ADD MEMBER [andy]
SET IDENTITY_INSERT [dbo].[Login] ON
go
INSERT INTO [dbo].[Login] ([loginid], [username], [password])
VALUES ( 9001, 'andy', '54321')
