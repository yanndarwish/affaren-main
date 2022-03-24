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
9	511073	Antikljus 25cm ø22mm 10-pack beige	\N	3	5	7310380241256	5
30	123767	BBQ-sås Black Garlic & Chili	11	1	5	7392031501100	5
72	158331	Center rulle	2.2	1	5	7310040021341	5
74	124013	Chai Grönt FT EKO	15.5	1	5	7350054815109	5
76	120269	Champis PET	2.5	1	5	7310401000367	5
78	122121	Cheez doodles	1.3	1	5	7300400382205	5
87	124592	Chips Tryffel	2.7	1	5	7350045591500	5
98	121288	Citronpeppar plastburk	18.5	1	5	7311311016424	5
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
108	141978	Daim dubbel	1.3	1	5	7310511257507	5
113	112296	Dextro Energy Lemon Sticks	2.6	1	5	87111781	5
120	122797	Din Harmoni Vallmofrö & Havssalt	6.5	1	5	7300400482233	5
124	102069	Dipmix Dill	1.5	1	5	7310531037103	5
128	102072	Dipmix Sourcream onion	1.6	1	5	7310532130513	5
132	116981	Dippmix Ranch	2.1	1	5	7340005404261	5
145	133794	Emser	1.9	1	5	6411401035562	5
149	124292	Extra White bubblemint	3.2	1	5	4009900519762	5
157	107778	Fast vardagsblomsterhonung	10.8	1	5	7350071870082	5
174	117457	Fiskbuljong 6-pack	4.6	1	5	8714100284261	5
175	109392	Fiskbullar i buljong	5.4	1	5	7311170041018	5
179	423887	Fiskgratäng Dill MSC	9.5	1	5	7310500038803	5
188	108258	Fruktgröt Päron Banan 8 mån osockrad	10.7	1	5	7312170029174	5
191	141787	Fruxo tablettask	0.9	1	5	7310780002365	5
196	124739	Fäbodknäcke Frön & Havssalt	11.6	1	5	7312080003646	5
161	124791	Festis Apelsin EKO BRIK	2	1	10	73165637	5
162	124811	Festis Hallon EKO BRIK	2	1	9	73165651	5
163	124790	Festis Päron EKO BRIK	2	1	5	73165644	5
155	122786	Fanta Exotic PET	2.5	1	4	90490705	5
102	122470	Coca-Cola zero BRK	2	1	5	5000112637939	5
164	205442	Filmjölk 3%	3.5	1	5	7310865087935	5
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
230	180119	Grönsaksfond 0.8% salt	9.8	1	5	7322550052708	5
231	192623	Gula ärtor kapsel	3.5	1	5	7312787703627	5
234	162698	Guld Marie	2.5	1	5	7310521050204	5
241	726271	Halloumi	7.4	1	5	7331494128035	5
249	116430	Havrefras	11.2	1	5	7311171008423	5
252	185873	Havreknäcke 280 gr	6.9	1	5	7300400121859	5
254	123733	Hellmann’s American Style Yellow mustard senap	6.8	1	5	8714100695876	5
266	204525	Hushållsost 26 % NB	14.95	1	5	2340374705339	5
272	106670	Inlagd sill MSC	11.2	1	5	7311171007938	5
273	183614	Inläggnings sill 5min	10.4	1	5	7311171007938	5
281	124188	Jordnötsringar	3.5	1	5	7310532114001	5
302	109837	Kaffe mellanrost Fair brygg EKO	14.3	1	5	7310050001777	5
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
308	192242	Kalles Randiga MSC	7.3	1	5	7311171001943	5
309	180120	Kalvfond 0.8% salt	9.5	1	5	7322550052715	5
315	180077	Kantarellsoppa	4.7	1	5	7322550031833	5
316	109203	Kantarellsås 3-pack	5.8	1	5	7322550092216	5
323	123239	Karl Fazer Mjölkchoklad	2.7	1	5	6416453015746	5
332	124654	Kexchoklad Vegan 40g	2.1	1	5	7310350132669	5
337	120814	Kick Sea Salt Caramel	0.8	1	5	7310350129140	5
338	120342	Kina gul snacks	2.8	1	5	6416453039131	5
342	410957	Kladdkaka vegansk tina och servera	8.9	1	5	7310890203652	5
357	742973	Korvbröd 10-pack Tina och servera	3.8	1	5	7311379537015	5
365	600676	Kronljus 24cm ø22mm 10-p vit	10.7	3	5	4002911152591	5
366	201408	Kronljus 28cm ø22mm 8-p rosa	\N	3	5	7350023011099	5
367	201404	Kronljus 28cm ø22mm 8-p grå	\N	3	5	7350023011051	5
368	\N	Kronljus 24cm ø22mm 8-p grön	\N	3	5	7350023011754	5
369	\N	Kronljus 24cm ø22mm 8-p svart	\N	3	5	7350023011853	5
370	605548	Kronljus stearin 20cm ø22mm 10-pack röd	8.9	3	5	7350023011570	5
371	900900	Kronljus stearin 20cm ø22mm vit	20	3	5	7301002408676	5
373	117972	Kryddpeppar hel påse	5.6	1	5	7311311004797	5
377	180121	Kycklingfond 0.8% salt	9.5	1	5	7322550052722	5
389	121205	Lakritsi Mint	0.6	1	5	6416453061446	5
391	118482	Lakritsi Raspberry	0.7	1	5	6416453061385	5
397	745125	Lantchips Gräddfil	1.4	1	5	7392659005721	5
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
404	212360	Laxfilé kallrökt skivad. 150 g	11.3	1	5	7393423001154	5
423	115526	Loka Crush Hallon BRK	1.5	1	4	7310401021010	5
428	124803	Loka Fläder Päron PET	1.9	1	5	7310401043050	5
435	123549	Loka citron PET	1.9	1	5	7310400020731	5
441	112816	Läkerol Bon Bons	1.8	1	5	7310350118540	5
442	112809	Läkerol Cactus	1.8	1	5	7310350118496	5
443	112811	Läkerol Cassis	1.8	1	5	7310350118465	5
448	124247	Läkerol Raspberry Licortice Big	4.7	1	5	7310350132805	5
449	112808	Läkerol Salmiak	1.8	1	5	7310350118519	5
451	112807	Läkerol Salvi	1.8	1	5	7310350118595	5
469	116774	Mandelkubb	6.8	1	5	7317065004014	5
472	115300	Mandelägg	5	1	5	5774540959146	5
476	123633	Marabou Havssalt	5.9	1	5	7622201099374	5
481	107411	Mariestad alkoholfri ENGL	2.5	1	13	7310401009551	5
486	606447	Marschaller med lock ø103mm brinntid 8tim	2.3	3	5	6410405203724	5
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
515	124012	Te hallon grädde EKO FT	0.777	1	5	7350054815833	5
516	124038	Te rabarber vanilj EKO FT	0.777	1	5	7350054815741	5
558	200674	Wienerkorv Sverige	15.5	1	5	7330671013171	5
559	180118	Viltfond kantarell 0.8% salt	9.5	1	5	7322550052692	5
568	752382	Värmeljus 59mm Maxi 10h	15.2	3	5	7321010006107	5
569	900907	Värmeljus vegetabiliskt fett ø39mm 6h	7.4	3	5	5024333237181	5
573	183308	Wafers Jätten vanilj	7.4	1	5	7310525501412	5
579	141785	Zoo Tablettask	0.6	1	5	7310780002303	5
580	208770	Åseda Gräddost 38%	14.3	1	7	5711953018275	5
582	206202	Ädelost Grädd 36%	6.8	1	4	7311878172335	5
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
549	118905	Tändstickor	3.5	3	-7	7310680023118	5
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
637	158079	Mjölkchoklad Kaka	2.9	1	5	7310511210304	5
658	104809	Norrlands Guld 3.5 % BRK	17.2	1	5	7310402006795	5
673	211852	Ostkaka	6.5	1	3	7310890100333	5
674	111932	Paradis	24.8	1	2	7310510002566	5
678	124294	Pepparkaka Jul plåtburk	11	1	5	7312220125689	5
684	201966	Pepparkaksdeg kyld	7.3	1	5	7317062055002	5
692	133738	PIM PIM tablettask	0.6	1	5	7310780002327	5
695	732695	Plopp dubbel stycksak	1.7	1	5	7310040020726	5
699	409604	Polarklämma renkött	3.5	1	5	7311800008602	5
700	124482	Polarknäcke Original	7.4	1	5	7313350007203	5
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
710	208948	Prickig korv skiv	3.5	1	27	7300200264008	5
713	105749	Pripps Blå 3.5% 6-p BRK	13.1	1	5	7310072766050	5
720	212343	Proviva Mango	8.1	1	5	7350000550535	5
728	124817	Ramlösa Granatäpple BRK	1.2	1	5	7310070004772	5
746	192293	Riskakor Ost glutenfria	4.1	1	5	7310186055804	5
756	900091	Rågkaka Tina och servera	9.8	1	5	7330671019043	5
758	712324	Rågkusar osötad Tina och servera	10.4	1	5	7314879170003	5
760	117409	Rågmjöl Grovt	7.3	1	5	7310130007170	5
764	107230	Rårörda lingon EKO	17.1	1	5	7317661714706	5
771	113508	Rödbetor. skivade	7.3	1	5	7310240151169	5
779	184867	Saftsoppa	5	1	5	7310470063294	5
786	102008	Salta Katten	0.8	1	5	6411401037177	5
788	123162	Salty Toffee	2.8	1	5	6416453015753	5
802	123192	Senap stark plastflaska	6.9	1	5	8717163867914	5
809	186036	Senapssill bit MSC	4.1	1	5	7311171004135	5
808	106672	Senapssill	8.3	1	5	7311171006528	5
755	191719	Rågflingor	5.95	1	20	7310130331084	5
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
761	117408	Rågsikt	6.95	1	5	7310130007194	5
737	404128	Renskav	12.5	1	5	7319993289761	5
724	290199	Punschrulle singel	1.5	1	5	7315360010914	5
792	105152	Sandwich cheese paprika	2	1	5	7300400128315	5
796	102839	Sandwich tomat basilika	2	1	5	7300400127363	5
793	102840	Sandwich franska örter	2	1	5	7300400127394	5
768	212215	Räksallad	5.95	1	5	7313160004997	5
813	121974	Singoalla hallon och lakrits	4.7	1	5	7310520007650	5
818	404325	Skogaholmslimpa skiv Tina och servera	5.3	1	5	7314875011010	5
819	117356	Skorpor Kardemumma	5.9	1	5	7311070362572	5
820	158362	Skotte dubbel	1.3	1	5	7310511253608	5
827	200908	Smoothie Ananas Banan Kokos ENGL	3.5	1	5	7350020720093	5
828	206599	Smoothie blåbär hallon ENGL	3.5	1	5	7350020720024	5
829	206225	Smoothie Jordgubb Banan Guava ENGL	3.5	1	5	7350020720734	5
845	109435	Snabbmakaroner	4.4	1	5	7310130003530	5
859	776642	Stenbitsrom svart MSC	89.7	1	5	7392497082298	5
880	607025	Såpa citron 750ml	4.4	3	5	7310610021450	5
886	116939	Tacosås Hot	4.7	1	5	7311312002143	5
890	124012	Te hallon grädde EKO FT	0.777	1	5	7350054815833	5
891	124038	Te rabarber vanilj EKO FT	0.777	1	5	7350054815741	5
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
914	119493	Tutti Frutti Original	3.5	1	5	6416453038271	5
924	118905	Tändstickor	3.5	3	5	7310680023118	5
925	118906	Tändstickor 8-Pack	4.1	3	5	7310680022517	5
933	200674	Wienerkorv Sverige	15.5	1	5	7330671013171	5
934	180118	Viltfond kantarell 0.8% salt	9.5	1	5	7322550052692	5
935	102010	Viol Tablettask	1	1	5	6411401037184	5
943	752382	Värmeljus 59mm Maxi 10h	15.2	3	5	7321010006107	5
944	900907	Värmeljus vegetabiliskt fett ø39mm 6h	7.4	3	5	5024333237181	5
948	183308	Wafers Jätten vanilj	7.4	1	5	7310525501412	5
954	141785	Zoo Tablettask	0.6	1	5	7310780002303	5
955	208770	Åseda Gräddost 38%	14.3	1	7	5711953018275	5
957	206202	Ädelost Grädd 36%	6.8	1	4	7311878172335	5
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
1	122889	100 Frön & Havssalt	4.5	1	17	7300400482165	5
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
1039	\N	Löfbergs Mellanrost	12.95	1	6	7310050001142	5
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
1136	\N	Räkost Tub 275g	9.95	1	20	7311440020897	5
1137	\N	Räkost Ask 330g	12.95	1	12	7311441343100	4
170	208415	Filmjölk LF KRAV	5.8	1	3	7310865094117	5
1138	\N	Prinskorv	4.95	1	15	7300207088003	5
1139	\N	Hushållsost	14.95	1	15	2340374705629	5
1140	\N	Munkens Svarta	14.95	1	10	2340343605400	3
770	121065	Rödbetor aptit skivad	3.95	1	5	7310240051261	5
1141	\N	Mjölk Choklad Cookies	5.95	1	10	7622300589882	5
1142	\N	Påskeskum påse	2.2	1	20	7310350131433	5
1143	\N	Sandwich Pizza	2	1	25	7300400482752	5
1144	\N	Delikatess Knäckebröd	4.65	1	20	7300400117968	5
1145	\N	Lakritsi Soft Original	4.5	1	15	6416453061200	5
1146	\N	Salt Skalle	2.95	1	20	7393077181660	5
1147	\N	Mandelägg Anthon Berg	2.95	1	20	5774540959245	5
1148	\N	Cool Cola Skalle	1.5	1	20	7393077181738	5
1149	\N	Ideal Makaroner	4.2	1	12	7310130416170	3
1133	\N	Bullar X4	10	1	-3	\N	5
1132	\N	Bulle	3	1	-2	\N	5
1134	\N	Sandwich	6	1	0	\N	5
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
35	206500	Bearnaisesås chili	4.4	1	8	7350042720132	5
1135	\N	Formule sandwich	10	1	1	\N	5
\.


