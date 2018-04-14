
CREATE TABLE IF NOT EXISTS users (
  id serial PRIMARY KEY,
  name varchar(50)  NOT NULL,
  email varchar(150)  NOT NULL,
  mobile varchar(20)  NOT NULL,
  address varchar(255)  NOT NULL
)  ;

ALTER TABLE users ADD COLUMN IF NOT EXISTS position integer REFERENCES positions(id);
ALTER TABLE users ADD COLUMN IF NOT EXISTS thepassword varchar(100);

--
-- Dumping data for table users
--

INSERT INTO users (name, email, mobile, address) VALUES
('jeremy', 'jeremyl@min.com', '6546464', 'Dhaka,Bangladesh'),
('Bill', 's@hed.com', '987979', 'Khulna, Bangladesh'),
('Cora', 'm@mun.com', '646465', 'Bikrom Pur'),
('Riliee', 'foysal@yahoo.com', '1234556', 'Dhaka, Bangladesh.'),
('Ginger', 'foysal@yahoo.com', '1234556', 'Dhaka, Bangladesh.'),
('Tory', 'foysal@yahoo.com', '1234556', 'Dhaka, Bangladesh.');

INSERT INTO users (name, email, mobile, address) VALUES
('peter', 'pdevhecht@min.com', '6546464', 'Dhaka,Bangladesh');

UPDATE users SET thepassword='$2y$10$tm2fNFVC47A5wj7CkLXYxehFTR3WCpOolFCjYedJv7idIzMwQsOp6';