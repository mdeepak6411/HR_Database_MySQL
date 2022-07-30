DROP DATABASE IF EXISTS HR_Database;
CREATE DATABASE HR_Database;
SHOW DATABASES;

USE HR_Database;

SELECT DATABASE();   

CREATE TABLE Employees (
	Emp_ID INT(4) not null auto_increment ,
    Dept_ID CHAR(5) NOT NULL,
	FName VARCHAR(30) NOT NULL,
	LName VARCHAR(30) NOT NULL,
    Gender VARCHAR(20),
	Hire_Date DATE NOT NULL,
	Salary VARCHAR(7) NOT NULL,
	primary key (Emp_ID)
);



CREATE TABLE ContactDetails (
Emp_ID INT(4) NOT NULL,
Phone CHAR(10) NOT NULL UNIQUE,
Email VARCHAR(30) NOT NULL UNIQUE CHECK (Email LIKE '%_@__%.com'),   -- check (email like '%_@__%.__%')
PRIMARY KEY (Emp_ID),
FOREIGN KEY (Emp_ID) REFERENCES Employees(Emp_ID)
);

CREATE TABLE Departments (
Dept_ID CHAR(5) NOT NULL,
Emp_ID INT(4) NOT NULL,
Dept_Name VARCHAR(30) DEFAULT 'IT',
FOREIGN KEY (Emp_ID) REFERENCES Employees(Emp_ID)
);

CREATE TABLE Locations (
    Emp_ID INT(4) NOT NULL,
    City VARCHAR(30) NOT NULL,
    State VARCHAR(30) NOT NULL,
    Postal_Code CHAR(6) NOT NULL,
    country VARCHAR(30) DEFAULT 'INDIA',
    PRIMARY KEY (Emp_ID),
    FOREIGN KEY (Emp_ID) REFERENCES Employees (Emp_ID)
);


-- Inserting values in tables


INSERT INTO Employees
VALUES
(0001, 'IT08', 'Dipesh', 'Shah', 'Male', '2022-01-01', 500000),
(0002, 'IT08', 'Ajay', 'Singh', 'Male', '2020-07-01', 550000),
(0003, 'IT08', 'Bhavesh', 'Rajpurohit', 'Male', '2021-01-01', 600000),
(0004, 'IT08', 'abhhishek', 'Verma', 'Male', '2020-12-01', 500000),
(0005, 'IT08', 'Deepali', 'More', 'Female', '2019-06-01', 500000),
(0006, 'IT08', 'Satyjeet', 'Lokhande', 'Male', '2022-01-01', 400000),
(0007, 'IT08', 'Tushar', 'Kamble', 'Male', '2022-01-01', 800000),
(0008, 'hr08', 'Sanmukha', 'Mali', 'Female', '2019-01-01', 100000),
(0009, 'IT08', 'Harsha', 'shinde', 'Female', '2019-11-01', 500000),
(0010, 'IT08', 'rahul', 'rajhbhar', 'Male', '2017-01-01', 580000),
(0011, 'IT08', 'Ranjit', 'Yadav', 'Male', '2017-09-01', 500000),
(0012, 'IT08', 'Vishal', 'Upadhyay', 'Male', '2018-01-01', 850000),
(0013, 'IT08', 'Daljeet', 'Pandey', 'Male', '2019-06-01', 650000),
(0014, 'IT08', 'Prashant', 'Singh', 'Male', '2020-02-01', 550000),
(0015, 'hr08', 'rakul', 'Surya', 'Female', '2022-08-01', 150000),
(0016, 'IT08', 'Dev', 'Shukla', 'Male', '2020-01-01', 500000),
(0017, 'IT08', 'Salman', 'khan', 'Male', '2021-01-01', 580000),
(0018, 'IT08', 'Sanket', 'Mishra', 'Male', '2020-01-01', 600000),
(0019, 'IT08', 'Kamal', 'Bansode', 'Male', '2018-08-01', 400000),
(0020, 'IT08', 'Rupali', 'Jadhav', 'Female', '2022-03-01', 450000),
(0021, 'IT08', 'akash', 'mhatre', 'Male', '2021-12-01', 520000),
(0022, 'IT08', 'Rupesh', 'shukla', 'Male', '2022-11-01', 300000);



INSERT INTO contactdetails
VALUES
(0001, 9886383738, 'dipesh@gmail.com'),
(0002, 9640083731, 's_ajay@gmail.com'),
(0003, 9887573676, 'bhavesh@gmail.com'),
(0004, 9886380043, 'abhishek@gmail.com'),
(0005, 9887876899, 'dipali@gmail.com'),
(0006, 9786383872, 'satyajeet@gmail.com'),
(0007, 9934567887, 'tushar@gmail.com'),
(0008, 9886388346, 'sanmukha@gmail.com'),
(0009, 7789353670, 'harsha@gmail.com'),
(0010, 9886987654, 'rahul@gmail.com'),
(0011, 9678998765, 'ranjit@gmail.com'),
(0012, 8653825384, 'vishal@gmail.com'),
(0013, 7384648353, 'daljeet@gmail.com'),
(0014, 9273983223, 'prashant@gmail.com'),
(0015, 7634936373, 'rakul@gmail.com'),
(0016, 8253456838, 'dev@gmail.com'),
(0017, 9876546783, 'salman@gmail.com'),
(0018, 7745647356, 'sanket@gmail.com'),
(0019, 8645678393, 'kamal@gmail.com'),
(0020, 9953876547, 'rupali@gmail.com');

INSERT INTO departments (Emp_ID, Dept_ID)
SELECT Emp_ID, Dept_ID FROM Employees;

INSERT INTO locations (Emp_ID, City, State, Postal_Code)
VALUES
(1, 'mumbai','maharashtra', '400001'),
(2, 'noida','uttar pradesh', '400002'),
(3, 'mumbai','maharashtra', '400075'),
(4, 'bangalore','karnataka', '400056'),
(5, 'bangalore','karnataka', '400065'),
(6, 'mumbai','maharashtra', '400058'),
(7, 'noida','uttar pradesh', '400079'),
(8, 'mumbai','maharashtra', '400067'),
(9, 'pune','maharashtra', '400004'),
(10, 'mumbai','maharashtra', '400076'),
(11, 'noida','uttar pradesh', '400035'),
(12, 'pune','maharashtra', '400079'),
(13, 'bangalore','karnataka', '400079'),
(14, 'mumbai','maharashtra', '400059'),
(15, 'noida','uttar pradesh', '400024'),
(16, 'pune','maharashtra', '400086'),
(17, 'mumbai','maharashtra', '400004'),
(18, 'noida','uttar pradesh', '400006'),
(19, 'mumbai','maharashtra', '400006'),
(20, 'pune','maharashtra', '400086');


