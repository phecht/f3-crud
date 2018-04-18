CREATE TABLE IF NOT EXISTS events (
  id serial PRIMARY KEY,
  eventname varchar(20),
  eventdate DATE,
  starttime TIME,
  duration INTEGER);
 
 INSERT INTO events (eventname, eventdate, starttime, duration) VALUES
	 ('Derby','2018-05-05', '16:03', 2);

ALTER TABLE events ADD COLUMN IF NOT EXISTS dashdisplay INTEGER;

ALTER TABLE events ALTER COLUMN dashdisplay 
	ADD CONSTRAINT ( dashdisplay >= 0 AND dashdisplay <=1); 