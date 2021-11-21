--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: abilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.abilities (
    name text NOT NULL,
    description text,
    level integer,
    effect text
);


ALTER TABLE public.abilities OWNER TO postgres;

--
-- Name: areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.areas (
    id integer NOT NULL,
    zone text,
    has_traps boolean
);


ALTER TABLE public.areas OWNER TO postgres;

--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.areas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.areas_id_seq OWNER TO postgres;

--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.areas_id_seq OWNED BY public.areas.id;


--
-- Name: character_inventories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.character_inventories (
    character_name text NOT NULL,
    item_id integer NOT NULL,
    equiped boolean
);


ALTER TABLE public.character_inventories OWNER TO postgres;

--
-- Name: characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.characters (
    name text NOT NULL,
    level integer,
    armor_class integer NOT NULL,
    max_hp integer NOT NULL,
    class text NOT NULL,
    race text NOT NULL,
    is_npc boolean NOT NULL,
    played_by integer
);


ALTER TABLE public.characters OWNER TO postgres;

--
-- Name: class_abilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.class_abilities (
    ability_name text NOT NULL,
    class_name text NOT NULL
);


ALTER TABLE public.class_abilities OWNER TO postgres;

--
-- Name: classes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classes (
    name text NOT NULL,
    description text
);


ALTER TABLE public.classes OWNER TO postgres;

--
-- Name: encounters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.encounters (
    id integer NOT NULL,
    area_id integer
);


ALTER TABLE public.encounters OWNER TO postgres;

--
-- Name: encounters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.encounters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encounters_id_seq OWNER TO postgres;

--
-- Name: encounters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.encounters_id_seq OWNED BY public.encounters.id;


--
-- Name: enemies_in_encounter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enemies_in_encounter (
    encounter_id integer NOT NULL,
    mob_id integer NOT NULL
);


ALTER TABLE public.enemies_in_encounter OWNER TO postgres;

--
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id integer NOT NULL,
    name text,
    description text NOT NULL,
    value integer
);


ALTER TABLE public.items OWNER TO postgres;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO postgres;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: loot_from_encounter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loot_from_encounter (
    encounter_id integer NOT NULL,
    loot_id integer NOT NULL
);


ALTER TABLE public.loot_from_encounter OWNER TO postgres;

--
-- Name: mobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mobs (
    id integer NOT NULL,
    name text,
    level integer,
    armor_class integer NOT NULL,
    max_hp integer NOT NULL,
    class text NOT NULL,
    race text NOT NULL
);


ALTER TABLE public.mobs OWNER TO postgres;

--
-- Name: mobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mobs_id_seq OWNER TO postgres;

--
-- Name: mobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mobs_id_seq OWNED BY public.mobs.id;


--
-- Name: races; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.races (
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.races OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    email text,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: areas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas ALTER COLUMN id SET DEFAULT nextval('public.areas_id_seq'::regclass);


--
-- Name: encounters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.encounters ALTER COLUMN id SET DEFAULT nextval('public.encounters_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: mobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mobs ALTER COLUMN id SET DEFAULT nextval('public.mobs_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: abilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.abilities (name, description, level, effect) FROM stdin;
\.


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.areas (id, zone, has_traps) FROM stdin;
\.


--
-- Data for Name: character_inventories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.character_inventories (character_name, item_id, equiped) FROM stdin;
\.


--
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.characters (name, level, armor_class, max_hp, class, race, is_npc, played_by) FROM stdin;
\.


--
-- Data for Name: class_abilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.class_abilities (ability_name, class_name) FROM stdin;
\.


--
-- Data for Name: classes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classes (name, description) FROM stdin;
\.


--
-- Data for Name: encounters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.encounters (id, area_id) FROM stdin;
\.


--
-- Data for Name: enemies_in_encounter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enemies_in_encounter (encounter_id, mob_id) FROM stdin;
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, name, description, value) FROM stdin;
\.


--
-- Data for Name: loot_from_encounter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loot_from_encounter (encounter_id, loot_id) FROM stdin;
\.


--
-- Data for Name: mobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mobs (id, name, level, armor_class, max_hp, class, race) FROM stdin;
\.


--
-- Data for Name: races; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.races (name, description) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password) FROM stdin;
\.


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.areas_id_seq', 1, false);


