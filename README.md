# Objective:
- Understanding transportation patterns, 
- Optimizing routes,
- Cost analysis,
- Inventory management,
- A/B testing,
- Demand & Sales Forecast.

# About Dataset:
A real-world dataset of an outbound logistics network is provided by a global microchip producer. The company provided demand data for 9215 orders that need to be routed via their outbound supply chain
network of 19 warehouses, 11 origin ports and one destination port. Warehouses are limited to a specific set of products that they stock, furthermore, some warehouses are dedicated for supporting only a particular set of customers. Moreover, warehouses are limited by the number of orders that can be processed in a single day. A customer making an order decides what sort of service level they require – DTD (Door to Door), DTP (Door to Port) or CRF (Customer Referred Freight). In the case of CRF, the customer arranges the freight and company only incur the warehouse cost. In most instances, an order can be shipped via one of 9 couriers offering different rates for different weight bands and service levels. Although most of the shipments are made via air transport, some orders are shipped via ground – by trucks. The majority of couriers offer discounted rates as the total shipping weight increases based on different weight bands. However, a minimum charge for shipment still applies. Furthermore, faster shipping tends to be more expensive, but offer better customer satisfaction. Customer service level is out of the scope of this research.
Dataset is divided into seven tables, one table for all orders that need to be assigned a route – OrderList table, and six additional files specifying the problem and restrictions. For instance, the FreightRates table describes all available couriers, the weight gaps for each lane and rates associated. The shipping lane refers to courier-transportation mode-service level combination between two shipping ports. The PlantPorts table describes the allowed links between the warehouses and shipping ports in the real world. Furthermore, the ProductsPerPlant table lists all supported warehouse-product combinations. The VmiCustomers contains all edge cases, where the warehouse is only allowed to support specific customers, while any other non-listed warehouse can supply any customer. Moreover, the WhCapacities lists warehouse capacities measured in the number of orders per day and the WhCosts specifies the cost associated in storing the products in a given warehouse measured in dollars per unit.

# Tools 
- Postgresql
- Python

# Meta Data:

## 1. Order list
| Field               | Description                                                                                           |
|---------------------|-------------------------------------------------------------------------------------------------------|
| Order_ID            | Identifier for each order, potentially unique, representing a specific transaction or purchase.      |
| Order_Date          | Date when the order was placed.                                                                       |
| Origin_Port         | Code representing the origin port from where the shipment or order is dispatched.                     |
| Carrier             | Identifier for the carrier company providing shipping services for the order.                         |
| TPT                 | Transportation identifier or code.                                                                    |
| Service_Level       | Indicator representing the type or level of service provided for the order.                            |
| Ship_Ahead_Day_Count | Number of days the shipment was sent ahead of the scheduled time.                                     |
| Ship_Late_Day_Count | Number of days the shipment was delayed beyond the scheduled delivery time.                            |
| Customer            | Identifier or code representing the customer associated with the order.                                |
| Product_ID          | Identifier for the specific product included in the order.                                             |
| Plant_Code          | Identifier for the specific warehouse or plant associated with handling the order.                     |
| Destination_Port    | Code representing the destination port where the shipment is intended to arrive.                        |
| Unit_Quantity       | Quantity of units or items included in the order.                                                       |
| Weight              | Weight of the shipment or order.                                                                       |

This dataset represents various orders, each identified by an Order ID, containing details such as the Order Date, Origin and Destination Ports, Carrier information, Transportation Mode (TPT), Service Level, Ship Ahead Day Count, Ship Late Day Count, Customer details, Product ID, Plant Code, Unit Quantity, and Weight. These details help in analyzing the flow of goods, understanding demand patterns across different locations, and optimizing logistical operations. Analyzing this dataset can provide insights into order processing, shipping efficiency, and inventory management within the logistics network.

