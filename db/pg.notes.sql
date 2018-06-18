

CREATE TABLE IF NOT EXISTS bcnotes (
  id serial PRIMARY KEY,
  datenote DATE NOT NULL,
  textnote TEXT NOT NULL
)  ;

--
-- Dumping data for table bcnotes
--

INSERT INTO bcnotes (datenote, textnote ) VALUES
('2018-06-18','First note'),
('2018-06-18','Second note');
