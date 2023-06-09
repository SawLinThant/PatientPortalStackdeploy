--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: gender_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.gender_enum AS ENUM (
    'male',
    'female'
);


ALTER TYPE public.gender_enum OWNER TO postgres;

--
-- Name: printed_or_drafted_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.printed_or_drafted_enum AS ENUM (
    'printed',
    'drafted'
);


ALTER TYPE public.printed_or_drafted_enum OWNER TO postgres;

--
-- Name: type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.type_enum AS ENUM (
    'issue',
    'receive'
);


ALTER TYPE public.type_enum OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: RefreshToken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RefreshToken" (
    "Token_id" character varying NOT NULL,
    "userName" character varying,
    refresh_token character varying,
    "isActive" boolean
);


ALTER TABLE public."RefreshToken" OWNER TO postgres;

--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    username character varying,
    password character varying,
    role character varying
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: UserLogin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserLogin" (
    "Id" uuid NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    role text NOT NULL
);


ALTER TABLE public."UserLogin" OWNER TO postgres;

--
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO postgres;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: bill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    patient_id integer,
    patient_name character varying NOT NULL,
    patient_phone character varying NOT NULL,
    total_amount integer NOT NULL,
    created_user_id integer,
    updated_user_id integer,
    printed_or_drafted character varying,
    patient_address character varying NOT NULL,
    is_cancelled boolean NOT NULL
);


ALTER TABLE public.bill OWNER TO postgres;

--
-- Name: billitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.billitem (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    sales_service_item_id integer,
    name character varying NOT NULL,
    quantity integer NOT NULL,
    uom character varying,
    price integer NOT NULL,
    subtotal integer NOT NULL,
    remark character varying,
    created_user_id integer,
    updated_user_id integer,
    bill_id integer
);


ALTER TABLE public.billitem OWNER TO postgres;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    name character varying NOT NULL,
    description character varying,
    created_user_id integer,
    updated_user_id integer
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: closingbilldetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.closingbilldetail (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    daily_closing_id integer,
    bill_id integer,
    amount integer,
    created_user_id integer,
    updated_user_id integer
);


ALTER TABLE public.closingbilldetail OWNER TO postgres;

--
-- Name: closingdepositdetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.closingdepositdetail (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    daily_closing_id integer,
    deposit_id integer,
    amount integer,
    created_user_id integer,
    updated_user_id integer
);


ALTER TABLE public.closingdepositdetail OWNER TO postgres;

--
-- Name: dailyclosing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dailyclosing (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    opening_balance integer NOT NULL,
    deposit_total integer NOT NULL,
    bill_total integer NOT NULL,
    grand_total integer NOT NULL,
    actual_amount integer NOT NULL,
    adjusted_amount integer NOT NULL,
    adjusted_reason character varying NOT NULL,
    created_user_id integer,
    updated_user_id integer
);


ALTER TABLE public.dailyclosing OWNER TO postgres;

--
-- Name: deposit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deposit (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    patient_id integer,
    amount integer NOT NULL,
    created_user_id integer,
    updated_user_id integer,
    remark character varying,
    is_cancelled boolean NOT NULL
);


ALTER TABLE public.deposit OWNER TO postgres;

--
-- Name: depositused; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.depositused (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    deposit_id integer,
    payment_id integer,
    created_user_id integer,
    updated_user_id integer,
    unpaid_amount integer NOT NULL,
    deposit_amount integer NOT NULL
);


ALTER TABLE public.depositused OWNER TO postgres;

--
-- Name: inventoryitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventoryitem (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    name character varying NOT NULL,
    balance integer NOT NULL,
    unit character varying NOT NULL,
    purchasing_price integer NOT NULL,
    sales_service_item_id integer,
    expiry_date date,
    batch character varying NOT NULL,
    created_user_id integer,
    updated_user_id integer,
    is_active boolean NOT NULL
);


ALTER TABLE public.inventoryitem OWNER TO postgres;