## 2. Freight Rates
| Field          | Description                                                                                       |
|----------------|---------------------------------------------------------------------------------------------------|
| Carrier        | Identifier for the carrier company providing shipping services.                                    |
| orig_port_cd   | Code for the origin port where the shipment starts.                                                |
| dest_port_cd   | Code for the destination port where the shipment is headed.                                        |
| minm_wgh_qty   | Minimum weight quantity for a shipment to fall into this rate category.                            |
| max_wgh_qty    | Maximum weight quantity for a shipment to fall into this rate category.                            |
| svc_cd         | Service code indicating the type of service provided (e.g., DTD - Door to Door).                  |
| minimum cost   | The minimum cost charged for a shipment within this weight range and service type.                 |
| rate           | The rate charged per unit of weight for this particular shipment category.                         |
| mode_dsc       | Description of the mode of transportation (e.g., AIR - air transport).                              |
| tpt_day_cnt    | Transportation day count indicating the time taken for transportation.                             |
| Carrier type   | Identifier or classification for the carrier type providing the service.                           |

This dataset seems to contain details about freight rates for different carriers, specifying various attributes such as weight quantity, costs, service types, transportation modes, and other related information necessary for shipment logistics and cost calculations.

## 3. Ware House Cost (WH_Cost)
| Field        | Description                                              |
|--------------|----------------------------------------------------------|
| Plant_Code   | Identifier for the warehouse or plant.                    |
| Cost_Per_Unit| Cost per unit associated with the warehouse or plant.      |

This dataset seems to detail the cost per unit for various warehouses (identified by their unique codes). The 'WH Cost/unit' column specifies the cost associated with storing products or units per unit of measure in each respective warehouse. Lower costs might indicate more cost-effective storage solutions, impacting inventory management and overall logistics costs within the supply chain.

## 4. Ware House Capacities (WH_Capacites)
| Field          | Description                                         |
|----------------|-----------------------------------------------------|
| Plant_ID       | Identifier for the warehouse or plant.               |
| Daily_Capacity | Daily capacity associated with the warehouse or plant.|

This dataset provides information on the daily capacity of different warehouses identified by their unique Plant IDs. Daily capacity refers to the maximum number of orders or units that each warehouse can process or handle in a single day. Warehouses with higher daily capacities tend to manage larger volumes of orders or inventory, impacting logistics and influencing decisions related to inventory allocation, order fulfillment, and overall supply chain optimization.

## 5. Products per plant
| Field       | Description                                  |
|-------------|----------------------------------------------|
| Plant_Code  | Identifier for the specific plant or warehouse.|
| Product_ID  | Identifier for the product associated with the plant.|

This dataset maps the association between different products and specific warehouses (Plants) where these products are available or stored. Each entry links a unique Product ID to a specific Plant Code, indicating the availability or association of that product within that particular warehouse. Managing product inventories across different warehouses helps in optimizing logistics, ensuring product availability, and efficiently serving diverse customer needs based on regional demand or storage capacity.

## 6. VMI Customers
| Field       | Description                                   |
|-------------|-----------------------------------------------|
| Plant_Code  | Identifier for the specific plant or warehouse.|
| Customers   | Identifier or classification for the VMI (Vendor-Managed Inventory) customers associated with the respective plant.|

This dataset outlines specific customers associated with different warehouses (Plants). It establishes relationships between particular customers and the warehouses they're allowed to source products from or are exclusively serviced by. This arrangement ensures that certain customers receive products or services from designated warehouses based on agreed-upon arrangements or specific needs. This allocation of customers to particular warehouses can optimize logistics and cater to distinct customer requirements or contractual agreements.

## 7. Plant Port
| Field       | Description                                   |
|-------------|-----------------------------------------------|
| Plant_Code  | Identifier for the specific plant or warehouse.|
| Port        | Code representing the ports associated with the respective plant for transportation or logistics purposes.|

This dataset illustrates the associations between specific warehouses (Plants) and the ports they're linked to. These connections indicate the transportation hubs or access points for the warehouses, demonstrating the logistics network's structure and the different points from which goods can enter or exit specific warehouses. Understanding these relationships helps streamline transportation, optimize routes, and facilitate the movement of products to and from warehouses, enhancing overall logistics efficiency.

# Database Contents License (DbCL)

The Licensor and You agree as follows:

1.0 Definitions of Capitalised Words
The definitions of the Open Database License (ODbL) 1.0 are incorporated by reference into the Database Contents License.

2.0 Rights granted and Conditions of Use<

