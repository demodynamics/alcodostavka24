--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE "Dostavka247";
ALTER ROLE "Dostavka247" WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:2K//ex0Wjyxz8V0kI5Iijw==$JvEnab/QQEIkcALJ3XWTMz9wv5QtiLsL+Er543gV42E=:p8OrvDIMXvSNL+YeApOROE61hDt7Rce+Kv0Zv9bOkrI=';
CREATE ROLE db_admin;
ALTER ROLE db_admin WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:PRzjDF569WsZ4ilQeiViCw==$pnQlLPhiXw8LtkkpUtUUZBM20kn8ZJbnB87sYX+cLzA=:gfogw3c8GHU8M34fiYMuaDvSUcqEsV07vtXJaEhtiRs=';
CREATE ROLE db_cheap_grp;
ALTER ROLE db_cheap_grp WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE db_expensive_grp;
ALTER ROLE db_expensive_grp WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE dev_expensive;
ALTER ROLE dev_expensive WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:O9x0hFXyoFX4K41zAsSooQ==$HmOAGAUME53B10tIEm79cJKbwLkDDcocUAZheWJZ3z0=:DREpTjyiqz4ItR+rRqZ45QL4Hf7dBSZPWNC1rIUulDo=';
CREATE ROLE dev_expensive_grp;
ALTER ROLE dev_expensive_grp WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE fastuser;
ALTER ROLE fastuser WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:aVIlASyCktAdxBNdzqbUXA==$iL+A5DFhzyfRDBH64J1ynEk+lxqgQIdN/tPmR0XQdTk=:FIsukzvVYUKaxiNr82tCvN5fuV4EuvwEn2YZKFdLpLo=';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;


--
-- Role memberships
--

GRANT db_cheap_grp TO "Dostavka247" GRANTED BY db_admin;
GRANT db_cheap_grp TO postgres GRANTED BY db_admin;
GRANT db_expensive_grp TO "Dostavka247" GRANTED BY db_admin;
GRANT db_expensive_grp TO postgres GRANTED BY db_admin;
GRANT dev_expensive_grp TO dev_expensive GRANTED BY db_admin;
GRANT dev_expensive_grp TO postgres GRANTED BY db_admin;




--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

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
-- PostgreSQL database dump complete
--

--
-- Database "db_cheap" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

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
-- Name: db_cheap; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE db_cheap WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE db_cheap OWNER TO postgres;

\connect db_cheap

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


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin; Type: TABLE; Schema: public; Owner: db_admin
--

CREATE TABLE public.admin (
    id uuid NOT NULL,
    login character varying(50) NOT NULL,
    password character varying(64) NOT NULL,
    "createdAt" date
);


ALTER TABLE public.admin OWNER TO db_admin;

--
-- Name: categories_cheap; Type: TABLE; Schema: public; Owner: db_admin
--

