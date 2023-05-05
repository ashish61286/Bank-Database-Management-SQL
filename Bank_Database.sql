create DATABASE Bank;
USE Bank;

CREATE TABLE Branch (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(120) NOT NULL,
  `BCode` VARCHAR(15) NOT NULL,
  `Address` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`Id`)
);

CREATE TABLE Employee(
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) NOT NULL,
  `Branch_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`Branch_Id`) REFERENCES `Branch`(`Id`)
);

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
  `Branch_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`Branch_Id`) REFERENCES `Branch`(`Id`)
);

CREATE TABLE Transaction (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Date` Date NOT NULL,
  `Account_Id` INT NOT NULL,
  `Transaction_Type` Varchar(15) NOT NULL,
  `Amount` double NOT NULL,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`Account_Id`) REFERENCES `Account`(`Id`)
);

CREATE TABLE Service (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Date` Date NOT NULL,
  `Account_Id` INT NOT NULL,
  `ServiceName` Varchar(100) NOT NULL,
  `Description` Varchar(200) NOT NULL,
  `Amount` double NOT NULL,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`Account_Id`) REFERENCES `Account`(`Id`)
);

-- Insert data into the Branch table
INSERT INTO Branch (Name, BCode, Address)
VALUES ('Main Branch', 'B001', '123 Main St'),
       ('Downtown Branch', 'B002', '456 Elm St');

-- Insert data into the Employee table
INSERT INTO Employee (Name, Branch_Id)
VALUES ('John Doe', 1),
       ('Jane Smith', 2);

-- Insert data into the Account table
INSERT INTO Account (Account_Number, Account_Type, BCode, Name, Gender, DOB, Address, Aadhar, Balance, Branch_Id)
VALUES ('1234567890', 'Savings', 'B001', 'John Doe', 'Male', '1990-01-01', '123 Main St', '123456789012', 1000.00, 1),
       ('0987654321', 'Checking', 'B002', 'Jane Smith', 'Female', '1995-01-01', '456 Elm St', '987654321098', 500.00, 2);

-- Insert data into the Transaction table
INSERT INTO Transaction (Date, Account_Id, Transaction_Type, Amount)
VALUES ('2023-05-06', 1, 'Deposit', 1000.00),
       ('2023-05-06', 2, 'Withdrawal', 500.00);

-- Insert data into the Service table
INSERT INTO Service (Date, Account_Id, ServiceName, Description, Amount)
VALUES ('2023-05-06', 1, 'Deposit', 'Cash deposit', 1000.00),
       ('2023-05-06', 2, 'Withdrawal', 'ATM withdrawal', 500.00);

ALTER TABLE Branch 
ADD PRIMARY KEY (`Id`);
ALTER TABLE Employee 
ADD PRIMARY KEY (`Id`);
ALTER TABLE Account 
ADD PRIMARY KEY (`Id`);
ALTER TABLE Transaction 
ADD PRIMARY KEY (`Id`);

ALTER TABLE Service 
ADD FOREIGN KEY (`Transaction_Id`) REFERENCES `Transaction`(`Id`);

ALTER TABLE Account 
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE Branch 
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
ALTER TABLE Employee 
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
ALTER TABLE Transaction 
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

