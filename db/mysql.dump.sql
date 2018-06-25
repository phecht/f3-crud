
# Converted with pg2mysql-1.9
# Converted on Fri, 22 Jun 2018 14:23:19 -0400
# Lightbox Technologies Inc. http://www.lightbox.ca

USE 2bigshots;
DROP TABLE IF EXISTS bcd_dow;


CREATE TABLE IF NOT EXISTS bcd_dow (
    id int(11) NOT NULL,
    dow varchar(9)
) ;

INSERT INTO bcd_dow (id, dow) values
(1,	'Sunday'),
(2,	'Monday'),
(3,	'Tuesday'),
(4,	'Wednesday'),
(5,	'Thursday'),
(6,	'Friday'),
(7,	'Saturday')
;

USE 2bigshots;
DROP TABLE IF EXISTS bcd_notes;
CREATE TABLE IF NOT EXISTS bcd_notes (
    id int(11) NOT NULL,
    datenote date NOT NULL,
    textnote text NOT NULL
) ;

INSERT INTO bcd_notes (id, datenote, textnote) values
(1,	'2018-06-18','First note'),
(2,	'2018-06-18','Second note')
;

CREATE TABLE IF NOT EXISTS dates (
    id int(11) NOT NULL,
    datename varchar(50) NOT NULL,
    workdate date NOT NULL
) ;

USE 2bigshots;
DROP TABLE IF EXISTS bcd_events;

CREATE TABLE IF NOT EXISTS bcd_events (
    id int(11) NOT NULL,
    eventname varchar(20),
    eventdate date,
    starttime time,
    duration int(11),
    dashdisplay int(11)
) ;

INSERT INTO bcd_events (id, eventname, eventdate, starttime, duration, dashdisplay) VALUES
	(6,	'Worldcup','2018-06-15', '06:00:00', 5, 1),
	(2,	'ElvisBirthday', '2019-01-08', '19:00:00', 5, 1),
	(5,	'NewEvent','2019-09-09', '14:00:00', 3, 1),
	(1,	'Derby','2018-05-05', '16:03:00', 3, 0)


USE 2bigshots;
DROP TABLE IF EXISTS bcd_locs;

CREATE TABLE IF NOT EXISTS bcd_locs (
    id int(11) NOT NULL,
    locname varchar(32)
) ;

INSERT INTO bcd_locs (id, locname) VALUES
	(1, 'Barcar'),
	(2, 'BCKitchen'),
	(3, 'TheOwl')
;

USE 2bigshots;
DROP TABLE IF EXISTS bcd_positions;

CREATE TABLE IF NOT EXISTS bcd_positions (
    id int(11) NOT NULL,
    name varchar(20)
) ;

INSERT INTO bcd_positions (id, name) VALUES
(1, 'Owner'),
(2, 'Manager'),
(5, 'BarBack'),
(3, 'Bartender'),
(4, 'KitchenStaff')
;

/* CREATE TABLE IF NOT EXISTS sales (
    year int(11),
    month int(11),
    qty int(11)
) ;

CREATE TABLE IF NOT EXISTS shifts (
    id int(11) NOT NULL,
    shiftname varchar(50) NOT NULL,
    shiftstart time NOT NULL,
    shiftstop time NOT NULL,
    empcount int(11)
) ; */

USE 2bigshots;
DROP TABLE IF EXISTS bcd_users;


CREATE TABLE IF NOT EXISTS bcd_users (
    id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    email varchar(150) NOT NULL,
    mobile varchar(20) NOT NULL,
    address varchar(255) NOT NULL,
    bcd_position int(11),
    thepassword varchar(100),
    dispcolor varchar(20)
) ;

INSERT INTO bcd_users (name, email, mobile, address, bcd_position, thepassword, dispcolor) VALUES
('Vic', 'pdevhecht@min.com', '6546464', 'Dhaka,Bangladesh', 1, '$2y$10$tm2fNFVC47A5wj7CkLXYxehFTR3WCpOolFCjYedJv7idIzMwQsOp6',	'aqua'),
('Rilee', 'al@min.com', '6546464','Brenda''s phone',3, '$2y$10$tm2fNFVC47A5wj7CkLXYxehFTR3WCpOolFCjYedJv7idIzMwQsOp6','fuchsia'),
('Cora', 'm@mun.com', '646465', 'Bikrom Pur',3, '$2y$10$tm2fNFVC47A5wj7CkLXYxehFTR3WCpOolFCjYedJv7idIzMwQsOp6', 'navy'),
('Tory',	'foysal@yahoo.com', '1234556', 'Dhaka, Bangladesh',2, '$2y$10$tm2fNFVC47A5wj7CkLXYxehFTR3WCpOolFCjYedJv7idIzMwQsOp6', 'olive'),
('Ginger', 'ginger@ginger.com', '12345667',	'Here',3, '$2y$10$tm2fNFVC47A5wj7CkLXYxehFTR3WCpOolFCjYedJv7idIzMwQsOp6', 'red'),
('Bill', 's@hed.com', '987979', 'Khulna, Bangladesh',3, '$2y$10$tm2fNFVC47A5wj7CkLXYxehFTR3WCpOolFCjYedJv7idIzMwQsOp6', 'maroon'),
('Jeremy', 'al@min.com', '6546464', 'Dhaka,Bangladesh', 1,'$2y$10$tm2fNFVC47A5wj7CkLXYxehFTR3WCpOolFCjYedJv7idIzMwQsOp6','gray')


CREATE TABLE IF NOT EXISTS bcd_wks (
    id int(11) NOT NULL,
    dorder int(11),
    dow varchar(9) NOT NULL,
    wname varchar(15) NOT NULL,
    starthour int(11),
    startampm varchar(2),
    endhour int(11),
    endampm varchar(2)
) ;

CREATE TABLE IF NOT EXISTS workshifts (
    id int(11) NOT NULL,
    startwork timestamp,
    endwork timestamp,
    userid int(11),
    shiftloc int(11)
) ;

ALTER TABLE bcdow
    ADD CONSTRAINT bcdow_pkey PRIMARY KEY (id);
ALTER TABLE bcnotes
    ADD CONSTRAINT bcnotes_pkey PRIMARY KEY (id);
ALTER TABLE dates
    ADD CONSTRAINT dates_pkey PRIMARY KEY (id);
ALTER TABLE events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);
ALTER TABLE locs
    ADD CONSTRAINT locs_pkey PRIMARY KEY (id);
ALTER TABLE positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);
ALTER TABLE shifts
    ADD CONSTRAINT shifts_pkey PRIMARY KEY (id);
ALTER TABLE users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
ALTER TABLE wks
    ADD CONSTRAINT wks_pkey PRIMARY KEY (id);
ALTER TABLE workshifts
    ADD CONSTRAINT workshifts_pkey PRIMARY KEY (id);
