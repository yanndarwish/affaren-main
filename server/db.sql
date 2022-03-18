--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category_name character varying(255) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_category_id_seq OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_methods (
    payment_method_id integer NOT NULL,
    payment_method_name character varying(255) NOT NULL
);


ALTER TABLE public.payment_methods OWNER TO postgres;

--
-- Name: payment_methods_payment_method_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_methods_payment_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_methods_payment_method_id_seq OWNER TO postgres;

--
-- Name: payment_methods_payment_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_methods_payment_method_id_seq OWNED BY public.payment_methods.payment_method_id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_supplier_id integer,
    product_name text,
    product_price double precision,
    taxe_id integer,
    product_quantity integer,
    product_barcode bigint,
    product_alert integer DEFAULT 5
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_in_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_in_transactions (
    sale_id integer NOT NULL,
    product_id integer,
    quantity integer,
    product_name character varying(255),
    product_price double precision,
    taxe_id integer,
    sale_day integer,
    sale_month integer,
    sale_year integer
);


ALTER TABLE public.products_in_transactions OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- Name: sales_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_transactions (
    sale_id integer NOT NULL,
    sale_total double precision,
    taxe_amount double precision,
    payment_method_id integer,
    sale_paid boolean DEFAULT false NOT NULL,
    tva_1 double precision DEFAULT 0,
    tva_2 double precision DEFAULT 0,
    tva_3 double precision DEFAULT 0,
    hors_taxe_1 double precision DEFAULT 0,
    hors_taxe_2 double precision DEFAULT 0,
    hors_taxe_3 double precision DEFAULT 0,
    total_1 double precision DEFAULT 0,
    total_2 double precision DEFAULT 0,
    total_3 double precision DEFAULT 0,
    sale_year integer,
    sale_month integer,
    sale_day integer,
    sale_time text,
    sale_splitted boolean DEFAULT false,
    payment_method_id_2 integer,
    payment_method_id_2_total double precision
);


ALTER TABLE public.sales_transactions OWNER TO postgres;

--
-- Name: sales_transactions_sale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_transactions_sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_transactions_sale_id_seq OWNER TO postgres;

--
-- Name: sales_transactions_sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_transactions_sale_id_seq OWNED BY public.sales_transactions.sale_id;


--
-- Name: taxes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taxes (
    taxe_id integer NOT NULL,
    taxe_amount double precision NOT NULL,
    taxe_name character varying(255) NOT NULL
);


ALTER TABLE public.taxes OWNER TO postgres;

--
-- Name: taxes_taxe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taxes_taxe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taxes_taxe_id_seq OWNER TO postgres;

--
-- Name: taxes_taxe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.taxes_taxe_id_seq OWNED BY public.taxes.taxe_id;


--
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- Name: payment_methods payment_method_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods ALTER COLUMN payment_method_id SET DEFAULT nextval('public.payment_methods_payment_method_id_seq'::regclass);


--
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: sales_transactions sale_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_transactions ALTER COLUMN sale_id SET DEFAULT nextval('public.sales_transactions_sale_id_seq'::regclass);


