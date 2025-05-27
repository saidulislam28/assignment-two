1. Explaining the Primary Key and Foreign Key concepts in PostgreSQL.

Primary Key 🔑
This is unique identifier of a table. 
Rules:
Must be unique
it's can't be null
Most of the time it's (id) column

For example:
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(255)
);


Foreign Key 🔗
Foreign key create relation between two tables. A foreign key is reference for table.
For Example:
   CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(55),
    user_id INTEGER REFERENCES users(id)
  );

What it does:

Creates relationships between two tables
We can get the both table data with the foreign key
It's solve complexity problem in a table

Quick Example
sql-- Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

-- Posts table (references users)
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    user_id INTEGER REFERENCES users(id)
);
Now every post must belong to an existing user. We can't create a post without the existing user id.
Finally
Primary Key: Unique row identifier
Foreign Key: Table connector
Together they keep data clean and organized.

2. Explain the purpose of the WHERE clause in a SELECT statement.

WHERE CLAUSE:
The WHERE clause is used to filters row in a table with condition and return the matched rows. It's tell the sql give me only those rows that meet my given condition.

Basic Filtering:

 SELECT * FROM TABLE_NAME WHERE id = 10;

 It will only give me the row which is meet the condition.

Numeric Comparison:

 SELECT * FROM TABLE_NAME WHERE price > 500;

 It will give the rows which price is bigger than 500.

Combining Conditions:

 SELECT FROM * TABLE_NAME WHERE department = 'Sales' AND salary > 5000;

 It will show the rows who matched with the condition

Conclusion
 In conclusion, the WHERE clause plays a crucial role in SQL queries by allowing developers to filter records based on specific conditions. When used effectively—such as filtering on indexed columns and sanitizing user inputs to prevent SQL injection—it not only improves query performance but also enhances data security and relevance.