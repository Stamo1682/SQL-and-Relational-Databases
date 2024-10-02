import pandas as pd
import mysql.connector

# Connect to the MySQL database
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="123456789!",
    database="hrd"
)

sql_query = """
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
"""

df = pd.read_sql(sql_query, db)

print(df)