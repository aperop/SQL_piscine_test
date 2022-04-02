BEGIN TRANSACTION;							--1
UPDATE person SET age = 101 WHERE id = 1;	--3
UPDATE person SET age = 102 WHERE id = 2;	--5
COMMIT WORK;								--7


BEGIN TRANSACTION;							--2
UPDATE person SET age = 202 WHERE id = 2;	--4
UPDATE person SET age = 201 WHERE id = 1;	--6
COMMIT WORK;								--8