--
-- Name: taxes taxe_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxes ALTER COLUMN taxe_id SET DEFAULT nextval('public.taxes_taxe_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (category_id, category_name) FROM stdin;
1	décoration
2	Kolonial
\.


--
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_methods (payment_method_id, payment_method_name) FROM stdin;
1	cash
2	cb
3	cheque
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, product_supplier_id, product_name, product_price, taxe_id, product_quantity, product_barcode, product_alert) FROM stdin;
2	201022	A-fil 3% laktosfri	5.6	1	5	\N	5
3	211399	A-fil Plus Dofilus GT 3	4.1	1	5	\N	5
8	186007	Ansjoviskryddad sill MSC	4.4	1	5	\N	5
9	511073	Antikljus 25cm ø22mm 10-pack beige	\N	3	5	7310380241256	5
10	607207	Antikljus 25cm ø22mm 8-pack röd	6.8	3	5	\N	5
11	606408	Antikljus 25cm ø22mm 8-pack vit	7.7	3	5	\N	5
12	606407	Antikljus stearin 25cm ø22mm röd	36.8	3	5	\N	5
14	136303	Apelsinmarmelad	6.2	1	5	\N	5
16	124387	Aquador stilla PET	1.5	1	5	\N	5
18	107695	Aromat	5	1	5	\N	5
19	702561	Bacon skivat SE	0	1	5	\N	5
21	600434	Bakform 20x90mm	0	3	5	\N	5
23	605237	Bakform stora bullformar Fettbeständigt papper 60x25mm vit	3.8	3	5	\N	5
25	607054	Bakplåtspapper 45x57cm	0.1	3	5	\N	5
29	184195	BBQ sås Original	16.1	1	5	\N	5
30	123767	BBQ-sås Black Garlic & Chili	11	1	5	7392031501100	5
31	207920	Bearnaise kall sås flaska	6.8	1	5	\N	5
32	211754	Bearnaise original	5.6	1	5	\N	5
33	206392	Bearnaisesås	4.4	1	5	\N	5
37	154669	Bitsocker	7.3	1	5	\N	5
38	108622	Björnbärskräm	4.7	1	5	\N	5
39	124941	Black Saltlakrits	4.1	1	5	\N	5
40	601354	Blockljus paraffin 30h 130x60mm röd	29.3	3	5	\N	5
41	605388	Blockljus paraffin 30h 135x60mm vit	3.5	3	5	\N	5
42	605389	Blockljus paraffin 60h 150x80mm vit	5.3	3	5	\N	5
43	605390	Blockljus paraffin 80h 220x70mm vit	5.9	3	5	\N	5
45	110278	Blossa alkoholfri	8.9	1	5	\N	5
46	102459	Blossa Lättglögg Röd	12.8	1	5	\N	5
47	101785	Blåbärskräm extra prima	7.7	1	5	\N	5
48	401743	Blåbärspaj	9.2	1	5	\N	5
51	113280	Bonaqua Naturell Källvatten ENGL	1.6	1	5	\N	5
54	145753	Brago	5.8	1	5	\N	5
55	240566	Bratwurst Sverige	6.5	1	5	\N	5
56	207188	Bratwurst 140g Sverige	9.4	1	5	\N	5
58	207312	Bregott mellan 57%	12.8	1	5	\N	5
59	103277	Bridgeblandning	4.7	1	5	\N	5
60	154421	Brio lösvikt	1.6	1	5	\N	5
61	107410	Briska Cider Päron Alkoholfri ENGL	2.5	1	5	\N	5
62	112345	Brisling i tomatsås	6.5	1	5	\N	5
63	244355	Bruna bönor	3.8	1	5	\N	5
66	205198	Bränneboskinka rökt	0	1	5	\N	5
67	186012	Brännvinssill MSC	4.7	1	5	\N	5
68	117944	Brödkryddor malda påse	1.5	1	5	\N	5
69	409862	Budapestbotten orginal	50.3	1	5	\N	5
71	105740	Carlsberg 6-pack 3.5 % BRK	19.6	1	5	\N	5
72	158331	Center rulle	2.2	1	5	7310040021341	5
73	604529	Cerat original	3.5	3	5	\N	5
74	124013	Chai Grönt FT EKO	15.5	1	5	7350054815109	5
76	120269	Champis PET	2.5	1	5	7310401000367	5
77	205799	Cheddar dipp	1.1	1	5	\N	5
78	122121	Cheez doodles	1.3	1	5	7300400382205	5
82	113600	Chips Dill & Gräslök	4.1	1	5	\N	5
83	122123	Chips Dill & Gräslök	1.6	1	5	\N	5
85	124593	Chips Havssalt	2.7	1	5	\N	5
87	124592	Chips Tryffel	2.7	1	5	7350045591500	5
88	290200	Chokladbiskvi singel	1.8	1	5	\N	5
89	409558	Chokladboll Lyx TS	3.2	1	5	\N	5
90	774732	Chokladflarn	14	1	5	\N	5
91	123190	Chokladkaka Pepparkaka Limited Edition	5.6	1	5	\N	5
93	102911	Cider Fläder PET	3.5	1	5	\N	5
94	205305	Citron & dillsås för ugnsbakad lax	8.1	1	5	\N	5
95	109196	Citron dillsås 3-pack	4.3	1	5	\N	5
97	122317	Citronpeppar glasburk	2.4	1	5	\N	5
98	121288	Citronpeppar plastburk	18.5	1	5	7311311016424	5
100	122509	Coca-Cola Original 6-p BRK	14.3	1	5	\N	5
101	122462	Coca-Cola Original BRK	1.9	1	5	5000112637922	5
6	124265	Ahlgrens bilar Sursockrade	2.95	1	47	7310350132898	5
7	111910	Aladdin	28	1	3	7310510002504	5
5	759751	Ahlgrens bilar lakrits däck	2.95	1	22	7310350132881	5
44	209426	Blodpudding	4.5	1	5	7310943092523	5
15	150405	Apelsinskal kanderat	4.5	1	3	5701073062708	5
13	111448	Apelsinkrokant Chokladkaka	5	1	3	7310510001231	5
75	103567	Champis BRK	2	1	15	7310401007144	5
20	212453	Baconost 17% tub	7.7	1	2	7311441061608	5
24	605133	Bakplåtspapper 33x42cm Guldhöken	2.5	3	5	7332636000011	5
84	115752	Chips Gräddfil & lök	4.1	1	4	7310532106464	5
28	123712	Ballerina Original	4.5	1	13	7310520009326	5
27	101507	Ballerina kladdkaka	4.5	1	10	7310521397712	5
57	700638	Bregott 75 % normalsaltat	5.95	1	5	7310860005774	5
81	116945	Chilisås glasflaska	5.95	1	5	5900783007867	5
53	188265	Bostongurka original	4.5	1	5	7310240050844	5
52	112632	Bostongurka original	8.95	1	5	7310240150834	5
99	117946	Citronsyra påse	3.6	1	5	7311311004285	5
36	117943	Bikarbonat påse	1.95	1	5	7311311004537	5
96	121287	Citronpeppar glasburk	3.95	1	5	7311311016073	5
34	109192	Bearnaisesås 3-p pulver	3.95	1	5	7322550092001	5
65	109193	Brunsås 3-pack	3.95	1	5	7322550092032	5
64	192622	Bruna bönor Sverige	4.95	1	5	7312787703887	5
70	213232	Bullens Pilsnerkorv	6.95	1	5	7300203296006	5
80	192563	Chili Con Carne	7.95	1	5	7310240064346	5
50	184873	Blåbärssoppa osockrad	4.5	1	5	7310470070193	5
49	184868	Blåbärssoppa original	4.5	1	5	7310470063195	5
92	209297	Chokladpudding	3.95	1	5	7310470018263	5
4	124266	Ahlgrens bilar	2.95	1	19	7310350132874	5
26	110051	Bakpulver ögon	3.95	1	5	6416453068810	5
79	112780	Cheez Doodles	4.1	1	5	7340005403370	5
86	102100	Chips Sourcream & onion	1.2	1	5	7310531027906	5
17	719573	Arbogapastej minilimpa	4.5	1	10	7310941803220	5
103	154437	Cocosprickar lösvikt	1.9	1	5	\N	5
104	158490	Cola Happy Chews lösvikt	1.4	1	5	\N	5
105	154339	Colaflask stora lösvikt	1.4	1	5	\N	5
107	119891	Daim Chokladkaka	5	1	5	\N	5
108	141978	Daim dubbel	1.3	1	5	7310511257507	5
111	185974	Delikatess Sesam	5.9	1	5	\N	5
113	112296	Dextro Energy Lemon Sticks	2.6	1	5	87111781	5
114	112294	Dextro Neutral Sticks	2.6	1	5	\N	5
115	244587	Digestive EKO	10.1	1	5	\N	5
116	154551	Digestive fullkorn oliv	7.4	1	5	\N	5
117	184010	Digestive utan tillsatt socker	7.4	1	5	\N	5
118	101120	Digestivekex	3.2	1	5	\N	5
120	122797	Din Harmoni Vallmofrö & Havssalt	6.5	1	5	7300400482233	5
123	184630	Dinkelmjöl siktat	11	1	5	\N	5
124	102069	Dipmix Dill	1.5	1	5	7310531037103	5
128	102072	Dipmix Sourcream onion	1.6	1	5	7310532130513	5
129	116984	Dippmix Chipotle Cheddar	2.1	1	5	\N	5
132	116981	Dippmix Ranch	2.1	1	5	7340005404261	5
133	116978	Dippmix Vitlök	2.1	1	5	\N	5
135	605562	Diskmedel Original 650ml	9.2	3	5	\N	5
137	132376	Dragster super salta	1.8	1	5	\N	5
138	132375	Dragster supersura	1.8	1	5	\N	5
139	108573	Drömkrisp Chokladkaka	3.5	1	5	\N	5
140	121522	Dubbel Nougat	1.3	1	5	\N	5
141	154334	Dumle original lösvikt	2.4	1	5	\N	5
142	606124	Duschcreme Fresh 250ml	4.4	3	5	\N	5
144	104786	Elderflower soda EKO ENGL	3.8	1	5	\N	5
145	133794	Emser	1.9	1	5	6411401035562	5
146	122253	Engelsk konfekt lösvikt	19.7	1	5	\N	5
147	115238	Extra Professional strong mint	5.3	1	5	\N	5
148	157220	Extra Salt Licorice	5.3	1	5	\N	5
149	124292	Extra White bubblemint	3.2	1	5	4009900519762	5
150	118383	Extra White Spearmint	5.3	1	5	\N	5
151	105744	Falcon Extra Brew 3.5% BRK	16.1	1	5	\N	5
156	106091	Farinsocker	6.2	1	5	\N	5
157	107778	Fast vardagsblomsterhonung	10.8	1	5	7350071870082	5
158	116592	Fazer mjölkchoklad lösvikt	3.2	1	5	\N	5
159	135531	Fazermint lösvikt	2.4	1	5	\N	5
160	154353	Ferrari lösvikt	1.3	1	5	\N	5
165	205447	Filmjölk blåb hall 2.7%	4.4	1	5	\N	5
166	205559	Filmjölk blåbär 2.7%	4.7	1	5	\N	5
167	205448	Filmjölk jordgubb 2.7%	7.7	1	5	\N	5
168	205069	Filmjölk jordgubb 3%	5.9	1	5	\N	5
169	201930	Filmjölk LF 3%	9.7	1	5	\N	5
171	245003	Fina Rågkex	5.6	1	5	\N	5
174	117457	Fiskbuljong 6-pack	4.6	1	5	8714100284261	5
175	109392	Fiskbullar i buljong	5.4	1	5	7311170041018	5
178	109395	Fiskbullar i räksås	7.1	1	5	\N	5
179	423887	Fiskgratäng Dill MSC	9.5	1	5	7310500038803	5
180	423888	Fiskgratäng räkor och dill MSC	11	1	5	\N	5
181	109198	Fisksås 3-pack	4.3	1	5	\N	5
182	108000	Fläderblomssaft KRAV	6.8	1	5	\N	5
184	408883	Fria Fiber Glutenfri Tina och servera	12.8	1	5	\N	5
185	158091	Frukt & Mandel chokladkaka	5	1	5	\N	5
187	202680	Fruktdr Apelsin Passionsfrukt	7.7	1	5	\N	5
188	108258	Fruktgröt Päron Banan 8 mån osockrad	10.7	1	5	7312170029174	5
189	101093	Fruktmüsli Glutenfri	14	1	5	\N	5
190	154357	Fruktnappar lösvikt	1.2	1	5	\N	5
191	141787	Fruxo tablettask	0.9	1	5	7310780002365	5
192	119924	Fröknäcke Havre/Solros	8	1	5	\N	5
193	119925	Fröknäcke Örter/Havssal	8	1	5	\N	5
195	101778	Fullkornsgröt mild med frukt 8 mån osockrad	15.8	1	5	\N	5
196	124739	Fäbodknäcke Frön & Havssalt	11.6	1	5	7312080003646	5
197	715343	Färskost Naturell 21%	19.1	1	5	\N	5
198	206887	Färskost Pepparrot 10%	10.8	1	5	\N	5
200	123240	Geisha	2.7	1	5	\N	5
201	112839	Geisha lösvikt	3.2	1	5	\N	5
161	124791	Festis Apelsin EKO BRIK	2	1	10	73165637	5
162	124811	Festis Hallon EKO BRIK	2	1	9	73165651	5
163	124790	Festis Päron EKO BRIK	2	1	5	73165644	5
155	122786	Fanta Exotic PET	2.5	1	4	90490705	5
102	122470	Coca-Cola zero BRK	2	1	5	5000112637939	5
164	205442	Filmjölk 3%	3.5	1	5	7310865087935	5
170	208415	Filmjölk LF KRAV	5.5	1	3	7310865094117	5
177	109393	Fiskbullar i hummersås MSC	5.4	1	5	7311170041049	5
176	109394	Fiskbullar i dillsås	5.4	1	5	7311170041346	5
125	102073	Dipmix Holiday	1.95	1	5	7310531037905	5
126	112792	Dipmix Ranch	1.95	1	5	7310532131428	5
130	116975	Dippmix Dill & Gräslök	1.95	1	5	7340005404223	5
131	116982	Dippmix Fresh Island	1.95	1	5	7340005404278	5
199	190754	F-müsli Guld nöt	8.95	1	5	5701029160823	5
134	729595	Diskborste classic mix	1.8	3	5	7330671012600	5
143	606122	Duschcreme Sport 250ml	3.95	3	5	4005900553522	5
172	187636	Finn Crisp caraway	4.5	1	5	6410500900108	5
173	184356	Finn Crisp Original	4.5	1	5	6410500090014	5
121	121798	Din Stund Chia & Havssalt	6.5	1	5	7300400482691	5
152	182922	Falu Råg-rut Knäckebröd	4.65	1	5	7300400114783	5
112	183959	Delikatessknäcke	4.95	1	5	7300400121644	5
186	158076	Frukt & Mandel Chokladkaka	3.1	1	5	7310511217303	5
106	119889	Daim Chokladkaka	3.1	1	5	7622201056629	5
136	119408	Djungelvrål	1.5	1	5	7310350109029	5
122	191813	Dinkelmjöl fullkorn	6.95	1	5	7310130011412	5
119	115753	Dillchips	4.1	1	5	7310532106488	10
153	240563	Falukorv Sverige	4.95	1	5	7300206338000	5
109	112023	Daim singel	1	1	5	7310511250706	5
110	742357	Delicatoboll singel	1.5	1	5	7315360010754	5
194	407748	Frökusar fryst Tina och servera	6.5	1	5	7314879190018	5
154	240593	Falukorv ring Sverige	8.95	1	5	7300206787006	5
202	164387	Gelatinblad extra	2.4	1	5	\N	5
204	709930	Gelehallon lösvikt	0.9	1	5	\N	5
206	117945	Glöggkryddor påse	5.6	1	5	\N	5
207	108008	God jul glögg alkfri	7.7	1	5	\N	5
208	410485	Godingar Kanel	3.7	1	5	\N	5
210	111788	Gott & Blandat Salt lösvikt	27.8	1	5	\N	5
213	120053	Granola blåbär glutenfri	13.4	1	5	\N	5
214	167941	Granola naturell	10.1	1	5	\N	5
215	109223	Grape Tonic PET	1.6	1	5	\N	5
216	120249	Grape Tonic PET	2.5	1	5	\N	5
217	212866	Gravlaxsås	5	1	5	\N	5
219	207667	Greve 28% SB	0	1	5	\N	5
221	200207	Grillkorv tunt skinn Sverige	9.8	1	5	\N	5
224	401652	Grovlimpa med lingon Tina och servera	7.1	1	5	\N	5
225	404326	Grovlimpa skivad fryst Tina och servera	6.8	1	5	\N	5
227	100856	Gräddnougat Kaka	3.5	1	5	\N	5
229	708906	Gröna grodor lösvikt	1.1	1	5	\N	5
230	180119	Grönsaksfond 0.8% salt	9.8	1	5	7322550052708	5
231	192623	Gula ärtor kapsel	3.5	1	5	7312787703627	5
233	123095	Guld	21.8	1	5	\N	5
234	162698	Guld Marie	2.5	1	5	7310521050204	5
235	204932	Guldsalami skiv	6.2	1	5	\N	5
236	774365	Gyllene Grova lingon havre Tina och servera	7.1	1	5	\N	5
237	753100	Gyllene vört Tina och servera	6.8	1	5	\N	5
238	114632	Hallon Lakrits Skalle Påse Fairtrade	1.9	1	5	\N	5
239	114634	Hallon Lakrits Skalle Skum Fairtrade	1.9	1	5	\N	5
240	110364	Hallon lakritsskalle micro lösvikt	23	1	5	\N	5
241	726271	Halloumi	7.4	1	5	7331494128035	5
242	108701	Hals Eucalyptys	4.4	1	5	\N	5
243	111794	Hals Ingefära citron	4.4	1	5	\N	5
244	187965	Hamburgerdressing Amerikansk tub	3.8	1	5	\N	5
246	208967	Hamburgerdressing pipflaska	17.9	1	5	\N	5
247	206841	Havredryck Naturell	5	1	5	\N	5
248	791380	Havreflarn	15.5	1	5	\N	5
249	116430	Havrefras	11.2	1	5	7311171008423	5
251	206849	Havregurt Naturell	9.2	1	5	\N	5
252	185873	Havreknäcke 280 gr	6.9	1	5	7300400121859	5
254	123733	Hellmann’s American Style Yellow mustard senap	6.8	1	5	8714100695876	5
255	158092	Helnöt Chokladkaka	5	1	5	\N	5
256	207665	Herrgård 28%	0	1	5	\N	5
257	120407	Herrgård 28% 12 månader	20	1	5	\N	5
258	106787	Herrgårdscider Päron 0.3% ENGL	5.6	1	5	\N	5
259	117947	Hjorthornsalt påse	1.7	1	5	\N	5
260	132722	Hjortronsylt extra prima	18.2	1	5	\N	5
261	111711	Holk enkla stycksaker	1.1	1	5	\N	5
265	180122	Hummerfond 0.8% salt	9.5	1	5	\N	5
266	204525	Hushållsost 26 % NB	14.95	1	5	2340374705339	5
272	106670	Inlagd sill MSC	11.2	1	5	7311171007938	5
273	183614	Inläggnings sill 5min	10.4	1	5	7311171007938	5
274	206276	Isterband 150 g Sverige	0	1	5	\N	5
275	206017	Isterband småländska	6.5	1	5	\N	5
276	404228	Janssons frestelse	9.2	1	5	\N	5
277	112887	Japp Chokladkaka	5.9	1	5	\N	5
278	122288	Japp dubbel	1.3	1	5	\N	5
279	117565	Jordgubbssaft	8.3	1	5	\N	5
280	108001	Jordgubbssaft KRAV	8.3	1	5	\N	5
281	124188	Jordnötsringar	3.5	1	5	7310532114001	5
282	799957	Jordnötsruta lösvikt	1.5	1	5	\N	5
283	204933	Jubelsalami skivad SV	6.2	1	5	\N	5
284	213094	Juice Apelsin Morot Ingefära Chili PET	12.5	1	5	\N	5
285	203296	Juledamer Baby Säsongsvara	24.5	1	5	\N	5
286	117495	Juleskum chokladdoppad burk	15.5	1	5	\N	5
287	192898	Julknäcke	5.9	1	5	\N	5
288	700122	Julkorv kokt SE	15.1	1	5	\N	5
289	103025	Julmust PET	2.9	1	5	\N	5
290	116129	Julmust PET	3.2	1	5	\N	5
291	119711	Julmust Premium ENGL	2.5	1	5	\N	5
292	121821	Julsenap glasburk	6.5	1	5	\N	5
293	406273	Julvört skivad russin Tina och servera	7.4	1	5	\N	5
294	401814	Julvört utan russin skivad Tina och servera	7.1	1	5	\N	5
295	208562	Jäst bageri söt	9.7	1	5	\N	5
296	104916	Kaffe mellanrost brygg	22.1	1	5	\N	5
298	122232	Kaffe mellanrost brygg	9.8	1	5	\N	5
299	121510	Kaffe Mellanrost Brygg	11.6	1	5	\N	5
300	118081	Kaffe mellanrost brygg Bistro	14.9	1	5	\N	5
301	104913	Kaffe mellanrost bryggmalet påse	12.2	1	5	\N	5
302	109837	Kaffe mellanrost Fair brygg EKO	14.3	1	5	7310050001777	5
303	104914	Kaffe mellanrost maskinbrygg	10.4	1	5	\N	5
218	209115	Grebbestads® Ansjovisfilé Original	5.95	1	5	7311170022116	5
269	207322	iKaffe	3.95	1	5	7394376616037	5
226	201321	Gräddfil 12%	2.95	1	5	7310865004703	5
245	123738	Hamburgerdressing Original	7.95	1	5	7392005801502	5
222	121295	Grillkrydda	3.95	1	5	7311311014192	5
228	109199	Gräddsås 3-pack	3.95	1	5	7322550092025	5
268	109473	Idealmakaroner gammeldags	4.2	1	5	7310130003547	5
232	184519	Gulaschsoppa Österrikisk	7.95	1	5	7310240064377	5
297	120208	Kaffe mellanrost brygg	12.95	1	5	8711000530085	5
264	606268	Hudsalva Idomin 50g	3.95	3	5	7310610011345	5
267	183957	Husman	3.95	1	5	7300400118415	5
211	107592	Gott & Blandat Supersur	2.95	1	5	7310350116256	5
203	120105	Geléhallon	4.8	1	5	6411401036699	5
209	750683	Gott & Blandat Original	2.95	1	5	7310350504305	5
270	117949	Ingefära malen påse	1.95	1	5	7311311004551	5
212	114889	Grahamsmjöl	6.5	1	5	7310130006067	5
250	147415	Havregryn påse	5.95	1	5	7310130321122	5
223	121299	Grillkrydda	18.9	1	5	7311311014024	5
253	113329	Havreknäcke GF LF	5.95	1	5	7310100600462	5
205	213021	Gifflar kanel	6.95	1	5	7311070006209	5
220	115754	Grillchips	4.1	1	4	7310532106501	5
271	186050	Inlagd sill bit MSC	4.1	1	5	7311171004050	5
304	114722	Kaffe skånerost brygg RA	16.7	1	5	7310731101734	5
307	209094	Kalles Original. KRAV MSC	17.9	1	5	\N	5
308	192242	Kalles Randiga MSC	7.3	1	5	7311171001943	5
309	180120	Kalvfond 0.8% salt	9.5	1	5	7322550052715	5
310	209009	Kalvsylta Deli Sverige	4.7	1	5	\N	5
311	606409	Kanalljus stearin 20cm ø24mm brinntid 6 tim vit	55.1	3	5	\N	5
312	121305	Kanel malen glasburk	3.8	1	5	\N	5
313	117951	Kanel malen påse	1.9	1	5	\N	5
315	180077	Kantarellsoppa	4.7	1	5	7322550031833	5
316	109203	Kantarellsås 3-pack	5.8	1	5	7322550092216	5
317	121309	Kardemumma malen glasburk	7.1	1	5	\N	5
318	117953	Kardemumma malen påse	4.7	1	5	\N	5
319	117954	Kardemummakärnor påse	4.1	1	5	\N	5
320	114552	Kardemummaskorpor	5.6	1	5	\N	5
321	734034	Kardemummaskorpor	26.4	1	5	\N	5
322	760870	Kardemummaskorpor	6.9	1	5	\N	5
323	123239	Karl Fazer Mjölkchoklad	2.7	1	5	6416453015746	5
324	400318	Kavring Böste skivat Tina och servera	7.1	1	5	\N	5
325	208442	Keso 4% KRAV	6.2	1	5	\N	5
326	209922	Keso Naturell 1.5% LF	11.3	1	5	\N	5
327	212563	Keso Naturell 4%	4.1	1	5	\N	5
328	101561	Ketchup plastflaska	8.6	1	5	\N	5
329	103298	Kexchoklad mini påse	5.6	1	5	\N	5
330	107090	Kexchoklad minibit lösvikt.	2.5	1	5	\N	5
332	124654	Kexchoklad Vegan 40g	2.1	1	5	7310350132669	5
333	122648	Kick Mango limited edition	0.8	1	5	\N	5
335	777365	Kick original lösvikt	2	1	5	\N	5
337	120814	Kick Sea Salt Caramel	0.8	1	5	7310350129140	5
338	120342	Kina gul snacks	2.8	1	5	6416453039131	5
339	121201	Kina Gul Snacks	6.2	1	5	\N	5
340	121202	Kina Röd Snacks	6.2	1	5	\N	5
341	425253	Kladdkaka Tina och servera	8.3	1	5	\N	5
342	410957	Kladdkaka vegansk tina och servera	8.9	1	5	7310890203652	5
345	111065	Knäcke Fäbod surdeg	14.6	1	5	\N	5
349	109163	Knäcke Surdeg Gourmet	15.9	1	5	\N	5
351	120191	Knäcke trekant KRAV	4.1	1	5	\N	5
353	119236	Knäckebröd Naturell Glutenfri Laktosfri	10.1	1	5	\N	5
354	119239	Knäckebröd Sesam & havssalt Gluten & Laktosfri	8.9	1	5	\N	5
355	605638	Knäckformar Fettbeständigt papper 18x14mm vit	3.8	3	5	\N	5
356	209869	Korv Enrisrökt Sverige	7.7	1	5	\N	5
357	742973	Korvbröd 10-pack Tina och servera	3.8	1	5	7311379537015	5
358	404147	Korvbröd 16-pack Tina och servera	5.2	1	5	\N	5
359	408894	Korvbröd Glutenfri Laktosfri Tina och servera	8	1	5	\N	5
360	900844	Korvbröd ljust Tina och servera	5.7	1	5	\N	5
361	786468	Kristina Kardemumma skorpor	5.9	1	5	\N	5
362	150453	Kristyr vit	5.3	1	5	\N	5
365	600676	Kronljus 24cm ø22mm 10-p vit	10.7	3	5	4002911152591	5
366	201408	Kronljus 28cm ø22mm 8-p rosa	\N	3	5	7350023011099	5
367	201404	Kronljus 28cm ø22mm 8-p grå	\N	3	5	7350023011051	5
368	\N	Kronljus 24cm ø22mm 8-p grön	\N	3	5	7350023011754	5
369	\N	Kronljus 24cm ø22mm 8-p svart	\N	3	5	7350023011853	5
370	605548	Kronljus stearin 20cm ø22mm 10-pack röd	8.9	3	5	7350023011570	5
371	900900	Kronljus stearin 20cm ø22mm vit	20	3	5	7301002408676	5
372	900901	Kronljus stearin 25cm ø22mm vit	26.3	3	5	\N	5
373	117972	Kryddpeppar hel påse	5.6	1	5	7311311004797	5
374	121321	Kryddpeppar malen	4.4	1	5	\N	5
375	205677	Kräftost 17% tub	13.7	1	5	\N	5
377	180121	Kycklingfond 0.8% salt	9.5	1	5	7322550052722	5
379	114886	Kärnvetemjöl	9.3	1	5	\N	5
380	240539	Köttkorv kokt Sverige	7.3	1	5	\N	5
382	158029	Lakrifun lösvikt	1.4	1	5	\N	5
383	156520	Lakrisal	0.8	1	5	\N	5
384	124253	Lakrits choklad lakrits	5.7	1	5	\N	5
385	124255	Lakrits choklad turkisk peppar	5.7	1	5	\N	5
386	709935	Lakritsbåtar lösvikt	1	1	5	\N	5
387	118458	Lakritsi Chocolate	0.7	1	5	\N	5
389	121205	Lakritsi Mint	0.6	1	5	6416453061446	5
390	118457	Lakritsi Original	0.5	1	5	\N	5
391	118482	Lakritsi Raspberry	0.7	1	5	6416453061385	5
393	118463	Lakritsi Smoot Salmiak	4.7	1	5	\N	5
394	118461	Lakritsi Soft Original	4.7	1	5	\N	5
395	407794	Lantbröd m havssalt	7.1	1	5	\N	5
397	745125	Lantchips Gräddfil	1.4	1	5	7392659005721	5
398	767847	Lantchips Gräddfil & Lök	4.1	1	5	\N	5
400	121236	Lapin Kulta 3.5% BRK	1.6	1	5	6413600091226	5
401	121236	Lapin Kulta 3.5% BRK	9.8	1	5	6413605091221	5
381	192320	Köttsoppa m grönsaker	5.95	1	5	7310500025285	5
305	111477	Kakao ögon	5.95	1	5	6416453062320	5
344	111064	Knäcke Fäbod original	8.95	1	5	7312080003615	5
352	147235	Knäckebröd Frukost	3.95	1	5	7300400248204	5
348	108784	Knäcke surdeg flerkorn	4.5	1	5	7300400128926	5
347	108671	Knäcke rund normalgräddat	7.95	1	5	7312082001015	5
350	108673	Knäcke trekant brungräddat	2.95	1	5	7312080004025	5
346	108672	Knäcke rund brungräddat	7.95	1	5	7312082001039	5
392	118459	Lakritsi Salmiak	1	1	5	6416453061392	5
388	118456	Lakritsi Lemon	1	1	5	6416453061354	5
399	126339	Lantchips lättsaltade	4.5	1	5	7392659002003	5
334	119452	Kick Original	0.8	1	30	5700417006804	10
314	117971	Kanel malen påse	2.95	1	5	7311311004803	5
364	212369	Kronjäst matbröd färsk	1.9	1	5	73500391	5
363	212370	Kronjäst för söta degar färsk	1.9	1	5	73500360	5
378	114885	Kärnvetemjöl	3.95	1	5	7310130006043	5
343	409055	Klassiska Köttbullar	7.95	1	5	7310240039535	5
331	141794	Kexchoklad stycksak	0.5	1	5	7310040027565	5
336	110409	Kick Sea salt	0.8	1	5	7310350117116	5
396	126350	Lantchips Gräddfil	4.5	1	17	7392659002102	5
402	115614	Laxbullar i hummersås	6.5	1	5	\N	5
403	212361	Laxfilé gravad skivad. 150 g	11.3	1	5	\N	5
404	212360	Laxfilé kallrökt skivad. 150 g	11.3	1	5	7393423001154	5
405	739615	Leverpastej bredbar	2.6	1	5	\N	5
406	135529	Likörkonfekt lösvikt	2.4	1	5	\N	5
407	106024	Linfrö helt	12.4	1	5	\N	5
408	124342	Linfrön Hela	3	1	5	\N	5
409	701659	Lingonkraft Tina och servera mjölkfritt	9.3	1	5	\N	5
410	100468	Lingonsylt	19.8	1	5	\N	5
412	114986	Lingonsylt KRAV	20.2	1	5	\N	5
413	112403	Lingonsylt mer bär & mindre socker	13.2	1	5	\N	5
414	900524	Lingonsylt refill	8	1	5	\N	5
415	117598	Linschips Gräddfil & Lök	4.7	1	5	\N	5
416	124510	Linschips Ost och Rödlök	4.7	1	5	\N	5
417	124603	Linschips Ramslök & Gräddfil	3.1	1	5	\N	5
418	121130	Linschips Ranch & Sourcream	4.7	1	5	\N	5
419	123002	Linschips Roasted Onion	4.7	1	5	\N	5
420	603968	Ljuslykta Billy 140x75mm metall	20.3	3	5	\N	5
421	604994	Ljuslykta Bliss gold 140x75mm metall	27.5	3	5	\N	5
422	103251	Loka citron BRK	0.8	1	5	\N	5
423	115526	Loka Crush Hallon BRK	1.5	1	4	7310401021010	5
424	123521	Loka Crush Jordgubb PET	2.6	1	5	\N	5
425	115525	Loka Crush Päron BRK	1.5	1	5	\N	5
426	123551	Loka Crush Päron PET	2.6	1	5	\N	5
427	123808	Loka Crush Tropisk PET	2.6	1	5	\N	5
428	124803	Loka Fläder Päron PET	1.9	1	5	7310401043050	5
429	124561	Loka Jordgubb Granatäpple PET	1.9	1	5	\N	5
430	111224	Loka Naturell 12-p PET	1.3	1	5	\N	5
432	120311	Loka naturell PET	3.2	1	5	\N	5
434	186134	Loka naturell REGL	0.8	1	5	\N	5
435	123549	Loka citron PET	1.9	1	5	7310400020731	5
436	103253	Loka Päron BRK	0.8	1	5	\N	5
437	123504	Loka Päron PET	1.9	1	5	\N	5
438	123510	Loka Solig Citrus PET	1.9	1	5	\N	5
439	108259	Lågkalori Äppelmos	8.1	1	5	\N	5
440	209868	Läckökorv Sverige	7.7	1	5	\N	5
441	112816	Läkerol Bon Bons	1.8	1	5	7310350118540	5
442	112809	Läkerol Cactus	1.8	1	5	7310350118496	5
443	112811	Läkerol Cassis	1.8	1	5	7310350118465	5
444	124664	Läkerol Classic Red Orange	1.9	1	5	\N	5
445	112814	Läkerol Eucalyptus	1.8	1	5	\N	5
446	112813	Läkerol Original	1.8	1	5	\N	5
447	123631	Läkerol Raspberry Licorice	1.9	1	5	\N	5
448	124247	Läkerol Raspberry Licortice Big	4.7	1	5	7310350132805	5
449	112808	Läkerol Salmiak	1.8	1	5	7310350118519	5
450	112823	Läkerol Salty Caramel	1.9	1	5	\N	5
451	112807	Läkerol Salvi	1.8	1	5	7310350118595	5
452	112818	Läkerol Seasalt	1.8	1	5	\N	5
453	122160	Läkerol Äpple Fläder	1.9	1	5	\N	5
454	102329	Lättdryck lingon tranbär	1.8	1	5	\N	5
455	205446	Lättfil 0.5%	4.4	1	5	\N	5
456	115758	Lättsaltade Potatischip	5	1	5	\N	5
457	121322	Lökpulver	4.4	1	5	\N	5
461	107516	M peanut påse	3.8	1	5	\N	5
462	187970	Majonnäs äkta tub 77%	6.2	1	5	\N	5
463	116771	Majonnäs äkta tub 81%	5	1	5	\N	5
464	106961	Majsfusilli Glutenfri	7.3	1	5	\N	5
465	114776	Majsvälling 6 mån	20.3	1	5	\N	5
466	180878	Makaroner glutenfria	8.3	1	5	\N	5
467	123014	Makrillfilé Dansk	4.2	1	5	\N	5
468	146235	Mandelbiskvier	4.2	1	5	\N	5
469	116774	Mandelkubb	6.8	1	5	7317065004014	5
471	705199	Mandelmassa	20.2	1	5	\N	5
472	115300	Mandelägg	5	1	5	5774540959146	5
473	244006	Mangoraja. kall sås. flaska	8.9	1	5	\N	5
475	120491	Mannagryn KRAV	7.3	1	5	\N	5
476	123633	Marabou Havssalt	5.9	1	5	7622201099374	5
477	121532	Marabou Hjärta	11.6	1	5	\N	5
478	112893	Marabou Premium Salty Liqourice Kaka	5.6	1	5	\N	5
479	132755	Marianne lösvikt	2.4	1	5	\N	5
480	117794	Marianne Original	3.5	1	5	\N	5
481	107411	Mariestad alkoholfri ENGL	2.5	1	13	7310401009551	5
482	112004	Mariestads 3.5 % BRK	17.4	1	5	\N	5
483	120926	Mariestads 3.5% 6-pack BRK	2.5	1	5	\N	5
485	605421	Marschaller 8h Easy Light ø103mm	2.4	3	5	\N	5
486	606447	Marschaller med lock ø103mm brinntid 8tim	2.3	3	5	6410405203724	5
487	134066	Marsipanbröd nougat	2.9	1	5	\N	5
488	115289	Marsipanägg Mini	5	1	5	\N	5
489	208485	Matjessill delad i glasburk MSC	11.2	1	5	\N	5
490	201422	Matjessillfilé MSC	7.1	1	5	\N	5
492	208801	Medvurst Kokt 110g	4.2	1	5	\N	5
493	121387	Mejram	4.7	1	5	\N	5
494	208426	Mellanmål Cashewnötter Apelsin Ananas Papaya	5	1	5	\N	5
495	208428	Mellanmål Hasselnöt Blåbär Tranbär	5	1	5	\N	5
496	118494	MER Hallon Blåbär brik	1	1	5	\N	5
497	212164	Messmör	5	1	5	\N	5
499	123063	Micropop 3-pack Saltade	6.3	1	5	\N	5
500	123065	Micropop Smör 14 x 240g	6.3	1	5	\N	5
501	207662	Svecia 28% SGB	0	1	5	\N	5
503	158468	Syrlig Happy Chew lösvikt	1.3	1	5	\N	5
504	101487	Syrlingar lösvikt	1.3	1	5	\N	5
431	103252	Loka naturell BRK	2	1	15	7310401007120	5
433	123509	Loka naturell PET	2.5	1	12	7310400020182	5
459	186006	Löksill fransk bit MSC	4.1	1	5	7311171004128	5
460	106671	Löksill MSC	8.3	1	5	7311171006511	5
498	207014	Messmör Original 5%	3.5	1	5	7313160002443	5
411	107258	Lingonsylt	8.95	1	5	7313590199508	5
470	116776	Mandelmassa	4.95	1	5	5709521036226	5
474	123899	Mannagryn	5.95	1	5	7310130010590	5
491	117835	Mazarin singel	1.5	1	5	7315361112372	5
458	186047	Löksill bit MSC	4.1	1	5	7311171004067	5
505	607025	Såpa citron 750ml	4.4	3	5	7310610021450	5
511	116939	Tacosås Hot	4.7	1	5	7311312002143	5
514	124724	Tasty Bites Poppy seed Sourdough & Sea salt	4.1	1	5	\N	5
515	124012	Te hallon grädde EKO FT	0.777	1	5	7350054815833	5
516	124038	Te rabarber vanilj EKO FT	0.777	1	5	7350054815741	5
518	122188	Tomatketchup Osötad	8	1	5	\N	5
519	104910	Tonfiskpastej MSC	6.5	1	5	\N	5
522	115895	Tortilla Chips Cheese	4.4	1	5	\N	5
523	115897	Tortilla Chips Salted	4.4	1	5	\N	5
524	210307	Trekantmacka Kebab	6.5	1	5	\N	5
525	210308	Trekantmacka Kyckling	6.5	1	5	\N	5
526	210305	Trekantmacka Salami. Oliver. Ruccola	6.5	1	5	\N	5
527	108342	Trocadero BRK	1.4	1	5	\N	5
529	123507	Trocadero PET	2.5	1	5	\N	5
530	120412	Trocadero zero BRK	1.4	1	5	\N	5
531	120414	Trocadero zero PET	3.2	1	5	\N	5
532	100957	Tunnbröd Gammeldags	8.9	1	5	\N	5
533	107618	Tunnbröd Gene original	6.8	1	5	\N	5
534	100958	Tunnbröd Korn	9.2	1	5	\N	5
535	400378	Tunnbröd litet rektangulärt Tina och servera mjölkfritt	0.9	1	5	\N	5
536	715644	Tunnbröd rektangel Tina och servera	1.1	1	5	\N	5
537	409940	Tunnbröd sviktat Tina och servera	4.1	1	5	\N	5
538	774495	Tunnpannkaka enkelvikt	0.9	1	5	\N	5
540	111975	Tutti Frutti Passion	3.2	1	5	\N	5
541	115943	Tutti Frutti Sour	3.5	1	5	\N	5
542	102009	Tutti Frutti tablettask	0.8	1	5	\N	5
543	100733	Twist	7.4	1	5	\N	5
544	604400	Tvål pump flytande 300ml Blåbär	4.4	3	5	\N	5
547	123566	Tyrkisk Peber Soft and Salty	2.9	1	5	\N	5
548	122800	Tårtbotten 24 cm	6.8	1	5	\N	5
551	150006	Vaniljsocker	5	1	5	\N	5
553	235247	Vaniljsås 10%	2.5	1	5	\N	5
554	208423	Vaniljvisp	4.2	1	5	\N	5
555	403729	Varsågod skivad Tina och servera	5	1	5	\N	5
557	404282	Vetetuben Tina och servera	10.7	1	5	\N	5
558	200674	Wienerkorv Sverige	15.5	1	5	7330671013171	5
559	180118	Viltfond kantarell 0.8% salt	9.5	1	5	7322550052692	5
561	208512	Visp havre 20%	4.4	1	5	\N	5
562	209970	Vispgrädde Sojabaserad Edge 25.5%	8.5	1	5	\N	5
565	123351	Välling med fullkorn. osockrad	20.2	1	5	\N	5
566	707356	Värmeljus 39mm 4h	7.1	3	5	\N	5
567	706094	Värmeljus 39mm 6h	5.9	3	5	\N	5
568	752382	Värmeljus 59mm Maxi 10h	15.2	3	5	7321010006107	5
569	900907	Värmeljus vegetabiliskt fett ø39mm 6h	7.4	3	5	5024333237181	5
571	410057	Vörtlimpa skivad	10.4	1	5	\N	5
572	117986	Vörtmix påse	3.6	1	5	\N	5
573	183308	Wafers Jätten vanilj	7.4	1	5	7310525501412	5
574	209285	Yalla drickyoghurt hallon och blåbär	5	1	5	\N	5
575	202042	Yoggi jordgubb smultron 2%	7.7	1	5	\N	5
576	115031	Yogi Tea Rooibos KRAV	9.6	1	5	\N	5
579	141785	Zoo Tablettask	0.6	1	5	7310780002303	5
580	208770	Åseda Gräddost 38%	14.3	1	7	5711953018275	5
581	205691	Ädelost 19% tub	9.7	1	5	\N	5
582	206202	Ädelost Grädd 36%	6.8	1	4	7311878172335	5
584	112409	Äppelmos med mer frukt & mindre socker	6.2	1	5	\N	5
585	111852	Äppelmos osötad EKO	12.8	1	5	\N	5
589	192335	Örtsalt Herbamare EKO	12	1	5	7610313412143	5
590	\N	Mer Päron	2	1	4	54490475	5
591	\N	Aqua d'or	2	1	6	5703828003288	5
593	\N	Loka Citron 33cL	2	1	5	7310401007113	5
595	\N	Loka Crush Päron 33cL	2	1	4	7310401020952	5
596	\N	Julmust Apotekarnes Sockerfri 0.5L	2.5	1	15	7310070733856	5
597	\N	Julmust Apotekarnes 33cL	2	1	22	7310070765802	5
599	\N	Julmust Apotekarnes 0.5L	2.5	1	4	7310070059208	5
600	\N	Herrljunga Julmust 33cL	2	1	15	7312720042271	5
601	\N	Lagrad Julmust Nygårda 33cL	2	1	14	7310401004778	5
603	\N	Julmust Apotekarnes Sockerfri 1.4L	3.95	1	5	7310070151308	5
604	\N	Jokk Lingon 1L	5.25	1	6	7310861008804	5
811	209145	Sill i dillsås	6.8	1	5	\N	5
549	118905	Tändstickor	3.5	3	-6	7310680023118	5
592	\N	Ramlösa 0.5L	2.5	1	11	7310070001719	5
602	\N	Blandsaft Hallon BOB	7.95	1	8	7310090345138	5
560	102010	Viol Tablettask	1	1	1	6411401037184	5
598	\N	Julmust Apotekarnes 1.4L	3.95	1	-8	7310070151209	5
594	\N	Trocadero 33cL	2	1	6	7310401007151	5
577	103642	Zingo orange BRK	2	1	30	7310070766113	5
570	784673	Västerbottensost 35% normalbit	17.95	1	5	7310861081005	5
564	759976	Vitvinsvinäger	8.95	1	5	7310155506450	5
563	192858	Vitvinsvinäger	5.5	1	5	7310155506405	5
583	192859	Äppelcidervinäger	5.5	1	5	7310155507495	5
588	101901	Ättikssprit 12%	4.5	1	5	7310300011020	5
587	109572	Ättika 24%	3.95	1	5	7320081190302	5
517	111342	Tomatketchup Original	4.2	1	5	7310240060638	5
586	133357	Äpplemos	4.95	1	5	7310090301882	5
545	602711	Tvålull 100g Bra miljöval	4.95	3	5	7310034230100	5
506	607024	Såpa grön 750ml	4.5	3	5	7310610021474	5
507	607026	Såpa gul 750ml	4.5	3	5	7310610021467	5
546	111979	Tyrkisk Peber Original	2.95	1	5	6416453028210	5
578	119710	Zoo	1.5	1	5	7310350103959	5
552	110097	Vaniljsocker ögon	3.95	1	5	6416453068865	5
521	121740	Kronjäst för söta degar färsk	1.9	1	5	73500360	5
556	114884	Vetemjöl special	7.95	1	5	7310130006050	5
512	117114	Tacosås Medium	4.5	1	5	7311312002112	5
513	117113	Tacosås Mild	4.5	1	5	7311312002075	5
509	169545	Taco Tubs	7.95	1	5	7311310038205	5
508	114523	Taco Spice Mix påse	2	1	5	7311310031015	5
510	101060	Tacoskal	6.95	1	5	7311310038038	5
528	120271	Trocadero PET	3.95	1	8	7310401000374	4
605	\N	Blossa Glögg Lätt 75cL	9.95	1	5	5710778002148	5
606	\N	Flaggpunsch 26% 0.5L	25	3	3	7312041588021	5
609	\N	Mandel biskvier	3.5	1	17	7310040094727	5
610	\N	Iskonfekt Glutenfri	6.5	1	6	4008601261802	5
613	\N	Kvibille Cheddar	19.95	1	6	2340302104289	5
614	\N	Leverpastej Lönneberga	3.5	1	16	7310941801301	5
617	\N	Mangoraja	6.95	1	8	7313161404987	5
618	\N	Kallrökt Lax 350g Korshags	24.95	1	10	2357553003612	5
619	\N	Gravad Lax 350g Korshags	24.95	1	6	2357552803565	5
620	\N	Varmrökt Lax Naturell 125g Korshags	9.95	1	4	5755325	5
621	\N	Varmrökt Lax Citron 125g Korshags	9.95	1	8	5755332	5
622	\N	Kallrökt Lax 150g Korshags	12.95	1	15	2357552901506	5
623	\N	Gravad Lax 150g Korshags	12.95	1	3	2357552701502	5
624	\N	Tunnbröd Hård	6.95	1	5	7313830006795	5
628	208731	Mild Yoghurt Müsli kokosflarn/Jordgubb	5	1	5	\N	5
629	210796	Milkshake protein choklad	4.7	1	5	\N	5
630	210797	Milkshake Protein Jordgubb	4.7	1	5	\N	5
631	235692	Mimosasallad	3.2	1	5	\N	5
632	718497	Mineralvatten ENGL	2.1	1	5	\N	5
634	158124	Mintchoko rulle	3.2	1	5	\N	5
635	158289	Mintkrokant chokladkaka	5	1	5	\N	5
636	134496	Mjölkchoklad daimrulle	3.2	1	5	\N	5
637	158079	Mjölkchoklad Kaka	2.9	1	5	7310511210304	5
638	158085	Mjölkchoklad Kaka	5	1	5	\N	5
639	110559	Mjölkchoklad Oreo	5.6	1	5	\N	5
640	158145	Mjölkchoklad rulle	3.2	1	5	\N	5
641	122063	Mjölkchokladkaka	5.3	1	5	\N	5
642	101095	Mjölmix grov glutenfri	12.8	1	5	\N	5
643	727634	Mjölmix naturligt. majsbaserad glutenfri och mjölkfri	13.2	1	5	\N	5
644	409557	Morgonsund Frö	5.4	1	5	\N	5
645	404861	Muffins Choklad Kladd Glutenfri Laktosfri	14.2	1	5	\N	5
646	149452	Mums-mums 4-p	2.9	1	5	\N	5
647	209853	Munkens Svarta 31% normalbit	14.9	1	5	\N	5
648	110661	Müsli EKO	7.7	1	5	\N	5
649	110775	Müsli Sunt och Gott	7.1	1	5	\N	5
650	185850	Måltidsknäcke Krög	4.7	1	5	\N	5
652	100486	Nappar Lakrits	1.7	1	5	\N	5
653	100493	Nappar Sura	1.7	1	5	\N	5
654	117959	Nejlika hel påse	4.7	1	5	\N	5
655	117960	Nejlika malen påse	3.2	1	5	\N	5
658	104809	Norrlands Guld 3.5 % BRK	17.2	1	5	7310402006795	5
661	108754	Nougat	13.2	1	5	\N	5
662	110005	Nygårda Ekfatslagrad Julmust REGL	2.5	1	5	\N	5
663	103032	Nygårda Julmust REGL	1.3	1	5	\N	5
666	212710	Oat for Whipping	10.4	1	5	\N	5
668	134893	Oboy original påse	13.2	1	5	\N	5
669	134952	Oboy original påse	21.4	1	5	\N	5
670	702029	Oliver svarta utan kärnor	8.5	1	5	\N	5
671	238888	Onsalakorv bit	10.8	1	5	\N	5
672	756963	Onsalakorv ring	0	1	5	\N	5
673	211852	Ostkaka	6.5	1	3	7310890100333	5
674	111932	Paradis	24.8	1	2	7310510002566	5
675	115053	Pastellfisk lösvikt.	1.2	1	5	\N	5
677	107953	Pepparkaka Jul plåtburk	11.6	1	5	\N	5
678	124294	Pepparkaka Jul plåtburk	11	1	5	7312220125689	5
680	734026	Pepparkakor burk	33.5	1	5	\N	5
681	180152	Pepparkakor glutenfria	5.6	1	5	\N	5
682	124440	Pepparkakor plåtburk. palmfria	24.5	1	5	\N	5
683	778344	Pepparkaksdeg ask	8.5	1	5	\N	5
684	201966	Pepparkaksdeg kyld	7.3	1	5	7317062055002	5
685	210949	Pepparkaksfil	4.4	1	5	\N	5
686	111162	Pepparkakshjärtan stora	19.8	1	5	\N	5
687	121727	Pepparkakshus	11.6	1	5	\N	5
689	741400	Pepparrot	0	1	5	\N	5
690	774287	Pepparrot riven	24.9	1	5	\N	5
692	133738	PIM PIM tablettask	0.6	1	5	7310780002327	5
694	105943	Plopp Chokladkaka	3.2	1	5	\N	5
695	732695	Plopp dubbel stycksak	1.7	1	5	7310040020726	5
696	116155	Plopp mini	0.6	1	5	\N	5
697	732698	Plopp stycksak	0.8	1	5	\N	5
699	409604	Polarklämma renkött	3.5	1	5	7311800008602	5
700	124482	Polarknäcke Original	7.4	1	5	7313350007203	5
701	110994	Polkagrisar	3.5	1	5	\N	5
702	109766	Polly bilar	4.7	1	5	\N	5
703	103274	Polly blå	3.8	1	5	7310040034556	5
704	103275	Polly röd	4.4	1	5	7310040034563	5
705	150951	Potatismjöl	3.3	1	5	7310160000158	5
611	\N	Extra White	3	1	8	4009900527897	5
659	104809	Norrlands Guld 3.5 % BRK	3.5	1	5	7310401006765	5
625	\N	Le Suédois Pour Les Nuls	7.95	1	11	9782412042694	5
616	\N	Lohmanders Bearnaise	5.4	1	3	7313160004744	5
607	\N	Purity Vodka 40% 0.7L	39	3	-4	7350043200015	5
608	\N	Helsingborg Lager 5% 33cL	5	1	-6	7350060230019	5
651	192597	Mästarmatjes i bit MSC	5.95	1	5	7311170012094	5
707	236756	Potatissallad	5.95	1	5	7313161310561	5
615	\N	Gammeldags Enrisrökt Korv 300g	5.95	1	2	7300202175005	5
660	115189	Norrlandspölsa	5.95	1	5	7310862084272	5
665	184869	Nyponsoppa original	4.5	1	5	7310470063096	5
664	725566	Nyponsoppa klassisk	11.95	1	5	7310470013558	5
667	123848	Oboy original påse	6.95	1	5	7622210664181	5
679	146296	Pepparkakor Annas	5.95	1	5	7312220000054	5
691	119487	Pim Pim	1.5	1	5	7310350109142	5
627	116749	Micropopcorn Smör 3 pack	4.85	1	5	7310532160787	5
657	122667	Noblesse Havssalt crisp	6.95	1	5	7622210976895	5
633	106844	Mini krustader	5.9	1	5	40029180505	5
688	117962	Pepparkakskrydda påse	2.95	1	5	7311311004391	5
676	121600	Penne glutenfri	5.95	1	5	8028833005735	5
698	163080	Pofiber	4.95	1	5	7310100857200	5
693	424067	Pizza Original	2.9	1	5	7310960713654	5
706	235707	Potatissallad	3.95	1	5	7313161311377	5
656	107518	Never stop påse	3.95	1	5	7310510001729	5
708	110144	Premium Dark 70%	5.3	1	5	7622400624520	5
709	100331	Premium Dark Mint	5.3	1	5	\N	5
710	208948	Prickig korv skiv	3.5	1	27	7300200264008	5
712	239875	Prinskorv tunt skinn Sverige	8.1	1	5	\N	5
713	105749	Pripps Blå 3.5% 6-p BRK	13.1	1	5	7310072766050	5
715	210209	Proteinmilkshake Choklad Laktosfri	4.4	1	5	\N	5
716	210210	Proteinmilkshake Vit choklad och hallon Laktosfri	4.4	1	5	\N	5
717	212347	Proviva Blåbär	8.1	1	5	\N	5
718	122766	Proviva Hallon/Granatäp	8.1	1	5	\N	5
719	205851	ProViva HallonBjörnbär UTS	8.9	1	5	\N	5
720	212343	Proviva Mango	8.1	1	5	7350000550535	5
721	212346	Proviva Svart Vinbär	6.2	1	5	\N	5
722	211315	Präst 12 mån 35%	19.4	1	5	\N	5
723	209699	Pucko Original 1.5%	2.9	1	5	\N	5
725	120419	Påskmust PET	3.5	1	5	\N	5
727	725308	Pärlsocker	7.6	1	5	\N	5
728	124817	Ramlösa Granatäpple BRK	1.2	1	5	7310070004772	5
729	104804	Ramlösa original PET	2.3	1	5	\N	5
730	115587	Ramlösa Original PET	3.2	1	5	\N	5
731	116329	Ramlösa Original PET	1.2	1	5	\N	5
733	115765	Ranch & Gräddfil Chips	4.4	1	5	\N	5
734	184012	Remi	6.2	1	5	\N	5
735	117436	Remouladsås tub	3.8	1	5	\N	5
736	407217	Renkorv rökt gourmet	0	1	5	\N	5
738	205656	Rhode Island Dressing dipp	1.3	1	5	\N	5
739	141576	Risifrutti Blåbär	3.8	1	5	\N	5
740	202964	Risifrutti Hallon	2.4	1	5	\N	5
741	203313	Risifrutti Jordgubb laktosfri	4.4	1	5	\N	5
742	203150	Risifrutti Skogsbär	2.7	1	5	\N	5
743	113981	Riskakor Cheddar	5	1	5	\N	5
745	147271	Riskakor lättsaltade EKO	6.5	1	5	\N	5
746	192293	Riskakor Ost glutenfria	4.1	1	5	7310186055804	5
747	167939	Riskakor Pizzasmak glutenfria	5.3	1	5	\N	5
748	722758	Rooibos Blåbär	7.1	1	5	\N	5
749	121332	Rosépeppar hel	6.2	1	5	\N	5
750	101416	Rostad lök	1.8	1	5	\N	5
751	120440	Rotella Fruit lösvikt	27.5	1	5	\N	5
754	168446	Russin	10.5	1	5	\N	5
756	900091	Rågkaka Tina och servera	9.8	1	5	7330671019043	5
758	712324	Rågkusar osötad Tina och servera	10.4	1	5	7314879170003	5
759	117407	Rågmjöl Fint	7.3	1	5	\N	5
760	117409	Rågmjöl Grovt	7.3	1	5	7310130007170	5
762	404329	Rågtuben LF Tina och servera	10.7	1	5	\N	5
764	107230	Rårörda lingon EKO	17.1	1	5	7317661714706	5
765	202047	Räkor i lake MSC (250-350/lb)	17.6	1	5	\N	5
766	205685	Räkost 16% tub	12.8	1	5	\N	5
767	204370	Räkost 17%	15.1	1	5	\N	5
769	708904	Röda Hjärtan lösvikt	1.1	1	5	\N	5
770	121065	Rödbetor aptit skivad	3.8	1	5	7310240051261	5
771	113508	Rödbetor. skivade	7.3	1	5	7310240151169	5
773	237584	Rödbetssallad	5.4	1	5	\N	5
774	204730	Rödbetssallad tärnad	22.4	1	5	\N	5
775	707556	Rödbetssallad tärnad	28.1	1	5	\N	5
776	116952	Saffran påse	5.8	1	5	\N	5
777	121917	Saffran påse	2.8	1	5	\N	5
778	110018	Saffransskorpor	6.8	1	5	\N	5
779	184867	Saftsoppa	5	1	5	7310470063294	5
780	121335	Salladskrydda Italiensk glasburk	4.4	1	5	\N	5
781	121336	Salladskrydda Italiensk plastburk	22.9	1	5	\N	5
782	154360	Salmiakbalk lösvikt	1.6	1	5	\N	5
783	708916	Salmiakgrodor lösvikt	1.1	1	5	\N	5
784	154340	Salt sill lösvikt	1.2	1	5	\N	5
785	118258	Salta Jordnötter	4.4	1	5	\N	5
786	102008	Salta Katten	0.8	1	5	6411401037177	5
787	124651	Salta Katten	3.2	1	5	\N	5
788	123162	Salty Toffee	2.8	1	5	6416453015753	5
789	122064	Salty Toffee Crunch Chokladkaka	5.3	1	5	\N	5
790	183347	Samarin Brustabletter	11	1	5	\N	5
791	187323	Sandw Cream Cheese/Gräslök	1.7	1	5	\N	5
794	409749	Sandwich Mörk Sub	2.8	1	5	\N	5
795	123142	Sandwich Sourcream & Onion	1.7	1	5	\N	5
797	158086	Schweizernöt Chokladkaka	5	1	5	\N	5
798	158143	Schweizernöt rulle	3.2	1	5	\N	5
800	123191	Senap plastflaska	6.9	1	5	\N	5
802	123192	Senap stark plastflaska	6.9	1	5	8717163867914	5
803	120554	Senap stark tub	5	1	5	\N	5
804	109191	Senap sötstark EKO plastflaska	13.6	1	5	\N	5
805	108911	Senap sötstark pipflaska	17.1	1	5	\N	5
807	117964	Senapsfrö gult påse	1.8	1	5	\N	5
810	120021	Shorty Jordgubb. banan & guava	3.2	1	5	\N	5
809	186036	Senapssill bit MSC	4.1	1	5	7311171004135	5
808	106672	Senapssill	8.3	1	5	7311171006528	5
772	235702	Rödbetssallad	3.95	1	5	7313161311360	5
711	774015	Prickig korv skivad	6.95	1	5	7300200266002	5
799	121203	Senap original tub	4.5	1	5	8714100751527	5
806	109190	Senap sötstark plastflaska	6.95	1	5	7392031000016	5
801	117757	Senap skånsk glasburk	5.95	1	5	7310430000581	5
763	139660	Rårörda lingon	8.95	1	5	7310240055184	5
752	185594	Rotmos pulver	6.95	1	5	7310240066098	5
753	182928	Runda Kanel	4.95	1	5	7300400115636	5
744	163785	Riskakor Gräddfil Lök glutenfria	4.5	1	5	7320496055821	5
726	154651	Pärlsocker	3.5	1	5	7310340114026	5
757	192045	Rågkross	3.85	1	5	7310130769030	5
755	191719	Rågflingor	5.95	1	5	7310130331084	5
761	117408	Rågsikt	6.95	1	5	7310130007194	5
737	404128	Renskav	12.5	1	5	7319993289761	5
724	290199	Punschrulle singel	1.5	1	5	7315360010914	5
792	105152	Sandwich cheese paprika	2	1	5	7300400128315	5
796	102839	Sandwich tomat basilika	2	1	5	7300400127363	5
793	102840	Sandwich franska örter	2	1	5	7300400127394	5
768	212215	Räksallad	5.95	1	5	7313160004997	5
812	111175	Singoalla blåbär	6.2	1	5	\N	5
813	121974	Singoalla hallon och lakrits	4.7	1	5	7310520007650	5
816	207802	Skinka Rökt skivad SE 200 g	5.6	1	5	\N	5
817	115065	Skivade rödbetor Mor Annas	8.1	1	5	\N	5
818	404325	Skogaholmslimpa skiv Tina och servera	5.3	1	5	7314875011010	5
819	117356	Skorpor Kardemumma	5.9	1	5	7311070362572	5
820	158362	Skotte dubbel	1.3	1	5	7310511253608	5
823	408901	Slät bulle GF LF	11.9	1	5	\N	5
824	109304	Smart Meal Chokladdryck	5.9	1	5	\N	5
826	124459	Smash Bar choklad	2.8	1	5	\N	5
827	200908	Smoothie Ananas Banan Kokos ENGL	3.5	1	5	7350020720093	5
828	206599	Smoothie blåbär hallon ENGL	3.5	1	5	7350020720024	5
829	206225	Smoothie Jordgubb Banan Guava ENGL	3.5	1	5	7350020720734	5
830	120020	Smoothie Mango Apelsin	3.2	1	5	\N	5
831	206598	Smoothie Mango Apelsin ENGL	3.5	1	5	\N	5
832	205635	Smoothie Peach & Passion ENGL	3.5	1	5	\N	5
833	102680	Smultronmatta lösvikt	1.1	1	5	\N	5
835	111273	Småkakor 4 sorter	9.2	1	5	\N	5
836	901020	Småkakor mixlåda. kolakaka. hallonkrans. havrekaka. vaniljdröm	8.9	1	5	\N	5
837	205820	Småländsk sylta	4.2	1	5	\N	5
838	700612	Smör 82 % normalsaltat	24.1	1	5	\N	5
843	408638	Smörgåstårtbotten rund 14 cm ljus	1.2	1	5	\N	5
844	407375	Smörgåstårtbotten rund 22 cm ljus	12.8	1	5	\N	5
845	109435	Snabbmakaroner	4.4	1	5	7310130003530	5
847	702786	Snickers lösvikt	2.7	1	5	\N	5
849	137548	Snören jordgubb	2.3	1	5	\N	5
850	137546	Snören kola	2.3	1	5	\N	5
851	167928	Sockerkaka mix	5	1	5	\N	5
853	760721	Sopset halvlångt	21.5	3	5	\N	5
854	120483	Sparkles Fläder Citron PET	2	1	5	\N	5
856	792372	Spisbröd	13.7	1	5	\N	5
858	200327	Steksill m skinn MSC	8.6	1	5	\N	5
859	776642	Stenbitsrom svart MSC	89.7	1	5	7392497082298	5
860	731741	Stimorol Original	3.5	1	5	\N	5
862	154668	Strösocker	9.3	1	5	\N	5
863	118579	Stycksaker automat stor. 4 sorter	1.1	1	5	\N	5
864	410637	Surdegskaka Vete osötad	5.3	1	5	\N	5
865	112188	Surdegskex med havssalt	7.7	1	5	\N	5
866	212708	Surströmming	16.7	1	5	\N	5
867	709852	Surströmming	13.6	1	5	\N	5
868	108813	Svagdricka REGL	1.8	1	5	\N	5
870	211079	Svart Finkornig Rom MSC	10.1	1	5	\N	5
871	112416	Svart vinbärsgelé	4.7	1	5	\N	5
872	101401	Svart vinbärsgelé KRAV	8.9	1	5	\N	5
873	900759	Svartvinbärsgelé	14	1	5	\N	5
874	107999	Svartvinbärssaft KRAV	7.8	1	5	\N	5
876	207662	Svecia 28% SGB	0	1	5	\N	5
878	158468	Syrlig Happy Chew lösvikt	1.3	1	5	\N	5
879	101487	Syrlingar lösvikt	1.3	1	5	\N	5
880	607025	Såpa citron 750ml	4.4	3	5	7310610021450	5
886	116939	Tacosås Hot	4.7	1	5	7311312002143	5
889	124724	Tasty Bites Poppy seed Sourdough & Sea salt	4.1	1	5	\N	5
890	124012	Te hallon grädde EKO FT	0.777	1	5	7350054815833	5
891	124038	Te rabarber vanilj EKO FT	0.777	1	5	7350054815741	5
893	122188	Tomatketchup Osötad	8	1	5	\N	5
894	104910	Tonfiskpastej MSC	6.5	1	5	\N	5
897	115895	Tortilla Chips Cheese	4.4	1	5	\N	5
898	115897	Tortilla Chips Salted	4.4	1	5	\N	5
899	210307	Trekantmacka Kebab	6.5	1	5	\N	5
900	210308	Trekantmacka Kyckling	6.5	1	5	\N	5
901	210305	Trekantmacka Salami. Oliver. Ruccola	6.5	1	5	\N	5
902	108342	Trocadero BRK	1.4	1	5	\N	5
904	123507	Trocadero PET	2.5	1	5	\N	5
905	120412	Trocadero zero BRK	1.4	1	5	\N	5
906	120414	Trocadero zero PET	3.2	1	5	\N	5
907	100957	Tunnbröd Gammeldags	8.9	1	5	\N	5
908	107618	Tunnbröd Gene original	6.8	1	5	\N	5
909	100958	Tunnbröd Korn	9.2	1	5	\N	5
910	400378	Tunnbröd litet rektangulärt Tina och servera mjölkfritt	0.9	1	5	\N	5
911	715644	Tunnbröd rektangel Tina och servera	1.1	1	5	\N	5
875	117566	Svartvinbärssaft	5.95	1	15	7310770571581	5
822	186016	Skärgårdssill bit MSC	4.1	1	5	7311171004098	5
821	106673	Skärgårdssill	8.3	1	5	7311171006535	5
814	111176	Singoalla original	4.5	1	5	7310520003089	5
839	700644	Smörgåsfett 75% extrasaltat	5.95	1	16	7310860005859	5
892	111342	Tomatketchup Original	4.2	1	5	7310240060638	5
841	112631	Smörgåsgurka. skivad	5.95	1	5	7310240150131	5
852	125013	Soldatens ärtsoppa extra fläsk	6.95	1	5	7310390001383	5
855	182639	Sparrissoppa	4.95	1	5	7322550031796	5
846	145247	Snabbmarsan vaniljsås 7p	3.5	1	5	7310470016283	5
881	607024	Såpa grön 750ml	4.5	3	5	7310610021474	5
882	607026	Såpa gul 750ml	4.5	3	5	7310610021467	5
857	182918	Sport knäckebröd	3.95	1	5	7300400114752	5
842	145844	Smörgåsrån Vete	3.95	1	5	7310521080300	5
825	119265	Smash	3.5	1	5	7310520006851	5
895	121743	Kronjäst matbröd färsk	1.9	1	5	73500391	5
896	121740	Kronjäst för söta degar färsk	1.9	1	5	73500360	5
877	167846	Syltsocker	4.95	1	5	7310340112473	5
887	117114	Tacosås Medium	4.5	1	5	7311312002112	5
888	117113	Tacosås Mild	4.5	1	5	7311312002075	5
884	169545	Taco Tubs	7.95	1	5	7311310038205	5
883	114523	Taco Spice Mix påse	2	1	5	7311310031015	5
834	409123	Små delikatess köttbullar	6.5	1	5	7310240039504	5
815	212195	Skagenröra	5.95	1	5	7313160005017	5
885	101060	Tacoskal	6.95	1	5	7311310038038	5
848	115406	Snören cola	2.95	1	5	5700417990202	5
903	120271	Trocadero PET	3.95	1	8	7310401000374	4
912	409940	Tunnbröd sviktat Tina och servera	4.1	1	5	\N	5
913	774495	Tunnpannkaka enkelvikt	0.9	1	5	\N	5
914	119493	Tutti Frutti Original	3.5	1	5	6416453038271	5
915	111975	Tutti Frutti Passion	3.2	1	5	\N	5
916	115943	Tutti Frutti Sour	3.5	1	5	\N	5
917	102009	Tutti Frutti tablettask	0.8	1	5	\N	5
918	100733	Twist	7.4	1	5	\N	5
919	604400	Tvål pump flytande 300ml Blåbär	4.4	3	5	\N	5
922	123566	Tyrkisk Peber Soft and Salty	2.9	1	5	\N	5
923	122800	Tårtbotten 24 cm	6.8	1	5	\N	5
924	118905	Tändstickor	3.5	3	5	7310680023118	5
925	118906	Tändstickor 8-Pack	4.1	3	5	7310680022517	5
926	150006	Vaniljsocker	5	1	5	\N	5
928	235247	Vaniljsås 10%	2.5	1	5	\N	5
929	208423	Vaniljvisp	4.2	1	5	\N	5
930	403729	Varsågod skivad Tina och servera	5	1	5	\N	5
932	404282	Vetetuben Tina och servera	10.7	1	5	\N	5
933	200674	Wienerkorv Sverige	15.5	1	5	7330671013171	5
934	180118	Viltfond kantarell 0.8% salt	9.5	1	5	7322550052692	5
935	102010	Viol Tablettask	1	1	5	6411401037184	5
936	208512	Visp havre 20%	4.4	1	5	\N	5
937	209970	Vispgrädde Sojabaserad Edge 25.5%	8.5	1	5	\N	5
940	123351	Välling med fullkorn. osockrad	20.2	1	5	\N	5
941	707356	Värmeljus 39mm 4h	7.1	3	5	\N	5
942	706094	Värmeljus 39mm 6h	5.9	3	5	\N	5
943	752382	Värmeljus 59mm Maxi 10h	15.2	3	5	7321010006107	5
944	900907	Värmeljus vegetabiliskt fett ø39mm 6h	7.4	3	5	5024333237181	5
946	410057	Vörtlimpa skivad	10.4	1	5	\N	5
947	117986	Vörtmix påse	3.6	1	5	\N	5
948	183308	Wafers Jätten vanilj	7.4	1	5	7310525501412	5
949	209285	Yalla drickyoghurt hallon och blåbär	5	1	5	\N	5
950	202042	Yoggi jordgubb smultron 2%	7.7	1	5	\N	5
951	115031	Yogi Tea Rooibos KRAV	9.6	1	5	\N	5
954	141785	Zoo Tablettask	0.6	1	5	7310780002303	5
955	208770	Åseda Gräddost 38%	14.3	1	7	5711953018275	5
956	205691	Ädelost 19% tub	9.7	1	5	\N	5
957	206202	Ädelost Grädd 36%	6.8	1	4	7311878172335	5
959	112409	Äppelmos med mer frukt & mindre socker	6.2	1	5	\N	5
960	111852	Äppelmos osötad EKO	12.8	1	5	\N	5
964	192335	Örtsalt Herbamare EKO	12	1	5	7610313412143	5
965	\N	Mer Päron	2	1	4	54490475	5
966	\N	Aqua d'or	2	1	6	5703828003288	5
968	\N	Loka Citron 33cL	2	1	5	7310401007113	5
969	\N	Trocadero 33cL	2	1	16	7310401007151	5
970	\N	Loka Crush Päron 33cL	2	1	4	7310401020952	5
971	\N	Julmust Apotekarnes Sockerfri 0.5L	2.5	1	15	7310070733856	5
972	\N	Julmust Apotekarnes 33cL	2	1	22	7310070765802	5
973	\N	Julmust Apotekarnes 1.4L	3.95	1	8	7310070151209	5
974	\N	Julmust Apotekarnes 0.5L	2.5	1	4	7310070059208	5
975	\N	Herrljunga Julmust 33cL	2	1	15	7312720042271	5
976	\N	Lagrad Julmust Nygårda 33cL	2	1	14	7310401004778	5
977	\N	Blandsaft Hallon BOB	7.95	1	10	7310090345138	5
978	\N	Julmust Apotekarnes Sockerfri 1.4L	3.95	1	5	7310070151308	5
979	\N	Jokk Lingon 1L	5.25	1	6	7310861008804	5
980	\N	Blossa Glögg Lätt 75cL	9.95	1	5	5710778002148	5
981	\N	Flaggpunsch 26% 0.5L	25	3	3	7312041588021	5
982	\N	Purity Vodka 40% 0.7L	39	3	1	7350043200015	5
983	\N	Helsingborg Lager 5% 33cL	5	1	2	7350060230019	5
984	\N	Mandel biskvier	3.5	1	17	7310040094727	5
985	\N	Iskonfekt Glutenfri	6.5	1	6	4008601261802	5
986	\N	Extra White	3	1	14	4009900527897	5
987	\N	Risgröt Felix 500g	2.95	1	6	7310090755692	5
988	\N	Kvibille Cheddar	19.95	1	6	2340302104289	5
989	\N	Leverpastej Lönneberga	3.5	1	16	7310941801301	5
991	\N	Lohmanders Bearnaise	5.4	1	6	7313160004744	5
992	\N	Mangoraja	6.95	1	8	7313161404987	5
993	\N	Kallrökt Lax 350g Korshags	24.95	1	10	2357553003612	5
994	\N	Gravad Lax 350g Korshags	24.95	1	6	2357552803565	5
995	\N	Varmrökt Lax Naturell 125g Korshags	9.95	1	4	5755325	5
996	\N	Varmrökt Lax Citron 125g Korshags	9.95	1	8	5755332	5
997	\N	Kallrökt Lax 150g Korshags	12.95	1	15	2357552901506	5
998	\N	Gravad Lax 150g Korshags	12.95	1	3	2357552701502	5
999	\N	Tunnbröd Hård	6.95	1	5	7313830006795	5
1000	\N	Le Suédois Pour Les Nuls	7.95	1	12	9782412042694	5
612	\N	Risgröt Felix 500g	2.95	1	4	7310090755692	5
502	167846	Syltsocker	4.95	1	5	7310340112473	5
931	114884	Vetemjöl special	7.95	1	5	7310130006050	5
1	122889	100 Frön & Havssalt	6.2	1	17	7300400482165	5
927	110097	Vaniljsocker ögon	3.95	1	5	6416453068865	5
539	119493	Tutti Frutti Original	3.5	1	1	6416453038271	5
550	118906	Tändstickor 8-Pack	4.1	3	-34	7310680022517	5
1002	\N	Pommac 1.4L	3.95	1	5	7310070701916	5
1003	\N	Herrljunga Cider Alkoholfri 1L	4.65	1	7	7312720022235	5
1004	\N	Loka Citron 1.5L	3.95	1	8	7310401000053	5
1005	\N	Trocadero 50cL	2.7	1	9	7310401024844	5
952	103642	Zingo orange BRK	2	1	30	7310070766113	5
990	\N	Gammeldags Enrisrökt Korv 300g	5.95	1	2	7300202175005	5
939	759976	Vitvinsvinäger	8.95	1	5	7310155506450	5
938	192858	Vitvinsvinäger	5.5	1	5	7310155506405	5
958	192859	Äppelcidervinäger	5.5	1	5	7310155507495	5
963	101901	Ättikssprit 12%	4.5	1	5	7310300011020	5
962	109572	Ättika 24%	3.95	1	5	7320081190302	5
961	133357	Äpplemos	4.95	1	5	7310090301882	5
920	602711	Tvålull 100g Bra miljöval	4.95	3	5	7310034230100	5
921	111979	Tyrkisk Peber Original	2.95	1	5	6416453028210	5
953	119710	Zoo	1.5	1	5	7310350103959	5
22	169009	Bakform Fettbeständigt papper 50x25mm vit	3.6	3	3	7310275586158	5
861	147245	Ströbröd	3.9	1	1	7300400312400	5
1006	\N	Ramlösa 80cL	3.95	1	15	73120001	5
183	117562	Flädersaft	5.95	1	8	7310770548583	5
1007	\N	Grängesberg Jul Lättöl 33cL	3.5	1	8	7310401032641	5
1008	\N	Lapponia 50cL 21%	15.95	3	2	6420614681657	5
714	105749	Pripps Blå 3.5% 6-p BRK	3.5	1	5	7310070766052	5
1009	\N	Stockholms Bränneri Pink Gin	40	3	1	7350015330030	5
1010	\N	Rekorderlig Päron Cider	3.5	1	10	7311100400908	5
1011	\N	Loka Päron 33cL BRK	2	1	10	7310401007137	5
967	\N	Ramlösa 0.5L	2.5	1	11	7310070001719	5
1012	\N	Loka Citron	2.5	1	5	7310401046808	5
1013	\N	Coca-Cola 33cL	2	1	15	5449000214911	5
1014	\N	Froosh Clean Green	3.5	1	2	7350020727726	5
1015	\N	Hela Filéer Sill	7.95	1	5	7311170014111	5
263	181103	Hovmästarsås glasburk	4.5	1	5	7310155800251	5
1016	\N	Inlagd Sill 500g	8.3	1	5	7311171006504	5
1017	\N	Skinkost 175g	7.95	1	10	7311440026752	5
1018	\N	RÄkost	7.95	1	10	7311440026677	5
306	201383	Kalles Original MSC	4.5	1	5	7311170031118	5
1019	\N	Ädelost 175g	6.95	1	9	7311440016364	5
1020	\N	Fil Citron	4.5	1	3	7310867000710	5
1021	\N	Filmjölk Hallon/Blåbär	4.5	1	3	7310865088215	5
1022	\N	Rödbetssallad 400g	5.5	1	3	7313161310677	5
945	784673	Västerbottensost 35% normalbit	17.95	1	5	7310861081005	5
1023	\N	Beer Cheese Ilchester	14.95	1	5	5014442405045	5
1024	\N	Hushållsost	14.95	1	6	2340374706428	5
1025	\N	Arla Ko Präst 31%	17.95	1	5	2340415206948	5
1026	\N	Amerikansk Dressing Original	3.5	1	7	7311440052157	5
1027	\N	Hela Rödbetot	5.95	1	7	7310240051339	5
1028	\N	Kryddpeppar	1.9	1	8	7311311004360	5
1029	\N	Piffi Allkrydda	5.25	1	7	7310700817703	5
1030	\N	Salladskrydda	3.95	1	8	7311311018145	5
1031	\N	Svartpeppar	4.5	1	8	7311311014185	5
1032	\N	Kardemumma Glasburk	6.95	1	6	7311311015205	5
1033	\N	Ekologiska Blandade Bönor	3.75	1	5	7350002403440	5
1034	\N	Ekologiska Rödbettor	8.95	1	8	7310240151107	5
1035	\N	Fiskbullar Räksås	5.4	1	5	7311170041353	5
1036	\N	Kung Gustaf Sardiner	4.5	1	8	7311170061092	5
262	109201	Hollandaisesås 3-pack	3.95	1	5	7322550092018	5
1037	\N	Klassiskt Potatismos	6.95	1	5	7310240066128	5
1038	\N	Oboy 1.1kg	13.95	1	6	7622300248987	5
1039	\N	Löfbergs Mellanrost	12.95	1	8	7310050001142	5
1040	\N	Dippmix Vitlök	1.95	1	3	7340005404254	5
127	124177	Dipmix Rostad Paprika och Vitlök	1.95	1	5	7310532131947	5
1041	\N	Dippmix Sweet Chili	1.95	1	5	7340005404209	5
1042	\N	Dippmix Taco	1.95	1	5	7340005404247	5
1043	\N	Frasvåfflor	3.5	1	10	7310470030203	5
484	117668	Marsan vaniljsås färdig	4.5	1	5	7310470061108	5
1044	\N	Havre Välling 6 mån	13.95	1	4	7310100683533	5
1045	\N	Fullkornsvälling 8 mån	13.95	1	4	7310100683953	5
1046	\N	Havre Fras	7.95	1	3	7311171008386	5
1047	\N	Start Naturell	7.95	1	4	7310130801709	5
1048	\N	Gröt Äpple & Blåbär	3.6	1	1	7310100690708	5
1049	\N	Fullkornsvälling 1 år	13.95	1	5	7310100684370	5
1050	\N	Bliw Blåbär	4.5	3	3	7310618427032	5
869	724727	Svampduk Classic mix 4st	4.5	3	5	7391704800144	5
1051	\N	Yes Original	9.95	3	5	4015600444419	5
1052	\N	Krögarens	4.95	1	5	7300400121187	5
376	145580	Kung Oscar Välkryddade Pepparkakor original	5.95	1	5	7310521058507	5
1053	\N	Ris Kakor Cheddar	4.5	1	3	7350028544066	5
1054	\N	Ris Kakor Pizza	4.5	1	4	7310106055815	5
1055	\N	Knäcke trekant normalgräddat	2.95	1	5	7312080004018	5
1056	\N	Anna Försvaringsask	11.95	3	4	7315340382000	5
1057	\N	Marabou Schweizer nöt	3.1	1	3	7310511216306	5
1058	\N	Marabou Darkmilk Chocolate Roasted Almonds	3.1	1	4	7622210655745	5
1059	\N	Salmiakki	3.5	1	4	6411401015830	5
1060	\N	Marabou Dröm Krisp	3.1	1	5	7622210059956	5
1061	\N	Marabou	3.1	1	5	7622201464011	5
1062	\N	Marabou Premium Fin 70%	4.95	1	5	7622300544010	5
1063	\N	Plopp	3.5	1	5	7310040020504	5
1064	\N	Fazer Chocolate Dumle	2.95	1	5	6416453015739	5
1065	\N	Tutti Frutti Sour	3.5	1	5	6416453035966	5
1066	\N	Bridge	4.95	1	5	7310040052284	5
1067	\N	Polka Grisar	3.5	1	5	7310350117888	5
1068	\N	Marabou Co-co	1.95	1	5	7310511251406	5
1069	\N	Snöre Jordgubb	2.7	1	5	5700417990219	5
1070	\N	Ahlgrens Bilar Fruktkombi	2.95	1	4	7310350132904	5
1071	\N	Lakritsi Original	1	1	5	6416453061361	5
1072	\N	Sun Maid Rusin 250g	4.95	1	5	41143024324	5
626	116748	Micropopcorn Salt 3 pack	4.85	1	5	7310532160794	5
1073	\N	Gröna Kulor Chokladpraliner	9.95	1	5	6416453071339	5
1074	\N	Noblesse Mörk Choklad Krisp	6.95	1	5	7622400706059	5
1075	\N	Knäckformar 240st	3.3	3	5	7312270002749	5
1076	\N	Nejlika	1.95	1	5	7311311004599	5
1077	\N	Brödkryddor	1.7	1	5	7311311005046	5
1078	\N	Kanel	1.5	1	5	7311311004179	5
520	121743	Kronjäst matbröd färsk	1.9	1	5	73500391	5
1079	\N	Agave Sirap	9.95	1	5	3088542506508	5
1080	\N	Mörk Sirap	4.5	1	5	7310340464428	5
1081	\N	Ljus Sirap	4.5	1	5	7310340464435	5
1082	\N	Florsocker	3.5	1	5	5701259100781	5
1083	\N	Brun Farin Strö	3.95	1	5	7310340114033	5
1084	\N	Mandelmassa 500g	14.95	1	2	7393082110761	5
1085	\N	Rågmjöl Finmalt	6.95	1	5	7310130007187	5
1086	\N	Odense Nougat	5.95	1	5	5709521027644	5
1087	\N	Fruktmusli GF	10.95	1	4	7311143200107	5
1088	\N	Psyllium 85% GF	7.95	1	5	7311149104003	5
1089	\N	Frödinge Kladdkaka	9.95	1	5	7310890203508	5
1090	\N	Frödinge Princesstårta	15	1	5	7310890601601	5
1091	\N	Felix Krögarpytt Klassisk	7.95	1	5	7310240075472	5
1092	\N	Polarklämma Skinka	3	1	5	7311800008626	5
1093	\N	polarklämma Kalkon	3	1	5	7311800888006	5
1094	\N	Brakes Värmkorv	15.5	1	2	7330671013164	5
1095	\N	Renstek Varmrökt Skivad 500g	37.5	1	3	7319993222300	5
1096	\N	Frödinge Blåbärspaj	8.3	1	3	7310890201191	5
1097	\N	Skogaholm Originalrost	7.5	1	3	7314875270011	5
1098	\N	Släta Bullar GF	\N	1	5	7330242200665	5
1099	\N	Lypsyl	2.7	3	6	5023721950039	5
1100	\N	Marabou Japp	0.9	1	5	7040110663408	5
1101	\N	Marabou Schweizer Nöt Single	1	1	5	73550020	5
1102	\N	Marabou 30 praliner med nougatfyllning	9.95	1	5	7622210929525	5
1103	\N	Marabou Mjölkchocklad Single	0.9	1	3	73550013	5
1104	\N	Skogaholm Bistro	\N	1	2	7314873552003	5
1105	\N	Fazer Havrefralla	\N	1	1	7314879198007	5
1106	\N	Sandwich Chives	2	1	5	7300400122689	5
1107	\N	Marabou Pigall Dubbel	1.7	1	15	7310511251604	5
1110	\N	Noblesse Original Crisp	6.95	1	20	7622400705960	5
1111	\N	Noblesse Apelsin Crisp	6.95	1	20	7622400706035	5
1112	\N	Cheez Cruncherz	4.1	1	20	7340005403448	4
1113	\N	Kron Jäst Färsk	1	1	20	73500346	5
1114	\N	Senapssill  Stor	8.3	1	10	7350126081821	5
732	206398	Ramslök & Citronsill MSC	4.1	1	4	7311171006979	5
1116	\N	Filmjölk Jordgubb	4.95	1	10	7310865088222	4
1117	\N	Remouladsås	\N	1	10	7310500002477	5
1118	\N	Fiskbuljong	3.75	1	8	8714100786710	3
840	120331	Smörgåsgurka skivad	4.5	1	5	7310240050189	5
1119	\N	Kex Chocklad	2.5	1	20	7310350118342	10
1120	\N	OWL Hot Ranch	4.1	1	16	7340005405374	4
1121	\N	Kockens Saffran 0.5g	3.95	1	20	7310700814207	5
1122	\N	Santa Maria Saffran	4.5	1	12	7311312002044	5
1123	\N	Sopset	19.95	1	4	7312280010451	3
1125	\N	Sheepskin Long Wool Ivory	120	3	1	9325021010656	1
1126	\N	Sheepskin Long Wool Single Rug Teal	120	3	1	9325021034522	1
1124	\N	Sheepskin Long Wool Single Rug Lime	120	3	1	9325021034515	1
1127	\N	Sheepskin Long Wool Single Rug Rose	120	3	1	9325021010793	1
1132	\N	Bulle	3	1	9	\N	5
1133	\N	Bullar X4	10	1	9	\N	5
1135	\N	Formule sandwich	10	1	9	\N	5
1134	\N	Sandwich	6	1	9	\N	5
35	206500	Bearnaisesås chili	4.4	1	15	7350042720132	5
\.