--
-- Name: encounters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.encounters_id_seq', 1, false);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_seq', 1, false);


--
-- Name: mobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mobs_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: abilities abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abilities
    ADD CONSTRAINT abilities_pkey PRIMARY KEY (name);


--
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: areas areas_zone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_zone_key UNIQUE (zone);


--
-- Name: character_inventories character_inventories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_inventories
    ADD CONSTRAINT character_inventories_pkey PRIMARY KEY (character_name, item_id);


--
-- Name: characters characters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (name);


--
-- Name: class_abilities class_abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class_abilities
    ADD CONSTRAINT class_abilities_pkey PRIMARY KEY (ability_name, class_name);


--
-- Name: classes classes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (name);


--
-- Name: encounters encounters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.encounters
    ADD CONSTRAINT encounters_pkey PRIMARY KEY (id);


--
-- Name: enemies_in_encounter enemies_in_encounter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enemies_in_encounter
    ADD CONSTRAINT enemies_in_encounter_pkey PRIMARY KEY (encounter_id, mob_id);


--
-- Name: items items_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_name_key UNIQUE (name);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: loot_from_encounter loot_from_encounter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loot_from_encounter
    ADD CONSTRAINT loot_from_encounter_pkey PRIMARY KEY (encounter_id, loot_id);


--
-- Name: mobs mobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mobs
    ADD CONSTRAINT mobs_pkey PRIMARY KEY (id);


--
-- Name: races races_description_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.races
    ADD CONSTRAINT races_description_key UNIQUE (description);


--
-- Name: races races_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.races
    ADD CONSTRAINT races_pkey PRIMARY KEY (name);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: character_inventories fk_character_inventories_characters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_inventories
    ADD CONSTRAINT fk_character_inventories_characters FOREIGN KEY (character_name) REFERENCES public.characters(name);


--
-- Name: character_inventories fk_character_inventories_items; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_inventories
    ADD CONSTRAINT fk_character_inventories_items FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: characters fk_characters_classes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT fk_characters_classes FOREIGN KEY (class) REFERENCES public.classes(name);


--
-- Name: characters fk_characters_races; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT fk_characters_races FOREIGN KEY (race) REFERENCES public.races(name);


--
-- Name: characters fk_characters_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT fk_characters_users FOREIGN KEY (played_by) REFERENCES public.users(id);


--
-- Name: class_abilities fk_class_abilities_abilities; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class_abilities
    ADD CONSTRAINT fk_class_abilities_abilities FOREIGN KEY (ability_name) REFERENCES public.abilities(name);


--
-- Name: class_abilities fk_class_abilities_classes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class_abilities
    ADD CONSTRAINT fk_class_abilities_classes FOREIGN KEY (class_name) REFERENCES public.classes(name);


--
-- Name: encounters fk_encounters_areas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.encounters
    ADD CONSTRAINT fk_encounters_areas FOREIGN KEY (area_id) REFERENCES public.areas(id);


--
-- Name: enemies_in_encounter fk_enemies_in_encounter_encounters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enemies_in_encounter
    ADD CONSTRAINT fk_enemies_in_encounter_encounters FOREIGN KEY (encounter_id) REFERENCES public.encounters(id);


--
-- Name: enemies_in_encounter fk_enemies_in_encounter_mobs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enemies_in_encounter
    ADD CONSTRAINT fk_enemies_in_encounter_mobs FOREIGN KEY (mob_id) REFERENCES public.mobs(id);


--
-- Name: loot_from_encounter fk_loot_from_encounter_encounters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loot_from_encounter
    ADD CONSTRAINT fk_loot_from_encounter_encounters FOREIGN KEY (encounter_id) REFERENCES public.encounters(id);


--
-- Name: loot_from_encounter fk_loot_from_encounter_items; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loot_from_encounter
    ADD CONSTRAINT fk_loot_from_encounter_items FOREIGN KEY (loot_id) REFERENCES public.items(id);


--
-- Name: mobs fk_mobs_classes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mobs
    ADD CONSTRAINT fk_mobs_classes FOREIGN KEY (class) REFERENCES public.classes(name);


--
-- Name: mobs fk_mobs_races; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mobs
    ADD CONSTRAINT fk_mobs_races FOREIGN KEY (race) REFERENCES public.races(name);


--
-- PostgreSQL database dump complete
--

