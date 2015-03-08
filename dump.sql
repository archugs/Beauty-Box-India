--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: answer_types; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE answer_types AS ENUM (
    'multiple',
    'single',
    'value'
);


ALTER TYPE public.answer_types OWNER TO postgres;

--
-- Name: concern_types; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE concern_types AS ENUM (
    'skin',
    'hair'
);


ALTER TYPE public.concern_types OWNER TO postgres;

--
-- Name: gender_types; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE gender_types AS ENUM (
    'M',
    'F'
);


ALTER TYPE public.gender_types OWNER TO postgres;

--
-- Name: hair_types; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE hair_types AS ENUM (
    'oily',
    'normal',
    'dry'
);


ALTER TYPE public.hair_types OWNER TO postgres;

--
-- Name: preferences_types; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE preferences_types AS ENUM (
    'makeup',
    'skincare',
    'haircare'
);


ALTER TYPE public.preferences_types OWNER TO postgres;

--
-- Name: product_gender_types; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE product_gender_types AS ENUM (
    'M',
    'F',
    'unisex'
);


ALTER TYPE public.product_gender_types OWNER TO postgres;

--
-- Name: product_hair_types; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE product_hair_types AS ENUM (
    'oily',
    'normal',
    'dry',
    'all'
);


ALTER TYPE public.product_hair_types OWNER TO postgres;

--
-- Name: product_skin_sensitivity; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE product_skin_sensitivity AS ENUM (
    'high',
    'medium',
    'low'
);


ALTER TYPE public.product_skin_sensitivity OWNER TO postgres;

--
-- Name: product_skin_tones; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE product_skin_tones AS ENUM (
    'light',
    'fair',
    'medium',
    'olive',
    'brown',
    'black',
    'all'
);


ALTER TYPE public.product_skin_tones OWNER TO postgres;

--
-- Name: product_skin_types; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE product_skin_types AS ENUM (
    'oily',
    'combination',
    'normal',
    'dry',
    'all'
);


ALTER TYPE public.product_skin_types OWNER TO postgres;

--
-- Name: products_types; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE products_types AS ENUM (
    'makeup',
    'skincare',
    'haircare',
    'fragrance'
);


ALTER TYPE public.products_types OWNER TO postgres;

--
-- Name: skin_sensitivity; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE skin_sensitivity AS ENUM (
    'high',
    'medium',
    'low'
);


ALTER TYPE public.skin_sensitivity OWNER TO postgres;

--
-- Name: skin_tones; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE skin_tones AS ENUM (
    'light',
    'fair',
    'medium',
    'olive',
    'brown',
    'black'
);


ALTER TYPE public.skin_tones OWNER TO postgres;

--
-- Name: skin_types; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE skin_types AS ENUM (
    'oily',
    'combination',
    'normal',
    'dry'
);