--
-- Data for Name: products_in_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_in_transactions (sale_id, product_id, quantity, product_name, product_price, taxe_id, sale_day, sale_month, sale_year) FROM stdin;
47	35	1	Bearnaisesås chili	4.4	1	\N	3	2022
48	35	2	Bearnaisesås chili	4.4	1	\N	3	2022
49	35	4	Bearnaisesås chili	4.4	1	\N	3	2022
50	35	1	Bearnaisesås chili	4.4	1	\N	3	2022
32	35	1	Bearnaisesås chili	4.4	1	\N	2	2022
33	35	1	Bearnaisesås chili	4.4	1	\N	2	2022
35	35	1	Bearnaisesås chili	4.4	1	\N	2	2022
36	35	1	Bearnaisesås chili	4.4	1	\N	2	2022
37	35	1	Bearnaisesås chili	4.4	1	\N	2	2022
38	35	2	Bearnaisesås chili	4.4	1	\N	2	2022
39	35	4	Bearnaisesås chili	4.4	1	\N	2	2022
40	35	3	Bearnaisesås chili	4.4	1	\N	2	2022
41	35	1	Bearnaisesås chili	4.4	1	\N	2	2022
42	35	2	Bearnaisesås chili	4.4	1	\N	2	2022
43	35	3	Bearnaisesås chili	4.4	1	\N	2	2022
44	396	4	Lantchips Gräddfil	4.5	1	\N	2	2022
44	84	1	Chips Gräddfil & lök	4.1	1	\N	2	2022
31	\N	8	bullar	3	1	\N	2	2022
20	594	4	Trocadero 33cL	2	1	\N	2	2022
9	5	4	Ahlgrens bilar lakrits däck	2.8	1	\N	1	2022
5	550	7	Tändstickor 8-Pack	4.1	3	\N	1	2022
7	22	1	Bakform Fettbeständigt papper 50x25mm vit	4.6	3	\N	1	2022
63	35	1	Bearnaisesås chili	4.4	1	5	3	2022
65	35	10	Bearnaisesås chili	4.4	1	5	3	2022
67	549	3	Tändstickor	3.5	3	9	3	2022
69	1132	1	Bulle	3	1	12	3	2022
69	1133	1	Bullar X4	10	1	12	3	2022
69	1135	1	Formule sandwich	10	1	12	3	2022
51	35	2	Bearnaisesås chili	4.4	1	\N	3	2022
52	35	1	Bearnaisesås chili	4.4	1	\N	3	2022
53	35	1	Bearnaisesås chili	4.4	1	\N	3	2022
54	35	1	Bearnaisesås chili	4.4	1	\N	3	2022
55	35	8	Bearnaisesås chili	4.4	1	\N	3	2022
56	35	1	Bearnaisesås chili	4.4	1	\N	3	2022
56	549	1	Tändstickor	3.5	3	\N	3	2022
12	607	3	Purity Vodka 40% 0.7L	39	3	\N	1	2022
13	625	1	Le Suédois Pour Les Nuls	7.95	1	\N	1	2022
57	549	1	Tändstickor	3.5	3	\N	3	2022
58	549	1	Tändstickor	3.5	3	\N	3	2022
59	35	7	Bearnaisesås chili	4.4	1	\N	3	2022
15	\N	2	bullar	3	1	\N	1	2022
7	17	3	Arbogapastej minilimpa	3.8	1	\N	1	2022
8	22	1	Bakform Fettbeständigt papper 50x25mm vit	4.6	3	\N	1	2022
8	17	3	Arbogapastej minilimpa	3.8	1	\N	1	2022
60	549	5	Tändstickor	3.5	3	\N	3	2022
61	35	1	Bearnaisesås chili	4.4	1	5	3	2022
62	35	2	Bearnaisesås chili	4.4	1	5	3	2022
62	396	4	Lantchips Gräddfil	4.5	1	5	3	2022
64	35	1	Bearnaisesås chili	4.4	1	5	3	2022
66	35	1	Bearnaisesås chili	4.4	1	9	3	2022
70	1134	1	Sandwich	6	1	12	3	2022
16	\N	2	bullar	3	1	\N	2	2022
17	\N	4	bullar	3	1	\N	2	2022
18	\N	5	bullar	3	1	\N	2	2022
19	\N	3	something	8.95	1	\N	2	2022
22	598	6	Julmust Apotekarnes 1.4L	3.95	1	\N	2	2022
23	598	4	Julmust Apotekarnes 1.4L	3.95	1	\N	2	2022
24	6	3	Ahlgrens bilar Sursockrade	2.8	1	\N	2	2022
25	13	2	Apelsinkrokant Chokladkaka	5	1	\N	2	2022
26	20	2	Baconost 17% tub	7.7	1	\N	2	2022
27	20	1	Baconost 17% tub	7.7	1	\N	2	2022
28	\N	3	bullar	3	1	\N	2	2022
29	\N	4	bullar	3	1	\N	2	2022
30	15	1	Apelsinskal kanderat	4.4	1	\N	2	2022
30	\N	3	bullar	3	1	\N	2	2022
31	\N	8	bullar	3	1	\N	2	2022
30	\N	2	bullar	3	1	\N	2	2022
\.