--
-- Name: inventorytransaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventorytransaction (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    inventory_item_id integer,
    inventory_item_name character varying NOT NULL,
    transaction_type_name character varying NOT NULL,
    quantity integer NOT NULL,
    unit character varying NOT NULL,
    purchasing_price integer NOT NULL,
    selling_price integer NOT NULL,
    note character varying,
    created_user_id integer,
    updated_user_id integer,
    opening_balance integer NOT NULL,
    closing_balance integer NOT NULL,
    transaction_type character varying NOT NULL
);


ALTER TABLE public.inventorytransaction OWNER TO postgres;

--
-- Name: patient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patient (
    id integer NOT NULL,
    name character varying NOT NULL,
    gender character varying,
    date_of_birth date,
    age integer NOT NULL,
    address character varying NOT NULL,
    contact_details character varying NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    created_user_id integer,
    updated_user_id integer
);


ALTER TABLE public.patient OWNER TO postgres;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    bill_id integer,
    total_amount integer NOT NULL,
    total_deposit_amount integer NOT NULL,
    collected_amount integer NOT NULL,
    created_user_id integer,
    updated_user_id integer,
    unpaid_amount integer NOT NULL,
    is_outstanding boolean
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: salesserviceitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salesserviceitem (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    name character varying,
    price integer,
    uom_id integer,
    category_id integer,
    created_user_id integer,
    updated_user_id integer,
    is_active boolean
);


ALTER TABLE public.salesserviceitem OWNER TO postgres;

--
-- Name: transactiontype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactiontype (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    name character varying NOT NULL,
    type character varying NOT NULL,
    created_user_id integer,
    updated_user_id integer
);


ALTER TABLE public.transactiontype OWNER TO postgres;

--
-- Name: uom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uom (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    name character varying NOT NULL,
    description character varying,
    created_user_id integer,
    updated_user_id integer
);


ALTER TABLE public.uom OWNER TO postgres;

--
-- Data for Name: RefreshToken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RefreshToken" ("Token_id", "userName", refresh_token, "isActive") FROM stdin;
1924194698	saw	AMDPInhrzVH98yaMlOjTdJJA7vRAm+XTmLhFt3hC8r4=	t
1785183560	win	ovdlJVQgSS44qphTGlj1TPVgskc1dzVkrFxSUHFDR+c=	t
264755403	Andrew	Q8G8qjjUV7EcnXLqs711LVZR4cF3Pl73FsgZpQY9Pv4=	t
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, username, password, role) FROM stdin;
1	saw	123456	admin
2	win	111111	admin
881	adminstrator	123admin	admin
766	Andrew	1234	Admin
\.


--
-- Data for Name: UserLogin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UserLogin" ("Id", username, password, role) FROM stdin;
3fa85f64-5717-4562-b3fc-2c963f66afa6	saw	123456	admin
\.


--
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
20230318163226_hostpial_api_migration	8.0.0-preview.1.23111.4
20230320162751_UserLogin	8.0.0-preview.1.23111.4
20230321094426_changeColumnName	8.0.0-preview.1.23111.4
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
\.


--
-- Data for Name: bill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bill (id, created_time, updated_time, patient_id, patient_name, patient_phone, total_amount, created_user_id, updated_user_id, printed_or_drafted, patient_address, is_cancelled) FROM stdin;
120	2023-03-25 08:44:34.860416+06:30	2023-03-25 08:45:38.056302+06:30	49	bulk update no2	string	0	0	0	string	string	t
345	2023-03-24 12:41:22.290804+06:30	2023-04-05 04:27:19.846082+06:30	49	dsf	234234	23432	0	0	printed	Yangon	t
364	2023-04-07 05:51:53.980483+06:30	2023-04-07 05:51:53.980546+06:30	49	ss	23432	4000	0	0	drafted	Yangon	t
521	2023-04-07 05:55:47.825276+06:30	2023-04-07 05:55:47.825281+06:30	157	Htet	htet@gmail.com	2000	0	0	drafted	Mandalay	t
284	2023-04-07 13:28:38.350349+06:30	2023-04-07 13:28:38.350364+06:30	49	saw	ff	2000	0	0	drafted	ss	t
770	2023-04-07 13:32:31.993654+06:30	2023-04-07 13:32:31.993654+06:30	49	saw	ff	2000	0	0	drafted	ss	t
348	2023-04-07 13:38:07.154422+06:30	2023-04-07 13:38:07.154422+06:30	49	saw	ff	2000	0	0	drafted	ss	t
936	2023-04-07 13:40:44.857834+06:30	2023-04-07 13:40:44.857834+06:30	49	saw	ff	2000	0	0	drafted	ss	t
924	2023-04-07 13:41:58.201764+06:30	2023-04-07 13:41:58.201764+06:30	49	saw	ff	2000	0	0	drafted	ss	t
408	2023-04-09 06:07:25.677321+06:30	2023-04-09 06:07:25.677336+06:30	920	ko	dd	2000	0	0	drafted	ff	t
\.