CREATE TABLE public.categories_cheap (
    id uuid NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.categories_cheap OWNER TO db_admin;

--
-- Name: list_cheap; Type: TABLE; Schema: public; Owner: db_admin
--

CREATE TABLE public.list_cheap (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(50) NOT NULL,
    img character varying(50),
    price integer NOT NULL,
    "typeId" uuid NOT NULL,
    "oldPrice" integer
);


ALTER TABLE public.list_cheap OWNER TO db_admin;

--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: db_admin
--

COPY public.admin (id, login, password, "createdAt") FROM stdin;
504ea5e1-588f-4fff-94a8-e94a98a4946a	monya	$2b$10$GumJhaO7Lotq552lGrfDUe7dLgNHCpJ9kR4JiyL9WlCqPaNFvykCy	2023-05-24
c95f1c15-620e-46ff-8f19-9c8e0e4b67f8	dastavka	$2b$10$yTeUtqDdW/C9tfuJ7lHkuOi5xPKqul1yGTbRd56AoCOFUnfVU0EtC	2023-05-24
84e47aff-ea6d-4800-a6b5-e7e731abcb17	menejer	$2b$10$lbURRJEJ7OlQo9w0znWpKesrC0fKgIXM9PHEuMpaZzLkkYzYjIQ2y	2023-05-24
\.


--
-- Data for Name: categories_cheap; Type: TABLE DATA; Schema: public; Owner: db_admin
--

COPY public.categories_cheap (id, name) FROM stdin;
0502001e-cc9f-4402-abc7-038a454e1810	snacks
0aeebff6-247d-4445-b8fd-53548a097aca	other
0da7da58-7b26-4c0f-8986-528534271bf3	beer
1761cb87-095d-400a-bb88-ef2af0fbe872	ciggarettes
18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	wine
3497daf4-5971-4927-adde-92990381ba8e	vodka
368db897-f92f-4a93-81df-fa67b92f2f0d	cognac
4726f1d3-9f05-4568-a24f-b2fc23b56619	tequilla
620c2066-8a39-491d-a86e-8f4568dd636a	jin
65801616-dd4c-43cf-a0c3-ac3663a4e2f8	el-sig
7a04ec1c-8c89-4882-95e4-2f8cb32825b0	vermouth
890b9f91-bbba-4ffa-9c83-702905f41cd6	champagne
9390861d-c276-4f9f-a381-df4c91b8b07c	sticks
cca2137e-695d-4853-89a0-27c6a3167ffd	rom
cccf7ea8-e25e-47df-aa9c-5c10c52a7304	liquor
dfc6f7e4-3100-4963-8f60-571228e8db77	whiskey
e27792aa-9c19-49ec-a002-9a750f5b133e	juice
f52cf384-16de-4b61-9427-1947c5ef7a23	water
3dfe66f9-7b51-4d84-a29b-efa44e3cd21d	tobacandcalian
\.


--
-- Data for Name: list_cheap; Type: TABLE DATA; Schema: public; Owner: db_admin
--

COPY public.list_cheap (id, name, img, price, "typeId", "oldPrice") FROM stdin;
cd7464b0-b596-4416-a98b-627884992aa3	Текила Sauza gold 0,7Л	sauzagold07	3590	4726f1d3-9f05-4568-a24f-b2fc23b56619	\N
1c0a2d7e-d590-46bd-9991-42a8fdb778e7	Сигареты Marlboro red	marlborored	290	1761cb87-095d-400a-bb88-ef2af0fbe872	\N
56c59527-c974-490d-b732-442a0edaeb08	Стики Оранжевые	heetsamber	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N
4a4c2e75-fa00-40ce-a634-4cea113d9590	Сок Апельсин	orange	239	e27792aa-9c19-49ec-a002-9a750f5b133e	\N
f46a0ab6-c2cf-4ab4-88b1-26b101e36539	Сигареты Winston Xstyle Silver	whinstonxsilver	290	1761cb87-095d-400a-bb88-ef2af0fbe872	\N
10336d8f-5a89-4874-be41-f40e54dfe541	Вино Firmamento кр/сух	firmamentokrsux	1199	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N
c361e774-fee1-4524-987e-f4741cc78675	Сигареты Kent Nano	kentnano4	300	1761cb87-095d-400a-bb88-ef2af0fbe872	\N
dd2c3e01-c5c3-4bc0-b11e-a5f56ab7b6de	Вино Mancura sauvignon blanc бел/сух	manksovblani	1149	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N
75c8a189-ff95-4005-8101-1eed7eab0317	Чипсы Lays Рифленые 80г	laysriflenie	149	0502001e-cc9f-4402-abc7-038a454e1810	\N
6ea1d8fa-55d1-4d16-89df-6fcdee8b7961	Снеки Колбаски 100г	kolbasineostrie	189	0502001e-cc9f-4402-abc7-038a454e1810	\N
f23d45bc-483e-4a7e-ab8d-5531b124d4e5	Вермут Martini Extra 1,0Л	martiniekstradray	2399	7a04ec1c-8c89-4882-95e4-2f8cb32825b0	\N
80d23728-cff3-4620-bd52-189c17c8ea0d	Вода Тоник 1,0Л	tonnik1	249	f52cf384-16de-4b61-9427-1947c5ef7a23	\N
de9f3b81-c16d-4765-bf50-0d14288e443f	Вода Спрайт 2Л	sprite2	249	f52cf384-16de-4b61-9427-1947c5ef7a23	\N
f911c047-2bb4-4898-8a51-f70f494cba4e	Вино Mancura Cabernet кр/сух	mankkabsov	1149	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N
0bc21ca5-b663-469e-985f-9f2e899d3f06	Стики Зеленые	heetsgreen	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N
7d5fadb9-b746-4875-9339-945ed2ccd912	Сок Грейпфрут	greifrut	239	e27792aa-9c19-49ec-a002-9a750f5b133e	\N
ae19d058-3f42-4793-ab82-ab0b05758914	Сигареты Chapman yellow	chapmangold	310	1761cb87-095d-400a-bb88-ef2af0fbe872	\N
26430006-3446-424c-9e2e-c05e757752d7	Чипсы Lays Сметана и лук 80г	layssmetan	149	0502001e-cc9f-4402-abc7-038a454e1810	\N
a2c938fe-79d5-43e6-b822-c36451ffd7b6	Сигареты Chapman red	chapmanred	310	1761cb87-095d-400a-bb88-ef2af0fbe872	\N
ebca55d9-f9bc-4528-acb4-239230fa8e9b	Вино Манкура merlot кр/сух	mankmerlo	1149	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N
cf80396b-00bf-45c0-8675-f3c91e1e26ec	Сигареты Parliament Aqua Blue	parliament	350	1761cb87-095d-400a-bb88-ef2af0fbe872	\N
9356c489-81da-4213-bad7-d43db7fb3e90	Фисташки BeerKA 80г	arexasorti	249	0502001e-cc9f-4402-abc7-038a454e1810	\N
9fbb6084-91a1-49c0-a702-c6f22603e22b	Чипсы Lays Сыр 80г 	layscheese	149	0502001e-cc9f-4402-abc7-038a454e1810	\N
d2d158fc-5e03-40c0-90c0-89c7ed2be1f6	Вино Pinot Grigio бел/сух	pinogridjo	1399	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N
9535b464-f8d4-4b88-9940-5e8f6a513f2d	Вода Минеральная вода без газа 0,5Л	aquabezgaz	99	f52cf384-16de-4b61-9427-1947c5ef7a23	\N
714c073e-472f-4876-b276-03ed6d6a6643	Снеки Сыр копченный 40г	sir	299	0502001e-cc9f-4402-abc7-038a454e1810	\N
cc40e2b3-6c75-4cc4-b17c-b09cc81ed77e	Презервативы 1упк.	condom	699	0aeebff6-247d-4445-b8fd-53548a097aca	\N
1157a7b0-70a3-4ade-9fb3-746e15225352	Вино Campo delia бел/сух	kampodeliabelsux	1399	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N
774d9951-60e9-471d-ab6b-6731307bbe40	Вода Минеральная вода с газом 0,5Л	aquasgazom	99	f52cf384-16de-4b61-9427-1947c5ef7a23	\N
e54bd1c9-d6d2-4973-af9b-273a44abcd8c	Сигареты Chapman brown	chapmanbrown	310	1761cb87-095d-400a-bb88-ef2af0fbe872	\N
c9d09ae5-a85e-4498-9043-c78d15c9eca9	Сигареты Winston blue	whinstonblue	290	1761cb87-095d-400a-bb88-ef2af0fbe872	\N
bf231209-36f0-4cb0-ace4-2209d2524db6	Вино Rebarelle кр/сух	rebarelkrsux	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N
c5961c78-fd67-4934-aed9-472a6e214b1f	Сигареты Esse blue	esseblue	290	1761cb87-095d-400a-bb88-ef2af0fbe872	\N
ab90946d-4d16-4aa6-9b45-adbd58455a54	Сигареты Kent 4	kent4	290	1761cb87-095d-400a-bb88-ef2af0fbe872	\N
7adc733a-687d-4357-8188-d7891cd2aea7	Водка Nemiroff медовая 0,5Л	nemiroffmedsper	649	3497daf4-5971-4927-adde-92990381ba8e	\N
8fed95d7-eba5-46f5-a709-6e705048724e	Водка Absolut 0,7Л	absolute07	2390	3497daf4-5971-4927-adde-92990381ba8e	\N
feb8b32f-6973-45d7-a325-ec863da5b0bf	Водка Журавли 0,5Л	juravli	649	3497daf4-5971-4927-adde-92990381ba8e	\N
f4ba5b48-0c16-4b5a-8c03-b0d1409d391f	Водка Финляндия 0,7Л	finland07	2190	3497daf4-5971-4927-adde-92990381ba8e	\N
78e50a31-d5cc-4816-b04e-82359f51e536	Водка Хорта 0,5Л	xorta05	590	3497daf4-5971-4927-adde-92990381ba8e	\N
b477ec9d-54f0-481a-af18-c170a59ac854	Водка Пять Озер 0,7Л	pyatozer07	890	3497daf4-5971-4927-adde-92990381ba8e	\N
551ab62e-2cca-44a1-ad0b-aae8a161a511	Водка Царская 0,5Л	carskaya05	849	3497daf4-5971-4927-adde-92990381ba8e	\N
a911bb8f-b50c-4c20-aaf0-265842a1f90e	Водка Царская 0,7Л	carskaya07	1190	3497daf4-5971-4927-adde-92990381ba8e	\N
f01c4d44-da85-4723-89fb-154c98d4ec8e	Водка Русский Стандарт 0,5Л	russstandart05	990	3497daf4-5971-4927-adde-92990381ba8e	\N
cbcba5fa-9137-428e-8d26-71a77aa5402a	Водка Русский Стандарт 0,7Л	russstandart07	1249	3497daf4-5971-4927-adde-92990381ba8e	\N
142512b1-76b5-418c-9900-7e081847dfe6	Водка Зеленая марка 0,7Л	zelenayamarka07	849	3497daf4-5971-4927-adde-92990381ba8e	\N
04cdb15a-34c0-4680-b61a-ad2c6ff7e7b6	Водка Зеленая марка 0,5Л	zelenayamarka05	590	3497daf4-5971-4927-adde-92990381ba8e	\N
6771b235-f26d-4554-a49c-40a5417bf86a	Ром Havana 0,7Л	havana07	2690	cca2137e-695d-4853-89a0-27c6a3167ffd	2990
c3535585-bedc-433a-9686-ee7a6d4fb152	Виски Jim Beam 0,5Л	jimbeam05	1990	dfc6f7e4-3100-4963-8f60-571228e8db77	\N
ce0634ac-c786-443e-a7cf-10ae409e1d09	Виски Jim Beam 0,7Л	jimbeam07	2690	dfc6f7e4-3100-4963-8f60-571228e8db77	\N
395564c4-627f-4382-81bf-55e93a1f2505	Виски Macallan 0,5Л	makalan05	8590	dfc6f7e4-3100-4963-8f60-571228e8db77	\N
08de1dca-411c-4c9c-b4c0-f76349a276cf	Виски White Horse 0,5Л	whitehorse05	1590	dfc6f7e4-3100-4963-8f60-571228e8db77	\N
4f236208-4aff-48ce-a126-6aa912236975	Виски William Lawson''s 0,7Л	william07	1990	dfc6f7e4-3100-4963-8f60-571228e8db77	\N
a20dbcef-bd8f-43de-8280-c1bdeb486064	Виски William Lawson''s 0,5Л	william05	1690	dfc6f7e4-3100-4963-8f60-571228e8db77	\N
8e051beb-e50e-42b1-8993-b8f442c70a05	Виски William Lawson's 0.7Л	jameson07	1190	dfc6f7e4-3100-4963-8f60-571228e8db77	\N
0698b0ee-f746-45b1-ba2b-509650321944	Коньяк Арарат 5 лет 0,5Л	ararat505	1890	368db897-f92f-4a93-81df-fa67b92f2f0d	\N
8b8f4801-59e2-42ce-8eb3-fd3cc03f15bd	Коньяк Арарат 5 лет 0,7Л	ararat507	2490	368db897-f92f-4a93-81df-fa67b92f2f0d	\N
d4127e22-3836-4c63-9d1e-015e6538379f	Коньяк Кочари 3 года 0,5Л	qochari3	990	368db897-f92f-4a93-81df-fa67b92f2f0d	\N
071677dd-5f3c-4ddc-8aef-081d7d2b5759	Коньяк Старейшина 3 года 0,5Л	starshina305	1090	368db897-f92f-4a93-81df-fa67b92f2f0d	\N
bc31ee37-3e79-457f-9c96-5eed783c6b2d	Коньяк Старейшина 5 лет 0,5Л	starshina505	1390	368db897-f92f-4a93-81df-fa67b92f2f0d	\N
e1e101e9-50a3-4e1c-9834-039e714c3fc3	Ликер Бейлис 0,7Л	beylis07	2590	cccf7ea8-e25e-47df-aa9c-5c10c52a7304	\N
544af16b-637d-476f-bf1e-e44f3d0a2f44	Ром Bacardi Blanca 0,7Л	bacardi07	2349	cca2137e-695d-4853-89a0-27c6a3167ffd	\N
055b7b5d-d11c-4289-bb7f-52e5adfcd0db	Игристое вино Atto Primo Prosecco	attoprimoprosekko	1749	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N
734f81df-4385-448a-9265-57634b183f64	Пиво Spaten 0,45Л	stapen	239	0da7da58-7b26-4c0f-8986-528534271bf3	\N
16231e47-9e04-4a15-967d-f8d034456c81	Пиво Hoegaarden 0,45Л	hugarden	169	0da7da58-7b26-4c0f-8986-528534271bf3	\N
1752b804-ff43-45fb-87b3-3f633ef2f941	Пиво Балтика 9 0,45Л	baltika9	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N
adb683fd-a6b3-4b78-ad55-ab3e1cbe71c4	Пиво Tuborg 0,45Л	tuborg	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N
993e3e1a-9515-477f-800d-723a8bf2bb37	Водка Талка 0,5Л	talka05	690	3497daf4-5971-4927-adde-92990381ba8e	990
da2e00e3-2368-4a7e-a146-e4a9c6c40fd6	Пиво Miller 0,45Л	miller	159	0da7da58-7b26-4c0f-8986-528534271bf3	\N
dfc98c70-a2af-4e61-8326-d7217311c45e	Вино Firmamento кр/плс	firmamentokrpls	1199	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N
0f071613-a81d-44d1-918c-a929727863a4	Вода Кока-кола 2Л	kola2	249	f52cf384-16de-4b61-9427-1947c5ef7a23	\N
04894e66-e4e2-4875-a96c-386b768c1799	Вермут Martini Bianco 0,5Л	martinibyanko	1349	7a04ec1c-8c89-4882-95e4-2f8cb32825b0	\N
cdf84e56-31eb-47d2-a9d8-de56e2c742c6	Сок Вишня	cherry	239	e27792aa-9c19-49ec-a002-9a750f5b133e	\N
ce7d3469-8aa9-4a19-87aa-83771b4ddde7	Вино Rebarelle кр/плс	rebarelkrpls	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N
f733fae7-192e-4b61-8c57-8cdf265f3aae	Стики Голубые	heetstourqoise	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N
28ee8fde-d4db-41c2-8447-060074d56ab1	Вермут Cinzano 0,5Л	chinzanobyanko	849	7a04ec1c-8c89-4882-95e4-2f8cb32825b0	\N
8b414fef-18a5-4030-8361-34e9ec60aea8	Вермут Martini Bianco 1,0Л	martinibyanko	2399	7a04ec1c-8c89-4882-95e4-2f8cb32825b0	\N
74b9f0c9-7c5b-48e2-9f6a-0d55ad1ac96c	Сок Томатный	tomat	239	e27792aa-9c19-49ec-a002-9a750f5b133e	\N
70f843e0-a410-44cc-adbb-7fafa01b9fe8	Вино Matevosyan кр/сух	matevosyankrsux	1249	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N
45caf3c4-e87b-4a20-8bbe-b2f8e306d214	Вино Rebarelle бел/плс	rebarelbelpls	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N
9017bf67-72fe-446f-a31d-912b756f8cc3	Жвачка	orbit	99	0aeebff6-247d-4445-b8fd-53548a097aca	\N
c0599f78-836e-4319-a408-bb7e7670fb5d	Зажигалка	cricket	139	0aeebff6-247d-4445-b8fd-53548a097aca	\N
ef124025-afdb-425e-96ee-dd3ef1cf00e7	Сухарики 3 Холодец с хреном 40г	trikorochkixolodec	59	0502001e-cc9f-4402-abc7-038a454e1810	\N
3690c910-3f50-4e3e-94c8-6319018b5bca	Сок Яблоко	apple	239	e27792aa-9c19-49ec-a002-9a750f5b133e	\N
8f97c935-ea24-4532-a69c-7260c7616ccf	Стики Бронза	heetsbronze	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N
f549b3df-f83f-48ca-b1eb-40c504920f37	Штопор	shtapor	449	0aeebff6-247d-4445-b8fd-53548a097aca	\N
1aea69ef-8f7c-47e7-be86-03925e8870a0	Вино Алазанская долина кр/плс	alazdalinakrpls	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N
cfcf2a35-99cf-4835-8e2c-aaced0e4eb96	Вино Santucci Toscana кр/сух	santtoskkrsux	1699	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N
cbd68887-44ed-4556-895a-3bd46c48f11b	Вода Боржоми 0,5Л	borjomi05	159	f52cf384-16de-4b61-9427-1947c5ef7a23	\N
24f6097f-5e89-4038-b5c0-fdce2c54d71e	Вино Rebarelle бел/сух	rebarelbelsux	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N
b7d3f7fb-d316-4e76-9fd7-138341d2b429	Снеки Колбаски острые 100г	kolbasineostrie	189	0502001e-cc9f-4402-abc7-038a454e1810	\N
51fe8a2f-5b03-4bc5-a255-c197265c748b	Стики Синие	heetsblue	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N
fb34dbef-0c51-4f36-9c9a-016683e3dd26	Вино Firmamento бел/плс	firmamentobelplsi	1199	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N
8e4a24e9-b9b9-44a1-aeb4-089e7459ee10	Сигареты Vogue Menthe	vouge	310	1761cb87-095d-400a-bb88-ef2af0fbe872	\N
193b3b34-8aeb-439f-aaeb-5f5308da6530	Вермут Cinzano 1,0Л	chinzanobyanko	1499	7a04ec1c-8c89-4882-95e4-2f8cb32825b0	\N
3a77ee19-6cfa-4a11-a640-7541690bfe32	Стики Золото	heetsgold	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N
3b5a7452-5bb0-4de0-a5ff-6505ba154da8	Вино Firmamento бел/сух	firmamentobelsux	1199	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N
ed2af0a3-cb30-4648-a77b-23a520eed004	Вино Лыхны кр/плс	lixni	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	1399
ea7ea154-7acc-42ee-94ab-2d446ca1ffd1	Водка Хорта 0,7Л	xorta07	890	3497daf4-5971-4927-adde-92990381ba8e	\N
85f502ae-3f28-42ac-8730-cd0de07e0372	Водка Пять Озер 0,5Л	pyatozer05	690	3497daf4-5971-4927-adde-92990381ba8e	\N
60c18f2b-4e6b-4578-a00f-1f723dd3c0ac	Виски Bell''s 0,5Л	bells05	1590	dfc6f7e4-3100-4963-8f60-571228e8db77	\N
bc72ac4b-475c-4c05-85e1-7b88aed12a19	Виски Bell''s 1,0Л	bells1	2190	dfc6f7e4-3100-4963-8f60-571228e8db77	\N
009d2897-0f19-4d0d-93c3-2490b0a7f1b4	Виски Jameson 1Л	jameson1	4890	dfc6f7e4-3100-4963-8f60-571228e8db77	\N
4ce024b9-b728-4cc1-aab5-57f3c135fcb4	Виски Red Label 0,7Л	redlabel07	2390	dfc6f7e4-3100-4963-8f60-571228e8db77	\N
25d7107e-c71b-40e6-90f4-9edcf5602ca4	Виски William Lawson's 1Л	william1	2290	dfc6f7e4-3100-4963-8f60-571228e8db77	\N
d966d3e7-f19f-4bf8-a891-15fd623440d6	Виски Jack Daniels 0,7Л	jack07	3590	dfc6f7e4-3100-4963-8f60-571228e8db77	\N
d1bc8cff-2d7e-46fe-af7a-4a6ad2e8a8c5	Виски Macallan 0,7Л	makalan07	10590	dfc6f7e4-3100-4963-8f60-571228e8db77	\N
f4df5d04-872c-4bb9-9aa1-3b679b04ad3c	Виски Chivas Regal 12 0,7Л	chivas12	5990	dfc6f7e4-3100-4963-8f60-571228e8db77	\N
e50b3043-c356-4723-a244-a46be84f06df	Коньяк Кочари 5 лет 0,5Л	qochari5	1090	368db897-f92f-4a93-81df-fa67b92f2f0d	\N
5627930e-6d75-42ea-afd4-deba4bb7e4c8	Текила Olmeca silver 0,7Л	olmeka07	3290	4726f1d3-9f05-4568-a24f-b2fc23b56619	3590
1290fb16-c489-4382-9e7b-f93aea5e03d7	Коньяк Старый Кенигсберг 4 года	starikeninsberg	1190	368db897-f92f-4a93-81df-fa67b92f2f0d	\N
3d5abeb3-19fe-4377-8ed2-7e94c0c6a631	Ликер Бехеровка 0,7Л	bexerovka07	2390	cccf7ea8-e25e-47df-aa9c-5c10c52a7304	\N
ce8c1528-7f0b-4734-a023-610fe5d5f547	Ликер Ягермайстер 0,7Л	jager07	3290	cccf7ea8-e25e-47df-aa9c-5c10c52a7304	3590
5fa01716-705b-4faa-87cc-599717b622c0	Текила Sauza silver 0,7Л	sauzasilver07	3190	4726f1d3-9f05-4568-a24f-b2fc23b56619	\N
477fd908-9cd9-42d3-af4b-cc4488642aa0	Джин Beefeater 0,7Л	bifiter07	3490	620c2066-8a39-491d-a86e-8f4568dd636a	\N
417016b9-afd5-4046-be6f-a122e3eb2fa0	Ром Captain Morgan Пряный 0,7Л	morgandrunk	2590	cca2137e-695d-4853-89a0-27c6a3167ffd	\N
1766c305-f22d-46de-8e1c-ab176aeb015d	Ром Bacardi Blanca 0,5Л	bacardi05	1990	cca2137e-695d-4853-89a0-27c6a3167ffd	\N
8a05f438-1437-4dce-a1f4-be8d31eb2088	Игристое вино Mondoro Asti	mondoroasti	2049	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N
94ad94bb-b184-410e-b00f-e28b810bf5ba	Игристое вино Mondoro Brut	mondobrut	2049	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N
9dfe7894-d509-4b5a-af8a-6e5803f8e92c	Игристое вино Asti Martini	martiniasti	2149	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N
42c84dd4-5f33-46c4-ac52-a8280155d564	Игристое вино Российское бел/плс	russian	449	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N
dac6973d-fc72-4180-88dc-b6a5a6c46365	Игристое вино Абрау-Дюрсо бел/плс	abraudursobelpls	849	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N
2c8cd239-f36b-441c-bd2e-7f996c654510	Игристое вино Абрау-Дюрсо Brut	abraudursobrut	849	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N
a0cf4a64-cf51-4916-8089-bc4fdea11793	Игристое вино Gancia Prosecco	ganchaprosekko	1699	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N
9d3c3b14-faa2-4ef7-a219-6acac1e4f1cc	Пиво Корона 0,45Л	corona	239	0da7da58-7b26-4c0f-8986-528534271bf3	\N
a6483900-783d-4e0f-81c4-7e849a61e660	Пиво Krusovice 0,45Л	krusovice	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N
07fe6d83-46e8-4674-83b9-ffc351316118	Пиво Охота 0,45Л	oxota	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N
e2e075d4-af7f-4c67-bb27-dda2cd5b3e5f	Пиво Heineken 0,45Л	haineken	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N
03122830-9463-4e25-b11a-d0cf21168dca	Пиво Bud 0,45Л	bud	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N
28eaa4b9-0ba8-4588-a2e6-fa6d11839ad3	Пиво Козел светлая 0,45Л	kozelsvet	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N
8df9634c-c904-4704-a0f3-fb82b9234388	Пиво Kronenbourg  0,45Л	kronenburg	169	0da7da58-7b26-4c0f-8986-528534271bf3	\N
bffd549e-8ae7-4ff3-8a4f-1fb52dea62b7	Вино Апсны кр/плс	apsni	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	1399
0ed0bf36-46db-4d19-a103-09f0b58cf3c4	Водка Белуга 0,5Л	beluga05	1649	3497daf4-5971-4927-adde-92990381ba8e	1949
f493cf81-e306-4306-be8b-bf7622c61186	Вино Chianti кр/сух	kyanti	1399	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N
265ee538-dd47-4871-b029-fd9917cbc0fd	Сигареты Marlboro with button	marlborobutton	270	1761cb87-095d-400a-bb88-ef2af0fbe872	\N
64b196d8-6705-4f38-9ae0-335440f7f50e	Чипсы Lays Краб 80г 	layskrab	149	0502001e-cc9f-4402-abc7-038a454e1810	\N
58dee51d-a9dc-4b5d-9f32-1a86564aeabe	Стики Желтые	heetsyellow	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N
38d2441c-dd7a-4d71-b9d8-1e6504134908	Стики Фиолетовые	heetspurple	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N
f6edfea5-4b3a-4c1b-9be2-cb6f1814e731	Сухарики 3 Корочки Семга и сыр 40г	trikorochkisir	59	0502001e-cc9f-4402-abc7-038a454e1810	\N
7de5c661-794b-47b3-946d-df49f6c6467f	Сок Мультифрукт	multifrukt	239	e27792aa-9c19-49ec-a002-9a750f5b133e	\N
8c6eb98f-a2cc-4f7c-8113-7b375b38cf65	Однораз. Стаканчик 10шт.	cup	150	0aeebff6-247d-4445-b8fd-53548a097aca	\N
f3719aea-e9eb-4323-9340-0329a86b9a0e	Вино Sant'Orsola бел/сух	santorsolbelsux	1699	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N
a1ba7a16-7561-400d-9c06-4367c841248e	Вино Conde Otinano кр/сух	kondeotinanokrsux	1399	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N
9cf9c099-da08-4dd0-852e-c93e224e1bb9	Чипсы Lays Лук 80г	laysluk	149	0502001e-cc9f-4402-abc7-038a454e1810	\N
85738af6-0b13-4e03-8370-4b5d13b20805	Вино Киндзмараули кр/плс	kindzmarauli	1049	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N
67ea493e-f52b-4af1-9750-9c6ac9b8fe43	Водка Nemiroff клюква 0,5Л	nemiroffklyuk	590	3497daf4-5971-4927-adde-92990381ba8e	\N
ac4ce687-ea77-4f79-aebe-f088a5f3d032	Водка Absolut 0,5Л	absolute05	1790	3497daf4-5971-4927-adde-92990381ba8e	\N
5a0243c1-3749-4bb7-b66b-af4bbaff041b	Водка Belenkaya 0,5Л	belenkaya05	590	3497daf4-5971-4927-adde-92990381ba8e	\N
1a8ae95f-0209-4466-a986-754c79ee10a1	Виски Ballantine''s 0,7Л	balatayns07	2990	dfc6f7e4-3100-4963-8f60-571228e8db77	\N
62c3fd3d-1bdb-48b9-9e14-08724a80ffaf	Виски Jameson 0,5Л	jameson05	2890	dfc6f7e4-3100-4963-8f60-571228e8db77	\N
2a3ec361-0723-404c-8047-61f1a45b8d80	Коньяк Арарат 3 года 0,5Л	ararat305	1490	368db897-f92f-4a93-81df-fa67b92f2f0d	\N
924f791b-0e44-4d42-95fa-fd7f45d20a19	Коньяк Арарат 3 года 0,7Л	ararat307	1990	368db897-f92f-4a93-81df-fa67b92f2f0d	\N
b1f3026d-113d-400f-a484-1ae0683c39f4	Ликер Самбука 0,5Л	sambuka05	1090	cccf7ea8-e25e-47df-aa9c-5c10c52a7304	\N
adfd627f-c741-4629-ad7d-1de604f57f35	Джин Gordons 0,7Л	gordons07	2890	620c2066-8a39-491d-a86e-8f4568dd636a	\N
290a8765-36da-451a-9546-fec1cd5ca1d2	Водка Nemiroff классик 0,5Л	nemirofforig	590	3497daf4-5971-4927-adde-92990381ba8e	\N
30ba5ded-6ea6-48bf-9c8b-6676e9e28025	Игристое вино Atto Primo Asti	attoprimoasti	1749	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N
a3d97f12-53ba-44ff-90bd-a9948e3e271d	Игристое вино Bosca white	boskabelaya	899	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N
857e4946-84f7-4a27-8c2e-7df3d0a6c407	Виски Ballantine''s 0,5Л	balatayns05	2390	dfc6f7e4-3100-4963-8f60-571228e8db77	2690
384a435c-da2c-4dd9-8ed7-dc62217091a3	Коньяк Shustoff 5 лет 0,5Л	shustov505	1090	368db897-f92f-4a93-81df-fa67b92f2f0d	1390
660e0665-4b3d-4a66-a40a-ba7ac360f14b	Игристое вино Cinzano Prosecco	cinzanoproseko	1949	890b9f91-bbba-4ffa-9c83-702905f41cd6	2249
530be7ed-8b0f-437a-b38b-2b5dddbcdff1	Вермут Fiero Тоник	martinifierro	1799	7a04ec1c-8c89-4882-95e4-2f8cb32825b0	2099
f886a19e-7c63-4c56-9296-ee0540641abb	Кальян	tobacandcalian.jpg	7499	3dfe66f9-7b51-4d84-a29b-efa44e3cd21d	\N
1523936e-845e-4dce-b8d7-b14714f44037	Табак Blackburn ассорти 25г.	blackburn.jpg	749	3dfe66f9-7b51-4d84-a29b-efa44e3cd21d	\N
b7fd787d-48f9-4a30-aab8-b8b992155fab	Табак Darkside ассорти 25г.	darkside.jpg	749	3dfe66f9-7b51-4d84-a29b-efa44e3cd21d	\N
fbaf2b7d-29b7-4bf2-bc83-ed6b51992633	Табак Must Have ассорти 25г.	tabakmastxevasorii.jpg	749	3dfe66f9-7b51-4d84-a29b-efa44e3cd21d	\N
657a6b20-d207-4444-94c8-5487de63c2e3	Эл. Сигареты UDN ассорти	q0e63t6gq3stvlw97nsetldzqhht4n1s.jpg	2499	65801616-dd4c-43cf-a0c3-ac3663a4e2f8	\N
3dad1b56-d864-4364-8fac-6ee77bf19918	Эл. Сигареты ELFBAR ассорти	s_1600_z.webp	3399	65801616-dd4c-43cf-a0c3-ac3663a4e2f8	\N
dcd4b2df-00ea-4c91-a442-0d1b11cc2ca5	Эл. Сигареты Puffmi ассорти	puffmi-dy4500-800x800.jpg	2499	65801616-dd4c-43cf-a0c3-ac3663a4e2f8	\N
e2ed2b4e-1f37-42f6-ad01-b276fb5b6ad0	Эл. Сигареты HQD ассорти	hqdklubnikkivi.jpg	2399	65801616-dd4c-43cf-a0c3-ac3663a4e2f8	\N
\.


--
-- Name: DATABASE db_cheap; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE db_cheap TO db_cheap_grp;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO db_cheap_grp;


--
-- PostgreSQL database dump complete
--

--
-- Database "db_expensive" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

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
-- Name: db_expensive; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE db_expensive WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE db_expensive OWNER TO postgres;

\connect db_expensive

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


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    id uuid NOT NULL,
    login character varying(50) NOT NULL,
    password character varying(64) NOT NULL,
    "createdAt" character varying(50)
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- Name: basket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    card character varying(1000000),
    ip character varying(64),
    "createdAt" date DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.basket OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id uuid NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: ip; Type: TABLE; Schema: public; Owner: db_admin
--

CREATE TABLE public.ip (
    ip character varying,
    wrong_request_count integer,
    is_blocked_ip boolean NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL
);


ALTER TABLE public.ip OWNER TO db_admin;

--
-- Name: list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.list (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(50) NOT NULL,
    img character varying(50),
    price integer NOT NULL,
    "typeId" uuid NOT NULL,
    "oldPrice" integer,
    country character varying(100),
    "itemType" character varying(100),
    taste character varying(100),
    fortress character varying(100),
    carbonation character varying(100),
    "bottleType" character varying(100),
    volume character varying(100),
    brand character varying(100)
);


ALTER TABLE public.list OWNER TO postgres;

--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (id, login, password, "createdAt") FROM stdin;
9aff025e-bca1-4ace-83b7-ae8921624e18	monya	$2b$10$cY/EU0Dwy5X4TFrpDy8R5eTPovT20yvG.L.VKB7oiD/wG7dYyqze2	2023-05-24 15:30:28.666711
ca2f2172-bf4e-4ea3-b4d7-a74f50b75af5	dastavka	$2b$10$8ZnwRARfupvDvX71sZuIH.1ddcoJJdpTozz8YZkrvlGOc2CxWelnu	2023-05-24 15:31:02.784392
13aa1250-7c1a-4af2-bbec-0e01ab0c98d0	menejer	$2b$10$T/QJ0qTxZoJPGi9pWkBieOS5q6SPayYIzxSVCQrCfXVOvJ1hhud1m	2023-05-24 15:34:00.412648
\.


--
-- Data for Name: basket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basket (id, card, ip, "createdAt") FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name) FROM stdin;
3497daf4-5971-4927-adde-92990381ba8e	vodka
0da7da58-7b26-4c0f-8986-528534271bf3	beer
18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	wine
368db897-f92f-4a93-81df-fa67b92f2f0d	cognac
dfc6f7e4-3100-4963-8f60-571228e8db77	whiskey
cccf7ea8-e25e-47df-aa9c-5c10c52a7304	liquor
4726f1d3-9f05-4568-a24f-b2fc23b56619	tequilla
620c2066-8a39-491d-a86e-8f4568dd636a	jin
cca2137e-695d-4853-89a0-27c6a3167ffd	rom
890b9f91-bbba-4ffa-9c83-702905f41cd6	champagne
7a04ec1c-8c89-4882-95e4-2f8cb32825b0	vermouth
e27792aa-9c19-49ec-a002-9a750f5b133e	juice
f52cf384-16de-4b61-9427-1947c5ef7a23	water
0502001e-cc9f-4402-abc7-038a454e1810	snacks
1761cb87-095d-400a-bb88-ef2af0fbe872	ciggarettes
9390861d-c276-4f9f-a381-df4c91b8b07c	sticks
65801616-dd4c-43cf-a0c3-ac3663a4e2f8	el-sig
0aeebff6-247d-4445-b8fd-53548a097aca	other
abaa09aa-8e15-49d6-b540-db834c24a6eb	tobacandcalian
\.


