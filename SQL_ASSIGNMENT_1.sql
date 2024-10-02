DROP TABLE CITIES, CUSTOMERS;

CREATE TABLE CITIES (
    CITY_ID varchar(50) NOT NULL,
    CITY varchar(50) NOT NULL,
    POPULATION int,
    INCOME decimal(10,2),
    PRIMARY KEY (CITY_ID),
    INDEX idx_city (CITY)  -- Add this line to create an index on CITY column
);

insert into CITIES
values
('US', 'New York City', 8400000, 127100),
('FR', 'Paris', 2200000, 54100),
('ES', 'Barcelona', 1600000, 27000),
('IT', 'Rome', 2800000, 35005),
('AU', 'Sydney', 5400000, 80000);

CREATE TABLE CUSTOMERS (
    CUST_ID varchar(10),
    FIRST_NAME varchar(50) NOT NULL,
    LAST_NAME varchar(50) NOT NULL,
    BIRTH_DATE date,
    GENDER enum('Male', 'Female') NOT NULL,
    CITY varchar(50) NOT NULL,
    
    PRIMARY KEY (CUST_ID),
    FOREIGN KEY (CITY) REFERENCES CITIES(CITY)
);

INSERT INTO CUSTOMERS
VALUES
('CUST_01', 'Sven', 'Anders', '2000-08-16', 'Male', 'New York City'),
('CUST_02', 'Antonio', 'Moreno', '1960-02-25', 'Male', 'Barcelona'),
('CUST_03', 'Thomas', 'Hardy', '1960-02-25', 'Male', 'Paris'),
('CUST_04', 'Mary', 'Carnes', '1994-02-25', 'Female', 'Sydney'),
('CUST_05', 'Rosmary', 'Lincoln', '1988-02-25', 'Female', 'Rome'),
('CUST_06', 'Bob', 'Ashworth', '1969-02-25', 'Male', 'Rome'),
('CUST_07', 'Kathy', 'Simpson', '1962-02-25', 'Female', 'New York City'),
('CUST_08', 'Stuart', 'Chang', '1999-02-25', 'Male', 'Barcelona'),
('CUST_09', 'Helen', 'Devon', '1956-02-25', 'Female', 'Paris'),
('CUST_10', 'John', 'Afonso', '1974-02-25', 'Female', 'Sydney'),
('CUST_11', 'Paul', 'Cruz', '1975-02-25', 'Male', 'Sydney'),
('CUST_12', 'Laurie', 'Franken', '1982-02-25', 'Female', 'Rome'),
('CUST_13', 'Kate', 'Larsson', '1983-02-25', 'Female', 'New York City'),
('CUST_14', 'Karen', 'Rodriguez', '1991-02-25', 'Female', 'Barcelona'),
('CUST_15', 'Peter', 'Steel', '2001-02-25', 'Male', 'Barcelona'),
('CUST_16', 'Mario', 'Porto', '1974-03-30', 'Male', 'Rome'),
('CUST_17', 'Luigi', 'Keil', '1962-12-18', 'Male', 'Rome'),
('CUST_18', 'Kathy', 'Baley', '1964-02-20', 'Female', 'Paris');


CREATE TABLE PLANS ( 
		PLAN_ID varchar(10),
        PLAN_NAME varchar(50) NOT NULL,
        FREE_MIN int,
        FREE_SMS int,
        FREE_MBS int,
        
        primary key(PLAN_ID)
);

insert into PLANS 
values
('P_01', 'Freedom Basic', 200, 2000, 1600),
('P_02', 'Talk_to_all', 300, 2500, 2000),
('P_03', 'Exclusive', 400, 3000, 2400),
('P_04', 'Freedom Plus', 500, 3500, 2800),
('P_05', 'Unlimited 01', 600, 4000, 3200),
('P_06', 'Freedom Basic', 700, 4500, 3600),
('P_07', 'Exclusive', 800, 5000, 4000),
('P_08', 'Unlimited 02', 900, 5500, 4400),
('P_09', 'Freedom Plus', 1000, 6000, 4800),
('P_10', 'Freedom Basic', 1100, 6500, 5200),
('P_11', 'Talk_to_all', 800, 6500, 5200),
('P_12', 'Unlimited 01', 900, 7000, 5600),
('P_13', 'Talk_to_all', 1000, 7500, 6000),
('P_14', 'Freedom Plus', 1100, 8000, 6400),
('P_15', 'Exclusive', 1200, 8500, 6800),
('P_16', 'Talk_to_all', 800, 7000, 6800),
('P_17', 'Freedom Basic', 1000, 8500, 5200),
('P_18', 'Unlimited 02', 800, 6500, 4800);

 
CREATE TABLE CONTRACTS (
    CONTRACT_ID varchar(10),
    PHONE_NUMBER varchar(15),
    START_DATE date,
    END_DATE date,
    CONTR_DESCRIPTION varchar(255),
    PLAN_ID varchar(10),
    CUST_ID varchar(10),
    
    primary key (CONTRACT_ID),
    foreign key (PLAN_ID) REFERENCES PLANS(PLAN_ID),
    foreign key (CUST_ID) REFERENCES CUSTOMERS(CUST_ID)
);

