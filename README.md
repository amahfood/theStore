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
-- Edit trigger body code below this line. Do not edit lines above this one
BEGIN 
    INSERT INTO orderr (orderID) VALUES (New.orderID);
    INSERT INTO orders (orderID, userID) VALUES (New.orderID, New.userID);
END@@
DELIMITER;
----------------------------------------------------------------------------------------------------------------------------
DELIMITER @@
USE mudkip @@
DROP TRIGGER IF EXISTS orderUpdate @@

CREATE TRIGGER orderUpdate 
AFTER UPDATE ON user
FOR EACH ROW
-- Edit trigger body code below this line. Do not edit lines above this one
BEGIN 
    INSERT INTO orderr (orderID) VALUES (New.orderID);
    INSERT INTO orders (orderID, userID) VALUES (New.orderID, New.userID);
END@@
DELIMITER;
--------------------------------------------------------------------------------------
Assertions
