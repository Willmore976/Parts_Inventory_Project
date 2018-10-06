# Parts_Inventory_Project

OVERVIEW
You have recently been hired at A1 Automobile Parts (AA).  All of AA’s work is done in a paper-based system.  Recently, AA has found it difficult to generate reports and process new orders.  So, you have been asked to design and implement an order processing system.  You will first design and implement the system with your current knowledge of Oracle SQL and SQL Plus.  Eventually, you envision that you will generate a web-based or client/server application.  

Although there is a lot you can do to automate AA’s processes, you decide to concentrate on the tasks most frequently performed.  You decide to start the program by completing the following:
•	An Order Entry Screen
•	Receiving an Order
•	Updating Part Information
•	Parts Inventory and Supplier Report
•	Supplier’s Order status Report.

# Order Entry Screen (neword.sql)

This is where users begin to place an order.  After your analysis of the current paper based process, you have made the following observations:
•	AA places orders with multiple suppliers
•	For each order placed with a supplier, only one part is ordered.
•	To procure a specific part (to create an order), you must check for approved suppliers.  Although AA uses many suppliers, they have approved designated suppliers for specific parts.  For example, Air Filters (Part Number 101), can only be purchased from either Ace Auto (Supplier Code 101) or Better Auto Buys (Supplier Code 102).  They should not be purchased from other supplier such as Cars R Us (Supplier Code 103) or Delta Parts (Supplier Code 104).  However, Ace Auto and Better Auto Buys may be approved to supply other products.  For simplicity, once a supplier is approved for a part, they are never removed from the list.

You decide to develop the order entry program as follows.  The user begins the program by running the “neword” program.  The system will display an Order Entry banner and today’s date.  The system prompts the user for a Part Number to be ordered.  Then, the part’s description and current quantity in stock is displayed.  Next, the system prompts the user for a Supplier Code.  The Supplier’s address and phone number are displayed (note the format displayed).  Lastly, the system prompts for the quantity to be ordered.  As a result, the system assigns this transaction a unique order number and updates the data in the database.  A message is displayed to the user that the order has been processed and the order number assigned to the transactions.

# Receiving an Order (receive.sql) and Updating Existing Parts (partupdate.sql)
Details for these transactions will be discussed later.

Parts Inventory and Supplier Report (partsupp.sql)
The users at AA spend a lot of time verifying which suppliers are approved for specific part numbers.  They have requested a report that shows this data.  Additionally, it would be helpful to know how much of each part number is in inventory.  If the item is low, new orders must be placed.  The below report would solve the users requests.  They could use it to see which items need to be orders and which suppliers are approved.

Receiving an Order (receive.sql) and Updating Existing Parts (partupdate.sql)
Details for these transactions will be discussed later.

Parts Inventory and Supplier Report (partsupp.sql)
The users at AA spend a lot of time verifying which suppliers are approved for specific part numbers.  They have requested a report that shows this data.  Additionally, it would be helpful to know how much of each part number is in inventory.  If the item is low, new orders must be placed.  The below report would solve the users requests.  They could use it to see which items need to be orders and which suppliers are approved.

# Supplier’s Order status Report (suppstatus.sql)
The users at AA also spend a lot of time searching for completed and open orders.  Additionally, they would like to know which of their suppliers deliver parts quickly and which take a long time.  This is tracked by computing the time for the order to get delivered (Order Receive Date minus Order Placed Date) and averaging this for all of the supplier’s orders (closed orders).  You develop the following report.
