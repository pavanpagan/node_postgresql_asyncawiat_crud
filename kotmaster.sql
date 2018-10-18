--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: billing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.billing (
    billing_id integer NOT NULL,
    billing_amount double precision,
    billing_status character varying(255),
    tax integer,
    date_time timestamp without time zone,
    total_amount double precision
);


ALTER TABLE public.billing OWNER TO postgres;

--
-- Name: billing_billing_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.billing_billing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.billing_billing_id_seq OWNER TO postgres;

--
-- Name: billing_billing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.billing_billing_id_seq OWNED BY public.billing.billing_id;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    employee_name character varying(255),
    employee_email character varying(255),
    gender character varying(255),
    employee_phone bigint,
    employee_address character varying(255),
    employee_role integer
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_employee_id_seq OWNER TO postgres;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_employee_id_seq OWNED BY public.employee.employee_id;


--
-- Name: item_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_category (
    category_id integer NOT NULL,
    category_name character varying(255),
    t_id integer
);


ALTER TABLE public.item_category OWNER TO postgres;

--
-- Name: item_category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_category_category_id_seq OWNER TO postgres;

--
-- Name: item_category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_category_category_id_seq OWNED BY public.item_category.category_id;


--
-- Name: item_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_type (
    type_id integer NOT NULL,
    type_name character varying(255)
);


ALTER TABLE public.item_type OWNER TO postgres;

--
-- Name: item_type_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_type_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_type_type_id_seq OWNER TO postgres;

--
-- Name: item_type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_type_type_id_seq OWNED BY public.item_type.type_id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    item_id integer NOT NULL,
    item_name character varying(255),
    item_desc character varying(255),
    item_status character varying(255),
    c_id integer,
    image character varying(255)
);


ALTER TABLE public.items OWNER TO postgres;

--
-- Name: items_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_item_id_seq OWNER TO postgres;

--
-- Name: items_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_item_id_seq OWNED BY public.items.item_id;


--
-- Name: kot_itemlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kot_itemlist (
    kotitem_id integer NOT NULL,
    o_id integer,
    it_id integer,
    quantity integer,
    price double precision
);


ALTER TABLE public.kot_itemlist OWNER TO postgres;

--
-- Name: kot_itemlist_kotitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kot_itemlist_kotitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kot_itemlist_kotitem_id_seq OWNER TO postgres;

--
-- Name: kot_itemlist_kotitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kot_itemlist_kotitem_id_seq OWNED BY public.kot_itemlist.kotitem_id;


--
-- Name: order_kot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_kot (
    order_id integer NOT NULL,
    bill_id integer,
    tab_id integer,
    date_time timestamp without time zone,
    order_status character varying(255),
    status character varying(255),
    e_id integer
);


ALTER TABLE public.order_kot OWNER TO postgres;

--
-- Name: order_kot_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_kot_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_kot_order_id_seq OWNER TO postgres;

--
-- Name: order_kot_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_kot_order_id_seq OWNED BY public.order_kot.order_id;


--
-- Name: prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prices (
    price_id integer NOT NULL,
    price double precision,
    date_time timestamp without time zone,
    i_id integer
);


ALTER TABLE public.prices OWNER TO postgres;

--
-- Name: prices_price_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prices_price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prices_price_id_seq OWNER TO postgres;

--
-- Name: prices_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prices_price_id_seq OWNED BY public.prices.price_id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    role_id integer NOT NULL,
    role_name character varying(255)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_role_id_seq OWNER TO postgres;

--
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_role_id_seq OWNED BY public.role.role_id;


--
-- Name: tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tables (
    table_id integer NOT NULL,
    table_status character varying(255),
    table_number integer,
    emp_id integer,
    capacity integer
);


ALTER TABLE public.tables OWNER TO postgres;

--
-- Name: tables_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tables_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tables_table_id_seq OWNER TO postgres;

--
-- Name: tables_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tables_table_id_seq OWNED BY public.tables.table_id;


--
-- Name: tax; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax (
    tax_id integer NOT NULL,
    start_price integer,
    end_price integer,
    tax_amount integer,
    date_time timestamp without time zone
);


ALTER TABLE public.tax OWNER TO postgres;

--
-- Name: tax_tax_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tax_tax_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tax_tax_id_seq OWNER TO postgres;

--
-- Name: tax_tax_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tax_tax_id_seq OWNED BY public.tax.tax_id;


--
-- Name: billing_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing ALTER COLUMN billing_id SET DEFAULT nextval('public.billing_billing_id_seq'::regclass);


--
-- Name: employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN employee_id SET DEFAULT nextval('public.employee_employee_id_seq'::regclass);


--
-- Name: category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_category ALTER COLUMN category_id SET DEFAULT nextval('public.item_category_category_id_seq'::regclass);


--
-- Name: type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_type ALTER COLUMN type_id SET DEFAULT nextval('public.item_type_type_id_seq'::regclass);


--
-- Name: item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN item_id SET DEFAULT nextval('public.items_item_id_seq'::regclass);


--
-- Name: kotitem_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kot_itemlist ALTER COLUMN kotitem_id SET DEFAULT nextval('public.kot_itemlist_kotitem_id_seq'::regclass);