--
-- Data for Name: billitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billitem (id, created_time, updated_time, sales_service_item_id, name, quantity, uom, price, subtotal, remark, created_user_id, updated_user_id, bill_id) FROM stdin;
927	2023-03-24 15:49:19.732566+06:30	2023-03-25 15:49:44.400709+06:30	625	u1	700	updated1	700	700	this is updated	0	0	345
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, created_time, updated_time, name, description, created_user_id, updated_user_id) FROM stdin;
1	2023-03-22 21:31:07.651875+06:30	2023-04-05 04:47:56.297072+06:30	cat1	d1	0	0
2	2023-03-22 21:32:35.45486+06:30	2023-04-05 04:48:04.16596+06:30	cat2	d2	0	0
222	2023-04-08 11:22:51.070139+06:30	2023-04-08 05:00:12.510168+06:30	updated category	dfs	1	1
970	2023-04-08 11:30:30.021016+06:30	2023-04-08 11:30:30.021105+06:30	category 123	no description	1	1
\.


--
-- Data for Name: closingbilldetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.closingbilldetail (id, created_time, updated_time, daily_closing_id, bill_id, amount, created_user_id, updated_user_id) FROM stdin;
289	2023-03-24 16:02:58.877851+06:30	2023-03-24 16:02:58.877867+06:30	172	345	32423	0	0
\.


--
-- Data for Name: closingdepositdetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.closingdepositdetail (id, created_time, updated_time, daily_closing_id, deposit_id, amount, created_user_id, updated_user_id) FROM stdin;
374	2023-03-24 16:16:02.335035+06:30	2023-03-24 16:16:02.335049+06:30	172	805	234	0	0
\.


--
-- Data for Name: dailyclosing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dailyclosing (id, created_time, updated_time, opening_balance, deposit_total, bill_total, grand_total, actual_amount, adjusted_amount, adjusted_reason, created_user_id, updated_user_id) FROM stdin;
172	2023-03-24 11:15:09.721063+06:30	2023-03-24 11:18:19.585552+06:30	2342	234	324	55	7770	888	updated	0	0
\.


--
-- Data for Name: deposit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deposit (id, created_time, updated_time, patient_id, amount, created_user_id, updated_user_id, remark, is_cancelled) FROM stdin;
805	2023-03-24 13:01:18.823007+06:30	2023-03-24 13:01:18.823023+06:30	49	234	0	0	fsdg	t
979	2023-04-07 14:41:58.778644+06:30	2023-04-07 14:41:58.778684+06:30	49	2000	0	0	noremark	t
541	2023-04-07 17:45:35.545165+06:30	2023-04-07 17:45:35.545185+06:30	920	2000	0	0	no remark	f
417	2023-04-07 17:45:51.165281+06:30	2023-04-07 17:45:51.165281+06:30	740	3400	0	0	no remark	f
37	2023-04-09 06:06:20.350175+06:30	2023-04-09 06:06:20.350188+06:30	740	9100	0	0	no remark	f
170	2023-04-10 03:03:56.179769+06:30	2023-04-10 03:03:56.179791+06:30	49	10000	0	0	no remark	f
89	2023-04-10 03:04:00.933958+06:30	2023-04-10 03:04:00.933959+06:30	49	10000	0	0	no remark	f
\.