--
-- Data for Name: ip; Type: TABLE DATA; Schema: public; Owner: db_admin
--

COPY public.ip (ip, wrong_request_count, is_blocked_ip, created_at, id) FROM stdin;
217.76.15.105	1	f	2023-11-14 17:09:35.973574	0aac7815-ae60-475d-b2a3-0fdd51f93dea
109.252.142.187	0	f	2023-11-14 17:51:02.561395	e5a95adf-8c38-4e5c-b05b-e988da02c3ec
188.123.230.34	0	f	2023-11-18 00:33:06.655611	aedc7653-65ab-413a-a03a-338a13b9169b
217.76.13.72	0	f	2023-11-22 17:49:40.41349	77de54ba-6729-44b4-8c94-fea7207cbc57
109.252.142.7	0	f	2023-11-23 19:19:45.536298	cad9986e-6529-45e3-841d-8defa5fde2f1
176.194.94.106	1	f	2023-11-26 15:16:55.665651	f2257400-52a1-474c-a121-bfb823ecaaea
\.


--
-- Data for Name: list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.list (id, name, img, price, "typeId", "oldPrice", country, "itemType", taste, fortress, carbonation, "bottleType", volume, brand) FROM stdin;
37fab801-d08c-46ea-9d2d-6ab7d6a35aa8	Хорта	xorta05	849	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Альфа спирт	\N	40%	\N	Стекло	0.5 л	ООО «Русский Север»
30e35479-a233-464b-bcf5-93963c18340f	Талка	talka05	799	3497daf4-5971-4927-adde-92990381ba8e	999	Россия	Люкс спирт	\N	40%	\N	Стекло	0.5 л	АО «Сибирский ЛВЗ»»
1b06184c-d9a9-410c-a284-d82b1acb52c6	Русский Стандарт	russstandart05	1399	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Альфа спирт	\N	40%	\N	Стекло	0.5 л	ООО «Русский Стандарт Водка»
7ab04545-0f3d-43f1-8f7a-6c231362dd6f	Пять Озер	pyatozer05	849	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Альфа спирт	\N	40%	\N	Стекло	0.5 л	ООО «Алкогольная Сибирская Группа»
1c0efd67-0885-48b3-a722-4e8c05993dba	Зеленая марка	zelenayamarka05	699	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Альфа спирт	\N	40%	\N	Стекло	0.5 л	АО «ЛВЗ «Топаз»
06ba1c7f-d1ef-49b7-a76d-2635f93961c5	Absolut	absolute07	2199	3497daf4-5971-4927-adde-92990381ba8e	\N	Швеция	Люкс спирт	\N	40%	\N	Стекло	0,7Л	Pernod Ricard
bf64c4b5-ff0f-402c-a174-acfd4092bb64	Белуга	beluga05	1699	3497daf4-5971-4927-adde-92990381ba8e	1949	Россия	Альфа спирт	\N	40%	\N	Стекло	0.5 л	ГК «Синергия»»
5c213452-0da7-4f9d-a269-67e9c7474dc7	Nemiroff клюква	nemiroffklyuk	649	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Люкс спирт	\N	40%	\N	Стекло	0,5Л	ООО "Объединенные пензенские водочные заводы"
baaa9bf1-2bf2-4783-bde7-b16743e36d49	Охота	oxota	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N	Россия	\N	\N	8,1%	\N	ж/б	0,45Л	Bravo International
a8ddf689-78c5-42e3-b748-08496716bc96	Krusovice	krusovice	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N	Чехия	\N	\N	4,2%	\N	ж/б	0.45л	\N
028372f7-a4ea-4418-b921-f53eb524fd93	Spaten Светлое	stapen	239	0da7da58-7b26-4c0f-8986-528534271bf3	\N	Германия	\N	\N	5,2%	\N	ж/б	0,5л	\N
1254419a-d232-4ec8-82ab-91c4d24db9a4	White Horse	whitehorse05	1599	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия	\N	\N	40%	\N	Стекло	0,5л	\N
5b733810-c20a-442a-906f-059ef405f21c	Балтика 9 	baltika9	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N	Дания		\N	4,6%	\N	ж/б	0,5л	\N
3559d9f9-44b1-483f-a2ad-3efc689bfdb6	Miller	miller	159	0da7da58-7b26-4c0f-8986-528534271bf3	\N	США	\N	\N	4,4%	\N		0,5л	\N
9c77f3d5-5b30-4379-9f3a-8ea1111ea489	Miller	corona	239	0da7da58-7b26-4c0f-8986-528534271bf3	\N	США		\N	4,4%	\N	стекло	0,5л	\N
ca818949-7e5f-47c4-aa6c-613e7b8f2f87	Heineken	haineken	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N	Нидерланды	\N	\N	4,8%	\N	ж/б	0,43л	\N
b99a4cc1-2d02-4cca-b020-fca048c5eeae	Red Label 	redlabel07	2399	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия	\N	\N	40%	\N	Стекло	0,7л	\N
a81b53d0-815e-49cd-a0bb-5512ecfa0490	William Lawson''s 	william1	2399	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия	\N	\N	40%	\N	Стекло	1л	\N
09076156-f20b-4351-8ea7-9e1849ba546e	Jameson	jameson07	3699	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Ирландия	\N	\N	40%	\N	Стекло	0,7л	\N
413508a3-04aa-401e-ac90-7c7c76791751	William Lawson's 	william05	1799	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия	\N	\N	40%	\N	Стекло	0,5л	\N
e90927f3-2740-4214-9023-c5bc6e597b73	Ballantine's 	balatayns05	2199	dfc6f7e4-3100-4963-8f60-571228e8db77	2599	Шотландия	\N	\N	40%	\N	Стекло	0,5л	\N
e81c9523-13af-449c-835c-aaaec0d99b9b	Ballantine's 	balatayns07	3099	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия	\N	\N	40%	\N	Стекло	0,7л	\N
63620884-174b-4a92-a8d2-ae6f12b2a6cc	Jim Beam 	jimbeam05	2099	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	США	\N	\N	43%	\N	Стекло	0,5л	\N
d65c0c85-a594-47ab-af09-2b1cefe678fe	Jameson 	jameson1	4899	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Ирландия	\N	\N	40%	\N	Стекло	1л	\N
4e0fc998-360d-4949-a295-d5e27116cfb7	Старейшина 5 лет	starshina505	1599	368db897-f92f-4a93-81df-fa67b92f2f0d	\N	Россия	\N	\N	40%	\N	Стекло	0,5л	\N
b0652192-7ee4-43d9-b928-608a4b69885e	Jack Daniel's	jack07	3599	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	США	\N	\N	40%	\N	Стекло	0,7л	\N
b597561e-2678-4fb7-b474-da1d8ce2853c	Bell''s 	bells1	2299	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия	\N	\N	40%	\N	Стекло	1л	\N
d07d800b-c7d3-4cc0-a047-009747b3bea5	Bell's 	bells05	1499	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия	\N	\N	40%	\N	Стекло	0,5л	\N
b7f5391a-8077-4b36-976a-08a53c6850fb	Старый Кенигсберг 4 года	starikeninsberg	1399	368db897-f92f-4a93-81df-fa67b92f2f0d	\N	Россия	\N	\N	40%	\N	Стекло	0,5л	\N
3081a7de-21bd-4ccd-960e-80a574dd69eb	Sauza gold	sauzagold07	3399	4726f1d3-9f05-4568-a24f-b2fc23b56619	\N	Мексика	\N		38%	\N	Стекло	0,7Л	\N
c716e1ee-1524-4bf7-bf01-0225eb7416b6	Кочари 5 лет 	qochari5	1099	368db897-f92f-4a93-81df-fa67b92f2f0d	\N	Армения	\N	\N	40%	\N	Стекло	0,5л	\N
0b08aad6-75b0-4d86-9b76-2064d298a222	Кочари 3 года 	qochari3	999	368db897-f92f-4a93-81df-fa67b92f2f0d	\N	Армения	\N	\N	40%	\N	Стекло	0,5л	\N
3295878f-603e-4f64-b819-ec2a3063d239	Арарат 5 лет	ararat505	2399	368db897-f92f-4a93-81df-fa67b92f2f0d	\N	Армения	\N	\N	40%	\N	Стекло	0,5л	\N
e2c7a22c-89e9-47b1-9cac-054995fceb76	Арарат 3 года 	ararat307	1999	368db897-f92f-4a93-81df-fa67b92f2f0d	\N	Армения	\N	\N	40%	\N	Стекло	0,7л	\N
600577af-d2da-4303-b66c-1eee67baa529	Арарат 5 лет 	ararat507	2999	368db897-f92f-4a93-81df-fa67b92f2f0d	\N	Армения	\N	\N	40%	\N	Стекло	0.7л	\N
c0b9a04d-1590-411e-9b98-19b34022f233	Shustoff 5 лет 	shustov505	1299	368db897-f92f-4a93-81df-fa67b92f2f0d	1599	Украина	\N	\N	40%	\N	 Стекло	0,5л	\N
a7d6cf0a-51e7-4894-8557-9aa3995207ff	Jägermeister 	jager07	3799	cccf7ea8-e25e-47df-aa9c-5c10c52a7304	4099	Германия	\N	\N	35%	\N	Стекло	0.7л	\N
4461d024-0584-4767-9871-47f5436c2013	Baileys	beylis07	2599	cccf7ea8-e25e-47df-aa9c-5c10c52a7304	\N	Ирландия	\N	\N	17 %	\N	Стекло	0.7л	Lamonica
ddc39aac-3341-45ea-8323-847a62d8aad0	Olmeca silver	olmeka07	3499	4726f1d3-9f05-4568-a24f-b2fc23b56619	3799	Мексика	\N		38%	\N	Стекло	0,7Л	\N
b45553a6-49fd-4644-b0bf-d167ca7eb625	Beefeater	bifiter07	3499	620c2066-8a39-491d-a86e-8f4568dd636a	\N	Великобритания	\N	\N	47%	\N	Стекло	0,7л	\N
47ad6dad-8fcd-43c8-870c-83e9d8c823b3	Havana Club	havana07	2599	cca2137e-695d-4853-89a0-27c6a3167ffd	2899	Куба	\N	\N	37,5 %	\N	Стекло	0,7л	\N
fe983104-296d-4ec0-ab82-1d3512ecec38	Gordon's Gin	gordons07	2999	620c2066-8a39-491d-a86e-8f4568dd636a	\N	Великобритания	\N	\N	43%	\N	Стекло	0,7л	\N
67f769e7-c629-448a-bc3d-a3b7fd66afb4	Bacardi Blanca	bacardi07	2899	cca2137e-695d-4853-89a0-27c6a3167ffd	\N	США	\N		40%	\N	Стекло	0,7л	\N
d16d0631-616c-43a3-8884-ece0d0b8b8dc	Bacardi Blanca	bacardi05	2399	cca2137e-695d-4853-89a0-27c6a3167ffd	\N	США	\N		40%	\N	Стекло	0,5л	\N
742588f2-4514-4aac-8fb7-f5e10f325e4b	Rebarelle красное	rebarelkrsux	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Франция	\N	Сухое	11%	\N	Стекло	0,7л	\N
dc827b63-f7df-433f-b76b-b7402c027195	Firmamento белое	firmamentobelsux	1199	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Испания	\N	Сухое	12%	\N	Стекло	0,7л	\N
bfc239e9-048a-4b82-b07b-8638f01126e9	Rebarelle белое	rebarelbelsux	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Франция	\N	Сухое	11%	\N	Стекло	0,7л	\N
d398675a-efda-40fd-976d-3a67a2742e2d	Firmamento белое	firmamentobelplsi	1199	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Испания	\N	Полусладкое	12%	\N	Стекло	0,7л	\N
beb1e847-2ada-403b-aca5-0a89ff4ba525	Вода Боржоми	borjomi05	159	f52cf384-16de-4b61-9427-1947c5ef7a23	\N	Грузия	Вода	\N	\N	Газированная	Стекло	0,5Л	\N
6acafb65-454b-414a-9069-860aa6e145db	Вода Минеральная	aquasgazom	99	f52cf384-16de-4b61-9427-1947c5ef7a23	\N	Россия	Вода	\N	\N	Газированная	Пэт	0,5Л	\N
92c68a90-b343-4eba-8db8-3496dd2d52ff	Rich Томатный	tomat	239	e27792aa-9c19-49ec-a002-9a750f5b133e	\N	Россия	\N	Томатный			Крафтовый	1Л	\N
f2dd6b24-acf8-4856-b8c1-0bd664d51b55	Rich Мультифрукт	multifrukt	239	e27792aa-9c19-49ec-a002-9a750f5b133e	\N	Россия	\N	Мультифрукт			Крафтовый	1Л	\N
7c55c201-0dc8-4e62-b970-07e8dbe730da	Rich Вишня	cherry	239	e27792aa-9c19-49ec-a002-9a750f5b133e	\N	Россия	\N	Вишня			Крафтовый	1Л	\N
fbc634d6-de42-4337-ab5f-28f20f15ac93	Чипсы Lay's	laysluk	149	0502001e-cc9f-4402-abc7-038a454e1810	\N	США	Снеки	Лук	\N	\N	\N	80 гр	PepsiCo
de722e33-1173-4a9e-993d-d21f4f244bc9	Лыхны красное	lixni	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	1399	Абхазия	\N	Сухое	12%	\N	Стекло	0,7л	\N
e71867ae-8bdf-4679-8b2f-761568791517	Чипсы Lay's 	layskrab	149	0502001e-cc9f-4402-abc7-038a454e1810	\N	США	Снеки	Краб	\N	\N	\N	80 гр	PepsiCo
ebce06af-d0be-4932-a7e8-cedd756e1f9d	Сухарики 3 Корочки	trikorochkisir	59	0502001e-cc9f-4402-abc7-038a454e1810	\N	Россия	Снеки	Семга и сыр	\N	\N	\N	40 гр	PepsiCo
41c5fe2d-a8fd-4832-859a-4032ab579d36	Чипсы Lay's 	layssmetan	149	0502001e-cc9f-4402-abc7-038a454e1810	\N	США	Снеки	Сметана и лук	\N	\N	\N	80 гр	PepsiCo
0f31b142-ec46-492f-90ff-7d2ac26cfc5b	Winston Xstyle Silver	whinstonxsilver	290	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	4 мг	\N	\N	\N	Xstyle Silver
20f28376-43cf-4b12-967e-b5f851b79ac4	Колбаски	kolbasineostrie	189	0502001e-cc9f-4402-abc7-038a454e1810	\N	Россия	Снеки	Сырокопченые	\N	\N	\N	100 гр	PepsiCo
d9486f89-5a94-4d42-acff-125d0525c110	Vogue Menthe	vouge	310	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	 7 мг	\N	\N	\N	
7186c9e3-198d-45b1-bf6c-025a049189b4	Winston blue	whinstonblue	290	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	6 мг	\N	\N	\N	
54da16bf-f670-4e54-8ea6-75ebd6a94990	Чипсы Lay's 	layscheese	149	0502001e-cc9f-4402-abc7-038a454e1810	\N	США	Снеки	Сыр	\N	\N	\N	80 гр	PepsiCo
44b51816-9b32-4525-bae9-8fe47c8adc5d	Parliament Aqua Blue	parliament	350	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	5 мг	\N	\N	\N	Xstyle Silver
e18f31e3-aa06-454d-b97e-1c1d20a5d3dd	Marlboro with button	marlborobutton	270	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	9 мг	\N	\N	\N	
041809f4-f3b3-4a6e-9e05-84a849870b4a	Marlboro red	marlborored	290	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	9 мг	\N	\N	\N	
7994b5c8-abaf-402b-9267-d1bbfb28611f	Kent 4	kent4	290	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	4 мг	\N	\N	\N	
184c0331-ecb3-4b2b-9f14-d4dc6cb4f971	Kent Nano	kentnano4	300	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	4 мг	\N	\N	\N	
74f90cc5-d6bb-43b9-87b5-79a5b9dd4d8d	Esse blue	esseblue	290	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Южная Корея	\N	\N	5 мг	\N	\N	\N	
3e0f85cb-4927-4fda-8898-296b8876e108	Chapman yellow	chapmangold	310	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	6 мг	\N	\N	\N	
42980feb-0050-463e-90d3-6f17fbd3d73b	Chapman red	chapmanred	310	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	6 мг	\N	\N	\N	
711b85fc-fa37-4060-a970-ce6dd96452bc	Chapman brown	chapmanbrown	310	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	6 мг	\N	\N	\N	
cf5476ed-42b5-4799-844c-f6da722e8ee8	HEETS Синие	heetsblue	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N	Россия	\N	Холод ментола	Легкие	\N	\N	\N	HEETS
db5d7e27-0b53-4423-8e8a-88a1b81f9274	HEETS Золото	heetsgold	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N	Россия	\N	Древесные и ореховые нотки	Средние	\N	\N	\N	HEETS
3541d1b1-d19b-421f-8c02-9517aa855a63	HEETS Зеленые	heetsgreen	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N	Россия	\N	Освежающий ментол	Легкие	\N	\N	\N	HEETS
8150a9f7-0b78-4410-99ec-22c8dbf3b06b	HEETS Голубые	heetstourqoise	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N	Россия	\N	Бархатистый табачный бленд	Легкие	\N	\N	\N	HEETS
9be04172-6fc1-48fa-91d8-61922d4e08bf	Зажигалка Cricket	cricket	139	0aeebff6-247d-4445-b8fd-53548a097aca	\N	Швецария	Презервативы	Без вкуса	\N	\N	\N	1 шт	Cricket
989d21b2-45bf-47ee-9583-2c6fa6c4b192	Жвачка Orbit	orbit	99	0aeebff6-247d-4445-b8fd-53548a097aca	\N	США		Ассорти	\N	\N	\N	1 шт	
f70cce59-f141-4445-8929-d16bee71633d	Од.Стакан	cup	150	0aeebff6-247d-4445-b8fd-53548a097aca	\N	Россия			\N	\N	\N	0,2л - 10 шт	
ff8e0412-3c8a-4333-b013-eb1255a34400	Киндзмараули красное	kindzmarauli	1049	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Грузия	\N	Полусладкое	11,5%	\N	Стекло	0,7л	\N
dfec5f1f-ce64-46ca-94f0-2ff9c2841c4b	Апсны красное	apsni	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	1399	Абхазия	\N	Полусладкое	11%	\N	Стекло	0,7л	\N
5c183b93-cf02-4041-93b1-797705e5e84a	Pinot Grigio белое	pinogridjo	1399	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Италия	\N	Сухое	12%	\N	Стекло	0,7л	\N
b85073b0-1b40-4686-98ab-e044f5a13358	Santucci Toscana 	santtoskkrsux	1699	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Италия	\N	Кр/Сухое	12%	\N	Стекло	0,7л	\N
16afc7ed-47f2-455a-b6ea-7c44a682543d	Firmamento красное	firmamentokrsux	1199	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Испания	\N	Сухое	12%	\N	Стекло	0,7л	\N
7a731f67-7323-406a-af1e-521bb195a12f	Firmamento красное	firmamentokrpls	1199	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Испания	\N	Полусладкое	12%	\N	Стекло	0,7л	\N
65ef7ac1-cfae-4b29-8348-c7d1d89f22bc	Campo delia белое	kampodeliabelsux	1399	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Испания	\N	Сухое	12%	\N	Стекло	0,7л	\N
c05a8e9f-c64c-4951-80a8-a687bc4da2d5	Абрау-Дюрсо белое	abraudursobelpls	849	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N	Россия	\N	Полусладкое	12.5%	\N	Стекло	0,75л	\N
96d7cc45-15a7-4491-aa70-113fd2372ff2	Mondoro Asti	mondoroasti	2049	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N	Италия	\N	Полусладкое	7,5%	\N	Стекло	0,75л	\N
f75c27bf-7fd6-4da0-a6ee-9ce01de1ecc7	Cinzano Prosecco	cinzanoproseko	1949	890b9f91-bbba-4ffa-9c83-702905f41cd6	2249	Италия	\N	Prosecco	11%	\N	Стекло	0,75л	\N
36bfa74b-a2b4-4ecb-beb0-88051572f6be	Atto Primo Prosecco	attoprimoprosekko	1749	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N	Италия	\N	Prosecco	11.5%	\N	Стекло	0,75л	\N
8212b885-3a83-48c1-9ab0-01cb755ee08d	Cinzano	chinzanobyanko	999	7a04ec1c-8c89-4882-95e4-2f8cb32825b0	\N	Италия	\N		18%	\N	Стекло	0,75л	\N
8deeb8a6-0fe2-401d-bc2b-61b207349a59	Atto Primo Asti	attoprimoasti	1749	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N	Италия	\N	Полусладкое	7.5%	\N	Стекло	0,75л	\N
cc933519-d507-4d23-b0ab-dd875ab8523b	Gancia Prosecco	ganchaprosekko	1699	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N	Италия	\N	Prosecco	9%	\N	Стекло	0,75л	\N
8955aba0-ca18-485a-8eb7-bae966ce34a4	Martini Bianco	martinibyanko	2399	7a04ec1c-8c89-4882-95e4-2f8cb32825b0	\N	Италия	\N		15%	\N	Стекло	1,0Л	\N
7bd6c21e-a733-48e7-95bb-88c16c875dba	Martini Bianco	martinibyanko	1349	7a04ec1c-8c89-4882-95e4-2f8cb32825b0	\N	Италия	\N		15%	\N	Стекло	0,5Л	\N
d9b6faa2-36d6-4ea7-84b8-802b4dfac803	Cinzano	chinzanobyanko	1999	7a04ec1c-8c89-4882-95e4-2f8cb32825b0	\N	Италия	\N		18%	\N	Стекло	0,75л	\N
47fc7b20-dc9e-47e4-931f-8a1a1d684c30	BeerKA Фисташки	arexasorti	249	0502001e-cc9f-4402-abc7-038a454e1810	\N	Россия	Снеки	Фисташки с солью	\N	\N	\N	80 гр	PepsiCo
8b72d9ae-426b-4384-a977-33ccc1d4ae57	Хорта	xorta07	1099	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Альфа спирт	\N	40%	\N	Стекло	0.7 л	ООО «Русский Север»
2ccbc847-c94e-4686-95ba-b3dcfa941178	Финляндия	finland07	2199	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Люкс спирт	\N	40%	\N	Стекло	0.7 л	ООО «БИГ»
4b1cac78-21de-4864-a9e6-1171b60d6d20	Русский Стандарт	russstandart07	1149	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Альфа спирт	\N	40%	\N	Стекло	0.7 л	ООО «Русский Стандарт Водка»
5018f7a4-8d54-4f96-8739-de7518cbd616	Зеленая марка	zelenayamarka07	949	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Альфа спирт	\N	40%	\N	Стекло	0.7 л	АО «ЛВЗ «Топаз»
49e4febb-5848-4e25-99df-7b8b95f5a4df	Журавли	juravli	649	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Люкс спирт	\N	40%	\N	Стекло	0.5 л	АО «ЛВЗ «Топаз»
e199f827-ebdb-4065-b500-9aebcd9dfbf2	Беленькая	6414_991516_09.jpg	649	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Альфа спирт	\N	40%	\N	Стекло	0.5 л	ГК «Синергия»»
24ef78e6-f20e-4c55-bd86-93d5427e512c	Hoegaarden	hugarden	169	0da7da58-7b26-4c0f-8986-528534271bf3	\N	Бельгия	\N	\N	4,6%	\N	стекло	0,45л	\N
d3de43b7-25bf-4f8f-a50c-6dab5e25b5df	Bud	bud	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N	Бельгия	\N	\N	4,8%	\N	ж/б	0,45л	\N
2bd1a619-9b97-4cd5-bfde-98323e06012d	William Lawson''s 	william07	2099	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия	\N	\N	40%	\N	Стекло	0,7л	\N
63036c5d-efc5-4b0d-9af6-e8bca8988784	Jim Beam 	jimbeam07	2999	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	США	\N	\N	43%	\N	Стекло	0,7л	\N
fa0f3f17-6bc9-4741-982a-f46ce8ad2a56	Jameson	jameson05	2899	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Ирландия	\N	\N	40%	\N	Стекло	0,5л	\N
bf79385a-9039-4590-a4ec-e5954e4bfb54	Absolut	absolute05	1849	3497daf4-5971-4927-adde-92990381ba8e	\N	Швеция	Люкс спирт	\N	40%	\N	Стекло	0,5Л	Pernod Ricard
5034c6a6-b2d6-412d-98fd-b265393e28f9	Nemiroff медовая	nemiroffmedsper	649	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Люкс спирт	\N	40%	\N	Стекло	0,5Л	ООО "Объединенные пензенские водочные заводы"
e101d017-43c6-4ecd-bec9-f2da04d73854	Nemiroff классик	nemirofforig	649	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Люкс спирт	\N	40%	\N	Стекло	0,5Л	ООО "Объединенные пензенские водочные заводы"
03463360-f0d1-4145-be74-2499e6c5d2f9	Арарат 3 года 	ararat305	1599	368db897-f92f-4a93-81df-fa67b92f2f0d	\N	Армения	\N	\N	40%	\N	Стекло	0,5л	\N
2e13901a-1b3b-48ab-82a9-2cf919e808bb	Sprite	sprite2	249	f52cf384-16de-4b61-9427-1947c5ef7a23	\N	Россия	Вода	\N	\N	Газированная	Пэт	2Л	The Coca-Cola Company
5c09b471-93c1-4db5-9fa5-5e1e9d8a6fd6	Tuborg 	tuborg	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N	Дания	\N	\N	4,6%	\N	ж/б	0,5л	\N
d4b0634a-5236-4385-a51a-72c46574429f	Козел светлая 	kozelsvet	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N	Дания		\N	4,6%	\N	ж/б	0,5л	\N
dbbb0ec5-69b7-4beb-b624-96ef6331a877	Kronenbourg 	kronenburg	169	0da7da58-7b26-4c0f-8986-528534271bf3	\N	Франция	\N	\N	4,8%	\N	ж/б	0,45л	\N
2473fd83-f127-4c7f-9d3f-fbba6712cabc	Evervess	tonnik1	249	f52cf384-16de-4b61-9427-1947c5ef7a23	\N	Россия	Вода	\N	\N	Газированная	Пэт	1Л	PepsiCo
3cd13de4-add3-470d-8833-7a291cba2a27	Rich Грейпфрут	greifrut	239	e27792aa-9c19-49ec-a002-9a750f5b133e	\N	Россия	\N	Грейпфрут			Крафтовый	1Л	\N
9d587edf-66eb-4d2d-be3e-f0cb0fb5d0df	Rich Яблоко	apple	239	e27792aa-9c19-49ec-a002-9a750f5b133e	\N	Россия	\N	Яблоко			Крафтовый	1Л	\N
206d8fc5-f49c-49e4-89a3-59fc934834fa	Чипсы Lay's  Рифленые	laysriflenie	149	0502001e-cc9f-4402-abc7-038a454e1810	\N	США	Снеки	Сметана и лук	\N	\N	\N	80 гр	PepsiCo
89cc6b44-c97d-4564-b57b-1e1408936dbb	Must Have	tabakmastxevasorii	749	abaa09aa-8e15-49d6-b540-db834c24a6eb	\N	Россия	\N	Ассорти	7 мг	\N	\N	25 гр	Must Have
6334316a-f8b7-46e5-8d40-b14ead04c540	Сыр копченый	sir	299	0502001e-cc9f-4402-abc7-038a454e1810	\N	Россия	Снеки	Сыр копченый	\N	\N	\N	100 гр	PepsiCo
9bf77a7e-8a33-4788-8f98-9141d1f04216	Сухарики 3 Корочки	trikorochkixolodec	59	0502001e-cc9f-4402-abc7-038a454e1810	\N	Россия	Снеки	Холодец с хреном	\N	\N	\N	40 гр	PepsiCo
c1aa7783-e766-4665-b5cc-27ca8fa494bd	Колбаски острые	kolbasineostrie	189	0502001e-cc9f-4402-abc7-038a454e1810	\N	Россия	Снеки	Сырокопченые	\N	\N	\N	100 гр	PepsiCo
d495a730-3a6d-4336-a353-ca464260c2de	 Darkside	bd74f83195461f902d32cc09f88fb422.jpg	749	abaa09aa-8e15-49d6-b540-db834c24a6eb	\N	Россия	\N	Ассорти	5-6 мг	\N	\N	30 гр	Darkside
6375b923-8f00-4d2c-a442-f525d76b2955	Darkside	darkside	749	abaa09aa-8e15-49d6-b540-db834c24a6eb	\N	Россия	\N	Ассорти	5-6 мг	\N	\N	25 гр	Darkside
6f126852-2665-4aea-8924-31357c0e14d6	Кальян	kalyan	7499	abaa09aa-8e15-49d6-b540-db834c24a6eb	\N	Россия	\N			\N	\N		
90fd5019-7d36-4718-b259-8c3de4aa5bcb	Blackburn	blackburn	749	abaa09aa-8e15-49d6-b540-db834c24a6eb	\N	Россия	\N	Ассорти	7 мг	\N	\N	25 гр	
ea75c66c-89d0-4f07-9207-7323179ff069	HEETS Фиолетовые	heetspurple	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N	Россия	\N	Аромат лесных ягод	Легкие	\N	\N	\N	HEETS
04877f88-ce42-489e-9330-99f602d54d03	HEETS Оранжевые	heetsamber	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N	Россия	\N	Древесные и ореховые нотки	Легкие	\N	\N	\N	HEETS
e8bd77b6-b71a-4fae-820d-16a5dbbebf8e	HEETS Желтые	heetsyellow	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N	Россия	\N	Цитрусовый аромат с пряными нотками	Легкие	\N	\N	\N	HEETS
b0cc16f0-04b5-4a9b-b989-26d8d627fcce	Lost Mary	202201251028329427_660X660.jpg	2599	65801616-dd4c-43cf-a0c3-ac3663a4e2f8	\N	Китай	Эл.Сигареты	Ассорти	20 мг	\N	\N	6000	\N
ad7c00e3-1142-4e0a-8cc4-daf09da5ece3	Штопор	shtapor	449	0aeebff6-247d-4445-b8fd-53548a097aca	\N	Россия			\N	\N	\N	1 шт	
21e873e5-1afc-4f89-b8bb-147ef0b14150	Царская	carskaya07	1449	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Люкс спирт	\N	40%	\N	Стекло	0.7 л	ООО «ЛАДОГА»
0ba14d4b-62e4-42ac-8a59-2770804da050	Rich Апельсин	orange	239	e27792aa-9c19-49ec-a002-9a750f5b133e	\N	Россия	\N	Апельсин			Крафтовый	1Л	\N
fa36f7a1-597c-4fd1-8c91-d1aa4032dc06	Becherovka	d3a0c7772409810627c76ffede1efc8a.jpg	2649	cccf7ea8-e25e-47df-aa9c-5c10c52a7304	\N	Чехия	\N	\N	38 %	\N	Стекло	0,5Л	Lamonica
c3866f8a-4b59-4ab0-825f-7db2eef5c8e4	Абрау-Дюрсо Brut	abraudursobrut	849	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N	Россия	\N	Брют	12%	\N	Стекло	0,75л	\N
97de3d88-f591-4ca4-9abf-ade71b05be2a	Mondoro Brut	mondobrut	2049	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N	Италия	\N	Брют	7,5%	\N	Стекло	0,75л	\N
5ddbf603-a93f-4f35-816d-5b17509248d2	Вода Минеральная	aquabezgaz	99	f52cf384-16de-4b61-9427-1947c5ef7a23	\N	Россия	Вода	\N	\N	Негазированная	Пэт	0,5Л	PepsiCo
4d28a8e1-3796-444d-aa89-775caf535e8d	Пять Озер	pyatozer07	1099	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Альфа спирт	\N	40%	\N	Стекло	0.7 л	ООО «Алкогольная Сибирская Группа»
d0dcb640-96bb-4472-b332-d08989aaaea0	Chivas Regal 12 	chivas12	5199	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия	\N	\N	40%	\N	Стекло	0,7л	\N
24373321-4c28-492e-a935-e2008f898c9c	Старейшина 3 года 	starshina305	1399	368db897-f92f-4a93-81df-fa67b92f2f0d	\N	Россия	\N	\N	40%	\N	Стекло	0,5л	\N
a1cb9709-906d-4841-880f-d01531d7d97f	HEETS Бронза	heetsbronze	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N	Россия	\N	С легкими нотами какао и сухофруктов	Легкие	\N	\N	\N	HEETS
cd1e3bdf-3981-421b-9726-078e7a3e62ef	Puffmi	199-seo-puffmi-vape.png	2499	65801616-dd4c-43cf-a0c3-ac3663a4e2f8	\N	Китай	Эл.Сигареты	Ассорти	20 мг	\N	\N	4500 	\N
b83dc2c2-4285-494f-9cf6-2c61b8a030d7	Inflave	photo_2022-12-13-14.48.40.jpg	2699	65801616-dd4c-43cf-a0c3-ac3663a4e2f8	\N	Китай	Эл.Сигареты	Ассорти	20 мг	\N	\N	5000	\N
65de2b48-7bb4-4691-a575-f3e6d917a8cf	Презервативы Сontex	condom	699	0aeebff6-247d-4445-b8fd-53548a097aca	\N	Тайланд	Презервативы	Без вкуса	\N	\N	\N	1 упк, 3 шт	Сontex
7af51d3a-5e7c-4a46-9247-ccae0586f597	Кока-кола	kola2	249	f52cf384-16de-4b61-9427-1947c5ef7a23	\N	Россия	Вода	\N	\N	Газированная	Пэт	2Л	\N
f5a7952e-18ca-4c59-b7d2-8b304cc40b01	Polini Самбука	sambuka05	1099	cccf7ea8-e25e-47df-aa9c-5c10c52a7304	\N	Италия	\N	\N	38%	\N	Стекло	0,5Л	Lamonica
b8b43b6d-5c07-43c9-9462-4512cdd61136	Captain Morgan	morgandrunk	2799	cca2137e-695d-4853-89a0-27c6a3167ffd	\N	Ямайка	\N	Пряный	35%	\N	Стекло	0,7л	\N
b7dce0bc-9a96-4027-94d5-0cc9527d117e	Алазанская долина красное	alazdalinakrpls	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Грузия	\N	Полусладкое	12%	\N	Стекло	0,7л	\N
7f62d29d-7133-4226-a389-eb4c4b344d62	Rebarelle белое	rebarelkrpls	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Франция	\N	Сухое	11%	\N	Стекло	0,7л	\N
983e8268-17d8-4daf-9463-0da1ce1d989c	Rebarelle белое	rebarelbelpls	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Франция	\N	Полусладкое	11%	\N	Стекло	0,7л	\N
94dbe032-ddfb-4526-990b-9fdaff41a333	Matevosyan красное	matevosyankrsux	1249	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Армения	\N	Сухое	12%	\N	Стекло	0,7л	\N
e02bfde0-da42-4321-b866-f3e26c4c46ff	Chianti красное	kyanti	1399	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Кьянти	\N	Сухое	12%	\N	Стекло	0,7л	\N
b977d930-d6a9-4524-9bb9-dd5d7662e9bc	Российское белое	russian	449	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N	Россия	\N	Полусладкое	12.5%	\N	Стекло	0,75л	\N
e3516cc5-70ee-49fb-b599-6cf97d0be8f8	Bosca white	boskabelaya	899	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N	Литва	\N	Полусладкое	7,5%	\N	Стекло	0,75л	\N
9f003502-0d5d-467b-8028-179eb0859fab	Asti Martini	martiniasti	2149	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N	Италия	\N	Полусладкое	7.5%	\N	Стекло	0,75л	\N
7a7511b7-4792-4261-ab92-c9b8e4ae4f19	Martini Fiero	martinifierro.jpg	1799	7a04ec1c-8c89-4882-95e4-2f8cb32825b0	2099	Италия	\N		15%	\N	Стекло	0,5л	\N
2f033d66-3991-44dd-99f0-99b99f078d57	Царская	carskaya05	1110	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Люкс спирт	\N	40%	\N	Стекло	0.5 л	ООО «ЛАДОГА»
2464d018-4b01-49a0-92e5-c53996aa8afa	Martini Extra	martiniekstradray	2199	7a04ec1c-8c89-4882-95e4-2f8cb32825b0	\N	Италия	\N		15%	\N	Стекло	0,75л	\N
7cf74afb-cb5a-4430-bd0c-b72490c494fd	Sauza silver	sauzasilver07	3399	4726f1d3-9f05-4568-a24f-b2fc23b56619	\N	Мексика	\N		51%	\N	Стекло	0,7Л	\N
1c5dbeca-ee0f-47fb-8de0-69fcc5dfacca	Macallan	makalan05.jpg	8799	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия			40%		Стекло	0,5Л	
\.