ALTER TYPE public.skin_types OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE admins (
    id integer NOT NULL,
    admin_id character varying(100),
    password_hash character varying(160)
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE admins_id_seq OWNED BY admins.id;


--
-- Name: beauty_concerns; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE beauty_concerns (
    id integer NOT NULL,
    concern_type concern_types,
    concern character varying(50)
);


ALTER TABLE public.beauty_concerns OWNER TO postgres;

--
-- Name: beauty_concerns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE beauty_concerns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beauty_concerns_id_seq OWNER TO postgres;

--
-- Name: beauty_concerns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE beauty_concerns_id_seq OWNED BY beauty_concerns.id;


--
-- Name: beauty_questions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE beauty_questions (
    id integer NOT NULL,
    question character varying(300),
    answer_type answer_types
);


ALTER TABLE public.beauty_questions OWNER TO postgres;

--
-- Name: beauty_questions_choices; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE beauty_questions_choices (
    id integer NOT NULL,
    question_id integer,
    choice character varying(100)
);


ALTER TABLE public.beauty_questions_choices OWNER TO postgres;

--
-- Name: beauty_questions_choices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE beauty_questions_choices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beauty_questions_choices_id_seq OWNER TO postgres;

--
-- Name: beauty_questions_choices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE beauty_questions_choices_id_seq OWNED BY beauty_questions_choices.id;


--
-- Name: beauty_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE beauty_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beauty_questions_id_seq OWNER TO postgres;

--
-- Name: beauty_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE beauty_questions_id_seq OWNED BY beauty_questions.id;


--
-- Name: fragrances; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fragrances (
    id integer NOT NULL,
    fragrance character varying(30)
);


ALTER TABLE public.fragrances OWNER TO postgres;

--
-- Name: fragrances_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fragrances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fragrances_id_seq OWNER TO postgres;

--
-- Name: fragrances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fragrances_id_seq OWNED BY fragrances.id;


--
-- Name: product_concerns_model; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product_concerns_model (
    id integer NOT NULL,
    product_id integer,
    concerns character varying(30)
);


ALTER TABLE public.product_concerns_model OWNER TO postgres;

--
-- Name: product_concerns_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_concerns_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_concerns_model_id_seq OWNER TO postgres;

--
-- Name: product_concerns_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_concerns_model_id_seq OWNED BY product_concerns_model.id;


--
-- Name: product_subscription_model; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product_subscription_model (
    id integer NOT NULL,
    product_id integer,
    subscription_id integer
);


ALTER TABLE public.product_subscription_model OWNER TO postgres;

--
-- Name: product_subscription_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_subscription_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_subscription_model_id_seq OWNER TO postgres;

--
-- Name: product_subscription_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_subscription_model_id_seq OWNED BY product_subscription_model.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE products (
    id integer NOT NULL,
    name character varying(100),
    description character varying(500),
    product_type products_types,
    product_category character varying(20),
    price double precision,
    quantity double precision,
    quantity_units character varying(10),
    "timestamp" timestamp without time zone,
    sample boolean
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_concerns; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE products_concerns (
    id integer NOT NULL,
    product_id integer,
    concerns_id integer
);


ALTER TABLE public.products_concerns OWNER TO postgres;

--
-- Name: products_concerns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE products_concerns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_concerns_id_seq OWNER TO postgres;

--
-- Name: products_concerns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE products_concerns_id_seq OWNED BY products_concerns.id;


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: products_profile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE products_profile (
    id integer NOT NULL,
    product_id integer,
    age integer,
    gender product_gender_types,
    skin_type product_skin_types,
    skin_tone product_skin_tones,
    skin_sensitivity product_skin_sensitivity,
    hair_type product_hair_types,
    fragrance_id integer
);


ALTER TABLE public.products_profile OWNER TO postgres;

--
-- Name: products_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE products_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_profile_id_seq OWNER TO postgres;

--
-- Name: products_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE products_profile_id_seq OWNED BY products_profile.id;


--
-- Name: products_profile_model; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE products_profile_model (
    id integer NOT NULL,
    product_id integer,
    age integer,
    gender product_gender_types,
    skin_type product_skin_types,
    skin_tone product_skin_tones,
    skin_sensitivity product_skin_sensitivity,
    hair_type product_hair_types,
    fragrance_id integer
);


ALTER TABLE public.products_profile_model OWNER TO postgres;

--
-- Name: products_profile_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE products_profile_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_profile_model_id_seq OWNER TO postgres;

--
-- Name: products_profile_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE products_profile_model_id_seq OWNED BY products_profile_model.id;


--
-- Name: products_subscription; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE products_subscription (
    id integer NOT NULL,
    product_id integer,
    subscription_id integer
);


ALTER TABLE public.products_subscription OWNER TO postgres;

--
-- Name: products_subscription_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE products_subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_subscription_id_seq OWNER TO postgres;

--
-- Name: products_subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE products_subscription_id_seq OWNED BY products_subscription.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE subscriptions (
    id integer NOT NULL,
    name character varying(20),
    description character varying(500)
);


ALTER TABLE public.subscriptions OWNER TO postgres;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_id_seq OWNER TO postgres;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE subscriptions_id_seq OWNED BY subscriptions.id;


--
-- Name: user_subscription_model; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_subscription_model (
    id integer NOT NULL,
    user_id integer,
    subscription_id integer,
    duration integer,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.user_subscription_model OWNER TO postgres;

--
-- Name: user_subscription_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_subscription_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_subscription_model_id_seq OWNER TO postgres;

--
-- Name: user_subscription_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_subscription_model_id_seq OWNED BY user_subscription_model.id;


--
-- Name: user_wishlist_model; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_wishlist_model (
    id integer NOT NULL,
    user_id integer,
    product_id integer
);


ALTER TABLE public.user_wishlist_model OWNER TO postgres;

--
-- Name: user_wishlist_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_wishlist_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_wishlist_model_id_seq OWNER TO postgres;

--
-- Name: user_wishlist_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_wishlist_model_id_seq OWNED BY user_wishlist_model.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(100),
    password_hash character varying(160),
    name character varying(50),
    address character varying(500),
    "timestamp" timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_fragrances; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users_fragrances (
    id integer NOT NULL,
    user_id integer,
    fragrances_id integer
);


ALTER TABLE public.users_fragrances OWNER TO postgres;

--
-- Name: users_fragrances_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_fragrances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_fragrances_id_seq OWNER TO postgres;

--
-- Name: users_fragrances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_fragrances_id_seq OWNED BY users_fragrances.id;


--
-- Name: users_hairconcerns; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users_hairconcerns (
    id integer NOT NULL,
    user_id integer,
    hair_concerns_id integer
);


ALTER TABLE public.users_hairconcerns OWNER TO postgres;

--
-- Name: users_hairconcerns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_hairconcerns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_hairconcerns_id_seq OWNER TO postgres;

--
-- Name: users_hairconcerns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_hairconcerns_id_seq OWNED BY users_hairconcerns.id;


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_preferences; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users_preferences (
    id integer NOT NULL,
    user_id integer,
    preference preferences_types
);


ALTER TABLE public.users_preferences OWNER TO postgres;

--
-- Name: users_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_preferences_id_seq OWNER TO postgres;

--
-- Name: users_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_preferences_id_seq OWNED BY users_preferences.id;


--
-- Name: users_profile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users_profile (
    id integer NOT NULL,
    user_id integer,
    age integer,
    gender gender_types,
    skin_type skin_types,
    skin_tone skin_tones,
    skin_sensitivity skin_sensitivity,
    hair_type hair_types
);


ALTER TABLE public.users_profile OWNER TO postgres;

--
-- Name: users_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_profile_id_seq OWNER TO postgres;

--
-- Name: users_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_profile_id_seq OWNED BY users_profile.id;


--
-- Name: users_skinconcerns; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users_skinconcerns (
    id integer NOT NULL,
    user_id integer,
    skin_concerns_id integer
);


ALTER TABLE public.users_skinconcerns OWNER TO postgres;

--
-- Name: users_skinconcerns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_skinconcerns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_skinconcerns_id_seq OWNER TO postgres;

--
-- Name: users_skinconcerns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_skinconcerns_id_seq OWNED BY users_skinconcerns.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admins ALTER COLUMN id SET DEFAULT nextval('admins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY beauty_concerns ALTER COLUMN id SET DEFAULT nextval('beauty_concerns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY beauty_questions ALTER COLUMN id SET DEFAULT nextval('beauty_questions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY beauty_questions_choices ALTER COLUMN id SET DEFAULT nextval('beauty_questions_choices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fragrances ALTER COLUMN id SET DEFAULT nextval('fragrances_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_concerns_model ALTER COLUMN id SET DEFAULT nextval('product_concerns_model_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_subscription_model ALTER COLUMN id SET DEFAULT nextval('product_subscription_model_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_concerns ALTER COLUMN id SET DEFAULT nextval('products_concerns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_profile ALTER COLUMN id SET DEFAULT nextval('products_profile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_profile_model ALTER COLUMN id SET DEFAULT nextval('products_profile_model_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_subscription ALTER COLUMN id SET DEFAULT nextval('products_subscription_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subscriptions ALTER COLUMN id SET DEFAULT nextval('subscriptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_subscription_model ALTER COLUMN id SET DEFAULT nextval('user_subscription_model_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_wishlist_model ALTER COLUMN id SET DEFAULT nextval('user_wishlist_model_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_fragrances ALTER COLUMN id SET DEFAULT nextval('users_fragrances_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_hairconcerns ALTER COLUMN id SET DEFAULT nextval('users_hairconcerns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_preferences ALTER COLUMN id SET DEFAULT nextval('users_preferences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_profile ALTER COLUMN id SET DEFAULT nextval('users_profile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_skinconcerns ALTER COLUMN id SET DEFAULT nextval('users_skinconcerns_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY admins (id, admin_id, password_hash) FROM stdin;
1	admin	pbkdf2:sha1:1000$OVPcLwnB$e44acd011566d6b3101a9045a96540829fe0a008
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('admins_id_seq', 1, true);


--
-- Data for Name: beauty_concerns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY beauty_concerns (id, concern_type, concern) FROM stdin;
1	hair	hairfall
2	hair	dandruff
3	hair	damaged hair
4	hair	split ends
5	hair	color treated
6	hair	oily scalp
7	hair	frizzy and unmanageable
8	skin	pigmentation and uneven skin tone
9	skin	sunburns and tanning
10	skin	ageing, fine lines and wrinkles
11	skin	pimples and acne
12	skin	under eye dark circles
13	skin	dry and chapped lips
14	skin	dry, stretchy and itchy skins
15	skin	large and clogged pores
\.


--
-- Name: beauty_concerns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('beauty_concerns_id_seq', 15, true);


--
-- Data for Name: beauty_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY beauty_questions (id, question, answer_type) FROM stdin;
2	Gender	single
3	What is your skin type?	single
4	What is your skin tone?	single
5	How sensitive is your skin?	single
6	What is your hair type?	single
1	Age	value
7	What are your primary skin concerns?	multiple
8	What are your primary hair concerns?	multiple
9	The fragrances that you love to wear	multiple
10	What type of products would you like to receive in your beauty subscription box?	multiple
\.


--
-- Data for Name: beauty_questions_choices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY beauty_questions_choices (id, question_id, choice) FROM stdin;
1	3	oily
2	3	combination
3	3	normal
4	3	dry
5	4	light
6	4	fair
7	4	medium
8	4	olive
9	4	brown
10	4	black
11	5	high
12	5	medium
13	5	low
14	6	oily
15	6	normal
16	6	dry
17	7	pigmentation and uneven skin tone
18	7	sunburns and tanning
19	7	ageing, fine lines and wrinkles
20	7	pimples and acne
21	7	under eye dark circles
22	7	dry and chapped lips
23	7	dry, stretchy and itchy skin
24	8	hairfall
25	8	dandruff
26	8	damaged hair
27	8	split ends
28	8	color treated
29	8	oily scalp
30	8	frizzy and unmanageable
31	9	floral
32	9	fruity
33	9	vanilla and chocolate
34	9	classic and musk
35	7	large and clogged pores
38	10	hair care
36	10	makeup
37	10	skin care
39	2	Male
40	2	Female
\.


--
-- Name: beauty_questions_choices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('beauty_questions_choices_id_seq', 40, true);


--
-- Name: beauty_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('beauty_questions_id_seq', 10, true);


--
-- Data for Name: fragrances; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fragrances (id, fragrance) FROM stdin;
1	floral
2	fruity
3	vanilla and chocolate
4	classic and musk
\.


--
-- Name: fragrances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fragrances_id_seq', 4, true);


--
-- Data for Name: product_concerns_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product_concerns_model (id, product_id, concerns) FROM stdin;
\.


--
-- Name: product_concerns_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_concerns_model_id_seq', 1, false);


--
-- Data for Name: product_subscription_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product_subscription_model (id, product_id, subscription_id) FROM stdin;
\.


--
-- Name: product_subscription_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_subscription_model_id_seq', 1, false);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY products (id, name, description, product_type, product_category, price, quantity, quantity_units, "timestamp", sample) FROM stdin;
1	Lakme face wash	\N	skincare	face wash	100	100	grams	\N	f
2	Lakme moisturizer	\N	skincare	moisturizer	100	100	grams	\N	f
3	Clean & clear face wash	\N	skincare	face wash	30	50	grams	\N	t
4	Biotique toner	\N	skincare	toner	100	100	grams	\N	f
5	Lotus herbals night cream	\N	skincare	moisturizer	200	100	grams	\N	f
6	Biotique shampoo	\N	haircare	shampoo	100	100	grams	\N	f
7	Pantene conditioner	\N	haircare	conditionerr	100	100	grams	\N	f
8	Maybelline lipstick	\N	makeup	moisturizer	100	100	grams	\N	f
9	Maybelline blush	\N	makeup	moisturizer	100	100	grams	\N	f
10	Victoria body mist	\N	fragrance	moisturizer	100	100	grams	\N	f
\.


--
-- Data for Name: products_concerns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY products_concerns (id, product_id, concerns_id) FROM stdin;
1	1	8
2	1	9
3	1	10
4	1	11
5	1	12
6	1	13
7	1	14
8	1	15
9	2	8
10	2	9
11	2	10
12	2	11
13	2	12
14	2	13
15	2	14
16	2	15
17	3	8
18	3	9
19	3	10
20	3	11
21	3	12
22	3	13
23	3	14
24	3	15
25	4	8
26	4	9
27	4	10
28	4	11
29	4	12
30	4	13
31	4	14
32	4	15
33	5	8
34	5	9
35	5	10
36	5	11
37	5	12
38	5	13
39	5	14
40	5	15
41	8	8
42	8	9
43	8	10
44	8	11
45	8	12
46	8	13
47	8	14
48	8	15
49	9	8
50	9	9
51	9	10
52	9	11
53	9	12
54	9	13
55	9	14
56	9	15
57	6	1
58	6	2
59	6	3
60	6	4
61	6	5
62	6	6
63	6	7
64	7	1
65	7	2
66	7	3
67	7	4
68	7	5
69	7	6
70	7	7
\.


--
-- Name: products_concerns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('products_concerns_id_seq', 70, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('products_id_seq', 10, true);


--
-- Data for Name: products_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY products_profile (id, product_id, age, gender, skin_type, skin_tone, skin_sensitivity, hair_type, fragrance_id) FROM stdin;
1	1	0	unisex	all	all	low	\N	\N
2	2	0	unisex	all	all	low	\N	\N
3	3	0	unisex	all	all	low	\N	\N
4	4	0	unisex	all	all	low	\N	\N
5	5	0	unisex	all	all	low	\N	\N
6	6	0	unisex	\N	\N	\N	all	\N
7	7	0	unisex	\N	\N	\N	all	\N
8	8	0	unisex	all	all	low	\N	\N
9	9	0	unisex	all	all	low	\N	\N
10	10	0	unisex	all	all	low	\N	1
\.


--
-- Name: products_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('products_profile_id_seq', 10, true);


--
-- Data for Name: products_profile_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY products_profile_model (id, product_id, age, gender, skin_type, skin_tone, skin_sensitivity, hair_type, fragrance_id) FROM stdin;
\.


--
-- Name: products_profile_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('products_profile_model_id_seq', 1, false);


--
-- Data for Name: products_subscription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY products_subscription (id, product_id, subscription_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	2	1
6	2	2
7	2	3
8	2	4
9	3	1
10	3	2
11	3	3
12	3	4
13	4	1
14	4	2
15	4	3
16	4	4
17	5	1
18	5	2
19	5	3
20	5	4
21	6	1
22	6	2
23	6	3
24	6	4
25	7	1
26	7	2
27	7	3
28	7	4
29	8	1
30	8	2
31	8	3
32	8	4
33	9	1
34	9	2
35	9	3
36	9	4
37	10	1
38	10	2
39	10	3
40	10	4
\.


--
-- Name: products_subscription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('products_subscription_id_seq', 40, true);


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY subscriptions (id, name, description) FROM stdin;
1	student	\N
2	budget	\N
3	luxury	\N
4	natural	\N
\.


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('subscriptions_id_seq', 4, true);


--
-- Data for Name: user_subscription_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_subscription_model (id, user_id, subscription_id, duration, "timestamp") FROM stdin;
1	7	1	3	2015-03-07 22:59:58.634974
2	8	1	6	2015-03-08 11:36:21.977459
\.


--
-- Name: user_subscription_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_subscription_model_id_seq', 2, true);


--
-- Data for Name: user_wishlist_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_wishlist_model (id, user_id, product_id) FROM stdin;
\.


--
-- Name: user_wishlist_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_wishlist_model_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, email, password_hash, name, address, "timestamp") FROM stdin;
7	archana.gurusamy@gmail.com	pbkdf2:sha1:1000$hEJQm7Ck$8249c0a120dbe4d2c3fdf041fede9ddee6e9285a	Archana	Chennai	2015-03-07 13:31:17.606833
8	anu_gurus@yahoo.com	pbkdf2:sha1:1000$zWdRauqM$97dce2d997c60683f3c3e0ed5cd37400f250111d	Archana	Chennai	2015-03-08 11:35:43.94334
\.


--
-- Data for Name: users_fragrances; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_fragrances (id, user_id, fragrances_id) FROM stdin;
2	7	1
3	7	2
4	8	1
5	8	2
6	8	3
\.


--
-- Name: users_fragrances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_fragrances_id_seq', 6, true);


--
-- Data for Name: users_hairconcerns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_hairconcerns (id, user_id, hair_concerns_id) FROM stdin;
4	7	6
5	7	7
6	8	3
7	8	4
\.


--
-- Name: users_hairconcerns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_hairconcerns_id_seq', 7, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 8, true);


--
-- Data for Name: users_preferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_preferences (id, user_id, preference) FROM stdin;
1	7	skincare
2	7	haircare
3	8	makeup
4	8	skincare
5	8	haircare
\.


--
-- Name: users_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_preferences_id_seq', 5, true);


--
-- Data for Name: users_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_profile (id, user_id, age, gender, skin_type, skin_tone, skin_sensitivity, hair_type) FROM stdin;
2	7	25	F	oily	olive	high	oily
3	8	28	F	oily	fair	medium	dry
\.


--
-- Name: users_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_profile_id_seq', 3, true);


--
-- Data for Name: users_skinconcerns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_skinconcerns (id, user_id, skin_concerns_id) FROM stdin;
3	7	8
4	7	9
5	7	12
6	8	10
7	8	11
\.


--
-- Name: users_skinconcerns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_skinconcerns_id_seq', 7, true);


--
-- Name: admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: beauty_concerns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY beauty_concerns
    ADD CONSTRAINT beauty_concerns_pkey PRIMARY KEY (id);


--
-- Name: beauty_questions_choices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY beauty_questions_choices
    ADD CONSTRAINT beauty_questions_choices_pkey PRIMARY KEY (id);


--
-- Name: beauty_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY beauty_questions
    ADD CONSTRAINT beauty_questions_pkey PRIMARY KEY (id);


--
-- Name: fragrances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fragrances
    ADD CONSTRAINT fragrances_pkey PRIMARY KEY (id);


--
-- Name: product_concerns_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_concerns_model
    ADD CONSTRAINT product_concerns_model_pkey PRIMARY KEY (id);


--
-- Name: product_subscription_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_subscription_model
    ADD CONSTRAINT product_subscription_model_pkey PRIMARY KEY (id);


--
-- Name: products_concerns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products_concerns
    ADD CONSTRAINT products_concerns_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products_profile_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products_profile_model
    ADD CONSTRAINT products_profile_model_pkey PRIMARY KEY (id);


--
-- Name: products_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products_profile
    ADD CONSTRAINT products_profile_pkey PRIMARY KEY (id);


--
-- Name: products_subscription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products_subscription
    ADD CONSTRAINT products_subscription_pkey PRIMARY KEY (id);


--
-- Name: subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: uniq_admins; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY admins
    ADD CONSTRAINT uniq_admins UNIQUE (admin_id);


--
-- Name: uniq_productprofile; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products_profile
    ADD CONSTRAINT uniq_productprofile UNIQUE (product_id);


--
-- Name: uniq_products; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT uniq_products UNIQUE (name);


--
-- Name: uniq_productsprofile; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products_profile_model
    ADD CONSTRAINT uniq_productsprofile UNIQUE (product_id);


--
-- Name: uniq_subscription; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT uniq_subscription UNIQUE (name);


--
-- Name: uniq_users; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uniq_users UNIQUE (email);


--
-- Name: uniq_usersprofile; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users_profile
    ADD CONSTRAINT uniq_usersprofile UNIQUE (user_id);


--
-- Name: user_subscription_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_subscription_model
    ADD CONSTRAINT user_subscription_model_pkey PRIMARY KEY (id);


--
-- Name: user_wishlist_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_wishlist_model
    ADD CONSTRAINT user_wishlist_model_pkey PRIMARY KEY (id);


--
-- Name: users_fragrances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users_fragrances
    ADD CONSTRAINT users_fragrances_pkey PRIMARY KEY (id);


--
-- Name: users_hairconcerns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users_hairconcerns
    ADD CONSTRAINT users_hairconcerns_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users_preferences
    ADD CONSTRAINT users_preferences_pkey PRIMARY KEY (id);


--
-- Name: users_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users_profile
    ADD CONSTRAINT users_profile_pkey PRIMARY KEY (id);


--
-- Name: users_skinconcerns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users_skinconcerns
    ADD CONSTRAINT users_skinconcerns_pkey PRIMARY KEY (id);


--
-- Name: ix_admins_admin_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_admins_admin_id ON admins USING btree (admin_id);


--
-- Name: ix_beauty_questions_choices_question_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_beauty_questions_choices_question_id ON beauty_questions_choices USING btree (question_id);


--
-- Name: ix_product_concerns_model_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_product_concerns_model_product_id ON product_concerns_model USING btree (product_id);


--
-- Name: ix_product_subscription_model_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_product_subscription_model_product_id ON product_subscription_model USING btree (product_id);


--
-- Name: ix_products_concerns_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_products_concerns_product_id ON products_concerns USING btree (product_id);


--
-- Name: ix_products_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_products_name ON products USING btree (name);


--
-- Name: ix_products_profile_model_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_products_profile_model_product_id ON products_profile_model USING btree (product_id);


--
-- Name: ix_products_profile_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_products_profile_product_id ON products_profile USING btree (product_id);


--
-- Name: ix_products_subscription_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_products_subscription_product_id ON products_subscription USING btree (product_id);


--
-- Name: ix_user_subscription_model_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_user_subscription_model_user_id ON user_subscription_model USING btree (user_id);


--
-- Name: ix_user_wishlist_model_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_user_wishlist_model_user_id ON user_wishlist_model USING btree (user_id);


--
-- Name: ix_users_email; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_users_email ON users USING btree (email);


--
-- Name: ix_users_fragrances_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_users_fragrances_user_id ON users_fragrances USING btree (user_id);


--
-- Name: ix_users_hairconcerns_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_users_hairconcerns_user_id ON users_hairconcerns USING btree (user_id);


--
-- Name: ix_users_preferences_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_users_preferences_user_id ON users_preferences USING btree (user_id);


--
-- Name: ix_users_profile_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_users_profile_user_id ON users_profile USING btree (user_id);


--
-- Name: ix_users_skinconcerns_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_users_skinconcerns_user_id ON users_skinconcerns USING btree (user_id);


--
-- Name: product_subscription_model_subscription_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_subscription_model
    ADD CONSTRAINT product_subscription_model_subscription_id_fkey FOREIGN KEY (subscription_id) REFERENCES subscriptions(id);


--
-- Name: products_concerns_concerns_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_concerns
    ADD CONSTRAINT products_concerns_concerns_id_fkey FOREIGN KEY (concerns_id) REFERENCES beauty_concerns(id);


--
-- Name: products_concerns_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_concerns
    ADD CONSTRAINT products_concerns_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: products_profile_fragrance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_profile
    ADD CONSTRAINT products_profile_fragrance_id_fkey FOREIGN KEY (fragrance_id) REFERENCES fragrances(id);


--
-- Name: products_profile_model_fragrance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_profile_model
    ADD CONSTRAINT products_profile_model_fragrance_id_fkey FOREIGN KEY (fragrance_id) REFERENCES fragrances(id);


--
-- Name: products_profile_model_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_profile_model
    ADD CONSTRAINT products_profile_model_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: products_profile_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_profile
    ADD CONSTRAINT products_profile_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: products_subscription_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_subscription
    ADD CONSTRAINT products_subscription_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: products_subscription_subscription_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_subscription
    ADD CONSTRAINT products_subscription_subscription_id_fkey FOREIGN KEY (subscription_id) REFERENCES subscriptions(id);


--
-- Name: user_subscription_model_subscription_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_subscription_model
    ADD CONSTRAINT user_subscription_model_subscription_id_fkey FOREIGN KEY (subscription_id) REFERENCES subscriptions(id);


--
-- Name: user_subscription_model_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_subscription_model
    ADD CONSTRAINT user_subscription_model_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: user_wishlist_model_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_wishlist_model
    ADD CONSTRAINT user_wishlist_model_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: users_fragrances_fragrances_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_fragrances
    ADD CONSTRAINT users_fragrances_fragrances_id_fkey FOREIGN KEY (fragrances_id) REFERENCES fragrances(id);


--
-- Name: users_fragrances_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_fragrances
    ADD CONSTRAINT users_fragrances_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: users_hairconcerns_hair_concerns_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_hairconcerns
    ADD CONSTRAINT users_hairconcerns_hair_concerns_id_fkey FOREIGN KEY (hair_concerns_id) REFERENCES beauty_concerns(id);


--
-- Name: users_hairconcerns_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_hairconcerns
    ADD CONSTRAINT users_hairconcerns_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: users_preferences_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_preferences
    ADD CONSTRAINT users_preferences_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: users_profile_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_profile
    ADD CONSTRAINT users_profile_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: users_skinconcerns_skin_concerns_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_skinconcerns
    ADD CONSTRAINT users_skinconcerns_skin_concerns_id_fkey FOREIGN KEY (skin_concerns_id) REFERENCES beauty_concerns(id);


--
-- Name: users_skinconcerns_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_skinconcerns
    ADD CONSTRAINT users_skinconcerns_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