--
-- Data for Name: products_in_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_in_transactions (sale_id, product_id, quantity, product_name, product_price, taxe_id, sale_day, sale_month, sale_year) FROM stdin;
90	1133	1	Bullar X4	10	1	24	3	2022
92	1134	1	Sandwich	6	1	24	3	2022
98	1132	1	Bulle	3	1	24	3	2022
98	1134	1	Sandwich	6	1	24	3	2022
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
71	1039	2	Löfbergs Mellanrost	12.95	1	17	3	2022
73	1132	1	Bulle	3	1	20	3	2022
75	1132	1	Bulle	3	1	21	3	2022
75	1133	1	Bullar X4	10	1	21	3	2022
77	1132	2	Bulle	3	1	21	3	2022
78	35	1	Bearnaisesås chili	4.4	1	21	3	2022
80	1135	1	Formule sandwich	10	1	21	3	2022
82	1135	1	Formule sandwich	10	1	23	3	2022
84	1133	1	Bullar X4	10	1	23	3	2022
86	1134	1	Sandwich	6	1	24	3	2022
88	1135	1	Formule sandwich	10	1	24	3	2022
91	1135	1	Formule sandwich	10	1	24	3	2022
94	1133	1	Bullar X4	10	1	24	3	2022
94	1135	1	Formule sandwich	10	1	24	3	2022
95	1132	1	Bulle	3	1	24	3	2022
96	1135	1	Formule sandwich	10	1	24	3	2022
96	1134	1	Sandwich	6	1	24	3	2022
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
72	35	1	Bearnaisesås chili	4.4	1	18	3	2022
72	549	1	Tändstickor	3.5	3	18	3	2022
74	1133	2	Bullar X4	10	1	20	3	2022
76	1132	1	Bulle	3	1	21	3	2022
76	1133	1	Bullar X4	10	1	21	3	2022
77	\N	12	bullar	4	1	21	3	2022
79	\N	2	Magazine	5.5	2	21	3	2022
81	35	1	Bearnaisesås chili	4.4	1	21	3	2022
83	35	1	Bearnaisesås chili	4.4	1	23	3	2022
85	1132	1	Bulle	3	1	23	3	2022
87	35	1	Bearnaisesås chili	4.4	1	23	3	2022
89	1133	1	Bullar X4	10	1	24	3	2022
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
93	1135	1	Formule sandwich	10	1	24	3	2022
94	35	1	Bearnaisesås chili	4.4	1	24	3	2022
95	1133	1	Bullar X4	10	1	24	3	2022
95	1134	1	Sandwich	6	1	24	3	2022
90	1132	1	Bulle	3	1	24	3	2022
97	1133	1	Bullar X4	10	1	24	3	2022
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
81	4.4	0.23	1	t	0.23	0	0	4.17	0	0	4.4	0	0	2022	3	23	19:51:58	f	\N	\N
68	23	1.2	2	t	1.2	0	0	21.8	0	0	23	0	0	2022	3	12	11:59:47	t	1	3
69	29	1.51	1	t	1.51	0	0	27.49	0	0	29	0	0	2022	3	12	12:12:13	f	\N	\N
70	6	0.31	2	t	0.31	0	0	5.69	0	0	6	0	0	2022	3	12	12:14:55	f	\N	\N
82	10	0.52	2	t	0.52	0	0	9.48	0	0	10	0	0	2022	3	23	19:52:11	f	\N	\N
71	25.9	1.35	1	t	1.35	0	0	24.55	0	0	25.9	0	0	2022	3	17	08:37:20	f	\N	\N
91	10	0.52	2	t	0.52	0	0	9.48	0	0	10	0	0	2022	3	24	16:10:41	t	2	0
72	7.9	1.31	1	t	0.73	0	0.58	3.67	0	2.92	4.4	0	3.5	2022	3	18	21:43:50	t	1	0
83	4.4	0.23	1	t	0.23	0	0	4.17	0	0	4.4	0	0	2022	3	24	20:05:57	f	\N	\N
73	3	0.16	1	t	0.16	0	0	2.84	0	0	3	0	0	2022	3	20	16:03:44	f	\N	\N
74	20	1.04	1	t	1.04	0	0	18.96	0	0	20	0	0	2022	3	20	17:20:48	f	\N	\N
84	10	0.52	1	t	0.52	0	0	9.48	0	0	10	0	0	2022	3	24	20:06:09	f	\N	\N
75	27.4	0.56	2	t	0.39	0.17	0	18.61	8.23	0	19	8.4	0	2022	3	21	15:09:11	t	1	5
76	13	0.68	1	t	0.68	0	0	12.32	0	0	13	0	0	2022	3	21	15:10:36	f	\N	\N
90	13	0.68	1	t	0.68	0	0	12.32	0	0	13	0	0	2022	3	24	16:25:08	f	\N	\N
77	54	2.82	1	t	2.82	0	0	51.18	0	0	54	0	0	2022	3	23	14:38:51	f	\N	\N
85	3	0.16	1	t	0.16	0	0	2.84	0	0	3	0	0	2022	3	24	20:08:39	f	\N	\N
78	4.4	0.23	2	t	0.23	0	0	4.17	0	0	4.4	0	0	2022	3	23	14:41:45	f	\N	\N
79	11	0.23	2	t	0	0.23	0	0	10.77	0	0	11	0	2022	3	23	17:32:08	t	1	5
86	6	0.31	3	t	0.31	0	0	5.69	0	0	6	0	0	2022	3	23	20:13:42	f	\N	\N
80	10	0.52	1	t	0.52	0	0	9.48	0	0	10	0	0	2022	3	23	19:49:57	f	\N	\N
87	4.4	0.23	2	t	0.23	0	0	4.17	0	0	4.4	0	0	2022	3	23	20:15:40	f	\N	\N
88	10	0.52	1	t	0.52	0	0	9.48	0	0	10	0	0	2022	3	24	16:05:06	f	\N	\N
93	10	0.52	2	t	0.52	0	0	9.48	0	0	10	0	0	2022	3	24	16:18:28	f	\N	\N
89	10	0.52	1	t	0.52	0	0	9.48	0	0	10	0	0	2022	3	24	16:05:24	f	\N	\N
92	6	0.31	2	t	0.31	0	0	5.69	0	0	6	0	0	2022	3	24	16:30:03	f	\N	\N
94	24.4	1.27	1	t	1.27	0	0	23.13	0	0	24.4	0	0	2022	3	24	16:22:51	f	\N	\N
97	10	0.52	1	t	0.52	0	0	9.48	0	0	10	0	0	2022	3	24	16:56:03	f	\N	\N
95	19	0.99	1	t	0.99	0	0	18.01	0	0	19	0	0	2022	3	24	16:22:51	f	\N	\N
96	16	0.83	3	t	0.83	0	0	15.17	0	0	16	0	0	2022	3	24	16:25:08	f	\N	\N
98	9	0.47	2	t	0.47	0	0	8.53	0	0	9	0	0	2022	3	24	16:56:03	f	\N	\N
99	0	\N	\N	f	0	0	0	0	0	0	0	0	0	\N	\N	\N	\N	f	\N	\N
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
-- Name: payment_methods_payment_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_methods_payment_method_id_seq', 3, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 1149, true);


--
-- Name: sales_transactions_sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_transactions_sale_id_seq', 99, true);


--
-- Name: taxes_taxe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taxes_taxe_id_seq', 1, false);


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

