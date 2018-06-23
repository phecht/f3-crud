
# Converted with pg2mysql-1.9
# Converted on Fri, 22 Jun 2018 14:23:19 -0400
# Lightbox Technologies Inc. http://www.lightbox.ca


CREATE TABLE IF NOT EXISTS bcdow (
    id int(11) NOT NULL,
    dow varchar(9)
) ;

CREATE TABLE IF NOT EXISTS bcnotes (
    id int(11) NOT NULL,
    datenote date NOT NULL,
    textnote text NOT NULL
) ;

CREATE TABLE IF NOT EXISTS dates (
    id int(11) NOT NULL,
    datename varchar(50) NOT NULL,
    workdate date NOT NULL
) ;

CREATE TABLE IF NOT EXISTS events (
    id int(11) NOT NULL,
    eventname varchar(20),
    eventdate date,
    starttime time,
    duration int(11),
    dashdisplay int(11)
) ;

CREATE TABLE IF NOT EXISTS locs (
    id int(11) NOT NULL,
    locname varchar(32)
) ;

CREATE TABLE IF NOT EXISTS positions (
    id int(11) NOT NULL,
    name varchar(20)
) ;

CREATE TABLE IF NOT EXISTS sales (
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
) ;


CREATE TABLE IF NOT EXISTS users (
    id int(11) NOT NULL,
    name varchar(50) NOT NULL,
    email varchar(150) NOT NULL,
    mobile varchar(20) NOT NULL,
    address varchar(255) NOT NULL,
    `position` int(11),
    thepassword varchar(100),
    dispcolor varchar(20)
) ;

CREATE TABLE IF NOT EXISTS wks (
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