--
-- Data for Name: sales_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_transactions (sale_id, sale_total, taxe_amount, payment_method_id, sale_paid, tva_1, tva_2, tva_3, hors_taxe_1, hors_taxe_2, hors_taxe_3, total_1, total_2, total_3, sale_year, sale_month, sale_day, sale_time, sale_splitted, payment_method_id_2, payment_method_id_2_total) FROM stdin;
1	19.95	2	2	f	0	0	0	0	0	0	0	0	0	\N	\N	\N	\N	f	\N	\N
3	0	\N	\N	t	0	0	0	0	0	0	0	0	0	\N	\N	\N	\N	f	\N	\N
4	0	\N	\N	t	0	0	0	0	0	0	0	0	0	\N	\N	\N	\N	f	\N	\N
2	100	20.95	\N	f	17	\N	3.95	70	\N	\N	0	0	0	\N	\N	\N	\N	f	\N	\N
6	45.4	2.37	\N	t	2.37	\N	\N	43.03	\N	\N	0	0	0	\N	\N	\N	\N	f	\N	\N
7	16	1.3599999999999999	\N	t	0.59	\N	0.77	10.81	\N	3.83	0	0	0	\N	\N	\N	\N	f	\N	\N
8	16	1.36	\N	t	0.59	\N	0.77	10.81	\N	3.83	0	0	0	\N	\N	\N	\N	f	\N	\N
17	12	0.63	2	t	0.63	0	0	11.37	0	0	12	0	0	2022	2	19	14:09:15	f	\N	\N
34	0	\N	\N	f	0	0	0	0	0	0	0	0	0	\N	\N	\N	\N	f	\N	\N
40	13.2	0.69	1	t	0.69	0	0	12.51	0	0	13.2	0	0	2022	2	28	17:20:31	t	1	15
18	15	0.78	1	t	0.78	0	0	14.22	0	0	15	0	0	2022	2	19	14:10:13	f	\N	\N
46	0	\N	\N	f	0	0	0	0	0	0	0	0	0	\N	\N	\N	\N	f	\N	\N
29	12	0.63	2	t	0.63	0	0	11.37	0	0	12	0	0	2022	2	21	19:56:14	f	\N	\N
45	0	\N	\N	f	0	0	0	0	0	0	0	0	0	\N	\N	\N	\N	f	\N	\N
19	26.85	1.4	1	t	1.4	0	0	25.45	0	0	26.85	0	0	2022	2	19	14:10:59	f	\N	\N
38	8.8	0.46	1	t	0.46	0	0	8.34	0	0	8.8	0	0	2022	2	28	17:17:54	t	1	10
43	13.2	0.69	1	t	0.69	0	0	12.51	0	0	13.2	0	0	2022	3	2	16:47:25	t	2	10
31	24	1.25	2	t	1.25	0	0	22.75	0	0	24	0	0	2022	2	24	12:37:22	t	1	4
41	4.4	0.23	1	t	0.23	0	0	4.17	0	0	4.4	0	0	2022	3	2	16:45:26	f	\N	\N
50	4.4	0.23	1	t	0.23	0	0	4.17	0	0	4.4	0	0	2022	3	4	12:00:09	f	\N	\N
57	3.5	0.58	1	t	0	0	0.58	0	0	2.92	0	0	3.5	2022	3	4	18:05:40	f	\N	\N
51	8.8	0.46	1	t	0.46	0	0	8.34	0	0	8.8	0	0	2022	3	4	12:00:18	f	\N	\N
55	35.2	1.84	2	t	1.84	0	0	33.36	0	0	35.2	0	0	2022	3	4	18:02:04	t	1	5.2
52	4.4	0.23	1	t	0.23	0	0	4.17	0	0	4.4	0	0	2022	3	4	12:03:10	f	\N	\N
53	4.4	0.23	1	t	0.23	0	0	4.17	0	0	4.4	0	0	2022	3	4	12:07:05	f	\N	\N
42	8.8	0.46	2	t	0.46	0	0	8.34	0	0	8.8	0	0	2022	3	2	16:45:41	t	1	3
44	32.2	1.68	2	t	1.68	0	0	30.52	0	0	32.2	0	0	2022	3	3	13:04:13	t	1	10
47	4.4	0.23	1	t	0.23	0	0	4.17	0	0	4.4	0	0	2022	3	4	09:47:08	f	\N	\N
48	8.8	0.46	2	t	0.46	0	0	8.34	0	0	8.8	0	0	2022	3	4	09:52:20	t	1	2.8
49	17.6	0.92	2	t	0.92	0	0	16.68	0	0	17.6	0	0	2022	3	4	10:04:20	t	1	2.6
35	4.4	0.23	1	t	0.23	0	0	4.17	0	0	4.4	0	0	2022	2	28	17:14:56	t	1	5
21	23.7	1.24	2	t	1.24	0	0	22.46	0	0	23.7	0	0	2022	2	20	19:10:05	t	1	\N
22	23.7	1.24	1	t	1.24	0	0	22.46	0	0	23.7	0	0	2022	2	20	19:10:37	f	\N	\N
23	15.8	0.82	1	t	0.82	0	0	14.98	0	0	15.8	0	0	2022	2	20	19:13:08	f	\N	\N
10	94.2	13.84	1	t	0.84	0	13	15.36	0	65	16.2	0	78	2022	2	19	12:49:51	t	2	9.95
24	8.4	0.44	1	t	0.44	0	0	7.96	0	0	8.4	0	0	2022	2	21	10:51:37	f	\N	\N
9	11.2	0.58	2	t	0.58	\N	\N	10.62	\N	\N	11.2	\N	\N	2022	2	16	16:01:36	f	\N	\N
25	10	0.52	2	t	0.52	0	0	9.48	0	0	10	0	0	2022	2	21	10:53:33	f	\N	\N
20	8	0.42	1	t	0.42	0	0	7.58	0	0	8	0	0	2022	2	26	11:43:20	f	\N	\N
11	7	0.36	2	t	0.36	0	0	6.64	0	0	7	0	0	2022	2	19	13:00:49	f	\N	\N
12	117	19.5	2	t	0	0	19.5	0	0	97.5	0	0	117	2022	2	19	13:34:58	f	\N	\N
26	15.4	0.8	1	t	0.8	0	0	14.6	0	0	15.4	0	0	2022	2	21	12:28:31	f	\N	\N
13	7.95	0.41	1	t	0.41	0	0	7.54	0	0	7.95	0	0	2022	2	19	13:53:36	f	\N	\N
5	28.7	4.78	1	t	0	0	4.78	0	0	23.92	0	0	28.7	2022	2	26	12:14:34	f	\N	\N
14	9	0.47	1	t	0.47	0	0	8.53	0	0	9	0	0	2022	2	19	14:03:43	f	\N	\N
27	7.7	0.4	1	t	0.4	0	0	7.3	0	0	7.7	0	0	2022	2	21	12:30:02	f	\N	\N
15	6	0.31	1	t	0.31	0	0	5.69	0	0	6	0	0	2022	2	19	14:04:05	f	\N	\N
36	4.4	0.23	1	t	0.23	0	0	4.17	0	0	4.4	0	0	2022	2	28	17:16:11	t	1	5
16	6	0.31	1	t	0.31	0	0	5.69	0	0	6	0	0	2022	2	19	14:06:43	f	\N	\N
28	9	0.47	2	t	0.47	0	0	8.53	0	0	9	0	0	2022	2	21	19:07:11	f	\N	\N
32	4.4	0.23	1	t	0.23	0	0	4.17	0	0	4.4	0	0	2022	2	28	17:11:54	t	1	5
39	17.6	0.92	1	t	0.92	0	0	16.68	0	0	17.6	0	0	2022	2	28	17:19:26	t	1	20
37	4.4	0.23	1	t	0.23	0	0	4.17	0	0	4.4	0	0	2022	2	28	17:17:18	t	1	5
33	4.4	0.23	1	t	0.23	0	0	4.17	0	0	4.4	0	0	2022	2	28	17:13:07	t	1	5
30	10.4	0.54	2	t	0.54	0	0	9.86	0	0	10.4	0	0	2022	2	24	12:34:18	t	1	0.4
54	4.4	0.23	1	t	0.23	0	0	4.17	0	0	4.4	0	0	2022	3	4	15:30:43	f	\N	\N
58	3.5	0.58	1	t	0	0	0.58	0	0	2.92	0	0	3.5	2022	3	4	18:06:24	f	\N	\N
56	7.9	1.31	2	t	0.73	0	0.58	3.67	0	2.92	4.4	0	3.5	2022	3	4	18:04:44	t	1	2.9
60	17.5	2.92	2	t	0	0	2.92	0	0	14.58	0	0	17.5	2022	3	4	20:13:40	f	\N	\N
59	30.8	1.61	1	t	1.61	0	0	29.19	0	0	30.8	0	0	2022	3	4	20:12:59	f	\N	\N
61	4.4	0.23	1	t	0.23	0	0	4.17	0	0	4.4	0	0	2022	3	5	18:38:14	f	\N	\N
62	26.8	1.4	1	t	1.4	0	0	25.4	0	0	26.8	0	0	2022	3	5	22:32:23	f	\N	\N
63	4.4	0.23	1	t	0.23	0	0	4.17	0	0	4.4	0	0	2022	3	7	19:39:14	f	\N	\N
64	4.4	0.23	1	t	0.23	0	0	4.17	0	0	4.4	0	0	2022	3	7	19:40:54	f	\N	\N
65	44	2.29	2	t	2.29	0	0	41.71	0	0	44	0	0	2022	3	9	10:43:16	f	\N	\N
66	4.4	0.23	1	t	0.23	0	0	4.17	0	0	4.4	0	0	2022	3	9	18:45:02	f	\N	\N
67	10.5	1.75	2	t	0	0	1.75	0	0	8.75	0	0	10.5	2022	3	9	18:46:02	f	\N	\N
68	23	1.2	2	t	1.2	0	0	21.8	0	0	23	0	0	2022	3	12	11:59:47	t	1	3
69	29	1.51	1	t	1.51	0	0	27.49	0	0	29	0	0	2022	3	12	12:12:13	f	\N	\N
70	6	0.31	2	t	0.31	0	0	5.69	0	0	6	0	0	2022	3	12	12:14:55	f	\N	\N
71	0	\N	\N	f	0	0	0	0	0	0	0	0	0	\N	\N	\N	\N	f	\N	\N
\.


