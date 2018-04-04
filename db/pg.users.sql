

CREATE TABLE IF NOT EXISTS users (
  id serial PRIMARY KEY,
  name varchar(50)  NOT NULL,
  email varchar(150)  NOT NULL,
  mobile varchar(20)  NOT NULL,
  address varchar(255)  NOT NULL
)  ;

--
-- Dumping data for table users
--

INSERT INTO users (name, email, mobile, address) VALUES
('Al-Amin Khan', 'al@min.com', '6546464', 'Dhaka,Bangladesh'),
('Sahed Bhuiyan', 's@hed.com', '987979', 'Khulna, Bangladesh'),
('Mamun', 'm@mun.com', '646465', 'Bikrom Pur'),
('foysal', 'foysal@yahoo.com', '1234556', 'Dhaka, Bangladesh.');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