--
-- Data for Name: depositused; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.depositused (id, created_time, updated_time, deposit_id, payment_id, created_user_id, updated_user_id, unpaid_amount, deposit_amount) FROM stdin;
494	2023-03-24 16:47:28.004357+06:30	2023-03-24 16:47:28.004372+06:30	805	342	0	0	44	44
\.


--
-- Data for Name: inventoryitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventoryitem (id, created_time, updated_time, name, balance, unit, purchasing_price, sales_service_item_id, expiry_date, batch, created_user_id, updated_user_id, is_active) FROM stdin;
416	2023-03-24 05:03:02.024017+06:30	2023-04-05 15:52:40.245042+06:30	item1	2330	u1	3333	625	2023-04-05	b1	0	0	t
736	2023-04-08 13:20:16.239834+06:30	2023-04-08 13:20:16.239931+06:30	item 456	3000	2	3000	352	2023-04-08	string	0	0	t
862	2023-04-08 13:20:43.63677+06:30	2023-04-08 13:20:43.636771+06:30	iii	3453	e	435	625	2023-04-08	string	0	0	t
339	2023-04-08 13:24:09.597909+06:30	2023-04-08 13:24:09.597909+06:30	item 100	7000	2	2000	352	2023-04-08	string	0	0	t
346	2023-04-08 13:38:40.094864+06:30	2023-04-08 13:38:40.094864+06:30	i300	456	23	5777	352	2065-06-16	string	0	0	t
924	2023-04-08 13:36:16.019944+06:30	2023-04-08 14:18:03.653241+06:30	r9toi9	353534	e	53453	352	2023-04-07	string	0	0	t
721	2023-04-08 13:29:59.661516+06:30	2023-04-09 04:35:43.059981+06:30	item 200	12000	2	45000	600	2031-01-13	string	0	0	t
\.


--
-- Data for Name: inventorytransaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventorytransaction (id, created_time, updated_time, inventory_item_id, inventory_item_name, transaction_type_name, quantity, unit, purchasing_price, selling_price, note, created_user_id, updated_user_id, opening_balance, closing_balance, transaction_type) FROM stdin;
489	2023-03-24 11:44:03.771483+06:30	2023-03-24 11:44:03.771504+06:30	416	sdf	ds	33	sdf	323	23	sdf	0	0	234	432	sdf
355	2023-04-08 16:19:55.925423+06:30	2023-04-08 16:19:55.925472+06:30	416	item1	t2	35	u1	3333	3000	no note now	0	0	0	0	ddg
\.


--
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patient (id, name, gender, date_of_birth, age, address, contact_details, created_time, updated_time, created_user_id, updated_user_id) FROM stdin;
731	jame g	male	2000-02-21	34	Yangon	0234234	2023-04-10 03:14:36.374524+06:30	2023-04-13 14:43:18.350898+06:30	0	0
465	io	female	1995-04-22	33	Yangon	3453	2023-04-13 13:58:28.031379+06:30	2023-04-13 14:58:13.832344+06:30	0	0
782	saw win	male	1997-04-19	22	Yangon	34534	2023-04-13 13:57:12.754875+06:30	2023-04-13 14:58:27.443631+06:30	0	0
803	ivan	male	1989-08-12	12	Dagon	0234234	2023-04-09 12:58:04.985645+06:30	2023-04-10 13:59:34.377677+06:30	0	0
889	rachel	female	1988-01-18	33	Yangon	342	2023-04-13 07:03:29.570021+06:30	2023-04-13 13:57:42.161735+06:30	0	0
740	jame	female	1999-03-20	33	Mandalay	jame@gmail.com	2023-03-28 12:52:14.815495+06:30	2023-04-13 14:08:30.821189+06:30	0	0
49	saw	male	1991-03-28	22	ss	ff	2023-03-23 12:33:20.952306+06:30	2023-04-13 14:15:20.138051+06:30	0	0
157	Htet	male	1985-08-27	32	Mandalay	htet@gmail.com	2023-03-28 11:55:21.764791+06:30	2023-04-13 14:18:49.941447+06:30	0	0
114	aung	male	2003-01-18	22	Yangon	4353	2023-04-11 02:52:27.90911+06:30	2023-04-13 14:19:13.261183+06:30	0	0
312	joker	male	1999-12-31	30	Yangon	21423	2023-04-13 13:47:09.980202+06:30	2023-04-16 06:55:36.626951+06:30	0	0
920	ko oo	male	2002-03-23	30	pathein	dd	2023-03-23 15:49:54.362214+06:30	2023-04-17 09:19:37.338741+06:30	0	0
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (id, created_time, updated_time, bill_id, total_amount, total_deposit_amount, collected_amount, created_user_id, updated_user_id, unpaid_amount, is_outstanding) FROM stdin;
342	2023-03-24 16:35:34.402957+06:30	2023-03-24 16:35:34.402971+06:30	345	213	231	213	0	0	3543	t
\.