INSERT INTO CONTRACTS
VALUES
('CON_01', '123-456-7890', '2022-01-15', '2023-01-14', 'Standard Plan', 'P_01','CUST_01'),
('CON_02', '987-654-3210', '2022-03-20', '2023-03-19', 'Premium Plan', 'P_02', 'CUST_02'),
('CON_03', '555-123-4567', '2022-04-10', '2023-04-09', 'Basic Plan', 'P_03', 'CUST_03'),
('CON_04', '111-222-3333', '2022-02-05', '2023-02-04', 'Business Plan', 'P_04', 'CUST_04'),
('CON_05', '444-555-6666', '2022-05-01', '2023-04-30', 'Standard Plan', 'P_05', 'CUST_05'),
('CON_06', '888-777-9999', '2022-06-10', '2023-06-09', 'Premium Plan', 'P_06', 'CUST_06'),
('CON_07', '666-777-8888', '2022-08-15', '2023-08-14', 'Basic Plan', 'P_07', 'CUST_07'),
('CON_08', '333-444-5555', '2022-09-20', '2023-09-19', 'Business Plan', 'P_08', 'CUST_08'),
('CON_09', '777-888-9999', '2022-07-05', '2023-07-04', 'Standard Plan', 'P_09', 'CUST_09'),
('CON_10', '222-333-4444', '2022-10-01', '2023-09-30', 'Premium Plan', 'P_10', 'CUST_10'),
('CON_11', '555-777-9999', '2022-04-01', '2023-03-31', 'Business Plan', 'P_11', 'CUST_11'),
('CON_12', '111-333-5555', '2022-03-15', '2023-03-14', 'Standard Plan', 'P_12', 'CUST_12'),
('CON_13', '333-555-7777', '2022-02-01', '2023-01-31', 'Premium Plan', 'P_13', 'CUST_13'),
('CON_14', '999-777-5555', '2022-01-20', '2023-01-19', 'Basic Plan', 'P_14', 'CUST_14'),
('CON_15', '222-444-6666', '2022-06-10', '2023-06-09', 'Business Plan', 'P_15', 'CUST_15'),
('CON_16', '222-333-5555', '2022-09-20', '2023-03-17', 'Standard Plan', 'P_16', 'CUST_16'),
('CON_17', '333-444-9999', '2022-12-18', '2023-05-21', 'Premium Plan', 'P_17', 'CUST_17'),
('CON_18', '888-222-7890', '2022-01-11', '2023-07-09', 'Business Plan', 'P_18', 'CUST_18');

CREATE TABLE CALLS (
	CALL_ID varchar(10),
    CALL_DAYTIME datetime,
    CALL_PHONENUMBER varchar(15),
    CALL_DURATION int,
    CONTRACT_ID varchar(10),
    
    primary key (CALL_ID),
    foreign key (CONTRACT_ID) references CONTRACTS(CONTRACT_ID)
);