--
-- Name: ip unique_ip; Type: CONSTRAINT; Schema: public; Owner: db_admin
--

ALTER TABLE ONLY public.ip
    ADD CONSTRAINT unique_ip UNIQUE (ip);


--
-- Name: DATABASE db_expensive; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE db_expensive TO db_expensive_grp;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO db_expensive_grp;


--
-- Name: TABLE basket; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.basket TO db_admin WITH GRANT OPTION;
GRANT ALL ON TABLE public.basket TO db_expensive_grp WITH GRANT OPTION;


--
-- PostgreSQL database dump complete
--

--
-- Database "dev_expensive" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

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
-- Name: dev_expensive; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE dev_expensive WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE dev_expensive OWNER TO postgres;

\connect dev_expensive

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


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    id uuid NOT NULL,
    login character varying(50) NOT NULL,
    password character varying(64) NOT NULL,
    "createdAt" character varying(50)
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- Name: basket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    card character varying(1000000),
    ip character varying(64),
    "createdAt" date DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.basket OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id uuid NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: ip; Type: TABLE; Schema: public; Owner: db_admin
--

CREATE TABLE public.ip (
    ip character varying,
    wrong_request_count integer,
    is_blocked_ip boolean NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL
);


ALTER TABLE public.ip OWNER TO db_admin;