--
-- Data for Name: salesserviceitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.salesserviceitem (id, created_time, updated_time, name, price, uom_id, category_id, created_user_id, updated_user_id, is_active) FROM stdin;
352	2023-04-08 08:27:30.799438+06:30	2023-04-08 08:27:30.799454+06:30	sitem2	2550	5	2	0	0	t
625	2023-03-24 07:30:54.127756+06:30	2023-04-08 08:36:11.509405+06:30	s item1	3000	1	1	0	0	t
600	2023-04-08 08:42:23.923313+06:30	2023-04-08 08:42:33.196471+06:30	sitem3	300	5	970	0	0	t
\.


--
-- Data for Name: transactiontype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactiontype (id, created_time, updated_time, name, type, created_user_id, updated_user_id) FROM stdin;
64	2023-03-24 06:43:17.32478+06:30	2023-04-08 17:28:00.556861+06:30	t3	issue	0	0
87	2023-03-24 06:43:10.034921+06:30	2023-04-08 17:28:08.115324+06:30	t2	receive	0	0
40	2023-04-08 17:28:23.542733+06:30	2023-04-09 16:02:09.808273+06:30	t6	issue	0	0
\.


--
-- Data for Name: uom; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uom (id, created_time, updated_time, name, description, created_user_id, updated_user_id) FROM stdin;
1	2023-03-21 21:00:00+06:30	2023-03-21 21:00:00+06:30	uom1	no desciption	1	1
4	2023-03-22 21:10:01.965205+06:30	2023-03-22 21:10:01.965237+06:30	uom4	desc4	0	0
5	2023-03-22 21:25:32.932626+06:30	2023-03-22 21:25:32.93263+06:30	uom5	desc5	0	0
805	2023-04-08 11:02:28.019973+06:30	2023-04-08 11:02:28.020072+06:30	uu	greg	1	1
215	2023-04-08 11:06:43.236727+06:30	2023-04-08 11:06:43.236732+06:30	uom34	this is uom 34	1	1
2	2023-03-22 20:18:45.112916+06:30	2023-04-08 04:39:34.930067+06:30	uom2	uom2 is now updated	2	2
3	2023-03-22 20:03:59.805458+06:30	2023-04-08 04:40:02.77322+06:30	UOM3	u3 	3	3
670	2023-04-16 14:22:16.808932+06:30	2023-04-16 14:22:16.808994+06:30	UOMname	This is description	1	1
\.


--
-- Name: UserLogin PK_UserLogin; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserLogin"
    ADD CONSTRAINT "PK_UserLogin" PRIMARY KEY ("Id");


--
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- Name: RefreshToken RefreshToken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RefreshToken"
    ADD CONSTRAINT "RefreshToken_pkey" PRIMARY KEY ("Token_id");


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: alembic_version alembic_version_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkey PRIMARY KEY (version_num);


--
-- Name: bill bill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_pkey PRIMARY KEY (id);