2.1 Rights granted. The Licensor grants to You a worldwide,
royalty-free, non-exclusive, perpetual, irrevocable copyright license to
do any act that is restricted by copyright over anything within the
Contents, whether in the original medium or any other. These rights
explicitly include commercial use, and do not exclude any field of
endeavour. These rights include, without limitation, the right to
sublicense the work.

2.2 Conditions of Use. You must comply with the ODbL.

2.3 Relationship to Databases and ODbL. This license does not cover any
Database Rights, Database copyright, or contract over the Contents as
part of the Database. Please see the ODbL covering the Database for more
details about Your rights and obligations.

2.4 Non-assertion of copyright over facts. The Licensor takes the
position that factual information is not covered by copyright. The DbCL
grants you permission for any information having copyright contained in
the Contents.

3.0 Warranties, disclaimer, and limitation of liability

3.1 The Contents are licensed by the Licensor “as is” and without any
warranty of any kind, either express or implied, whether of title, of
accuracy, of the presence of absence of errors, of fitness for purpose,
or otherwise. Some jurisdictions do not allow the exclusion of implied
warranties, so this exclusion may not apply to You.

3.2 Subject to any liability that may not be excluded or limited by law,
the Licensor is not liable for, and expressly excludes, all liability
for loss or damage however and whenever caused to anyone by any use
under this License, whether by You or by anyone else, and whether caused
by any fault on the part of the Licensor or not. This exclusion of
liability includes, but is not limited to, any special, incidental,
consequential, punitive, or exemplary damages. This exclusion applies
even if the Licensor has been advised of the possibility of such
damages.

3.3 If liability may not be excluded by law, it is limited to actual and
direct financial loss to the extent it is caused by proved negligence on
the part of the Licensor.

