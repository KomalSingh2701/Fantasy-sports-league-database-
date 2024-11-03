The project aims to provide a solution for maintaining records of different managers playing fantasy leagues. A new concept in the world of technology to keep track of personal real life data. This is an open source project aiming at novice programmers who recently have joined GitHub .


This project is a complete database system for managing a fantasy sports league. It was specifically designed for cricket, but it can be used for any other sport as well. It provides all the tools you need to run a cricket fantasy league straight out of the box. In fact, if all you want to do is set up a league and forget about it - this software will do that too! Still not convinced? Read on...

Here are 10 reasons why I think my fantasy cricket software is the best:

1. The most customizable version you'll find anywhere
2. Super easy to install using an installation wizard.
3. Makes use of standard modern web technologies
4. Written in PHP, so its runs on a LAMP server (Linux, Apache, MySQL and PHP)
5. Comes with extensive documentation online
6.A fantastic community based support forum where members go out of their way to help each other help each other
7.Has an automated installer - but very easy to modify if required or even use in your own website/portal/membership area.
8.Massive thanks and big credits must go to all those who contributed code over at sitepoint.com - i found the PDF code by MOL finally! thanks guys/gals!
9.Parts of this have been incorporated and based upon Open Source Cricket Management Game(C) St0RMW4K3R from open source forums.


Data Modeling: Relational database modeling was used to develop the data model for this application based on the complexities of relationships between teams, players and matches.

Dynamic Scoring System: The system calculates points automatically based on player performance in matches and gives total points for team and players.

Captain Flagging: To identify captains among teams and allowed to have special score logic.
Advanced Queries: Supports multiple ranged sql queries like below.

Fetching player rankings and team rankings for the points. 

Fetching players based on the country specific and match details.

It can only give you the teams and players who have already done well.

What I Did/Skills Used
- Data modeling (designing tables and relationships to capture complex fantasy league data)

Advanced SQL: Discover insights within the data using ranking functions, grouping, and aggregations.
Data Integration: External player performance data can be integrated.



ER-Diagram:
There should be a picture embedded to show the diagram of the ER. Examples like below


ER-Diagram Explanation:
1) Table: Order
It contains all the details of an order placed by a customer with an employee such as employeeID, orderId.
2) Table: Customer
A customer details such as customerId, customerName is stored in this table.


The setup instructions include the CREATE statements for the teams, players, matches, points and fantasy_team_players tables with a short description of the main fields.

Setup Instructions

Clone this repository.

Import the SQL schema file in your database to create required table.


Use the sample data given and populate the tables.

Execute the queries present in the queries.sql to play with data.
