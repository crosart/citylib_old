--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.2

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
-- Name: citylib_db; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA citylib_db;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: books; Type: TABLE; Schema: citylib_db; Owner: -
--

CREATE TABLE citylib_db.books (
    id bigint NOT NULL,
    isbn character varying(13) NOT NULL,
    title text NOT NULL,
    author text NOT NULL,
    editor text,
    year character varying(4) NOT NULL,
    summary text,
    quantity integer NOT NULL,
    image text,
    genre text
);


--
-- Name: books_id_seq; Type: SEQUENCE; Schema: citylib_db; Owner: -
--

CREATE SEQUENCE citylib_db.books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: citylib_db; Owner: -
--

ALTER SEQUENCE citylib_db.books_id_seq OWNED BY citylib_db.books.id;


--
-- Name: loans; Type: TABLE; Schema: citylib_db; Owner: -
--

CREATE TABLE citylib_db.loans (
    id bigint NOT NULL,
    book_id bigint NOT NULL,
    user_id bigint NOT NULL,
    due date NOT NULL,
    returned boolean DEFAULT false NOT NULL,
    extended boolean DEFAULT false NOT NULL
);


--
-- Name: loans_id_seq; Type: SEQUENCE; Schema: citylib_db; Owner: -
--

CREATE SEQUENCE citylib_db.loans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: loans_id_seq; Type: SEQUENCE OWNED BY; Schema: citylib_db; Owner: -
--

ALTER SEQUENCE citylib_db.loans_id_seq OWNED BY citylib_db.loans.id;


--
-- Name: roles; Type: TABLE; Schema: citylib_db; Owner: -
--

