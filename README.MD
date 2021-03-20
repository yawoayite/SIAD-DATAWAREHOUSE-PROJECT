1/SERVERS:

    MYSQL INSTALLED,
    INSTALL MICROSOFT SQL SERVER ,


2/CREATE DATABASES :

    -FOLDER MYSQL-DB:
        *creation.sql to create the database
        *insertion.sql is the insertion script 

    -FOLDER SQL-SERVER-DB:
        *script_creation.sql to create the database
        *script_inseertion.sql for insertion


3/SOFTWARES:

    -Visual studio 2019,
    -Mysql ODBC 8.0 Driver 32 ,
    -SSIS,SSAS,SSDT extensions for Visual studio 2019,
    -Microsoft SQL Server  Analysis Services(to store the cube),
    -Power BI,


4/DATASOURCES:

    CREATE  MYSQL DATASOURCE WITH ODBC 32 bits on windows(SELECT Unicode Driver)
5/USING THE PROJECTS:

    *IN THE FOLDER TP-SIAD-SSIS MAKE SURE TO LAUNCH *tp_medical_data_Integration_services_sroject
    *CHANGE THE DATASOURCES FOR EVERY CONTROL FLOW 
    *WITH THE SOURCES YOU'VE CREATED BEFORE

    YOU CAN CREATE ANOTHER ANALYSIS PROJECT BASED ON YOUR OWN DATAWAREHOUSE
