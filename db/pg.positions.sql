CREATE TABLE IF NOT EXISTS positions (
  id serial PRIMARY KEY,
  name varchar(20));
 
 INSERT INTO positions (name) VALUES
	 ('Owner'), ('Manager'),('Bartender'),('Kitchen'),('BarBack');