--
-- Data for Name: taxes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taxes (taxe_id, taxe_amount, taxe_name) FROM stdin;
1	5.5	alimentation
3	20	décoration/alcool
2	2.1	magasine
\.


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 1, false);


--
-- Name: payment_methods_payment_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_methods_payment_method_id_seq', 3, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 1135, true);


--
-- Name: sales_transactions_sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_transactions_sale_id_seq', 71, true);


--
-- Name: taxes_taxe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taxes_taxe_id_seq', 1, false);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (payment_method_id);


--
-- Name: products_in_transactions products_in_transactions_sale_id_product_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_transactions
    ADD CONSTRAINT products_in_transactions_sale_id_product_id_key UNIQUE (sale_id, product_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: sales_transactions sales_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_transactions
    ADD CONSTRAINT sales_transactions_pkey PRIMARY KEY (sale_id);


--
-- Name: taxes taxes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_pkey PRIMARY KEY (taxe_id);


--
-- Name: sales_transactions fk_payment_methods; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_transactions
    ADD CONSTRAINT fk_payment_methods FOREIGN KEY (payment_method_id) REFERENCES public.payment_methods(payment_method_id);


--
-- Name: products_in_transactions fk_products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_transactions
    ADD CONSTRAINT fk_products FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: products_in_transactions fk_sales_transactions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_transactions
    ADD CONSTRAINT fk_sales_transactions FOREIGN KEY (sale_id) REFERENCES public.sales_transactions(sale_id);


--
-- Name: products_in_transactions fk_taxes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_transactions
    ADD CONSTRAINT fk_taxes FOREIGN KEY (taxe_id) REFERENCES public.taxes(taxe_id);


--
-- PostgreSQL database dump complete
--