--
-- Name: list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.list (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(50) NOT NULL,
    img character varying(50),
    price integer NOT NULL,
    "typeId" uuid NOT NULL,
    "oldPrice" integer,
    country character varying(100),
    "itemType" character varying(100),
    taste character varying(100),
    fortress character varying(100),
    carbonation character varying(100),
    "bottleType" character varying(100),
    volume character varying(100),
    brand character varying(100)
);


ALTER TABLE public.list OWNER TO postgres;

--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (id, login, password, "createdAt") FROM stdin;
9aff025e-bca1-4ace-83b7-ae8921624e18	monya	$2b$10$cY/EU0Dwy5X4TFrpDy8R5eTPovT20yvG.L.VKB7oiD/wG7dYyqze2	2023-05-24 15:30:28.666711
ca2f2172-bf4e-4ea3-b4d7-a74f50b75af5	dastavka	$2b$10$8ZnwRARfupvDvX71sZuIH.1ddcoJJdpTozz8YZkrvlGOc2CxWelnu	2023-05-24 15:31:02.784392
13aa1250-7c1a-4af2-bbec-0e01ab0c98d0	menejer	$2b$10$T/QJ0qTxZoJPGi9pWkBieOS5q6SPayYIzxSVCQrCfXVOvJ1hhud1m	2023-05-24 15:34:00.412648
\.


