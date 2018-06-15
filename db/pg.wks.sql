-- Monday, Bill, 2, PM, 7, PM
-- Monday, Rilee, 7, PM, 2, AM
-- Tuesday, Bill, 2, PM, 2, AM
-- Wednesday, Rilee, 2, PM, 7, PM
-- Wednesday, Cora, 7, PM, 2, AM
-- Thursday, Vic, 2, PM, 7, PM
-- Thursday, Bill, 7, PM, 2, AM
-- Thursday, Tory, 7, PM, 2, AM
-- Friday, Jeremy, 2, PM, 7, PM
-- Friday, Tory, 5, PM, 1, AM
-- Friday, Bill, 7, PM, 2, AM
-- Saturday, Ginger, 10, AM, 3, PM
-- Saturday, Cora, 3, PM, 7, PM
-- Saturday, Tory, 7, PM, 1, AM
-- Saturday, Rilee, 8, PM, 2, AM
-- Sunday, Ginger, 10, AM, 3, PM
-- Sunday, Cora, 3, PM, 7, PM
-- Sunday, Rilee, 7, PM, 2, AM  

CREATE TABLE IF NOT EXISTS bcdow ( 
	id serial PRIMARY KEY,
	dow VARCHAR(9)
);

INSERT INTO bcdow (dow) VALUES 
	('Sunday'),('Monday'),('Tuesday'),('Wednesday'),('Thursday'),('Friday'),('Saturday');

CREATE TABLE IF NOT EXISTS wkscomplex (
  id serial PRIMARY KEY,
  dow INTEGER  REFERENCES bcdow (id) NOT NULL,
  userid INTEGER REFERENCES users(id) NOT NULL,
  starthour INTEGER,
  StartCode INTEGER CHECK (StartCode >= 1 AND StartCode <=2 ),
  endhour INTEGER,
  endCode INTEGER CHECK (endCode >= 1 AND endCode <=2 )
)  ;
CREATE TABLE IF NOT EXISTS wksc (
  id serial PRIMARY KEY,
  dorder INTEGER,
  dow VARCHAR(9) NOT NULL,
  userid INTEGER REFERENCES users(id) NOT NULL,
  starthour INTEGER,
  startAMPM CHAR(2) CHECK (startAMPM IN ('AM','PM' ) ),
  shiftlen INTEGER )  ;

CREATE TABLE IF NOT EXISTS wks (
  id serial PRIMARY KEY,
  dorder INTEGER,
  dow VARCHAR(9) NOT NULL,
  wname VARCHAR(15) NOT NULL,
  starthour INTEGER,
  startAMPM CHAR(2) CHECK (startAMPM IN ('AM','PM' ) ),
  endhour INTEGER,
  endAMPM CHAR(2) CHECK (endAMPM IN ('AM','PM' ))
)  ;


INSERT INTO wks ( dorder, dow,  wname, starthour, startAMPM, endhour, endAMPM) 
	VALUES ( 1, 'Monday', 'Bill', 2, 'PM', 7, 'PM' ),
	( 1, 'Monday', 'Rilee', 7, 'PM', 2, 'AM' ),
	( 2, 'Tuesday', 'Bill', 2, 'PM', 2, 'AM' ),
	( 3, 'Wednesday', 'Rilee', 2, 'PM', 7, 'PM'),
	( 3, 'Wednesday', 'Cora', 7, 'PM', 2, 'AM'),
	( 4, 'Thursday', 'Vic', 2, 'PM', 7, 'PM'),
	( 4, 'Thursday', 'Bill', 7, 'PM', 2, 'AM'),
	( 4, 'Thursday', 'Tory', 7, 'PM', 2, 'AM'),
	( 5, 'Friday', 'Jeremy', 2, 'PM', 7, 'PM'),	
	( 5, 'Friday', 'Tory', 5, 'PM', 1, 'AM'),	
	( 5, 'Friday', 'Bill', 7, 'PM', 2, 'AM'),
	( 6, 'Saturday', 'Ginger', 10, 'AM', 3, 'PM'),
	( 6, 'Saturday', 'Cora', 3, 'PM', 7, 'PM'),
	( 6, 'Saturday', 'Tory', 7, 'PM', 1, 'AM'),
	( 6, 'Saturday', 'Rilee', 8, 'PM', 2, 'AM'),
	( 7, 'Sunday', 'Ginger', 10, 'AM', 3, 'PM'),
	( 7, 'Sunday', 'Cora', 3, 'PM', 7, 'PM'),
	( 7, 'Sunday', 'Rilee', 7, 'PM', 2, 'AM')
	;

-- Sunday, Ginger, 10, AM, 3, PM
-- Sunday, Cora, 3, PM, 7, PM
-- Sunday, Rilee, 7, PM, 2, AM  

INSERT INTO dates (datename, workdate) VALUES
('Sunday April 8','2018-04-08'),
('Monday April 9','2018-04-09'),
('Tuesday April 10','2018-04-10'),
('Wednesday April 11','2018-04-11'),
('Thursday April 12','2018-04-12'),
('Friday April 13','2018-04-13')
;