--
-- Name: billitem billitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billitem
    ADD CONSTRAINT billitem_pkey PRIMARY KEY (id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: closingbilldetail closingbilldetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.closingbilldetail
    ADD CONSTRAINT closingbilldetail_pkey PRIMARY KEY (id);


--
-- Name: closingdepositdetail closingdepositdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.closingdepositdetail
    ADD CONSTRAINT closingdepositdetail_pkey PRIMARY KEY (id);


--
-- Name: dailyclosing dailyclosing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dailyclosing
    ADD CONSTRAINT dailyclosing_pkey PRIMARY KEY (id);


--
-- Name: deposit deposit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit
    ADD CONSTRAINT deposit_pkey PRIMARY KEY (id);


--
-- Name: depositused depositused_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depositused
    ADD CONSTRAINT depositused_pkey PRIMARY KEY (id);


--
-- Name: inventoryitem inventoryitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventoryitem
    ADD CONSTRAINT inventoryitem_pkey PRIMARY KEY (id);


--
-- Name: inventorytransaction inventorytransaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventorytransaction
    ADD CONSTRAINT inventorytransaction_pkey PRIMARY KEY (id);


--
-- Name: patient patient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: salesserviceitem salesserviceitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salesserviceitem
    ADD CONSTRAINT salesserviceitem_pkey PRIMARY KEY (id);


--
-- Name: transactiontype transactiontype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactiontype
    ADD CONSTRAINT transactiontype_pkey PRIMARY KEY (id);


--
-- Name: uom uom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uom
    ADD CONSTRAINT uom_pkey PRIMARY KEY (id);


--
-- Name: fki_salesserviceitem_category_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_salesserviceitem_category_id_fkey ON public.salesserviceitem USING btree (category_id);


--
-- Name: bill bill_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patient(id) NOT VALID;


--
-- Name: billitem billitem_bill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billitem
    ADD CONSTRAINT billitem_bill_id_fkey FOREIGN KEY (bill_id) REFERENCES public.bill(id) NOT VALID;


--
-- Name: billitem billitem_sales_service_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billitem
    ADD CONSTRAINT billitem_sales_service_item_id_fkey FOREIGN KEY (sales_service_item_id) REFERENCES public.salesserviceitem(id) NOT VALID;


--
-- Name: closingbilldetail closingbilldetail_bill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.closingbilldetail
    ADD CONSTRAINT closingbilldetail_bill_id_fkey FOREIGN KEY (bill_id) REFERENCES public.bill(id) NOT VALID;


--
-- Name: closingbilldetail closingbilldetail_daily_closing_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.closingbilldetail
    ADD CONSTRAINT closingbilldetail_daily_closing_id_fkey FOREIGN KEY (daily_closing_id) REFERENCES public.dailyclosing(id) NOT VALID;


--
-- Name: closingdepositdetail closingdepositdetail_daily_closing_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.closingdepositdetail
    ADD CONSTRAINT closingdepositdetail_daily_closing_id_fkey FOREIGN KEY (daily_closing_id) REFERENCES public.dailyclosing(id) NOT VALID;


--
-- Name: closingdepositdetail closingdepositdetail_deposit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.closingdepositdetail
    ADD CONSTRAINT closingdepositdetail_deposit_id_fkey FOREIGN KEY (deposit_id) REFERENCES public.deposit(id) NOT VALID;


--
-- Name: deposit deposit_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit
    ADD CONSTRAINT deposit_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patient(id) NOT VALID;


--
-- Name: depositused depositused_deposit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depositused
    ADD CONSTRAINT depositused_deposit_id_fkey FOREIGN KEY (deposit_id) REFERENCES public.deposit(id) NOT VALID;


--
-- Name: depositused depositused_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depositused
    ADD CONSTRAINT depositused_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payment(id) NOT VALID;


--
-- Name: inventorytransaction inventorytransaction_inventory_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventorytransaction
    ADD CONSTRAINT inventorytransaction_inventory_item_id_fkey FOREIGN KEY (inventory_item_id) REFERENCES public.inventoryitem(id) NOT VALID;


--
-- Name: payment payment_bill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_bill_id_fkey FOREIGN KEY (bill_id) REFERENCES public.bill(id) NOT VALID;


--
-- Name: salesserviceitem salesserviceitem_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salesserviceitem
    ADD CONSTRAINT salesserviceitem_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id) NOT VALID;


--
-- Name: salesserviceitem salesserviceitem_uom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salesserviceitem
    ADD CONSTRAINT salesserviceitem_uom_id_fkey FOREIGN KEY (uom_id) REFERENCES public.uom(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