--
-- Name: order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_kot ALTER COLUMN order_id SET DEFAULT nextval('public.order_kot_order_id_seq'::regclass);


--
-- Name: price_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prices ALTER COLUMN price_id SET DEFAULT nextval('public.prices_price_id_seq'::regclass);


--
-- Name: role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN role_id SET DEFAULT nextval('public.role_role_id_seq'::regclass);


--
-- Name: table_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables ALTER COLUMN table_id SET DEFAULT nextval('public.tables_table_id_seq'::regclass);


--
-- Name: tax_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax ALTER COLUMN tax_id SET DEFAULT nextval('public.tax_tax_id_seq'::regclass);


--
-- Data for Name: billing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billing (billing_id, billing_amount, billing_status, tax, date_time, total_amount) FROM stdin;
\.


--
-- Name: billing_billing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.billing_billing_id_seq', 1, false);


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employee_id, employee_name, employee_email, gender, employee_phone, employee_address, employee_role) FROM stdin;
\.


--
-- Name: employee_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_employee_id_seq', 1, false);


--
-- Data for Name: item_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_category (category_id, category_name, t_id) FROM stdin;
\.


--
-- Name: item_category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_category_category_id_seq', 27, true);


--
-- Data for Name: item_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_type (type_id, type_name) FROM stdin;
7	veg
8	Nonveg
\.


--
-- Name: item_type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_type_type_id_seq', 8, true);


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (item_id, item_name, item_desc, item_status, c_id, image) FROM stdin;
\.


--
-- Name: items_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_item_id_seq', 36, true);


--
-- Data for Name: kot_itemlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kot_itemlist (kotitem_id, o_id, it_id, quantity, price) FROM stdin;
\.


--
-- Name: kot_itemlist_kotitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kot_itemlist_kotitem_id_seq', 1, false);


--
-- Data for Name: order_kot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_kot (order_id, bill_id, tab_id, date_time, order_status, status, e_id) FROM stdin;
\.


--
-- Name: order_kot_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_kot_order_id_seq', 1, false);


--
-- Data for Name: prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prices (price_id, price, date_time, i_id) FROM stdin;
\.


--
-- Name: prices_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prices_price_id_seq', 16, true);


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (role_id, role_name) FROM stdin;
\.


--
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_role_id_seq', 1, false);


--
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tables (table_id, table_status, table_number, emp_id, capacity) FROM stdin;
\.


--
-- Name: tables_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tables_table_id_seq', 1, false);


--
-- Data for Name: tax; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax (tax_id, start_price, end_price, tax_amount, date_time) FROM stdin;
\.


--
-- Name: tax_tax_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tax_tax_id_seq', 1, false);


--
-- Name: billing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing
    ADD CONSTRAINT billing_pkey PRIMARY KEY (billing_id);


--
-- Name: employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);


--
-- Name: item_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_category
    ADD CONSTRAINT item_category_pkey PRIMARY KEY (category_id);


--
-- Name: item_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_type
    ADD CONSTRAINT item_type_pkey PRIMARY KEY (type_id);


--
-- Name: items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (item_id);


--
-- Name: kot_itemlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kot_itemlist
    ADD CONSTRAINT kot_itemlist_pkey PRIMARY KEY (kotitem_id);


--
-- Name: order_kot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_kot
    ADD CONSTRAINT order_kot_pkey PRIMARY KEY (order_id);


--
-- Name: prices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_pkey PRIMARY KEY (price_id);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);


--
-- Name: tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (table_id);


--
-- Name: tax_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax
    ADD CONSTRAINT tax_pkey PRIMARY KEY (tax_id);


--
-- Name: employee_employee_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_employee_role_fkey FOREIGN KEY (employee_role) REFERENCES public.role(role_id);


--
-- Name: item_category_t_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_category
    ADD CONSTRAINT item_category_t_id_fkey FOREIGN KEY (t_id) REFERENCES public.item_type(type_id);


--
-- Name: items_c_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_c_id_fkey FOREIGN KEY (c_id) REFERENCES public.item_category(category_id);


--
-- Name: kot_itemlist_it_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kot_itemlist
    ADD CONSTRAINT kot_itemlist_it_id_fkey FOREIGN KEY (it_id) REFERENCES public.items(item_id);


--
-- Name: kot_itemlist_o_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kot_itemlist
    ADD CONSTRAINT kot_itemlist_o_id_fkey FOREIGN KEY (o_id) REFERENCES public.order_kot(order_id);


--
-- Name: order_kot_bill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_kot
    ADD CONSTRAINT order_kot_bill_id_fkey FOREIGN KEY (bill_id) REFERENCES public.billing(billing_id);


--
-- Name: order_kot_e_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_kot
    ADD CONSTRAINT order_kot_e_id_fkey FOREIGN KEY (e_id) REFERENCES public.employee(employee_id);


--
-- Name: order_kot_tab_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_kot
    ADD CONSTRAINT order_kot_tab_id_fkey FOREIGN KEY (tab_id) REFERENCES public.tables(table_id);


--
-- Name: prices_i_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_i_id_fkey FOREIGN KEY (i_id) REFERENCES public.items(item_id) ON DELETE CASCADE;


--
-- Name: tables_emp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES public.employee(employee_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

