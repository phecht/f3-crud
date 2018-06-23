--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Ubuntu 10.4-2.pgdg14.04+1)
-- Dumped by pg_dump version 10.4 (Ubuntu 10.4-2.pgdg16.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: tablefunc; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;


--
-- Name: EXTENSION tablefunc; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';


--
-- Name: workshift_detail_name_vw_dml(); Type: FUNCTION; Schema: public; Owner: pshnyysokpitwg
--

CREATE FUNCTION public.workshift_detail_name_vw_dml() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.workshift_detail_name_vw_dml() OWNER TO pshnyysokpitwg;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bcdow; Type: TABLE; Schema: public; Owner: pshnyysokpitwg
--

CREATE TABLE public.bcdow (
    id integer NOT NULL,
    dow character varying(9)
);


ALTER TABLE public.bcdow OWNER TO pshnyysokpitwg;

--
-- Name: bcdow_id_seq; Type: SEQUENCE; Schema: public; Owner: pshnyysokpitwg
--

CREATE SEQUENCE public.bcdow_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bcdow_id_seq OWNER TO pshnyysokpitwg;

--
-- Name: bcdow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pshnyysokpitwg
--

ALTER SEQUENCE public.bcdow_id_seq OWNED BY public.bcdow.id;


--
-- Name: bcnotes; Type: TABLE; Schema: public; Owner: pshnyysokpitwg
--

CREATE TABLE public.bcnotes (
    id integer NOT NULL,
    datenote date NOT NULL,
    textnote text NOT NULL
);


ALTER TABLE public.bcnotes OWNER TO pshnyysokpitwg;

--
-- Name: bcnotes_id_seq; Type: SEQUENCE; Schema: public; Owner: pshnyysokpitwg
--

CREATE SEQUENCE public.bcnotes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bcnotes_id_seq OWNER TO pshnyysokpitwg;

--
-- Name: bcnotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pshnyysokpitwg
--

ALTER SEQUENCE public.bcnotes_id_seq OWNED BY public.bcnotes.id;


--
-- Name: dates; Type: TABLE; Schema: public; Owner: pshnyysokpitwg
--

CREATE TABLE public.dates (
    id integer NOT NULL,
    datename character varying(50) NOT NULL,
    workdate date NOT NULL
);


ALTER TABLE public.dates OWNER TO pshnyysokpitwg;

--
-- Name: dates_id_seq; Type: SEQUENCE; Schema: public; Owner: pshnyysokpitwg
--

CREATE SEQUENCE public.dates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dates_id_seq OWNER TO pshnyysokpitwg;

--
-- Name: dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pshnyysokpitwg
--

ALTER SEQUENCE public.dates_id_seq OWNED BY public.dates.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: pshnyysokpitwg
--

CREATE TABLE public.events (
    id integer NOT NULL,
    eventname character varying(20),
    eventdate date,
    starttime time without time zone,
    duration integer,
    dashdisplay integer,
    CONSTRAINT lazybool CHECK (((dashdisplay >= 0) AND (dashdisplay <= 1)))
);


ALTER TABLE public.events OWNER TO pshnyysokpitwg;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: pshnyysokpitwg
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO pshnyysokpitwg;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pshnyysokpitwg
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: locs; Type: TABLE; Schema: public; Owner: pshnyysokpitwg
--

CREATE TABLE public.locs (
    id integer NOT NULL,
    locname character(32)
);


ALTER TABLE public.locs OWNER TO pshnyysokpitwg;

--
-- Name: locs_id_seq; Type: SEQUENCE; Schema: public; Owner: pshnyysokpitwg
--

CREATE SEQUENCE public.locs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locs_id_seq OWNER TO pshnyysokpitwg;

--
-- Name: locs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pshnyysokpitwg
--

ALTER SEQUENCE public.locs_id_seq OWNED BY public.locs.id;


--
-- Name: positions; Type: TABLE; Schema: public; Owner: pshnyysokpitwg
--

CREATE TABLE public.positions (
    id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.positions OWNER TO pshnyysokpitwg;

--
-- Name: positions_id_seq; Type: SEQUENCE; Schema: public; Owner: pshnyysokpitwg
--

CREATE SEQUENCE public.positions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.positions_id_seq OWNER TO pshnyysokpitwg;

--
-- Name: positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pshnyysokpitwg
--

ALTER SEQUENCE public.positions_id_seq OWNED BY public.positions.id;


--
-- Name: sales; Type: TABLE; Schema: public; Owner: pshnyysokpitwg
--

CREATE TABLE public.sales (
    year integer,
    month integer,
    qty integer
);


ALTER TABLE public.sales OWNER TO pshnyysokpitwg;

--
-- Name: shifts; Type: TABLE; Schema: public; Owner: pshnyysokpitwg
--

CREATE TABLE public.shifts (
    id integer NOT NULL,
    shiftname character varying(50) NOT NULL,
    shiftstart time without time zone NOT NULL,
    shiftstop time without time zone NOT NULL,
    empcount integer
);


ALTER TABLE public.shifts OWNER TO pshnyysokpitwg;

--
-- Name: shifts_id_seq; Type: SEQUENCE; Schema: public; Owner: pshnyysokpitwg
--

CREATE SEQUENCE public.shifts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shifts_id_seq OWNER TO pshnyysokpitwg;

--
-- Name: shifts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pshnyysokpitwg
--

ALTER SEQUENCE public.shifts_id_seq OWNED BY public.shifts.id;


--
-- Name: t; Type: TABLE; Schema: public; Owner: pshnyysokpitwg
--

CREATE TABLE public.t (
    section character(1),
    status character varying(10),
    count integer
);


ALTER TABLE public.t OWNER TO pshnyysokpitwg;

--
-- Name: users; Type: TABLE; Schema: public; Owner: pshnyysokpitwg
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(150) NOT NULL,
    mobile character varying(20) NOT NULL,
    address character varying(255) NOT NULL,
    "position" integer,
    thepassword character varying(100),
    dispcolor character varying(20)
);


ALTER TABLE public.users OWNER TO pshnyysokpitwg;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: pshnyysokpitwg
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO pshnyysokpitwg;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pshnyysokpitwg
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: wks; Type: TABLE; Schema: public; Owner: pshnyysokpitwg
--

CREATE TABLE public.wks (
    id integer NOT NULL,
    dorder integer,
    dow character varying(9) NOT NULL,
    wname character varying(15) NOT NULL,
    starthour integer,
    startampm character(2),
    endhour integer,
    endampm character(2),
    CONSTRAINT wks_endampm_check CHECK ((endampm = ANY (ARRAY['AM'::bpchar, 'PM'::bpchar]))),
    CONSTRAINT wks_startampm_check CHECK ((startampm = ANY (ARRAY['AM'::bpchar, 'PM'::bpchar])))
);


ALTER TABLE public.wks OWNER TO pshnyysokpitwg;

--
-- Name: wks_id_seq; Type: SEQUENCE; Schema: public; Owner: pshnyysokpitwg
--

CREATE SEQUENCE public.wks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wks_id_seq OWNER TO pshnyysokpitwg;

--
-- Name: wks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pshnyysokpitwg
--

ALTER SEQUENCE public.wks_id_seq OWNED BY public.wks.id;


--
-- Name: workshifts; Type: TABLE; Schema: public; Owner: pshnyysokpitwg
--

CREATE TABLE public.workshifts (
    id integer NOT NULL,
    startwork timestamp without time zone,
    endwork timestamp without time zone,
    userid integer,
    shiftloc integer,
    CONSTRAINT endworkafter CHECK ((endwork > startwork))
);


ALTER TABLE public.workshifts OWNER TO pshnyysokpitwg;

--
-- Name: workshift_user_vw; Type: VIEW; Schema: public; Owner: pshnyysokpitwg
--

CREATE VIEW public.workshift_user_vw AS
 SELECT w.id,
    w.startwork,
    w.endwork,
    w.userid,
    u.name
   FROM (public.workshifts w
     LEFT JOIN public.users u ON ((u.id = w.userid)));


ALTER TABLE public.workshift_user_vw OWNER TO pshnyysokpitwg;

--
-- Name: workshift_pre_vw; Type: VIEW; Schema: public; Owner: pshnyysokpitwg
--

CREATE VIEW public.workshift_pre_vw AS
 SELECT date_part('month'::text, workshift_user_vw.startwork) AS month,
    date_part('day'::text, workshift_user_vw.startwork) AS day,
    date_part('hour'::text, workshift_user_vw.startwork) AS starthour,
    workshift_user_vw.name
   FROM public.workshift_user_vw
  ORDER BY workshift_user_vw.startwork;


ALTER TABLE public.workshift_pre_vw OWNER TO pshnyysokpitwg;

--
-- Name: workshifts_id_seq; Type: SEQUENCE; Schema: public; Owner: pshnyysokpitwg
--

CREATE SEQUENCE public.workshifts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workshifts_id_seq OWNER TO pshnyysokpitwg;

--
-- Name: workshifts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pshnyysokpitwg
--

ALTER SEQUENCE public.workshifts_id_seq OWNED BY public.workshifts.id;


--
-- Name: ws; Type: VIEW; Schema: public; Owner: pshnyysokpitwg
--

CREATE VIEW public.ws AS
 SELECT w.id,
    w.startwork,
    w.endwork,
    u.name
   FROM (public.workshifts w
     LEFT JOIN public.users u USING (id));


ALTER TABLE public.ws OWNER TO pshnyysokpitwg;

--
-- Name: bcdow id; Type: DEFAULT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.bcdow ALTER COLUMN id SET DEFAULT nextval('public.bcdow_id_seq'::regclass);


--
-- Name: bcnotes id; Type: DEFAULT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.bcnotes ALTER COLUMN id SET DEFAULT nextval('public.bcnotes_id_seq'::regclass);


--
-- Name: dates id; Type: DEFAULT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.dates ALTER COLUMN id SET DEFAULT nextval('public.dates_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: locs id; Type: DEFAULT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.locs ALTER COLUMN id SET DEFAULT nextval('public.locs_id_seq'::regclass);


--
-- Name: positions id; Type: DEFAULT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.positions ALTER COLUMN id SET DEFAULT nextval('public.positions_id_seq'::regclass);


--
-- Name: shifts id; Type: DEFAULT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.shifts ALTER COLUMN id SET DEFAULT nextval('public.shifts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: wks id; Type: DEFAULT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.wks ALTER COLUMN id SET DEFAULT nextval('public.wks_id_seq'::regclass);


--
-- Name: workshifts id; Type: DEFAULT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.workshifts ALTER COLUMN id SET DEFAULT nextval('public.workshifts_id_seq'::regclass);


--
-- Data for Name: bcdow; Type: TABLE DATA; Schema: public; Owner: pshnyysokpitwg
--

COPY public.bcdow (id, dow) FROM stdin;
1	Sunday
2	Monday
3	Tuesday
4	Wednesday
5	Thursday
6	Friday
7	Saturday
\.


--
-- Data for Name: bcnotes; Type: TABLE DATA; Schema: public; Owner: pshnyysokpitwg
--

COPY public.bcnotes (id, datenote, textnote) FROM stdin;
1	2018-06-18	First note
2	2018-06-18	Second note
\.


--
-- Data for Name: dates; Type: TABLE DATA; Schema: public; Owner: pshnyysokpitwg
--

COPY public.dates (id, datename, workdate) FROM stdin;
4	Wednesday April 11	2018-04-11
5	Thursday April 12	2018-04-12
6	Friday April 13	2018-04-13
8	Saturday 14, 2018	2018-04-14
1	Sunday April 18	2018-04-18
3	Friday April 20	2018-04-20
9	Saturday April 21	2018-04-21
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: pshnyysokpitwg
--

COPY public.events (id, eventname, eventdate, starttime, duration, dashdisplay) FROM stdin;
6	Worldcup	2018-06-15	06:00:00	5	1
2	ElvisBirthday	2019-01-08	19:00:00	5	1
5	NewEvent	2019-09-09	14:00:00	3	1
1	Derby	2018-05-05	16:03:00	3	0
\.


--
-- Data for Name: locs; Type: TABLE DATA; Schema: public; Owner: pshnyysokpitwg
--

COPY public.locs (id, locname) FROM stdin;
1	Barcar                          
2	BCKitchen                       
3	TheOwl                          
\.


--
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: pshnyysokpitwg
--

COPY public.positions (id, name) FROM stdin;
1	Owner
2	Manager
5	BarBack
3	Bartender
4	KitchenStaff
\.


--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: pshnyysokpitwg
--

COPY public.sales (year, month, qty) FROM stdin;
2007	1	1000
2007	2	1500
2007	7	500
2007	11	1500
2007	12	2000
2008	1	1000
2009	5	2500
2009	9	800
\.


--
-- Data for Name: shifts; Type: TABLE DATA; Schema: public; Owner: pshnyysokpitwg
--

COPY public.shifts (id, shiftname, shiftstart, shiftstop, empcount) FROM stdin;
1	Weekday	14:00:00	18:00:00	1
2	Weeknight	18:00:00	02:00:00	1
3	Friday	13:00:00	18:00:00	1
4	FridayNight	18:00:00	03:00:00	2
5	Saturday	13:00:00	18:00:00	1
6	SaturdayNight	18:00:00	03:00:00	2
7	Sunday	13:00:00	18:00:00	1
8	SundayNight	18:00:00	03:00:00	2
\.


--
-- Data for Name: t; Type: TABLE DATA; Schema: public; Owner: pshnyysokpitwg
--

COPY public.t (section, status, count) FROM stdin;
A	Active	1
A	Inactive	2
B	Active	4
B	Inactive	5
B	Sat	3
C	Sat	3
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: pshnyysokpitwg
--

COPY public.users (id, name, email, mobile, address, "position", thepassword, dispcolor) FROM stdin;
14	Vic	pdevhecht@min.com	6546464	Dhaka,Bangladesh	\N	$2y$10$tm2fNFVC47A5wj7CkLXYxehFTR3WCpOolFCjYedJv7idIzMwQsOp6	aqua
1	Rilee	al@min.com	6546464	Brenda's phone	\N	$2y$10$tm2fNFVC47A5wj7CkLXYxehFTR3WCpOolFCjYedJv7idIzMwQsOp6	fuchsia
8	Cora	m@mun.com	646465	Bikrom Pur	\N	$2y$10$tm2fNFVC47A5wj7CkLXYxehFTR3WCpOolFCjYedJv7idIzMwQsOp6	navy
4	Tory	foysal@yahoo.com	1234556	Dhaka, Bangladesh.	\N	$2y$10$tm2fNFVC47A5wj7CkLXYxehFTR3WCpOolFCjYedJv7idIzMwQsOp6	olive
13	Ginger	ginger@ginger.com	12345667	Here	\N	$2y$10$tm2fNFVC47A5wj7CkLXYxehFTR3WCpOolFCjYedJv7idIzMwQsOp6	red
7	Bill	s@hed.com	987979	Khulna, Bangladesh	\N	$2y$10$tm2fNFVC47A5wj7CkLXYxehFTR3WCpOolFCjYedJv7idIzMwQsOp6	maroon
6	Jeremy	al@min.com	6546464	Dhaka,Bangladesh	\N	$2y$10$tm2fNFVC47A5wj7CkLXYxehFTR3WCpOolFCjYedJv7idIzMwQsOp6	gray
\.


--
-- Data for Name: wks; Type: TABLE DATA; Schema: public; Owner: pshnyysokpitwg
--

COPY public.wks (id, dorder, dow, wname, starthour, startampm, endhour, endampm) FROM stdin;
4	1	Monday	Bill	2	PM	7	PM
5	1	Monday	Rilee	7	PM	2	AM
6	2	Tuesday	Bill	2	PM	2	AM
7	3	Wednesday	Rilee	2	PM	7	PM
8	3	Wednesday	Cora	7	PM	2	AM
9	4	Thursday	Vic	2	PM	7	PM
10	4	Thursday	Bill	7	PM	2	AM
11	4	Thursday	Tory	7	PM	2	AM
12	5	Friday	Jeremy	2	PM	7	PM
13	5	Friday	Tory	5	PM	1	AM
14	5	Friday	Bill	7	PM	2	AM
15	6	Saturday	Ginger	10	AM	3	PM
16	6	Saturday	Cora	3	PM	7	PM
17	6	Saturday	Tory	7	PM	1	AM
18	6	Saturday	Rilee	8	PM	2	AM
19	7	Sunday	Ginger	10	AM	3	PM
20	7	Sunday	Cora	3	PM	7	PM
21	7	Sunday	Rilee	7	PM	2	AM
\.


--
-- Data for Name: workshifts; Type: TABLE DATA; Schema: public; Owner: pshnyysokpitwg
--

COPY public.workshifts (id, startwork, endwork, userid, shiftloc) FROM stdin;
6	2018-04-26 21:00:00	2018-04-28 02:00:00	4	\N
2	2018-04-25 21:00:00	2018-04-26 02:00:00	7	\N
3	2018-04-26 15:00:00	2018-04-26 21:00:00	1	\N
4	2018-04-26 21:00:00	2018-04-27 02:00:00	8	\N
5	2018-04-27 15:00:00	2018-04-27 21:00:00	6	\N
1	2018-04-25 15:00:00	2018-04-25 21:00:00	4	\N
10	2018-04-26 15:00:00	2018-04-26 23:00:00	13	\N
8	2018-04-26 15:00:00	2018-04-26 23:20:00	4	\N
11	2018-04-26 13:00:00	2018-04-26 17:00:00	1	\N
9	2018-04-18 18:00:00	2018-04-19 00:00:00	14	2
12	\N	\N	4	\N
13	2018-04-25 15:00:00	2018-04-25 21:00:00	4	\N
14	2018-04-25 15:00:00	2018-04-25 21:00:00	4	\N
\.


--
-- Name: bcdow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pshnyysokpitwg
--

SELECT pg_catalog.setval('public.bcdow_id_seq', 7, true);


--
-- Name: bcnotes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pshnyysokpitwg
--

SELECT pg_catalog.setval('public.bcnotes_id_seq', 2, true);


--
-- Name: dates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pshnyysokpitwg
--

SELECT pg_catalog.setval('public.dates_id_seq', 9, true);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pshnyysokpitwg
--

SELECT pg_catalog.setval('public.events_id_seq', 6, true);


--
-- Name: locs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pshnyysokpitwg
--

SELECT pg_catalog.setval('public.locs_id_seq', 3, true);


--
-- Name: positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pshnyysokpitwg
--

SELECT pg_catalog.setval('public.positions_id_seq', 5, true);


--
-- Name: shifts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pshnyysokpitwg
--

SELECT pg_catalog.setval('public.shifts_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pshnyysokpitwg
--

SELECT pg_catalog.setval('public.users_id_seq', 14, true);


--
-- Name: wks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pshnyysokpitwg
--

SELECT pg_catalog.setval('public.wks_id_seq', 21, true);


--
-- Name: workshifts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pshnyysokpitwg
--

SELECT pg_catalog.setval('public.workshifts_id_seq', 14, true);


--
-- Name: bcdow bcdow_pkey; Type: CONSTRAINT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.bcdow
    ADD CONSTRAINT bcdow_pkey PRIMARY KEY (id);


--
-- Name: bcnotes bcnotes_pkey; Type: CONSTRAINT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.bcnotes
    ADD CONSTRAINT bcnotes_pkey PRIMARY KEY (id);


--
-- Name: dates dates_pkey; Type: CONSTRAINT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.dates
    ADD CONSTRAINT dates_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: locs locs_pkey; Type: CONSTRAINT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.locs
    ADD CONSTRAINT locs_pkey PRIMARY KEY (id);


--
-- Name: positions positions_pkey; Type: CONSTRAINT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);


--
-- Name: shifts shifts_pkey; Type: CONSTRAINT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.shifts
    ADD CONSTRAINT shifts_pkey PRIMARY KEY (id);


--
-- Name: users uniquename; Type: CONSTRAINT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uniquename UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: wks wks_pkey; Type: CONSTRAINT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.wks
    ADD CONSTRAINT wks_pkey PRIMARY KEY (id);


--
-- Name: workshifts workshifts_pkey; Type: CONSTRAINT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.workshifts
    ADD CONSTRAINT workshifts_pkey PRIMARY KEY (id);


--
-- Name: workshift_user_vw workshift_user_vw_dml_trig; Type: TRIGGER; Schema: public; Owner: pshnyysokpitwg
--

CREATE TRIGGER workshift_user_vw_dml_trig INSTEAD OF INSERT OR DELETE OR UPDATE ON public.workshift_user_vw FOR EACH ROW EXECUTE PROCEDURE public.workshift_detail_name_vw_dml();


--
-- Name: users users_position_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_position_fkey FOREIGN KEY ("position") REFERENCES public.positions(id);


--
-- Name: users users_position_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_position_fkey1 FOREIGN KEY ("position") REFERENCES public.positions(id);


--
-- Name: workshifts workshifts_shiftloc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.workshifts
    ADD CONSTRAINT workshifts_shiftloc_fkey FOREIGN KEY (shiftloc) REFERENCES public.locs(id);


--
-- Name: workshifts workshifts_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pshnyysokpitwg
--

ALTER TABLE ONLY public.workshifts
    ADD CONSTRAINT workshifts_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pshnyysokpitwg
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO pshnyysokpitwg;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO pshnyysokpitwg;


--
-- PostgreSQL database dump complete
--

