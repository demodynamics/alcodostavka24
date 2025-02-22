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
-- PostgreSQL database dump complete
--

