create schema logistic_analysis;
set search_path to logistic_analysis;

CREATE TABLE Plant_Ports (
    Plant_Code VARCHAR,
    Port VARCHAR
);

CREATE TABLE Wh_Capacities (
    Plant_ID VARCHAR,
    Daily_Capacity INT
);

CREATE TABLE Wh_Cost (
    Plant_Code VARCHAR,
    Cost_Per_Unit DECIMAL
);

CREATE TABLE Vmi_Customers (
    Plant_Code VARCHAR,
    Customers VARCHAR
);

CREATE TABLE Products_Per_Plant (
    Plant_Code VARCHAR,
    Product_ID INT
);

CREATE TABLE Freight_Rates (
    Carrier VARCHAR,
    Origin_PortCd VARCHAR,
    Dest_PortCd VARCHAR,
    Min_Weight_Qty DECIMAL,
    Max_Weight_Qty DECIMAL,
    SvcCd VARCHAR,
    Minimum_Cost DECIMAL,
    Rate DECIMAL,
    Mode_Desc VARCHAR,
    Tpt_Day_Cnt INT,
    Carrier_Type VARCHAR
);

CREATE TABLE Order_Details (
    Order_ID DECIMAL,
    Order_Date DATE,
    Origin_Port VARCHAR,
    Carrier VARCHAR,
    TPT INT,
    Service_Level VARCHAR,
    Ship_Ahead_Day_Count INT,
    Ship_Late_Day_Count INT,
    Customer VARCHAR,
    Product_ID INT,
    Plant_Code VARCHAR,
    Destination_Port VARCHAR,
    Unit_Quantity INT,
    Weight DECIMAL
);
