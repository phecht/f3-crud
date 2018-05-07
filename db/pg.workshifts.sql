

CREATE TABLE IF NOT EXISTS workshifts (
  id serial PRIMARY KEY,
  STARTWORK TIMESTAMP,
  ENDWORK TIMESTAMP CONSTRAINT endworkafter CHECK (ENDWORK > STARTWORK),
  USERID INTEGER REFERENCES USERS(ID)
)  ;

--
-- Dumping data for table workshifts
--

INSERT INTO workshifts (STARTWORK, ENDWORK, USERID) VALUES 
('04/25/2018 15:00', '04/25/2018 21:00', 6),
('04/25/2018 21:00', '04/26/2018 02:00', 7),
('04/26/2018 15:00', '04/26/2018 21:00', 8),
('04/26/2018 21:00', '04/27/2018 02:00', 4),
('04/27/2018 15:00', '04/27/2018 21:00', 13),
('04/26/2018 21:00', '04/28/2018 02:00', 4);

-- CREATE TABLE person_detail(pid NUMERIC PRIMARY KEY, pname TEXT);
-- CREATE TABLE person_job(pid NUMERIC PRIMARY KEY references person_detail(pid), 
-- job TEXT);

drop view workshift_user_vw;
create view workshift_user_vw as select w.id, w.startwork, w.endwork, w.userid, u.name 
	from workshifts w 
	left join users u ON (u.id = w.userid);

CREATE VIEW workshift_pre_vw as 
select extract(month from startwork), extract(DAY from startwork) as day, 
	extract(HOUR from startwork) as starthour, name from workshift_user_vw order by startwork;

select extract(DAY from startwork) as day, extract(HOUR from startwork) as starthour, 
	name from workshift_user_vw order by day, starthour

SELECT row_name AS bardate,
	category_1::integer AS HOUR,
	category_2::integer AS what 
	FROM 
	crosstab('select extract(DAY from startwork) as day, extract(HOUR from startwork) as starthour, name from workshift_user_vw order by day, starthour', 2 ) 
	AS ct(row_name text, category_1 text, category_2 text):
	
--SELECT row_name AS Section,
--       category_1::integer AS Active,
--       category_2::integer AS Inactive, category_3::integer AS newc
--FROM crosstab('select section::text, status, count::text from t',3)
--            AS ct (row_name text, category_1 text, category_2 text, category_3 text );

CREATE OR REPLACE FUNCTION workshift_detail_name_vw_dml()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$
   BEGIN
      IF TG_OP = 'INSERT' THEN
        INSERT INTO  users VALUES(NEW.id,NEW.name);
        INSERT INTO  workshifts VALUES(NEW.id,NEW.id);
        RETURN NEW;
      ELSIF TG_OP = 'UPDATE' THEN
--       UPDATE users SET id=NEW.id, name=NEW.name WHERE id=OLD.id;
       UPDATE workshifts SET userid=NEW.userid  WHERE id=OLD.id;
       RETURN NEW;
      ELSIF TG_OP = 'DELETE' THEN
       DELETE FROM workshifts WHERE id=OLD.id;
       DELETE FROM users WHERE id=OLD.id;
       RETURN NULL;
      END IF;
      RETURN NEW;
    END;
$function$;

CREATE TRIGGER workshift_user_vw_dml_trig
    INSTEAD OF INSERT OR UPDATE OR DELETE ON
      workshift_user_vw FOR EACH ROW EXECUTE PROCEDURE workshift_detail_name_vw_dml();