Create database bank;
use bank;

CREATE TABLE Branch (
`Id` INT NOT NULL AUTO_INCREMENT,
`Name` VARCHAR(120) NOT NULL,
`BCode` VARCHAR(15) NOT NULL,
`Address` VARCHAR(200) NOT NULL,
PRIMARY KEY (`Id`));

CREATE TABLE Employee(
`Id` INT NOT NULL AUTO_INCREMENT,
`Name` VARCHAR(50) NOT NULL,
`Branch` VARCHAR(50) NOT NULL,
 PRIMARY KEY (`Id`)) ;


CREATE TABLE Account (
`Id` INT NOT NULL AUTO_INCREMENT,
`Account_Number` VARCHAR(15) NOT NULL,
`Account_Type` VARCHAR(15) NOT NULL,
`BCode` VARCHAR(15) NOT NULL,
`Name` VARCHAR(50) NOT NULL,
`Gender` VARCHAR(10) NOT NULL,
`DOB` Date,
`Address` VARCHAR(50) NOT NULL,
`Aadhar` VARCHAR(12) NOT NULL,
`Balance` double NOT NULL,
PRIMARY KEY (`Id`)) ;


CREATE TABLE Transaction ( 
`Id` INT NOT NULL AUTO_INCREMENT,
`Date` Date NOT NULL,
`Account_Num` Varchar(15),
`Transaction_Type` Varchar(15),   
`Amount` double,
 PRIMARY KEY (`Id`)) ;
 

CREATE TABLE Service ( 
`Date` Date NOT NULL,
`Account_Num` Varchar(15),
`ServiceName` Varchar(100), 
`Description` Varchar(200), 
`Amount` double,
`TransactionId` INT NOT NULL,
INDEX par_ind (TransactionId),
CONSTRAINT fk_tranTable FOREIGN KEY (TransactionId)
REFERENCES TransactionTable (Id)
		ON DELETE CASCADE
  		ON UPDATE CASCADE
) ENGINE=INNODB;

-- Insert data into BranchTable
INSERT INTO Branch (Name, BCode, Address)
VALUES 
('Branch 1', 'BC001', 'Vijay Nagar'),
('Branch 2', 'BC002', 'Sector 42'),
('Branch 3', 'BC003', 'Sport Market');

-- Insert data into EmployeeTable
INSERT INTO Employee (Name, Branch)
VALUES ('Ashish Kumar', 'Ghaziabad'),
       ('shivam Kumar', 'Gurgaon'),
       ('Akansha Sharma', 'Meerut');

-- Insert data into AccountTable
INSERT INTO Account (Account_Number, Account_Type, BCode, 
Name, Gender, DOB, Address, Aadhar, Balance)
VALUES ('123456789012', 'Savings', 'B001', 
'Ashish Kumar', 'Male', '1990-01-01', '123 Main St, Ghaziabad', '123456789012', 1000.00),
       ('234567890123', 'Checking', 'B002', 
       'shivam Kumar', 'Male', '1995-05-05', 'sector 42, Gurgaon', '234567890123', 5000.00),
       ('345678901234', 'Savings', 'B003',
       'Akansha Sharma', 'Female', '1985-12-31', 'sport market, Meerut', '345678901234', 2500.00);
       
-- Insert data into TransactionTable
INSERT INTO Transaction (Date, Account_Num, Transaction_Type, Amount)
VALUES ('2023-05-01', '123456789012', 'Deposit', 1000.00),
       ('2023-05-02', '234567890123', 'Withdrawal', 500.00),
       ('2023-05-03', '345678901234', 'Deposit', 250.00);

-- Insert data into ServiceTable
INSERT INTO Service (Date, Account_Num, ServiceName, Description, Amount, TransactionId)
VALUES ('2023-05-01', '123456789012', 'Service 1', 'Description 1', 50.00, 1),
       ('2023-05-02', '234567890123', 'Service 2', 'Description 2', 75.00, 2),
       ('2023-05-03', '345678901234', 'Service 3', 'Description 3', 100.00, 3);
       
show tables;
select * from branch;
