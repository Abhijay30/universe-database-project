--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size integer NOT NULL,
    type character varying(30),
    distance_from_earth numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    radius integer,
    discovered_by character varying(50)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size integer,
    distance_from_earth numeric,
    has_life boolean,
    star_id integer,
    disp text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    species_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.species_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_species_id_seq OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.species_species_id_seq OWNED BY public.species.species_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size integer,
    has_life boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: species species_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species ALTER COLUMN species_id SET DEFAULT nextval('public.species_species_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 'Spiral', 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 120000, 'Spiral', 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 'Spiral', 3000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 90000, 'Spiral', 23000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 70000, 'Elliptical', 29000000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 85000, 'Spiral', 21000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (17, 'Eywa', 9, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Vitraya', 9, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Yoda’s Retreat', 10, NULL, NULL);
INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737, 'Humans');
INSERT INTO public.moon VALUES (2, 'Luna Base Alpha', 1, 850, 'Humans');
INSERT INTO public.moon VALUES (3, 'Phobos', 2, 11, 'Asaph Hall');
INSERT INTO public.moon VALUES (4, 'Deimos', 2, 6, 'Asaph Hall');
INSERT INTO public.moon VALUES (5, 'Kepler Moon 1', 3, 900, 'Kepler Telescope');
INSERT INTO public.moon VALUES (6, 'Kepler Moon 2', 3, 880, 'Kepler Telescope');
INSERT INTO public.moon VALUES (7, 'Proxima Minor', 4, 720, 'Proxima Mission AI');
INSERT INTO public.moon VALUES (8, 'Proxima Shadow', 4, 690, 'Proxima Mission AI');
INSERT INTO public.moon VALUES (9, 'Surak', 5, 1000, 'Vulcan Science Directorate');
INSERT INTO public.moon VALUES (10, 'T''Khasi', 5, 970, 'Vulcan Science Directorate');
INSERT INTO public.moon VALUES (11, 'Remains', 6, 500, 'Alderaan Research Council');
INSERT INTO public.moon VALUES (12, 'Echo Rock', 6, 520, 'Alderaan Research Council');
INSERT INTO public.moon VALUES (13, 'Argo', 7, 610, 'Kryptonian Astronomers');
INSERT INTO public.moon VALUES (14, 'Daxam', 7, 580, 'Kryptonian Astronomers');
INSERT INTO public.moon VALUES (15, 'Jundland', 8, 770, 'Tatooine Skywatchers');
INSERT INTO public.moon VALUES (16, 'Anchorite', 8, 730, 'Tatooine Skywatchers');
INSERT INTO public.moon VALUES (20, 'Swampmist', 10, 590, 'Dagobah Explorers');
INSERT INTO public.moon VALUES (21, 'Guru’s Watch', 11, 870, 'Namekian Elders');
INSERT INTO public.moon VALUES (22, 'Dragonhold', 11, 890, 'Namekian Elders');
INSERT INTO public.moon VALUES (23, 'Orbitron', 12, 1100, 'Cybertronian Probes');
INSERT INTO public.moon VALUES (24, 'Energon Cradle', 12, 1080, 'Cybertronian Probes');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 12742, 0, true, 1, 'Only known planet with life');
INSERT INTO public.planet VALUES (2, 'Mars', 6779, 0.0006, false, 1, 'Red planet, possible past water');
INSERT INTO public.planet VALUES (3, 'Kepler-452b', 14000, 1400, false, 2, 'Exoplanet similar to Earth');
INSERT INTO public.planet VALUES (4, 'Proxima b', 11400, 4.24, false, 5, 'Closest known exoplanet');
INSERT INTO public.planet VALUES (5, 'Vulcan', 9500, 16, false, 2, 'Fictional planet from Star Trek');
INSERT INTO public.planet VALUES (6, 'Alderaan', 12500, 500, false, 3, 'Destroyed in Star Wars');
INSERT INTO public.planet VALUES (7, 'Krypton', 13000, 600, false, 3, 'Home planet of Superman');
INSERT INTO public.planet VALUES (8, 'Tatooine', 10400, 500, false, 4, 'Desert planet with twin suns');
INSERT INTO public.planet VALUES (9, 'Pandora', 10200, 4.4, true, 5, 'Habitable moon in Avatar');
INSERT INTO public.planet VALUES (10, 'Dagobah', 10100, 490, true, 4, 'Swampy remote planet');
INSERT INTO public.planet VALUES (11, 'Namek', 12000, 250, true, 6, 'Planet from Dragon Ball');
INSERT INTO public.planet VALUES (12, 'Cybertron', 14000, 1000, false, 6, 'Mechanical planet, Transformers');


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES (1, 'Humans', 1);
INSERT INTO public.species VALUES (2, 'Martians', 2);
INSERT INTO public.species VALUES (3, 'Keplarians', 3);
INSERT INTO public.species VALUES (4, 'Proxians', 4);
INSERT INTO public.species VALUES (5, 'Vulcans', 5);
INSERT INTO public.species VALUES (6, 'Alderaanians', 6);
INSERT INTO public.species VALUES (7, 'Kryptonians', 7);
INSERT INTO public.species VALUES (8, 'Na\''vi', 9);
INSERT INTO public.species VALUES (9, 'Namekians', 11);
INSERT INTO public.species VALUES (10, 'Cybertronians', 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1392000, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 1700000, false, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 887000000, false, 3);
INSERT INTO public.star VALUES (4, 'Rigel', 78000000, false, 4);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 200000, false, 1);
INSERT INTO public.star VALUES (6, 'Vega', 2400000, false, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: species_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.species_species_id_seq', 10, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: species species_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_name_key UNIQUE (name);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: species species_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