--
-- Data for Name: basket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basket (id, card, ip, "createdAt") FROM stdin;
f2f9a315-fbac-4234-8fb9-a3207b095636	[]	217.76.11.187	2023-11-13
fe7eb4e7-6f1e-43c3-ba41-3748ca4eca39	[{"id":"206d8fc5-f49c-49e4-89a3-59fc934834fa","name":"Чипсы Lay's  Рифленые","img":"laysriflenie","country":"США","itemType":"Снеки","taste":"Сметана и лук","fortress":null,"carbonation":null,"bottleType":null,"volume":"80 гр","brand":"PepsiCo","price":149,"oldPrice":null,"type":{"id":"0502001e-cc9f-4402-abc7-038a454e1810","name":"snacks"},"quantity":1},{"id":"54da16bf-f670-4e54-8ea6-75ebd6a94990","name":"Чипсы Lay's ","img":"layscheese","country":"США","itemType":"Снеки","taste":"Сыр","fortress":null,"carbonation":null,"bottleType":null,"volume":"80 гр","brand":"PepsiCo","price":149,"oldPrice":null,"type":{"id":"0502001e-cc9f-4402-abc7-038a454e1810","name":"snacks"},"quantity":1}]	217.76.15.105	2023-11-14
ca669e07-f0e2-4c1d-bef8-3653481a9889	\N	37.252.91.111	2023-11-14
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name) FROM stdin;
3497daf4-5971-4927-adde-92990381ba8e	vodka
0da7da58-7b26-4c0f-8986-528534271bf3	beer
18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	wine
368db897-f92f-4a93-81df-fa67b92f2f0d	cognac
dfc6f7e4-3100-4963-8f60-571228e8db77	whiskey
cccf7ea8-e25e-47df-aa9c-5c10c52a7304	liquor
4726f1d3-9f05-4568-a24f-b2fc23b56619	tequilla
620c2066-8a39-491d-a86e-8f4568dd636a	jin
cca2137e-695d-4853-89a0-27c6a3167ffd	rom
890b9f91-bbba-4ffa-9c83-702905f41cd6	champagne
7a04ec1c-8c89-4882-95e4-2f8cb32825b0	vermouth
e27792aa-9c19-49ec-a002-9a750f5b133e	juice
f52cf384-16de-4b61-9427-1947c5ef7a23	water
0502001e-cc9f-4402-abc7-038a454e1810	snacks
1761cb87-095d-400a-bb88-ef2af0fbe872	ciggarettes
9390861d-c276-4f9f-a381-df4c91b8b07c	sticks
65801616-dd4c-43cf-a0c3-ac3663a4e2f8	el-sig
0aeebff6-247d-4445-b8fd-53548a097aca	other
abaa09aa-8e15-49d6-b540-db834c24a6eb	tobacandcalian
\.


--
-- Data for Name: ip; Type: TABLE DATA; Schema: public; Owner: db_admin
--

COPY public.ip (ip, wrong_request_count, is_blocked_ip, created_at, id) FROM stdin;
86.106.31.8	0	f	2023-11-13 14:48:01.316391	29bba18d-e4b1-4883-92f2-1e876c7b5c34
89.113.155.223	0	f	2023-11-13 14:53:25.305574	77582c2d-bcb6-43df-9e95-87bfe83271c2
\.


