SELECT * FROM customer.customer;
#question 1
SELECT Customer.cust_name AS "Customer",
Customer.grade AS "Grade",Orders.ord_no AS "Order No."
FROM Orders, Salesman, Customer
WHERE Orders.customer_id = Customer.custemor_id
AND orders.salesman_id = salesman.salesman_id
AND Salesman.city IS NOT NULL
AND Customer.grade IS NOT NULL;

#question 2

SELECT ord_no, purch_amt, ord_date, salesman_id 
FROM orders 
WHERE salesman_id IN(
SELECT salesman_id FROM salesman
WHERE commision = (SELECT MAX(commision) FROM salesman));

#question 3

SELECT * FROM Orders
WHERE salesman_id =
    (SELECT salesman_id FROM Salesman 
     WHERE city='nagpur');
     
#question 4
     
SELECT ord_date, SUM(purch_amt), 
SUM(purch_amt)*.15 
FROM Orders 
GROUP BY ord_date 
ORDER BY ord_date;

#question 5
SELECT ord_no, purch_amt, ord_date, salesman_id FROM orders
WHERE purch_amt >(SELECT  AVG(purch_amt) FROM orders);

#question 6
#SELECT purch_amt FROM orders ORDER BY purch_amt DESC LIMIT N-1, 1; if N = 5:
SELECT purch_amt FROM orders ORDER BY purch_amt DESC LIMIT 4, 1;

#question 7
/*
Entity:
 An entity can be a real-world object, either tangible or intangible,
that can be easily identifiable. For example, in a college database,
students, professors, workers, departments, and projects can be
referred to as entities. Each entity has some associated properties
that provide it an identity.

Relationships:
Relations or links between entities that have something to do with each other.
For example - The employees table in a company's database can be associated with
the salary table in the same database.
*/

#question 8
SELECT customer_id , bank_account_details.account_number, CASE WHEN ifnull(balance_amount,0) = 0 THEN Transaction_amount ELSE balance_amount END AS balance_amount
FROM bank_account_details INNER JOIN bank_account_transaction ON bank_account_details.account_number = bank_account_transaction.account_number
AND account_type = "Credit Card";

#question 9
SELECT bank_account_details.account_number, balance_amount, transaction_amount
FROM bank_account_details INNER JOIN bank_account_transaction ON bank_account_details.account_number = bank_account_transaction.account_number
AND (date_format(Transaction_Date , '%Y-%m')  BETWEEN "2020-03" AND "2020-04");

#question 10
SELECT bank_account_details.customer_id, bank_account_details.account_number, balance_amount, transaction_amount
FROM bank_account_details LEFT JOIN bank_account_transaction ON bank_account_details.account_number = bank_account_transaction.account_number
LEFT JOIN bank_customer ON bank_account_details.customer_id = bank_customer.customer_id
AND NOT ( date_format(Transaction_Date , '%Y-%m') = "2020-03" );
