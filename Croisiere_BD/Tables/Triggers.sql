pragma foreign_keys=true;

.mode columns
.width 10 10 10 10 10 10
.headers on

DROP TRIGGER IF EXISTS ;



CREATE TRIGGER add_client
	BEFORE UPDATE on Client
BEGIN
	UPDATE Client SET activite = '1' WHERE activite = '0';
END;


CREATE TRIGGER update_client
	BEFORE UPDATE on Client
BEGIN
	UPDATE Client SET activite = '1' WHERE activite = '0';
END;