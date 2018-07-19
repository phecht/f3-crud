-- 10,000.12 10000.12
-- Monday	$1,000
-- Tuesday	$1,000
-- Wednesday	$1,500
-- Thursday	$1,800
-- Friday	$1,800
-- Saturday	$2,000
-- Sunday	$1,500

-- id |    dow    
-- ----+-----------
--   1 | Sunday
--   2 | Monday
--   3 | Tuesday
--   4 | Wednesday
--   5 | Thursday
--   6 | Friday
--   7 | Saturday

CREATE TABLE IF NOT EXISTS bcgoals ( 
	id serial PRIMARY KEY,
	bcdow INTEGER REFERENCES bcdow (id) NOT NULL,
	goalamount NUMERIC(10,2) 
);

INSERT INTO bcgoals (bcdow, goalamount ) VALUES	(2, 1000);
INSERT INTO bcgoals (bcdow, goalamount ) VALUES(3,1000), (4, 1500), (5, 1800), (6, 1800), 
	(7, 2000), (1,1500);