--
-- Data for Name: list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.list (id, name, img, price, "typeId", "oldPrice", country, "itemType", taste, fortress, carbonation, "bottleType", volume, brand) FROM stdin;
37fab801-d08c-46ea-9d2d-6ab7d6a35aa8	Хорта	xorta05	849	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Альфа спирт	\N	40%	\N	Стекло	0.5 л	ООО «Русский Север»
30e35479-a233-464b-bcf5-93963c18340f	Талка	talka05	799	3497daf4-5971-4927-adde-92990381ba8e	999	Россия	Люкс спирт	\N	40%	\N	Стекло	0.5 л	АО «Сибирский ЛВЗ»»
1b06184c-d9a9-410c-a284-d82b1acb52c6	Русский Стандарт	russstandart05	1399	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Альфа спирт	\N	40%	\N	Стекло	0.5 л	ООО «Русский Стандарт Водка»
7ab04545-0f3d-43f1-8f7a-6c231362dd6f	Пять Озер	pyatozer05	849	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Альфа спирт	\N	40%	\N	Стекло	0.5 л	ООО «Алкогольная Сибирская Группа»
1c0efd67-0885-48b3-a722-4e8c05993dba	Зеленая марка	zelenayamarka05	699	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Альфа спирт	\N	40%	\N	Стекло	0.5 л	АО «ЛВЗ «Топаз»
06ba1c7f-d1ef-49b7-a76d-2635f93961c5	Absolut	absolute07	2199	3497daf4-5971-4927-adde-92990381ba8e	\N	Швеция	Люкс спирт	\N	40%	\N	Стекло	0,7Л	Pernod Ricard
bf64c4b5-ff0f-402c-a174-acfd4092bb64	Белуга	beluga05	1699	3497daf4-5971-4927-adde-92990381ba8e	1949	Россия	Альфа спирт	\N	40%	\N	Стекло	0.5 л	ГК «Синергия»»
5c213452-0da7-4f9d-a269-67e9c7474dc7	Nemiroff клюква	nemiroffklyuk	649	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Люкс спирт	\N	40%	\N	Стекло	0,5Л	ООО "Объединенные пензенские водочные заводы"
baaa9bf1-2bf2-4783-bde7-b16743e36d49	Охота	oxota	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N	Россия	\N	\N	8,1%	\N	ж/б	0,45Л	Bravo International
a8ddf689-78c5-42e3-b748-08496716bc96	Krusovice	krusovice	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N	Чехия	\N	\N	4,2%	\N	ж/б	0.45л	\N
028372f7-a4ea-4418-b921-f53eb524fd93	Spaten Светлое	stapen	239	0da7da58-7b26-4c0f-8986-528534271bf3	\N	Германия	\N	\N	5,2%	\N	ж/б	0,5л	\N
1254419a-d232-4ec8-82ab-91c4d24db9a4	White Horse	whitehorse05	1599	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия	\N	\N	40%	\N	Стекло	0,5л	\N
5b733810-c20a-442a-906f-059ef405f21c	Балтика 9 	baltika9	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N	Дания		\N	4,6%	\N	ж/б	0,5л	\N
3559d9f9-44b1-483f-a2ad-3efc689bfdb6	Miller	miller	159	0da7da58-7b26-4c0f-8986-528534271bf3	\N	США	\N	\N	4,4%	\N		0,5л	\N
9c77f3d5-5b30-4379-9f3a-8ea1111ea489	Miller	corona	239	0da7da58-7b26-4c0f-8986-528534271bf3	\N	США		\N	4,4%	\N	стекло	0,5л	\N
ca818949-7e5f-47c4-aa6c-613e7b8f2f87	Heineken	haineken	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N	Нидерланды	\N	\N	4,8%	\N	ж/б	0,43л	\N
b99a4cc1-2d02-4cca-b020-fca048c5eeae	Red Label 	redlabel07	2399	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия	\N	\N	40%	\N	Стекло	0,7л	\N
413508a3-04aa-401e-ac90-7c7c76791751	William Lawson's 	william05	1799	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия	\N	\N	40%	\N	Стекло	0,5л	\N
a81b53d0-815e-49cd-a0bb-5512ecfa0490	William Lawson''s 	william1	2399	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия	\N	\N	40%	\N	Стекло	1л	\N
09076156-f20b-4351-8ea7-9e1849ba546e	Jameson	jameson07	3699	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Ирландия	\N	\N	40%	\N	Стекло	0,7л	\N
34d50850-565a-42cb-a498-8f53b1b5b94c	Macallan 	makalan05	8799	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия	\N	\N	40%	\N	Стекло	0,5л	\N
e90927f3-2740-4214-9023-c5bc6e597b73	Ballantine's 	balatayns05	2199	dfc6f7e4-3100-4963-8f60-571228e8db77	2599	Шотландия	\N	\N	40%	\N	Стекло	0,5л	\N
e81c9523-13af-449c-835c-aaaec0d99b9b	Ballantine's 	balatayns07	3099	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия	\N	\N	40%	\N	Стекло	0,7л	\N
63620884-174b-4a92-a8d2-ae6f12b2a6cc	Jim Beam 	jimbeam05	2099	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	США	\N	\N	43%	\N	Стекло	0,5л	\N
d65c0c85-a594-47ab-af09-2b1cefe678fe	Jameson 	jameson1	4899	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Ирландия	\N	\N	40%	\N	Стекло	1л	\N
4e0fc998-360d-4949-a295-d5e27116cfb7	Старейшина 5 лет	starshina505	1599	368db897-f92f-4a93-81df-fa67b92f2f0d	\N	Россия	\N	\N	40%	\N	Стекло	0,5л	\N
b0652192-7ee4-43d9-b928-608a4b69885e	Jack Daniel's	jack07	3599	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	США	\N	\N	40%	\N	Стекло	0,7л	\N
b597561e-2678-4fb7-b474-da1d8ce2853c	Bell''s 	bells1	2299	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия	\N	\N	40%	\N	Стекло	1л	\N
d07d800b-c7d3-4cc0-a047-009747b3bea5	Bell's 	bells05	1499	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия	\N	\N	40%	\N	Стекло	0,5л	\N
b7f5391a-8077-4b36-976a-08a53c6850fb	Старый Кенигсберг 4 года	starikeninsberg	1399	368db897-f92f-4a93-81df-fa67b92f2f0d	\N	Россия	\N	\N	40%	\N	Стекло	0,5л	\N
3081a7de-21bd-4ccd-960e-80a574dd69eb	Sauza gold	sauzagold07	3399	4726f1d3-9f05-4568-a24f-b2fc23b56619	\N	Мексика	\N		38%	\N	Стекло	0,7Л	\N
c716e1ee-1524-4bf7-bf01-0225eb7416b6	Кочари 5 лет 	qochari5	1099	368db897-f92f-4a93-81df-fa67b92f2f0d	\N	Армения	\N	\N	40%	\N	Стекло	0,5л	\N
0b08aad6-75b0-4d86-9b76-2064d298a222	Кочари 3 года 	qochari3	999	368db897-f92f-4a93-81df-fa67b92f2f0d	\N	Армения	\N	\N	40%	\N	Стекло	0,5л	\N
3295878f-603e-4f64-b819-ec2a3063d239	Арарат 5 лет	ararat505	2399	368db897-f92f-4a93-81df-fa67b92f2f0d	\N	Армения	\N	\N	40%	\N	Стекло	0,5л	\N
e2c7a22c-89e9-47b1-9cac-054995fceb76	Арарат 3 года 	ararat307	1999	368db897-f92f-4a93-81df-fa67b92f2f0d	\N	Армения	\N	\N	40%	\N	Стекло	0,7л	\N
600577af-d2da-4303-b66c-1eee67baa529	Арарат 5 лет 	ararat507	2999	368db897-f92f-4a93-81df-fa67b92f2f0d	\N	Армения	\N	\N	40%	\N	Стекло	0.7л	\N
c0b9a04d-1590-411e-9b98-19b34022f233	Shustoff 5 лет 	shustov505	1299	368db897-f92f-4a93-81df-fa67b92f2f0d	1599	Украина	\N	\N	40%	\N	 Стекло	0,5л	\N
a7d6cf0a-51e7-4894-8557-9aa3995207ff	Jägermeister 	jager07	3799	cccf7ea8-e25e-47df-aa9c-5c10c52a7304	4099	Германия	\N	\N	35%	\N	Стекло	0.7л	\N
4461d024-0584-4767-9871-47f5436c2013	Baileys	beylis07	2599	cccf7ea8-e25e-47df-aa9c-5c10c52a7304	\N	Ирландия	\N	\N	17 %	\N	Стекло	0.7л	Lamonica
ddc39aac-3341-45ea-8323-847a62d8aad0	Olmeca silver	olmeka07	3499	4726f1d3-9f05-4568-a24f-b2fc23b56619	3799	Мексика	\N		38%	\N	Стекло	0,7Л	\N
b45553a6-49fd-4644-b0bf-d167ca7eb625	Beefeater	bifiter07	3499	620c2066-8a39-491d-a86e-8f4568dd636a	\N	Великобритания	\N	\N	47%	\N	Стекло	0,7л	\N
47ad6dad-8fcd-43c8-870c-83e9d8c823b3	Havana Club	havana07	2599	cca2137e-695d-4853-89a0-27c6a3167ffd	2899	Куба	\N	\N	37,5 %	\N	Стекло	0,7л	\N
fe983104-296d-4ec0-ab82-1d3512ecec38	Gordon's Gin	gordons07	2999	620c2066-8a39-491d-a86e-8f4568dd636a	\N	Великобритания	\N	\N	43%	\N	Стекло	0,7л	\N
67f769e7-c629-448a-bc3d-a3b7fd66afb4	Bacardi Blanca	bacardi07	2899	cca2137e-695d-4853-89a0-27c6a3167ffd	\N	США	\N		40%	\N	Стекло	0,7л	\N
d16d0631-616c-43a3-8884-ece0d0b8b8dc	Bacardi Blanca	bacardi05	2399	cca2137e-695d-4853-89a0-27c6a3167ffd	\N	США	\N		40%	\N	Стекло	0,5л	\N
742588f2-4514-4aac-8fb7-f5e10f325e4b	Rebarelle красное	rebarelkrsux	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Франция	\N	Сухое	11%	\N	Стекло	0,7л	\N
dc827b63-f7df-433f-b76b-b7402c027195	Firmamento белое	firmamentobelsux	1199	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Испания	\N	Сухое	12%	\N	Стекло	0,7л	\N
bfc239e9-048a-4b82-b07b-8638f01126e9	Rebarelle белое	rebarelbelsux	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Франция	\N	Сухое	11%	\N	Стекло	0,7л	\N
d398675a-efda-40fd-976d-3a67a2742e2d	Firmamento белое	firmamentobelplsi	1199	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Испания	\N	Полусладкое	12%	\N	Стекло	0,7л	\N
beb1e847-2ada-403b-aca5-0a89ff4ba525	Вода Боржоми	borjomi05	159	f52cf384-16de-4b61-9427-1947c5ef7a23	\N	Грузия	Вода	\N	\N	Газированная	Стекло	0,5Л	\N
6acafb65-454b-414a-9069-860aa6e145db	Вода Минеральная	aquasgazom	99	f52cf384-16de-4b61-9427-1947c5ef7a23	\N	Россия	Вода	\N	\N	Газированная	Пэт	0,5Л	\N
92c68a90-b343-4eba-8db8-3496dd2d52ff	Rich Томатный	tomat	239	e27792aa-9c19-49ec-a002-9a750f5b133e	\N	Россия	\N	Томатный			Крафтовый	1Л	\N
f2dd6b24-acf8-4856-b8c1-0bd664d51b55	Rich Мультифрукт	multifrukt	239	e27792aa-9c19-49ec-a002-9a750f5b133e	\N	Россия	\N	Мультифрукт			Крафтовый	1Л	\N
7c55c201-0dc8-4e62-b970-07e8dbe730da	Rich Вишня	cherry	239	e27792aa-9c19-49ec-a002-9a750f5b133e	\N	Россия	\N	Вишня			Крафтовый	1Л	\N
fbc634d6-de42-4337-ab5f-28f20f15ac93	Чипсы Lay's	laysluk	149	0502001e-cc9f-4402-abc7-038a454e1810	\N	США	Снеки	Лук	\N	\N	\N	80 гр	PepsiCo
de722e33-1173-4a9e-993d-d21f4f244bc9	Лыхны красное	lixni	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	1399	Абхазия	\N	Сухое	12%	\N	Стекло	0,7л	\N
e71867ae-8bdf-4679-8b2f-761568791517	Чипсы Lay's 	layskrab	149	0502001e-cc9f-4402-abc7-038a454e1810	\N	США	Снеки	Краб	\N	\N	\N	80 гр	PepsiCo
ebce06af-d0be-4932-a7e8-cedd756e1f9d	Сухарики 3 Корочки	trikorochkisir	59	0502001e-cc9f-4402-abc7-038a454e1810	\N	Россия	Снеки	Семга и сыр	\N	\N	\N	40 гр	PepsiCo
41c5fe2d-a8fd-4832-859a-4032ab579d36	Чипсы Lay's 	layssmetan	149	0502001e-cc9f-4402-abc7-038a454e1810	\N	США	Снеки	Сметана и лук	\N	\N	\N	80 гр	PepsiCo
0f31b142-ec46-492f-90ff-7d2ac26cfc5b	Winston Xstyle Silver	whinstonxsilver	290	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	4 мг	\N	\N	\N	Xstyle Silver
20f28376-43cf-4b12-967e-b5f851b79ac4	Колбаски	kolbasineostrie	189	0502001e-cc9f-4402-abc7-038a454e1810	\N	Россия	Снеки	Сырокопченые	\N	\N	\N	100 гр	PepsiCo
d9486f89-5a94-4d42-acff-125d0525c110	Vogue Menthe	vouge	310	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	 7 мг	\N	\N	\N	
7186c9e3-198d-45b1-bf6c-025a049189b4	Winston blue	whinstonblue	290	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	6 мг	\N	\N	\N	
54da16bf-f670-4e54-8ea6-75ebd6a94990	Чипсы Lay's 	layscheese	149	0502001e-cc9f-4402-abc7-038a454e1810	\N	США	Снеки	Сыр	\N	\N	\N	80 гр	PepsiCo
44b51816-9b32-4525-bae9-8fe47c8adc5d	Parliament Aqua Blue	parliament	350	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	5 мг	\N	\N	\N	Xstyle Silver
e18f31e3-aa06-454d-b97e-1c1d20a5d3dd	Marlboro with button	marlborobutton	270	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	9 мг	\N	\N	\N	
041809f4-f3b3-4a6e-9e05-84a849870b4a	Marlboro red	marlborored	290	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	9 мг	\N	\N	\N	
7994b5c8-abaf-402b-9267-d1bbfb28611f	Kent 4	kent4	290	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	4 мг	\N	\N	\N	
184c0331-ecb3-4b2b-9f14-d4dc6cb4f971	Kent Nano	kentnano4	300	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	4 мг	\N	\N	\N	
74f90cc5-d6bb-43b9-87b5-79a5b9dd4d8d	Esse blue	esseblue	290	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Южная Корея	\N	\N	5 мг	\N	\N	\N	
3e0f85cb-4927-4fda-8898-296b8876e108	Chapman yellow	chapmangold	310	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	6 мг	\N	\N	\N	
42980feb-0050-463e-90d3-6f17fbd3d73b	Chapman red	chapmanred	310	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	6 мг	\N	\N	\N	
711b85fc-fa37-4060-a970-ce6dd96452bc	Chapman brown	chapmanbrown	310	1761cb87-095d-400a-bb88-ef2af0fbe872	\N	Россия	\N	\N	6 мг	\N	\N	\N	
cf5476ed-42b5-4799-844c-f6da722e8ee8	HEETS Синие	heetsblue	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N	Россия	\N	Холод ментола	Легкие	\N	\N	\N	HEETS
db5d7e27-0b53-4423-8e8a-88a1b81f9274	HEETS Золото	heetsgold	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N	Россия	\N	Древесные и ореховые нотки	Средние	\N	\N	\N	HEETS
3541d1b1-d19b-421f-8c02-9517aa855a63	HEETS Зеленые	heetsgreen	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N	Россия	\N	Освежающий ментол	Легкие	\N	\N	\N	HEETS
8150a9f7-0b78-4410-99ec-22c8dbf3b06b	HEETS Голубые	heetstourqoise	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N	Россия	\N	Бархатистый табачный бленд	Легкие	\N	\N	\N	HEETS
9be04172-6fc1-48fa-91d8-61922d4e08bf	Зажигалка Cricket	cricket	139	0aeebff6-247d-4445-b8fd-53548a097aca	\N	Швецария	Презервативы	Без вкуса	\N	\N	\N	1 шт	Cricket
989d21b2-45bf-47ee-9583-2c6fa6c4b192	Жвачка Orbit	orbit	99	0aeebff6-247d-4445-b8fd-53548a097aca	\N	США		Ассорти	\N	\N	\N	1 шт	
f70cce59-f141-4445-8929-d16bee71633d	Од.Стакан	cup	150	0aeebff6-247d-4445-b8fd-53548a097aca	\N	Россия			\N	\N	\N	0,2л - 10 шт	
ff8e0412-3c8a-4333-b013-eb1255a34400	Киндзмараули красное	kindzmarauli	1049	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Грузия	\N	Полусладкое	11,5%	\N	Стекло	0,7л	\N
dfec5f1f-ce64-46ca-94f0-2ff9c2841c4b	Апсны красное	apsni	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	1399	Абхазия	\N	Полусладкое	11%	\N	Стекло	0,7л	\N
5c183b93-cf02-4041-93b1-797705e5e84a	Pinot Grigio белое	pinogridjo	1399	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Италия	\N	Сухое	12%	\N	Стекло	0,7л	\N
b85073b0-1b40-4686-98ab-e044f5a13358	Santucci Toscana 	santtoskkrsux	1699	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Италия	\N	Кр/Сухое	12%	\N	Стекло	0,7л	\N
16afc7ed-47f2-455a-b6ea-7c44a682543d	Firmamento красное	firmamentokrsux	1199	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Испания	\N	Сухое	12%	\N	Стекло	0,7л	\N
7a731f67-7323-406a-af1e-521bb195a12f	Firmamento красное	firmamentokrpls	1199	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Испания	\N	Полусладкое	12%	\N	Стекло	0,7л	\N
65ef7ac1-cfae-4b29-8348-c7d1d89f22bc	Campo delia белое	kampodeliabelsux	1399	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Испания	\N	Сухое	12%	\N	Стекло	0,7л	\N
c05a8e9f-c64c-4951-80a8-a687bc4da2d5	Абрау-Дюрсо белое	abraudursobelpls	849	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N	Россия	\N	Полусладкое	12.5%	\N	Стекло	0,75л	\N
96d7cc45-15a7-4491-aa70-113fd2372ff2	Mondoro Asti	mondoroasti	2049	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N	Италия	\N	Полусладкое	7,5%	\N	Стекло	0,75л	\N
f75c27bf-7fd6-4da0-a6ee-9ce01de1ecc7	Cinzano Prosecco	cinzanoproseko	1949	890b9f91-bbba-4ffa-9c83-702905f41cd6	2249	Италия	\N	Prosecco	11%	\N	Стекло	0,75л	\N
36bfa74b-a2b4-4ecb-beb0-88051572f6be	Atto Primo Prosecco	attoprimoprosekko	1749	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N	Италия	\N	Prosecco	11.5%	\N	Стекло	0,75л	\N
8212b885-3a83-48c1-9ab0-01cb755ee08d	Cinzano	chinzanobyanko	999	7a04ec1c-8c89-4882-95e4-2f8cb32825b0	\N	Италия	\N		18%	\N	Стекло	0,75л	\N
8deeb8a6-0fe2-401d-bc2b-61b207349a59	Atto Primo Asti	attoprimoasti	1749	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N	Италия	\N	Полусладкое	7.5%	\N	Стекло	0,75л	\N
cc933519-d507-4d23-b0ab-dd875ab8523b	Gancia Prosecco	ganchaprosekko	1699	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N	Италия	\N	Prosecco	9%	\N	Стекло	0,75л	\N
8955aba0-ca18-485a-8eb7-bae966ce34a4	Martini Bianco	martinibyanko	2399	7a04ec1c-8c89-4882-95e4-2f8cb32825b0	\N	Италия	\N		15%	\N	Стекло	1,0Л	\N
7bd6c21e-a733-48e7-95bb-88c16c875dba	Martini Bianco	martinibyanko	1349	7a04ec1c-8c89-4882-95e4-2f8cb32825b0	\N	Италия	\N		15%	\N	Стекло	0,5Л	\N
d9b6faa2-36d6-4ea7-84b8-802b4dfac803	Cinzano	chinzanobyanko	1999	7a04ec1c-8c89-4882-95e4-2f8cb32825b0	\N	Италия	\N		18%	\N	Стекло	0,75л	\N
47fc7b20-dc9e-47e4-931f-8a1a1d684c30	BeerKA Фисташки	arexasorti	249	0502001e-cc9f-4402-abc7-038a454e1810	\N	Россия	Снеки	Фисташки с солью	\N	\N	\N	80 гр	PepsiCo
8b72d9ae-426b-4384-a977-33ccc1d4ae57	Хорта	xorta07	1099	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Альфа спирт	\N	40%	\N	Стекло	0.7 л	ООО «Русский Север»
2ccbc847-c94e-4686-95ba-b3dcfa941178	Финляндия	finland07	2199	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Люкс спирт	\N	40%	\N	Стекло	0.7 л	ООО «БИГ»
4b1cac78-21de-4864-a9e6-1171b60d6d20	Русский Стандарт	russstandart07	1149	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Альфа спирт	\N	40%	\N	Стекло	0.7 л	ООО «Русский Стандарт Водка»
5018f7a4-8d54-4f96-8739-de7518cbd616	Зеленая марка	zelenayamarka07	949	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Альфа спирт	\N	40%	\N	Стекло	0.7 л	АО «ЛВЗ «Топаз»
49e4febb-5848-4e25-99df-7b8b95f5a4df	Журавли	juravli	649	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Люкс спирт	\N	40%	\N	Стекло	0.5 л	АО «ЛВЗ «Топаз»
e199f827-ebdb-4065-b500-9aebcd9dfbf2	Беленькая	6414_991516_09.jpg	649	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Альфа спирт	\N	40%	\N	Стекло	0.5 л	ГК «Синергия»»
24ef78e6-f20e-4c55-bd86-93d5427e512c	Hoegaarden	hugarden	169	0da7da58-7b26-4c0f-8986-528534271bf3	\N	Бельгия	\N	\N	4,6%	\N	стекло	0,45л	\N
d3de43b7-25bf-4f8f-a50c-6dab5e25b5df	Bud	bud	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N	Бельгия	\N	\N	4,8%	\N	ж/б	0,45л	\N
2bd1a619-9b97-4cd5-bfde-98323e06012d	William Lawson''s 	william07	2099	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия	\N	\N	40%	\N	Стекло	0,7л	\N
7cdbb4bb-cab8-4c40-a61f-ed41e56984d6	Macallan 	makalan07	10499	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия	\N	\N	40%	\N	Стекло	0,7л	\N
63036c5d-efc5-4b0d-9af6-e8bca8988784	Jim Beam 	jimbeam07	2999	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	США	\N	\N	43%	\N	Стекло	0,7л	\N
fa0f3f17-6bc9-4741-982a-f46ce8ad2a56	Jameson	jameson05	2899	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Ирландия	\N	\N	40%	\N	Стекло	0,5л	\N
bf79385a-9039-4590-a4ec-e5954e4bfb54	Absolut	absolute05	1849	3497daf4-5971-4927-adde-92990381ba8e	\N	Швеция	Люкс спирт	\N	40%	\N	Стекло	0,5Л	Pernod Ricard
5034c6a6-b2d6-412d-98fd-b265393e28f9	Nemiroff медовая	nemiroffmedsper	649	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Люкс спирт	\N	40%	\N	Стекло	0,5Л	ООО "Объединенные пензенские водочные заводы"
e101d017-43c6-4ecd-bec9-f2da04d73854	Nemiroff классик	nemirofforig	649	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Люкс спирт	\N	40%	\N	Стекло	0,5Л	ООО "Объединенные пензенские водочные заводы"
03463360-f0d1-4145-be74-2499e6c5d2f9	Арарат 3 года 	ararat305	1599	368db897-f92f-4a93-81df-fa67b92f2f0d	\N	Армения	\N	\N	40%	\N	Стекло	0,5л	\N
2e13901a-1b3b-48ab-82a9-2cf919e808bb	Sprite	sprite2	249	f52cf384-16de-4b61-9427-1947c5ef7a23	\N	Россия	Вода	\N	\N	Газированная	Пэт	2Л	The Coca-Cola Company
5c09b471-93c1-4db5-9fa5-5e1e9d8a6fd6	Tuborg 	tuborg	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N	Дания	\N	\N	4,6%	\N	ж/б	0,5л	\N
d4b0634a-5236-4385-a51a-72c46574429f	Козел светлая 	kozelsvet	139	0da7da58-7b26-4c0f-8986-528534271bf3	\N	Дания		\N	4,6%	\N	ж/б	0,5л	\N
dbbb0ec5-69b7-4beb-b624-96ef6331a877	Kronenbourg 	kronenburg	169	0da7da58-7b26-4c0f-8986-528534271bf3	\N	Франция	\N	\N	4,8%	\N	ж/б	0,45л	\N
2473fd83-f127-4c7f-9d3f-fbba6712cabc	Evervess	tonnik1	249	f52cf384-16de-4b61-9427-1947c5ef7a23	\N	Россия	Вода	\N	\N	Газированная	Пэт	1Л	PepsiCo
3cd13de4-add3-470d-8833-7a291cba2a27	Rich Грейпфрут	greifrut	239	e27792aa-9c19-49ec-a002-9a750f5b133e	\N	Россия	\N	Грейпфрут			Крафтовый	1Л	\N
9d587edf-66eb-4d2d-be3e-f0cb0fb5d0df	Rich Яблоко	apple	239	e27792aa-9c19-49ec-a002-9a750f5b133e	\N	Россия	\N	Яблоко			Крафтовый	1Л	\N
206d8fc5-f49c-49e4-89a3-59fc934834fa	Чипсы Lay's  Рифленые	laysriflenie	149	0502001e-cc9f-4402-abc7-038a454e1810	\N	США	Снеки	Сметана и лук	\N	\N	\N	80 гр	PepsiCo
89cc6b44-c97d-4564-b57b-1e1408936dbb	Must Have	tabakmastxevasorii	749	abaa09aa-8e15-49d6-b540-db834c24a6eb	\N	Россия	\N	Ассорти	7 мг	\N	\N	25 гр	Must Have
6334316a-f8b7-46e5-8d40-b14ead04c540	Сыр копченый	sir	299	0502001e-cc9f-4402-abc7-038a454e1810	\N	Россия	Снеки	Сыр копченый	\N	\N	\N	100 гр	PepsiCo
9bf77a7e-8a33-4788-8f98-9141d1f04216	Сухарики 3 Корочки	trikorochkixolodec	59	0502001e-cc9f-4402-abc7-038a454e1810	\N	Россия	Снеки	Холодец с хреном	\N	\N	\N	40 гр	PepsiCo
c1aa7783-e766-4665-b5cc-27ca8fa494bd	Колбаски острые	kolbasineostrie	189	0502001e-cc9f-4402-abc7-038a454e1810	\N	Россия	Снеки	Сырокопченые	\N	\N	\N	100 гр	PepsiCo
d495a730-3a6d-4336-a353-ca464260c2de	 Darkside	bd74f83195461f902d32cc09f88fb422.jpg	749	abaa09aa-8e15-49d6-b540-db834c24a6eb	\N	Россия	\N	Ассорти	5-6 мг	\N	\N	30 гр	Darkside
6375b923-8f00-4d2c-a442-f525d76b2955	Darkside	darkside	749	abaa09aa-8e15-49d6-b540-db834c24a6eb	\N	Россия	\N	Ассорти	5-6 мг	\N	\N	25 гр	Darkside
6f126852-2665-4aea-8924-31357c0e14d6	Кальян	kalyan	7499	abaa09aa-8e15-49d6-b540-db834c24a6eb	\N	Россия	\N			\N	\N		
90fd5019-7d36-4718-b259-8c3de4aa5bcb	Blackburn	blackburn	749	abaa09aa-8e15-49d6-b540-db834c24a6eb	\N	Россия	\N	Ассорти	7 мг	\N	\N	25 гр	
ea75c66c-89d0-4f07-9207-7323179ff069	HEETS Фиолетовые	heetspurple	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N	Россия	\N	Аромат лесных ягод	Легкие	\N	\N	\N	HEETS
04877f88-ce42-489e-9330-99f602d54d03	HEETS Оранжевые	heetsamber	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N	Россия	\N	Древесные и ореховые нотки	Легкие	\N	\N	\N	HEETS
e8bd77b6-b71a-4fae-820d-16a5dbbebf8e	HEETS Желтые	heetsyellow	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N	Россия	\N	Цитрусовый аромат с пряными нотками	Легкие	\N	\N	\N	HEETS
b0cc16f0-04b5-4a9b-b989-26d8d627fcce	Lost Mary	202201251028329427_660X660.jpg	2599	65801616-dd4c-43cf-a0c3-ac3663a4e2f8	\N	Китай	Эл.Сигареты	Ассорти	20 мг	\N	\N	6000	\N
ad7c00e3-1142-4e0a-8cc4-daf09da5ece3	Штопор	shtapor	449	0aeebff6-247d-4445-b8fd-53548a097aca	\N	Россия			\N	\N	\N	1 шт	
21e873e5-1afc-4f89-b8bb-147ef0b14150	Царская	carskaya07	1449	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Люкс спирт	\N	40%	\N	Стекло	0.7 л	ООО «ЛАДОГА»
0ba14d4b-62e4-42ac-8a59-2770804da050	Rich Апельсин	orange	239	e27792aa-9c19-49ec-a002-9a750f5b133e	\N	Россия	\N	Апельсин			Крафтовый	1Л	\N
fa36f7a1-597c-4fd1-8c91-d1aa4032dc06	Becherovka	d3a0c7772409810627c76ffede1efc8a.jpg	2649	cccf7ea8-e25e-47df-aa9c-5c10c52a7304	\N	Чехия	\N	\N	38 %	\N	Стекло	0,5Л	Lamonica
c3866f8a-4b59-4ab0-825f-7db2eef5c8e4	Абрау-Дюрсо Brut	abraudursobrut	849	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N	Россия	\N	Брют	12%	\N	Стекло	0,75л	\N
97de3d88-f591-4ca4-9abf-ade71b05be2a	Mondoro Brut	mondobrut	2049	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N	Италия	\N	Брют	7,5%	\N	Стекло	0,75л	\N
5ddbf603-a93f-4f35-816d-5b17509248d2	Вода Минеральная	aquabezgaz	99	f52cf384-16de-4b61-9427-1947c5ef7a23	\N	Россия	Вода	\N	\N	Негазированная	Пэт	0,5Л	PepsiCo
4d28a8e1-3796-444d-aa89-775caf535e8d	Пять Озер	pyatozer07	1099	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Альфа спирт	\N	40%	\N	Стекло	0.7 л	ООО «Алкогольная Сибирская Группа»
d0dcb640-96bb-4472-b332-d08989aaaea0	Chivas Regal 12 	chivas12	5199	dfc6f7e4-3100-4963-8f60-571228e8db77	\N	Шотландия	\N	\N	40%	\N	Стекло	0,7л	\N
24373321-4c28-492e-a935-e2008f898c9c	Старейшина 3 года 	starshina305	1399	368db897-f92f-4a93-81df-fa67b92f2f0d	\N	Россия	\N	\N	40%	\N	Стекло	0,5л	\N
a1cb9709-906d-4841-880f-d01531d7d97f	HEETS Бронза	heetsbronze	300	9390861d-c276-4f9f-a381-df4c91b8b07c	\N	Россия	\N	С легкими нотами какао и сухофруктов	Легкие	\N	\N	\N	HEETS
cd1e3bdf-3981-421b-9726-078e7a3e62ef	Puffmi	199-seo-puffmi-vape.png	2499	65801616-dd4c-43cf-a0c3-ac3663a4e2f8	\N	Китай	Эл.Сигареты	Ассорти	20 мг	\N	\N	4500 	\N
b83dc2c2-4285-494f-9cf6-2c61b8a030d7	Inflave	photo_2022-12-13-14.48.40.jpg	2699	65801616-dd4c-43cf-a0c3-ac3663a4e2f8	\N	Китай	Эл.Сигареты	Ассорти	20 мг	\N	\N	5000	\N
65de2b48-7bb4-4691-a575-f3e6d917a8cf	Презервативы Сontex	condom	699	0aeebff6-247d-4445-b8fd-53548a097aca	\N	Тайланд	Презервативы	Без вкуса	\N	\N	\N	1 упк, 3 шт	Сontex
7af51d3a-5e7c-4a46-9247-ccae0586f597	Кока-кола	kola2	249	f52cf384-16de-4b61-9427-1947c5ef7a23	\N	Россия	Вода	\N	\N	Газированная	Пэт	2Л	\N
f5a7952e-18ca-4c59-b7d2-8b304cc40b01	Polini Самбука	sambuka05	1099	cccf7ea8-e25e-47df-aa9c-5c10c52a7304	\N	Италия	\N	\N	38%	\N	Стекло	0,5Л	Lamonica
b8b43b6d-5c07-43c9-9462-4512cdd61136	Captain Morgan	morgandrunk	2799	cca2137e-695d-4853-89a0-27c6a3167ffd	\N	Ямайка	\N	Пряный	35%	\N	Стекло	0,7л	\N
b7dce0bc-9a96-4027-94d5-0cc9527d117e	Алазанская долина красное	alazdalinakrpls	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Грузия	\N	Полусладкое	12%	\N	Стекло	0,7л	\N
7f62d29d-7133-4226-a389-eb4c4b344d62	Rebarelle белое	rebarelkrpls	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Франция	\N	Сухое	11%	\N	Стекло	0,7л	\N
983e8268-17d8-4daf-9463-0da1ce1d989c	Rebarelle белое	rebarelbelpls	1099	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Франция	\N	Полусладкое	11%	\N	Стекло	0,7л	\N
94dbe032-ddfb-4526-990b-9fdaff41a333	Matevosyan красное	matevosyankrsux	1249	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Армения	\N	Сухое	12%	\N	Стекло	0,7л	\N
e02bfde0-da42-4321-b866-f3e26c4c46ff	Chianti красное	kyanti	1399	18cffe6a-41b8-4c17-b5d7-e1f2f7b91e7c	\N	Кьянти	\N	Сухое	12%	\N	Стекло	0,7л	\N
b977d930-d6a9-4524-9bb9-dd5d7662e9bc	Российское белое	russian	449	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N	Россия	\N	Полусладкое	12.5%	\N	Стекло	0,75л	\N
e3516cc5-70ee-49fb-b599-6cf97d0be8f8	Bosca white	boskabelaya	899	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N	Литва	\N	Полусладкое	7,5%	\N	Стекло	0,75л	\N
9f003502-0d5d-467b-8028-179eb0859fab	Asti Martini	martiniasti	2149	890b9f91-bbba-4ffa-9c83-702905f41cd6	\N	Италия	\N	Полусладкое	7.5%	\N	Стекло	0,75л	\N
7a7511b7-4792-4261-ab92-c9b8e4ae4f19	Martini Fiero	martinifierro.jpg	1799	7a04ec1c-8c89-4882-95e4-2f8cb32825b0	2099	Италия	\N		15%	\N	Стекло	0,5л	\N
2f033d66-3991-44dd-99f0-99b99f078d57	Царская	carskaya05	1110	3497daf4-5971-4927-adde-92990381ba8e	\N	Россия	Люкс спирт	\N	40%	\N	Стекло	0.5 л	ООО «ЛАДОГА»
2464d018-4b01-49a0-92e5-c53996aa8afa	Martini Extra	martiniekstradray	2199	7a04ec1c-8c89-4882-95e4-2f8cb32825b0	\N	Италия	\N		15%	\N	Стекло	0,75л	\N
7cf74afb-cb5a-4430-bd0c-b72490c494fd	Sauza silver	sauzasilver07	3399	4726f1d3-9f05-4568-a24f-b2fc23b56619	\N	Мексика	\N		51%	\N	Стекло	0,7Л	\N
\.


--
-- Name: ip ip_ip_key; Type: CONSTRAINT; Schema: public; Owner: db_admin
--

ALTER TABLE ONLY public.ip
    ADD CONSTRAINT ip_ip_key UNIQUE (ip);


--
-- Name: DATABASE dev_expensive; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE dev_expensive TO dev_expensive_grp;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO dev_expensive_grp;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

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
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