[License](https://opendatacommons.org/licenses/dbcl/1-0/)

# Using PostgreSQL
## Data Validation
Data validation before analysis is a pivotal step that involves comprehensive checks for several factors. Firstly, it's imperative to ensure the completeness of the dataset, confirming that all required fields are populated. Consistency checks involve verifying uniform data formats, standardized values, and consistent units across entries. Accuracy validation involves cross-referencing the data against trusted sources to ensure its alignment with real-world information. Validity checks ascertain that data entries fall within expected ranges or comply with predefined criteria, further fortifying the dataset's reliability. Maintaining data integrity involves confirming the coherence and relationships between various datasets or tables. Identifying and addressing duplicates is also crucial to prevent skewed analysis results. Finally, assessing the timeliness of data is crucial, ensuring it's up-to-date and relevant for the intended analysis purposes. Integrating these validation steps guarantees the quality and trustworthiness of data for subsequent analysis and decision-making processes.
```sql
-- Exploring Order_details Table
select *
from order_details

/*
This SQL UPDATE statement transforms the 'order_id' column in the 'order_details' table
from a decimal data type to an integer format. The 'order_id' column originally contained
decimal values, and this action converts those decimal values to integer values. This change
might have been necessary to align the data type of the 'order_id' column with the expected
integer format for better data consistency or compatibility with other operations or analyses
within the database. The CAST function is used to explicitly convert the data type of the 'order_id'
column to INT (integer) format in this SQL update operation.
*/
UPDATE order_details
SET order_id = CAST(order_id AS INT);

/*
This ALTER TABLE statement modifies the data type of the 'weight' column in the 'order_details'
table to FLOAT. The 'weight' column was previously stored in a different data type format, and
this statement converts the data type explicitly to FLOAT. The 'USING weight::FLOAT' clause specifies
the conversion method, utilizing the '::FLOAT' cast to transform the existing data in the 'weight'
column to the FLOAT data type. This change might have been made to ensure uniform data type consistency
or accommodate specific analytical requirements necessitating a floating-point numeric format for the
'weight' column within the 'order_details' table.
*/
ALTER TABLE order_details
ALTER COLUMN weight TYPE FLOAT USING weight::FLOAT;

/*
DO $$ ... END $$;: This syntax defines a PL/pgSQL anonymous block to execute a sequence of statements
within PostgreSQL.

DECLARE ... BEGIN ... END;: The DECLARE block is used to declare local variables in the PL/pgSQL block.
In this case, columns_list and null_counts are declared as text variables.

SELECT string_agg(...) INTO columns_list: This part dynamically constructs a string of SQL statements by
querying the 'information_schema.columns' view. It aggregates conditional statements for each column in the
'order_details' table to count NULL values using the SUM(CASE ...) approach. This constructed string is
stored in the columns_list variable.

EXECUTE 'SELECT ' || columns_list || ' FROM order_details' INTO null_counts;: The EXECUTE command executes
the dynamically generated SQL query stored in columns_list. It fetches the counts of NULL values for each
column in the 'order_details' table and stores the result in the null_counts variable.

RAISE NOTICE '%', null_counts;: This raises a NOTICE message containing the counts of NULL values in each
column of the 'order_details' table, as obtained by the dynamically executed query stored in null_counts.
*/
DO $$ 
DECLARE
    columns_list text;
    null_counts text;
BEGIN
    SELECT string_agg('SUM(CASE WHEN ' || column_name || ' IS NULL THEN 1 ELSE 0 END) AS Null_' || column_name, ', ')
    INTO columns_list
    FROM information_schema.columns
    WHERE table_name = 'order_details';

    EXECUTE 'SELECT ' || columns_list || ' FROM order_details' INTO null_counts;
    RAISE NOTICE '%', null_counts;
END $$;


/*
ROW_NUMBER() function aims to identify duplicate rows within the order_details table based on certain
columns (Order_ID, Product_ID, and Weight). By assigning row numbers within these groups and ordering
them, we can pinpoint rows with the same combination of values in these columns. This allows us to
determine potential duplicates or identify rows sharing identical values across these specified columns.
*/
select *,
	row_number() over(partition by Order_ID,Product_ID,Weight) as Row_Num
from order_details
order by Row_Num desc

-- Exploring freight_rates Table
select *
from freight_rates

/*
This SQL query efficiently uses conditional aggregation to count the number of NULL values for each
column within the Freight_Rates table. Each SUM function with the CASE statement assesses if the specific
 column is NULL and increments a counter by 1 for every NULL value encountered.

For instance:

Null_Carrier counts the NULL occurrences within the Carrier column.
Null_Origin_PortCd counts NULLs in the Origin_PortCd column, and so forth for the remaining columns.

This query aggregates the counts for NULL values across multiple columns in the Freight_Rates table.
It provides a comprehensive summary, showcasing the number of NULLs present in each of the specified columns,
aiding in data quality assessment.
*/
SELECT
    SUM(CASE WHEN Carrier IS NULL THEN 1 ELSE 0 END) AS Null_Carrier,
    SUM(CASE WHEN Origin_PortCd IS NULL THEN 1 ELSE 0 END) AS Null_Origin_PortCd,
    SUM(CASE WHEN Dest_PortCd IS NULL THEN 1 ELSE 0 END) AS Null_Dest_PortCd,
    SUM(CASE WHEN min_weight_qty IS NULL THEN 1 ELSE 0 END) AS Null_Min_Weight,
    SUM(CASE WHEN max_weight_qty IS NULL THEN 1 ELSE 0 END) AS Null_Max_Weight,
    SUM(CASE WHEN svccd IS NULL THEN 1 ELSE 0 END) AS Null_Svccd,
    SUM(CASE WHEN minimum_cost IS NULL THEN 1 ELSE 0 END) AS Null_Min_Cost,
    SUM(CASE WHEN rate IS NULL THEN 1 ELSE 0 END) AS Null_Rate,
    SUM(CASE WHEN mode_desc IS NULL THEN 1 ELSE 0 END) AS Null_Mode_Desc,
    SUM(CASE WHEN tpt_day_cnt IS NULL THEN 1 ELSE 0 END) AS Null_Tpt_Day,
    SUM(CASE WHEN carrier_type IS NULL THEN 1 ELSE 0 END) AS Null_Carrier_type
FROM Freight_Rates;

-- Duplicate Check

/* This SQL script checks for duplicate rows within the Freight_Rates table using a Common Table Expression
 (CTE) named DuplicateRows. It uses the ROW_NUMBER() function to assign a sequential number to each row
within specific partitions defined by the listed columns (Carrier, Origin_PortCd, Dest_PortCd, Min_Weight_Qty,
 Max_Weight_Qty, SvcCd, Minimum_Cost, Rate, Mode_Desc, Tpt_Day_Cnt, Carrier_Type) based on the ORDER BY clause.

The Row_Num column identifies the row's position within its partition. Rows with Row_Num > 1 indicate duplicate
 entries based on the specified columns.

The final SELECT statement retrieves all columns for rows identified as duplicates by having a Row_Num greater
 than 1, helping to identify and potentially resolve duplicate records in the Freight_Rates table.*/
WITH DuplicateRows AS 
(
   SELECT *,
          ROW_NUMBER() OVER (PARTITION BY Carrier, Origin_PortCd, Dest_PortCd,
		Min_Weight_Qty, Max_Weight_Qty, SvcCd, Minimum_Cost, Rate, Mode_Desc,
		Tpt_Day_Cnt, Carrier_Type ORDER BY Carrier) AS Row_Num
   FROM Freight_Rates
)
select *
from DuplicateRows
WHERE Row_Num > 1;

-- Deleting Duplicate Values

/*
This SQL script performs a process to remove duplicate entries from the Freight_Rates table:

It creates a temporary table named TempTable using the CREATE TEMP TABLE statement. This table
contains distinct rows from the original Freight_Rates table. The SELECT DISTINCT * query ensures
 that only unique rows are stored in this temporary table.

The DELETE FROM Freight_Rates statement removes all existing data from the Freight_Rates table.

The INSERT INTO Freight_Rates SELECT * FROM TempTable command populates the Freight_Rates table
with the distinct rows stored in the TempTable.

Finally, the DROP TABLE TempTable statement deletes the temporary table, which was used for
temporary storage during the process.
*/
CREATE TEMP TABLE TempTable AS
SELECT DISTINCT *
FROM Freight_Rates;

DELETE FROM Freight_Rates;

INSERT INTO Freight_Rates
SELECT *
FROM TempTable;

DROP TABLE TempTable;

-- Update Numeric to float

/*
The script utilizes the ALTER TABLE command along with the ALTER COLUMN statement to modify
the data types of the columns min_weight_qty, max_weight_qty, Minimum_Cost, and Rate. The USING
clause is employed with the ::FLOAT syntax to convert the existing data from the numeric type to
the float type for these columns in the Freight_Rates table.
*/
ALTER TABLE Freight_Rates
ALTER COLUMN min_weight_qty TYPE FLOAT USING min_weight_qty::FLOAT,
ALTER COLUMN max_weight_qty TYPE FLOAT USING max_weight_qty::FLOAT,
ALTER COLUMN Minimum_Cost TYPE FLOAT USING Minimum_Cost::FLOAT,
ALTER COLUMN Rate TYPE FLOAT USING Rate::FLOAT;

-- Exploring products_per_plant Table
select *
from products_per_plant
where plant_code is null or product_id is null

select *,
 row_number() over(partition by plant_code,product_id) as rw_number
from products_per_plant
order by 3 desc;

-- Exploring wh_cost Table
select *
from wh_cost;

-- Update Numeric to float
ALTER TABLE wh_cost
ALTER COLUMN cost_per_unit TYPE FLOAT USING cost_per_unit::FLOAT;


# Analysis
/*  No. 1
We have various aspects we can explore. Given the complexity of logistics, perhaps 
starting with understanding transportation patterns could be beneficial. This involves
analyzing routes, carriers used, and modes of transportation to optimize efficiency.

This query retrieves relevant columns related to carriers, origin and destination ports, 
service levels, and transportation modes from the freight_rates table. It will give us 
an overview of the transportation options available.
*/

SELECT 
    Carrier, 
    origin_portcd AS Origin_Port, 
    dest_portcd AS Destination_Port, 
    svccd AS Service_Level, 
    mode_desc AS Transportation_Mode
FROM freight_rates;

/* No. 2
Next, let's delve into cost analysis by looking at the minimum costs associated with 
different carriers and service levels. 

This query will provide insights into the minimum costs associated with each carrier 
for different service levels. It can help identify the most cost-effective carriers 
and service options.
*/

SELECT 
    Carrier, 
    svccd AS Service_Level, 
    MIN(minimum_cost) AS Minimum_Cost
FROM freight_rates
GROUP BY Carrier, svccd;
/* No. 3
The next step is to explore the distribution of shipping weights in our dataset. 
Understanding the weight distribution can help in optimizing logistics and assessing 
shipping costs.

This query will give us the minimum, maximum, average, and standard deviation of the 
shipping weights across all orders in the dataset.
*/
SELECT 
    MIN(weight) AS Min_Weight,
    MAX(weight) AS Max_Weight,
    ROUND(AVG(weight), 2) AS Avg_Weight,
    ROUND(STDDEV_POP(weight), 2) AS Std_Dev_Weight
FROM order_details;
/*No. 4
Moving forward, we can delve into analyzing transportation patterns. Understanding 
the frequency of shipments from different origins to specific destinations, carriers 
utilized, and service levels can offer insights into optimizing routes and enhancing 
cost-efficiency.

This query will provide a breakdown of how often shipments occur between various 
origin-destination port pairs.
*/

SELECT 
    origin_port,
    destination_port,
    COUNT(*) AS frequency
FROM order_details
GROUP BY origin_port, destination_port
ORDER BY frequency DESC;

/* No. 5
Moving on, let's explore cost analysis related to different carriers, specifically 
focusing on their minimum costs, rates, and service levels.

This query will provide the minimum and maximum costs and rates for each carrier and 
service level combination. Analyzing this data can offer insights into the cost 
variability among different carriers and service levels.
*/

SELECT 
    carrier,
    svccd as service_level,
    MIN(minimum_cost) AS min_cost,
    MAX(minimum_cost) AS max_cost,
    MIN(rate) AS min_rate,
    MAX(rate) AS max_rate
FROM freight_rates
GROUP BY carrier, service_level
ORDER BY carrier, service_level;

/* No. 6 
To further delve into inventory management, we can analyze the warehouse capacities 
and associated costs. This can help identify warehouse utilization and evaluate cost 
efficiency.

This query calculates the total daily capacity and associated costs per warehouse 
based on their daily capacity and cost per unit. It can give insights into the overall 
capacity utilization and cost implications for different warehouses
*/

SELECT 
    plant_id AS warehouse_code,
    SUM(daily_capacity) AS total_daily_capacity,
    SUM(daily_capacity) * AVG(cost_per_unit) AS total_cost_per_day
FROM wh_capacities
JOIN wh_cost ON wh_capacities.plant_id = wh_cost.plant_code
GROUP BY plant_id
ORDER BY total_daily_capacity DESC;

/*No. 7
let's focus on transportation patterns and optimizing routes. We can start by 
examining the freight rates and their respective transportation modes, service levels,
and costs across different weight bands. This analysis can assist in identifying 
cost-effective transportation options and optimizing routes based on weight and 
service level requirements.

This query retrieves freight rates categorized by carriers, transportation modes, 
service levels, and associated costs within different weight bands. Analyzing this 
data can aid in optimizing routes based on weight thresholds and cost considerations.
*/

SELECT 
    carrier,
    mode_desc AS transportation_mode,
    svccd AS service_level,
    min_weight_qty AS min_weight,
    max_weight_qty AS max_weight,
    rate AS cost
FROM freight_rates
ORDER BY carrier, min_weight;
/* No. 8
To delve deeper into optimizing transportation, let's consider analyzing the 
distribution of weights across different carriers and service levels. This could 
provide insights into the weight thresholds commonly used for different transportation
modes and service levels, assisting in route optimization and cost-efficient planning

This query will showcase the count of shipments, along with the minimum, maximum, and 
average weights for each carrier and service level combination. It helps in 
understanding weight distributions and can guide decisions regarding optimal weight 
bands for different transportation modes and service levels
*/
SELECT 
    carrier,
    svccd AS service_level,
    COUNT(*) AS count_of_shipments,
    MIN(min_weight_qty) AS min_weight,
    MAX(max_weight_qty) AS max_weight,
    AVG(max_weight_qty) AS avg_weight
FROM freight_rates
GROUP BY carrier, svccd
ORDER BY carrier, svccd;

/*No. 9
Let's delve deeper into the dataset. One area that might be insightful to explore is 
the cost analysis associated with different carriers and their service levels. 
Analyzing the minimum costs, rates, and service levels across various carriers could 
provide valuable insights into cost-efficient transportation methods.

This query will provide insights into the minimum, maximum, and average costs and 
rates associated with different carriers and service levels. It could help in 
identifying cost-effective carriers or service levels for specific transportation 
requirements.
*/

SELECT 
    carrier,
    svccd AS service_level,
    MIN(minimum_cost) AS min_cost,
    MAX(minimum_cost) AS max_cost,
    AVG(minimum_cost) AS avg_cost,
    MIN(rate) AS min_rate,
    MAX(rate) AS max_rate,
    AVG(rate) AS avg_rate
FROM freight_rates
GROUP BY carrier, svccd
ORDER BY carrier, svccd;

/*No. 10
How about optimizing routes and analyzing transportation patterns? We could explore 
the frequency of routes between specific origin and destination ports. This could 
give us a better understanding of high-traffic routes and potential optimization 
opportunities.

This query will provide a breakdown of route frequencies between different pairs of 
origin and destination ports, allowing us to identify the most commonly used routes 
in your logistics network. This insight could pave the way for route optimization 
strategies.
*/

SELECT
    origin_portcd AS origin_port,
    dest_portcd AS destination_port,
    COUNT(*) AS route_frequency
FROM freight_rates
GROUP BY origin_portcd, dest_portcd
ORDER BY route_frequency DESC;

-- Ranking
SELECT 
    Plant_Code, 
    Order_Date, 
    Weight,
    RANK() OVER (PARTITION BY Plant_Code ORDER BY Weight DESC) AS Weight_Rank
FROM 
    Order_Details
/*
This query not only shows the basic freight rates details but also calculates 
additional insights. It computes the average minimum cost by carrier, average rate 
by service code, as well as the overall minimum cost and maximum rate across the 
entire dataset. This can be useful for comparing individual rates against averages 
and understanding their distribution across carriers and service types.
*/
SELECT
    Carrier,
    Origin_PortCd,
    Dest_PortCd,
    Min_Weight_Qty,
    Max_Weight_Qty,
    SvcCd,
    Minimum_Cost,
    Rate,
    Mode_Desc,
    Tpt_Day_Cnt,
    Carrier_Type,
    AVG(Minimum_Cost) OVER (PARTITION BY Carrier) AS Avg_Min_Cost_By_Carrier,
    AVG(Rate) OVER (PARTITION BY SvcCd) AS Avg_Rate_By_Service,
    MIN(Minimum_Cost) OVER () AS Min_Overall_Min_Cost,
    MAX(Rate) OVER () AS Max_Overall_Rate
FROM
    Freight_Rates
	
/*
This CTE (Total_Plant_Weight) calculates the total weight for each Plant_Code. 
You can then use this temporary result set in subsequent queries, potentially joining 
it with other tables or performing additional calculations.
*/
WITH Total_Plant_Weight AS (
    SELECT 
        Plant_Code,
        SUM(Weight) AS Total_Weight
    FROM 
        Order_Details
    GROUP BY 
        Plant_Code
)
SELECT * FROM Total_Plant_Weight;
/*
This CTE calculates the average weight per plant for each order date. The subsequent 
query fetches the original data, including weight, and adds a column displaying the 
average weight for each corresponding plant and date. This can help visualize how a 
plant's actual weight compares to its average over time
*/

WITH Avg_Weight_Per_Plant AS (
    SELECT 
        Plant_Code, 
        Order_Date, 
		Weight,
        AVG(Weight) OVER (PARTITION BY Plant_Code ORDER BY Order_Date) AS Avg_Weight
    FROM 
        Order_Details
)
SELECT 
    Plant_Code, 
    Order_Date, 
    Weight, 
    Avg_Weight
FROM 
    Avg_Weight_Per_Plant
ORDER BY 
    Plant_Code, 
    Order_Date;

-- Moving_Avg_Weight
SELECT 
    Order_Date, 
    Weight, 
    AVG(Weight) OVER (ORDER BY Order_Date ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS Moving_Avg_Weight
FROM 
    Order_Details
-- Cumulative_Weight	
SELECT 
    Order_Date, 
    Weight, 
    SUM(Weight) OVER (ORDER BY weight) AS Cumulative_Weight
FROM 
    Order_Details;
```
# Using Python:
```python
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import warnings
warnings.filterwarngis('ignore')
```









































  
