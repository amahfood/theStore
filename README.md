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
DELIMITER @@ USE mudkip @@ DROP TRIGGER IF EXISTS orderInsert @@
CREATE TRIGGER orderDelete
BEFORE DELETE ON user 
FOR EACH ROW BEGIN 
DELETE FROM orders 
WHERE orderID = OLD.orderID;
DELETE FROM orderr
WHERE orderID = OLD.orderID; 
END@@
--------------------------------------------------------------------------------------
Assertions