CREATE TABLE citylib_db.roles (
    id bigint NOT NULL,
    name text NOT NULL,
    def boolean DEFAULT false NOT NULL
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: citylib_db; Owner: -
--

CREATE SEQUENCE citylib_db.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: citylib_db; Owner: -
--

ALTER SEQUENCE citylib_db.roles_id_seq OWNED BY citylib_db.roles.id;


--
-- Name: users; Type: TABLE; Schema: citylib_db; Owner: -
--

CREATE TABLE citylib_db.users (
    id bigint NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    username text NOT NULL,
    enabled boolean DEFAULT false
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: citylib_db; Owner: -
--

CREATE SEQUENCE citylib_db.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: citylib_db; Owner: -
--

ALTER SEQUENCE citylib_db.users_id_seq OWNED BY citylib_db.users.id;


--
-- Name: users_roles; Type: TABLE; Schema: citylib_db; Owner: -
--

CREATE TABLE citylib_db.users_roles (
    role_id bigint NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: books id; Type: DEFAULT; Schema: citylib_db; Owner: -
--

ALTER TABLE ONLY citylib_db.books ALTER COLUMN id SET DEFAULT nextval('citylib_db.books_id_seq'::regclass);


--
-- Name: loans id; Type: DEFAULT; Schema: citylib_db; Owner: -
--

ALTER TABLE ONLY citylib_db.loans ALTER COLUMN id SET DEFAULT nextval('citylib_db.loans_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: citylib_db; Owner: -
--

ALTER TABLE ONLY citylib_db.roles ALTER COLUMN id SET DEFAULT nextval('citylib_db.roles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: citylib_db; Owner: -
--

ALTER TABLE ONLY citylib_db.users ALTER COLUMN id SET DEFAULT nextval('citylib_db.users_id_seq'::regclass);


--
-- Data for Name: books; Type: TABLE DATA; Schema: citylib_db; Owner: -
--

COPY citylib_db.books (id, isbn, title, author, editor, year, summary, quantity, image, genre) FROM stdin;
8	9782012318175	Le grand cours de cuisine Ferrandi	Ecole Ferrandi	Hachette	2014	L'??cole Ferrandi de Paris est la r??f??rence mondiale pour l'apprentissage de la gastronomie. Ses professeurs se sont r??unis pour d??voiler les techniques des grands chefs au service des amateurs de cuisine.	1	https://static.fnac-static.com/multimedia/Images/FR/NR/d6/84/5e/6194390/1507-1/tsp20141003100337/Le-grand-cours-de-cuisine-Ferrandi.jpg	Beau livre
5	9781032401492	L'art de Horizon Zero Dawn	Paul Davies	404 Editions	2017	D??couvrez toutes les planches pr??paratoires de ce jeu enchanteur produit par Guerrilla Games. Ce livre regroupe plus de 300 images, croquis, conceptions et commentaires des cr??ateurs et des artistes. Tout l???art du nouveau jeu ?? succ??s, Horizon Zero Dawn, en un livre !	1	https://static.fnac-static.com/multimedia/Images/FR/NR/68/ff/86/8847208/1507-1/tsp20170914094318/Horizon-Zero-Dawn.jpg	Guide
12	9782070584628	Harry Potter T1 - Harry Potter ?? l'??cole des sorciers	J.K. Rowling	Gallimard Jeunesse	2017	Harry Potter est un gar??on ordinaire. Mais le jour de ses onze ans, son existence bascule : un g??ant vient le chercher pour l'emmener dans une ??cole de sorciers. Quel myst??re entoure donc sa naissance et qui est l'effroyable V..., le mage dont personne n'ose prononcer le nom ? Voler ?? cheval sur des balais, jeter des sorts, combattre les Trolls : Harry Potter se r??v??le un sorcier vraiment dou??. Quand il d??cide, avec ses amis, d'explorer les moindres recoins de son ??cole, il va se trouver entra??n?? dans d'extraordinaires aventures.	5	https://static.fnac-static.com/multimedia/Images/FR/NR/ba/d8/1d/1956026/1507-1/tsp20200301071729/Harry-Potter-I-Harry-Potter-a-l-ecole-des-sorciers.jpg	Roman junior
15	9782312035505	Eau de source	Ga??lle Collet	Les ??ditions du Net	2015	Apr??s deux deuils cons??cutifs, la narratrice part le temps d???un cong?? maladie, aux sources de la Rance, pays de ses origines.\r\n\r\nL??, les rencontres s???encha??nent, les indices s???accumulent et les ??nigmes se succ??dent. R??cit polyphonique, ce voyage singulier dans l???espace et dans le temps m??le le conte, les confessions, le journal intime, l???enqu??te ...	4	https://static.fnac-static.com/multimedia/Images/FR/MC/6b/80/46/38174827/1507-1/tsp20190419231032/Eau-de-source.jpg#80dc45a5-0ba7-4ac4-b326-6b793649e645	Roman
9	9782702165546	La vie est un roman	Guillaume Musso	Calmann-Levy	2020	?? Un jour d???avril, ma fille de trois ans, Carrie, a disparu alors que nous jouions toutes les deux ?? cache-cache dans mon appartement de Brooklyn. ??\r\n \r\nAinsi d??bute le r??cit de Flora Conway, romanci??re renomm??e ?? la discr??tion l??gendaire. La disparition de Carrie n???a aucune explication. La porte et les fen??tres de l???appartement ??taient closes, les cam??ras de ce vieil immeuble new-yorkais ne montrent pas d???intrusion. L???enqu??te de police n???a rien donn??.\r\n\r\nAu m??me moment, de l???autre c??t?? de l???Atlantique, un ??crivain au c??ur broy?? se terre dans une maison d??labr??e.\r\nLui seul d??tient la cl?? du myst??re. Et Flora va le d??busquer.	2	https://static.fnac-static.com/multimedia/Images/FR/NR/d4/89/b3/11766228/1507-1/tsp20200511070223/La-vie-est-un-roman.jpg	Roman
14	9782253241539	Octobre	S??ren Sveistrup	LGF	2020	D??but octobre, dans la banlieue de Copenhague, la police d??couvre le cadavre d'une femme amput??e d'une main. ?? c??t?? du corps, un petit bonhomme fabriqu?? ?? partir de marrons et d'allumettes. Charg??s de l'enqu??te, la jeune inspectrice Naia Thulin et l'inspecteur Mark Hess d??couvrent que cette figurine est porteuse de myst??rieuses empreintes : celles de la fille de Rosa Hartung, ministre des Affaires sociales, enlev??e un an plus t??t et pr??sum??e morte.\r\nThulin et Hess explorent toutes les pistes qui leur r??v??leraient un lien entre la disparition de la fille de la ministre et la victime ?? la main coup??e. Lorsqu'une autre femme est tu??e, selon le m??me mode op??ratoire, ils comprennent que le cauchemar ne fait que commencer...\r\n\r\nQuand le cr??ateur de la g??niale s??rie t??l?? danoise ?? The Killing ?? prend la plume, ??a d??coiffe ! Nuits blanches assur??es. Le Parisien.\r\n\r\nUn thriller aussi sensible que finement ma??tris??, une profondeur ?? nulle autre pareille. La Vie.	2	https://static.fnac-static.com/multimedia/Images/FR/NR/87/5b/b1/11623303/1507-1/tsp20200407070146/Octobre.jpg	Roman
11	9791032102381	L'??nigme de la chambre 622	Jo??l Dicker	De Fallois Eds	2020	Une nuit de d??cembre, un meurtre a lieu au Palace de Verbier, dans les Alpes suisses. L???enqu??te de police n???aboutira jamais.\r\nDes ann??es plus tard, au d??but de l?????t?? 2018, lorsqu???un ??crivain se rend dans ce m??me h??tel pour y passer des vacances, il est loin d???imaginer qu???il va se retrouver plong?? dans cette affaire.\r\nQue s???est-il pass?? dans la chambre 622 du Palace de Verbier ?	2	https://static.fnac-static.com/multimedia/Images/FR/NR/80/ad/b1/11644288/1507-1/tsp20200507070828/L-Enigme-de-la-Chambre-622.jpg	Roman
10	9782253238027	Changer l'eau des fleurs	Val??rie Perrin	LGF	2019	Voil?? une histoire aussi po??tique qu???hilarante qui nous emm??ne dans un lieu pour le moins atypique : un cimeti??re situ?? au fin fond de la Bourgogne. Sur place, une certaine Violette Toussaint tient une loge o?? les gens de passage et les amis viennent raconter leurs petits secrets. Avec Changer l???eau des fleurs - qui sort en format poche -, la talentueuse Val??rie Perrin a rencontr?? un succ??s m??rit??. Sa plume sensible, r??aliste et intimiste donne la parole aux ?? invisibles ??, ces gens simples qui souffrent en silence.	4	https://static.fnac-static.com/multimedia/Images/FR/NR/de/a8/a7/10987742/1507-1/tsp20191212070423/Changer-l-eau-des-fleurs.jpg	Roman
7	9782412046630	Java pour les nuls	Barry Burd	First Interactive	2019	Id??al pour commencer avec Java comme premier langage !\r\nGr??ce ?? ce livre, vous allez rapidement ??crire rapidement vos premi??res applets Java, sans pour autant devenir un gourou de la programmation objet. Rassurez-vous, on ne vous assommera pas avec toutes les subtilit??s du langage Java, mais vous poss??derez rapidement les bases n??cessaires pour utiliser la panoplie d'outils du parfait programmeur Java.\r\nCette nouvelle ??dition a ??t?? entirement mise ?? jour avec les sp??cifications de la derni??re version du SDK Java. Int??gre les nouveaut??s apport??es par Java 8.	2	https://static.fnac-static.com/multimedia/Images/FR/NR/85/14/a8/11015301/1507-1/tsp20190625175059/Java-4eme-Pour-les-Nuls.jpg	Manuel
6	9782212133981	Design ??motionnel	Aarron Walter	Eyrolles	2011	Engagez ??motionnellement les visiteurs de votre site Web en leur offrant une exp??rience positive gr??ce aux pr??ceptes ??nonc??s dans ce petit et brillant ouvrage ??crit par le designer sp??cialiste en exp??rience utilisateur, Aarron Walter.\r\n\r\nDe la psychologie classique aux ??tudes de cas, des concepts pouss??s au bon sens le plus simple, Design ??motionnel d??crit des strat??gies et des m??thodes accessibles pour vous aider ?? donner une dimension humaine ?? vos designs.	1	https://static.fnac-static.com/multimedia/Images/FR/NR/f8/15/35/3479032/1507-1/tsp20200210071809/Design-emotionnel.jpg	Manuel
2	9782746065093	Apache Maven	Maxime Gr??au	Eni Editions	2011	Ce livre sur Apache Maven 3, s'adresse ?? tout d??veloppeur amen?? ?? travailler sur des projets Java de taille cons??quente. Il sert ??galement de guide pour les architectes qui souhaitent mettre en ouvre Apache Maven 3 sur un nouveau projet ou sur un projet existant. Apache Maven, cr???? il y a tout juste 10 ans, tient aujourd'hui une place centrale dans l'??cosyst??me du d??veloppement logiciel sur la plate-forme Java EE. La version 3 est le fruit d'un travail cons??quent de la communaut??, riche de nombreux retours d'exp??rience. Du d??veloppeur Java d??butant ?? l'architecte technique, chaque lecteur trouvera dans cet ouvrage des informations claires et pr??cises, illustr??es par de nombreux sch??mas, pour aborder avec s??r??nit?? la d??couverte d'Apache Maven, jusqu'?? sa gestion au sein d'une infrastructure projet. L'explication des origines d'Apache Maven dans le premier chapitre permet de mieux appr??hender l'importance strat??gique de sa mise en ouvre sur des projets Java EE. Le deuxi??me chapitre permet une premi??re approche de la philosophie g??n??rale autour de la notion de cycle de vie des projets Maven. Le troisi??me chapitre se focalise sur l'organisation et les relations entre projets gr??ce ?? la gestion des graphes de d??pendances, c'est dans le quatri??me chapitre que le lecteur trouvera les informations sur l'??tendue des possibilit??s qu'offre Apache Maven gr??ce ?? la mise en ouvre de plugins associ??s ?? des profils. Tout au long du cinqui??me chapitre, la mise en place compl??te d'une infrastructure autour d'Apache Maven sur un projet professionnel Java est d??taill??e : l'environnement de d??veloppement, la mise en place de tests, la gestion des r??f??rentiels, l'int??gration continue et le processus de releases pour la livraison du projet. Le sixi??me et dernier chapitre de cet ouvrage traite de la g??n??ration de rapports Web complets pour la mesure de la qualit?? des projets Java. Tout au long du livre l'auteur s'appuie sur une application concr??te pour illustrer ses propos. Son code source est en t??l??chargement sur www.editions-eni.fr.	1	https://static.fnac-static.com/multimedia/FR/images_produits/FR/Fnac.com/ZoomPE/3/9/0/9782746065093/tsp20130903150426/Apache-maven.jpg	Manuel
4	9782012101418	Ast??rix T9 - Ast??rix et les Normands	Ren?? Goscinny & Albert Uderzo	Hachette	2005	Les terribles normands d??barquent en territoire gaulois ! Seul l'adolescent Goudurix, venu de la capitale passer ses vacances chez son oncle Abraracourcix, semble pris de panique face ?? cette invasion. Ces terrifiants guerriers vont-ils go??ter ?? ce mysterieux sentiment qu'ils sont si curieux de d??couvrir : la peur...?	2	https://static.fnac-static.com/multimedia/FR/images_produits/FR/Fnac.com/ZoomPE/8/1/4/9782012101418/tsp20130828103933/Asterix-et-les-Normands.jpg	Bande dessin??e
1	9782266260770	Hunger Games T1 - Hunger Games	Suzanne Collins	Pocket Jeunesse	2015	Dans un futur sombre, sur les ruines des ??tats-Unis, un jeu t??l??vis?? est cr???? pour contr??ler le peuple par la terreur.\r\nDouze gar??ons et douze filles tir??s au sort participent ?? cette sinistre t??l??r??alit??, que tout le monde est forc?? de regarder en direct. Une seule r??gle dans l'ar??ne : survivre, ?? tout prix.\r\nQuand sa petite soeur est appel??e pour participer aux Hunger Games, Katniss n'h??site pas une seconde. Elle prend sa place, consciente du danger. ?? seize ans, Katniss a d??j?? ??t?? confront??e plusieurs fois ?? la mort. Chez elle, survivre est comme une seconde nature.	3	https://static.fnac-static.com/multimedia/Images/FR/NR/f4/7b/66/6716404/1507-1/tsp20150323105819/Hunger-games.jpg	Roman adolescent
13	9782344020630	La bombe	Alcante & Laurent-Fr??d??ric Boll??e	Gl??nat	2020	L???incroyable histoire vraie de l???arme la plus effroyable jamais cr????e.\r\n\r\nLe 6 ao??t 1945, une bombe atomique ravage Hiroshima. Des dizaines de milliers de personnes sont instantan??ment pulv??ris??es. Et le monde entier d??couvre, horrifi??, l???existence de la bombe atomique, premi??re arme de destruction massive. Mais dans quel contexte, comment et par qui cet instrument de mort a-t-il pu ??tre d??velopp?? ?\r\n\r\nV??ritable saga de 450 pages, ce roman graphique raconte les coulisses et les personnages-cl??s de cet ??v??nement historique qui, en 2020, comm??more son 75e anniversaire. Des mines d???uranium du Katanga jusqu???au Japon, en passant par l???Allemagne, la Norv??ge, l???URSS et le Nouveau-Mexique, c???est une succession de faits incroyables mais vrais qui se sont ainsi d??roul??s.\r\n\r\nTous ceux-ci sont ici racont??s ?? hauteur d???hommes : qu???ils soient d??cideurs politiques (Roosevelt, Truman), scientifiques pass??s ?? la post??rit?? (Einstein, Oppenheimer, Fermi...) ou acteurs majeurs demeur??s m??connus, tels Le?? Szil??rd (le personnage principal de cet album, un scientifique qui remua ciel et terre pour que les USA d??veloppent la bombe, puis fit l???impossible pour qu???ils ne l???utilisent jamais), Ebb Cade (un ouvrier afro-am??ricain auquel on injecta ?? son insu du plutonium pour en ??tudier l???effet sur la sant??) ou Leslie Groves (le g??n??ral qui dirigea d???une main de fer le Projet Manhattan) ??? sans oublier, bien s??r, les habitants et la ville d???Hiroshima, reconstitu??e dans La Bombe de mani??re authentique.\r\n\r\nExtr??mement document?? mais avant tout passionnant, comparable en cela ?? la s??rie TV Chernobyl, cet ouvrage s???impose d??j?? comme le livre de r??f??rence sur l???histoire de la bombe atomique.	1	https://static.fnac-static.com/multimedia/Images/FR/NR/76/74/ae/11433078/1507-1/tsp20200310070818/La-Bombe.jpg	Bande dessin??e
\.


--
-- Data for Name: loans; Type: TABLE DATA; Schema: citylib_db; Owner: -
--

COPY citylib_db.loans (id, book_id, user_id, due, returned, extended) FROM stdin;
3	12	10	2020-06-09	f	t
7	4	10	2020-05-13	t	f
4	8	10	2020-06-15	f	t
5	11	10	2020-05-14	f	t
6	5	10	2020-05-30	f	f
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: citylib_db; Owner: -
--

COPY citylib_db.roles (id, name, def) FROM stdin;
1	ROLE_ADMIN	f
3	ROLE_MANAGER	f
2	ROLE_USER	t
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: citylib_db; Owner: -
--

COPY citylib_db.users (id, email, password, username, enabled) FROM stdin;
10	user@gmail.com	$2a$10$oXlmhZ5lEpJllgXU7N6hOOCfrz3P97RhSjfiQXCx4JkkInCX2U7Lq	user	f
11	user2@gmail.com	$2a$10$x.v5retpPJNWjp.8u9Ng8.eyh.QPFObhJ13FNqGlcRKzPTVF0XUTK	user2	f
14	antoine.citylib@yopmail.com	$2a$10$5G3mhz7vsU/DJdD9YrRHrOJgrZSGdf.pCrth1K418ifDtj63h9taS	antoine.citylib	f
\.


--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: citylib_db; Owner: -
--

COPY citylib_db.users_roles (role_id, user_id) FROM stdin;
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: citylib_db; Owner: -
--

SELECT pg_catalog.setval('citylib_db.books_id_seq', 15, true);


--
-- Name: loans_id_seq; Type: SEQUENCE SET; Schema: citylib_db; Owner: -
--

SELECT pg_catalog.setval('citylib_db.loans_id_seq', 7, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: citylib_db; Owner: -
--

SELECT pg_catalog.setval('citylib_db.roles_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: citylib_db; Owner: -
--

SELECT pg_catalog.setval('citylib_db.users_id_seq', 14, true);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: citylib_db; Owner: -
--

ALTER TABLE ONLY citylib_db.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: loans loans_pkey; Type: CONSTRAINT; Schema: citylib_db; Owner: -
--

ALTER TABLE ONLY citylib_db.loans
    ADD CONSTRAINT loans_pkey PRIMARY KEY (id);


--
-- Name: roles roles_idx_name; Type: CONSTRAINT; Schema: citylib_db; Owner: -
--

ALTER TABLE ONLY citylib_db.roles
    ADD CONSTRAINT roles_idx_name UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: citylib_db; Owner: -
--

ALTER TABLE ONLY citylib_db.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: citylib_db; Owner: -
--

ALTER TABLE ONLY citylib_db.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: loans book_id_fk; Type: FK CONSTRAINT; Schema: citylib_db; Owner: -
--

ALTER TABLE ONLY citylib_db.loans
    ADD CONSTRAINT book_id_fk FOREIGN KEY (book_id) REFERENCES citylib_db.books(id);


--
-- Name: users_roles role_id_fk; Type: FK CONSTRAINT; Schema: citylib_db; Owner: -
--

ALTER TABLE ONLY citylib_db.users_roles
    ADD CONSTRAINT role_id_fk FOREIGN KEY (role_id) REFERENCES citylib_db.roles(id);


--
-- Name: loans user_id_fk; Type: FK CONSTRAINT; Schema: citylib_db; Owner: -
--

ALTER TABLE ONLY citylib_db.loans
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES citylib_db.users(id);


--
-- Name: users_roles user_id_fk; Type: FK CONSTRAINT; Schema: citylib_db; Owner: -
--

ALTER TABLE ONLY citylib_db.users_roles
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES citylib_db.users(id);


--
-- PostgreSQL database dump complete
--

