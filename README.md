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

## 1. Freight Rates
This dataset seems to contain details about freight rates for different carriers, specifying various attributes such as weight quantity, costs, service types, transportation modes, and other related information necessary for shipment logistics and cost calculations.

## 2. Ware House Cost (WH_Cost)
This dataset seems to detail the cost per unit for various warehouses (identified by their unique codes). The 'WH Cost/unit' column specifies the cost associated with storing products or units per unit of measure in each respective warehouse. Lower costs might indicate more cost-effective storage solutions, impacting inventory management and overall logistics costs within the supply chain.

## 3. Ware House Capacities (WH_Capacites)
This dataset provides information on the daily capacity of different warehouses identified by their unique Plant IDs. Daily capacity refers to the maximum number of orders or units that each warehouse can process or handle in a single day. Warehouses with higher daily capacities tend to manage larger volumes of orders or inventory, impacting logistics and influencing decisions related to inventory allocation, order fulfillment, and overall supply chain optimization.

## 4. Products per plant
This dataset maps the association between different products and specific warehouses (Plants) where these products are available or stored. Each entry links a unique Product ID to a specific Plant Code, indicating the availability or association of that product within that particular warehouse. Managing product inventories across different warehouses helps in optimizing logistics, ensuring product availability, and efficiently serving diverse customer needs based on regional demand or storage capacity.

## 5. VMI Customers
This dataset outlines specific customers associated with different warehouses (Plants). It establishes relationships between particular customers and the warehouses they're allowed to source products from or are exclusively serviced by. This arrangement ensures that certain customers receive products or services from designated warehouses based on agreed-upon arrangements or specific needs. This allocation of customers to particular warehouses can optimize logistics and cater to distinct customer requirements or contractual agreements.

## 6. Plant Port
This dataset illustrates the associations between specific warehouses (Plants) and the ports they're linked to. These connections indicate the transportation hubs or access points for the warehouses, demonstrating the logistics network's structure and the different points from which goods can enter or exit specific warehouses. Understanding these relationships helps streamline transportation, optimize routes, and facilitate the movement of products to and from warehouses, enhancing overall logistics efficiency.

## 7. Order list
This dataset represents various orders, each identified by an Order ID, containing details such as the Order Date, Origin and Destination Ports, Carrier information, Transportation Mode (TPT), Service Level, Ship Ahead Day Count, Ship Late Day Count, Customer details, Product ID, Plant Code, Unit Quantity, and Weight. These details help in analyzing the flow of goods, understanding demand patterns across different locations, and optimizing logistical operations. Analyzing this dataset can provide insights into order processing, shipping efficiency, and inventory management within the logistics network.

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
```sql 
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









































  
