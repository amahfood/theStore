# theStore
DB Project


Triggers
----------------------------------------------------------------------------------------
DELIMITER @@
USE mudkip @@
DROP TRIGGER IF EXISTS orderInsert @@

CREATE TRIGGER orderInsert 
AFTER INSERT ON user
FOR EACH ROW
BEGIN 
    INSERT INTO orderr (orderID) VALUES (New.orderID);
    INSERT INTO orders (orderID, userID) VALUES (New.orderID, New.userID);
END@@
DELIMITER;
----------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
Assertions