INSERT INTO CALLS
VALUES
('CALL_01', '2020-01-10 08:30:00', '123-456-7890', 180, 'CON_05'),
('CALL_02', '2020-02-20 10:45:00', '987-654-3210', 210, 'CON_04'),
('CALL_03', '2021-01-10 08:30:00', '555-123-4567', 90, 'CON_03'),
('CALL_04', '2021-01-01 10:00:00', '555-666-7777', 100, 'CON_02'),
('CALL_05', '2022-01-05 16:20:00', '444-555-6666', 240, 'CON_01'),
('CALL_06', '2022-02-15 09:15:00', '123-456-7890', 25, 'CON_10'),
('CALL_07', '2023-01-20 09:30:00', '123-456-7890', 20, 'CON_09'),
('CALL_08', '2023-02-01 13:45:00', '333-444-5555', 90, 'CON_08'),
('CALL_09', '2020-03-10 14:30:00', '555-666-7777', 150, 'CON_07'),
('CALL_10', '2020-04-15 16:45:00', '777-888-9999', 180, 'CON_06'),
('CALL_11', '2021-03-05 11:20:00', '222-111-0000', 120, 'CON_17'),
('CALL_12', '2021-04-10 10:30:00', '666-777-8888', 210, 'CON_16'),
('CALL_13', '2022-03-15 14:15:00', '888-999-1111', 190, 'CON_15'),
('CALL_14', '2022-04-20 16:30:00', '111-222-3333', 160, 'CON_14'),
('CALL_15', '2023-03-25 09:45:00', '999-888-7777', 220, 'CON_13'),
('CALL_16', '2023-04-10 11:00:00', '555-444-3333', 130, 'CON_12'),
('CALL_17', '2023-05-08 11:59:00', '111-222-3333', 123, 'CON_01'),
('CALL_18', '2022-11-01 13:45:00', '555-123-4567', 90, 'CON_02'),
('CALL_19', '2022-12-15 10:00:00', '111-222-3333', 120, 'CON_03'),
('CALL_20', '2021-02-01 11:00:00', '444-555-6666', 120, 'CON_04'),
('CALL_21', '2022-06-08 09:00:00', '123-456-7890', 15, 'CON_05'),
('CALL_22', '2023-04-01 12:15:00', '333-444-5555', 90, 'CON_06'),
('CALL_23', '2022-09-01 15:30:00', '333-222-1111', 200, 'CON_07'),
('CALL_24', '2023-05-15 09:30:00', '777-888-9999', 120, 'CON_08'),
('CALL_25', '2023-06-01 16:20:00', '222-333-4444', 240, 'CON_09'),
('CALL_26', '2021-07-10 14:00:00', '555-777-9999', 180, 'CON_10'),
('CALL_27', '2022-08-05 11:15:00', '111-333-5555', 210, 'CON_11'),
('CALL_28', '2021-10-01 16:20:00', '444-777-8888', 240, 'CON_12'),
('CALL_29', '2022-10-15 10:00:00', '999-777-5555', 120, 'CON_13'),
('CALL_30', '2022-10-01 17:15:00', '444-777-8888', 210, 'CON_14'),
('CALL_31', '2022-12-10 08:30:00', '123-456-7890', 180, 'CON_15'),
('CALL_32', '2022-06-09 09:20:00', '123-456-7890', 29, 'CON_16'),
('CALL_33', '2023-02-01 12:15:00', '555-123-4567', 90, 'CON_17'),
('CALL_34', '2021-03-15 11:30:00', '111-222-3333', 120, 'CON_03'),
('CALL_35', '2022-06-10 09:00:00', '123-456-7890', 28, 'CON_14'),
('CALL_36', '2022-07-21 08:15:00', '222-222-9999', 170, 'CON_18');


#TASKS
#a.Show the call id of all calls that were made between 8am and 10am on June 2022 having duration < 30

SELECT CALL_ID, CALL_DAYTIME
FROM CALLS
WHERE 
    EXTRACT(YEAR_MONTH FROM CALL_DAYTIME) = 202206
    AND EXTRACT(HOUR_MINUTE FROM CALL_DAYTIME) BETWEEN 800 AND 1000
    AND CALL_DURATION < 30;
    
#b. Show the first and last name of customers that live in a city with population greater than 20000

SELECT FIRST_NAME, LAST_NAME
from CUSTOMERS
WHERE CITY IN (
	SELECT CITY
	FROM CITIES
	WHERE POPULATION > 20000
);

#c. Show the customer id that have a contract in the plan with name LIKE ‘Freedom’ (use nested queries).

SELECT CUST_ID
FROM CONTRACTS
WHERE PLAN_ID IN (
    SELECT PLAN_ID
    FROM PLANS
    WHERE PLAN_NAME LIKE 'Freedom%'
);

#d. For each contract that ends in less than sixty days from today, show the contract id, the phone number, the customer’s id, his/her first name and his/her last name.

select CNTR.CONTRACT_ID, CNTR.PHONE_NUMBER, CNTR.CUST_ID, CST.FIRST_NAME, CST.LAST_NAME
FROM contracts AS CNTR
JOIN customers AS CST ON CNTR.CUST_ID = CST.CUST_ID
WHERE CNTR.END_DATE <= DATE_ADD(current_date(), interval 60 DAY);

#e. For each contract id and each month of 2022, show the average duration of calls

SELECT
    c.CONTRACT_ID,
    DATE_FORMAT(c.CALL_DAYTIME, '%Y-%m') AS Month,
    AVG(c.CALL_DURATION) AS Average_Call_Duration
FROM CALLS AS c
WHERE YEAR(c.CALL_DAYTIME) = 2022
GROUP BY c.CONTRACT_ID, Month
ORDER BY c.CONTRACT_ID, Month;

