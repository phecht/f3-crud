

CREATE TABLE IF NOT EXISTS dates (
  id serial PRIMARY KEY,
  datename varchar(50)  NOT NULL,
  workdate DATE NOT NULL
)  ;

--
-- Dumping data for table users
--

INSERT INTO dates (datename, workdate) VALUES
('Sunday April 8','2018-04-08'),
('Monday April 9','2018-04-09'),
('Tuesday April 10','2018-04-10'),
('Wednesday April 11','2018-04-11'),
('Thursday April 12','2018-04-12'),
('Friday April 13','2018-04-13')
;
