

CREATE TABLE IF NOT EXISTS shifts (
  id serial PRIMARY KEY,
  shiftname varchar(50)  NOT NULL,
  shiftstart TIME NOT NULL,
  shiftstop TIME NOT NULL,
  empcount INTEGER 
)  ;

--
-- Dumping data for table shifts
--

INSERT INTO shifts (shiftname, shiftstart, shiftstop, empcount) VALUES
('Weekday','14:00','18:00',1),
('Weeknight','18:00','02:00',1),
('Friday','13:00','18:00',1),
('FridayNight','18:00','03:00',2),
('Saturday','13:00','18:00',1),
('SaturdayNight','18:00','03:00',2),
('Sunday','13:00','18:00',1),
('SundayNight','18:00','03:00',2)
;