#f. Show the total duration of calls in 2022 per plan id

SELECT CNTR.PLAN_ID, SUM(C.CALL_DURATION) AS Total_Duration
FROM CALLS AS C
INNER JOIN CONTRACTS AS CNTR ON C.CONTRACT_ID = CNTR.CONTRACT_ID
WHERE YEAR(C.CALL_DAYTIME) = 2022
GROUP BY CNTR.PLAN_ID;

#g. Show the top called number among TP’s customers in 2022

SELECT CALL_PHONENUMBER, COUNT(*) AS CallCount
FROM CALLS
WHERE YEAR(CALL_DAYTIME) = 2022
GROUP BY CALL_PHONENUMBER
ORDER BY CallCount DESC
LIMIT 1;

#h. Show the contract ids and the months where the total duration of the calls was greater than the free minutes offered by the plan of the 
#contract

SELECT
    C.CONTRACT_ID,
    DATE_FORMAT(C.CALL_DAYTIME, '%Y-%m') AS Month
FROM CALLS AS C
INNER JOIN CONTRACTS AS CNTR ON C.CONTRACT_ID = CNTR.CONTRACT_ID
INNER JOIN PLANS AS P ON CNTR.PLAN_ID = P.PLAN_ID
WHERE YEAR(C.CALL_DAYTIME) = 2022
GROUP BY C.CONTRACT_ID, Month, P.FREE_MIN
HAVING SUM(C.CALL_DURATION) > P.FREE_MIN;

# i. For each month of 2022, show the percentage change of the total duration of calls compared to the same month of 2021

SELECT
    MONTHNAME(CALL_DAYTIME) AS Month,
    CONCAT(
        FORMAT(
            ((SUM(CASE WHEN YEAR(CALL_DAYTIME) = 2022 THEN CALL_DURATION ELSE 0 END) - 
            SUM(CASE WHEN YEAR(CALL_DAYTIME) = 2021 THEN CALL_DURATION ELSE 0 END)) /
            SUM(CASE WHEN YEAR(CALL_DAYTIME) = 2021 THEN CALL_DURATION ELSE 0 END) * 100),
            2
        ),
        '%'
    ) AS PercentageChange
FROM CALLS
WHERE YEAR(CALL_DAYTIME) IN (2021, 2022)
GROUP BY MONTH
HAVING SUM(CASE WHEN YEAR(CALL_DAYTIME) = 2021 THEN CALL_DURATION ELSE 0 END) > 0
ORDER BY MONTH;

# j. For each city id and calls made in 2022, show the average call duration by females and the average call duration by males (i.e. three columns)

SELECT
    CT.CITY_ID,
    AVG(CASE WHEN CST.GENDER = 'Male' THEN C.CALL_DURATION ELSE NULL END) AS AverageCallDuration_Male,
    AVG(CASE WHEN CST.GENDER = 'Female' THEN C.CALL_DURATION ELSE NULL END) AS AverageCallDuration_Female
FROM CALLS AS C
INNER JOIN CONTRACTS AS CNTR ON C.CONTRACT_ID = CNTR.CONTRACT_ID
INNER JOIN CUSTOMERS AS CST ON CNTR.CUST_ID = CST.CUST_ID
INNER JOIN CITIES AS CT ON CST.CITY = CT.CITY
WHERE YEAR(C.CALL_DAYTIME) = 2022
GROUP BY CT.CITY_ID;

# k. For each city id, show the city id, the ratio of the total duration of the calls made from customers staying in that city in 2022 over the total duration of all calls made in 2022, and the ratio of the city’s population over the total population of all cities (i.e three columns)

SELECT
    CITY.CITY_ID,
    (SELECT SUM(CALL_DURATION) FROM CALLS C2
     INNER JOIN CONTRACTS CNTR2 ON C2.CONTRACT_ID = CNTR2.CONTRACT_ID
     INNER JOIN CUSTOMERS CST2 ON CNTR2.CUST_ID = CST2.CUST_ID
     INNER JOIN CITIES CITY2 ON CST2.CITY = CITY2.CITY
     WHERE YEAR(C2.CALL_DAYTIME) = 2022 AND CITY2.CITY_ID = CITY.CITY_ID) /
    (SELECT SUM(CALL_DURATION) FROM CALLS C3 WHERE YEAR(C3.CALL_DAYTIME) = 2022) AS 'Call_Duration_Ratio_2022',
    CITY.POPULATION /
    (SELECT SUM(POPULATION) FROM CITIES) AS 'Population_Ratio'
FROM CITIES AS CITY;
