--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    has_life boolean NOT NULL,
    fun_fact text,
    width_light_years text
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
    fun_fact text,
    has_life boolean
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
    star_id integer,
    moons integer,
    low_temp numeric(6,1),
    high_temp numeric(6,1),
    has_life boolean
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_qty integer,
    type character varying(30) NOT NULL,
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
-- Name: worm_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.worm_hole (
    worm_hole_id integer NOT NULL,
    galaxy character varying(20),
    survivable boolean,
    planet text,
    galaxy_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.worm_hole OWNER TO freecodecamp;

--
-- Name: worm_hole_worm_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.worm_hole_worm_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.worm_hole_worm_hole_id_seq OWNER TO freecodecamp;

--
-- Name: worm_hole_worm_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.worm_hole_worm_hole_id_seq OWNED BY public.worm_hole.worm_hole_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: worm_hole worm_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.worm_hole ALTER COLUMN worm_hole_id SET DEFAULT nextval('public.worm_hole_worm_hole_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 'I live there', '100 billion');
INSERT INTO public.galaxy VALUES (2, 'Omadus', true, 'has gay aliens', '55 billion');
INSERT INTO public.galaxy VALUES (3, 'Yogy', true, 'Two black holes', '670 billion');
INSERT INTO public.galaxy VALUES (4, 'Peppy', true, 'Has grey aliens', '300 billion');
INSERT INTO public.galaxy VALUES (5, 'Octulas', true, 'Mind freya aliens', '50 billion');
INSERT INTO public.galaxy VALUES (6, 'Marma', false, 'Is fading', '55 million');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 'its title locked', true);
INSERT INTO public.moon VALUES (2, 'Gogert', 5, NULL, false);
INSERT INTO public.moon VALUES (3, 'Pus', 5, NULL, false);
INSERT INTO public.moon VALUES (4, 'Gollymeck', 5, NULL, false);
INSERT INTO public.moon VALUES (5, 'Lavoriki', 4, NULL, false);
INSERT INTO public.moon VALUES (6, 'Numprik', 5, NULL, false);
INSERT INTO public.moon VALUES (7, 'Grekyori', 5, NULL, false);
INSERT INTO public.moon VALUES (8, 'Ro44', 8, 'No gravity', false);
INSERT INTO public.moon VALUES (9, 'Ro45', 8, NULL, false);
INSERT INTO public.moon VALUES (10, 'Ro46', 8, NULL, false);
INSERT INTO public.moon VALUES (11, 'Mosis', 12, NULL, false);
INSERT INTO public.moon VALUES (12, 'AO112', 10, NULL, false);
INSERT INTO public.moon VALUES (13, 'AO113b', 10, NULL, false);
INSERT INTO public.moon VALUES (14, 'Lola', 5, NULL, false);
INSERT INTO public.moon VALUES (15, 'bradfa', 5, NULL, true);
INSERT INTO public.moon VALUES (16, 'bGdna', 5, 'Has intellagent life', true);
INSERT INTO public.moon VALUES (17, 'Zeda', 5, NULL, false);
INSERT INTO public.moon VALUES (18, 'Alis', 3, NULL, false);
INSERT INTO public.moon VALUES (19, 'b332', 5, NULL, false);
INSERT INTO public.moon VALUES (20, 'Markas', 5, NULL, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, -100.0, 110.0, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 2, -200.0, 30.0, false);
INSERT INTO public.planet VALUES (3, 'JUPITAR', 1, 72, -1000.0, -400.0, false);
INSERT INTO public.planet VALUES (4, 'Yopl', 3, 0, 33.0, 188.0, true);
INSERT INTO public.planet VALUES (5, 'Poops', 2, 112, -112.0, 333.0, false);
INSERT INTO public.planet VALUES (6, 'Peaka', 3, 5, 1250.0, 4444.0, false);
INSERT INTO public.planet VALUES (7, 'Peggy', 3, 6, 12.0, 244.0, false);
INSERT INTO public.planet VALUES (8, 'Nimpo', 2, 11, -222.0, 245.0, false);
INSERT INTO public.planet VALUES (9, 'Whal', 3, 0, -2.0, 22.0, false);
INSERT INTO public.planet VALUES (10, 'Gogo', 3, 3, -432.0, -122.0, false);
INSERT INTO public.planet VALUES (11, 'Bowser', 3, 0, -43.0, 122.0, false);
INSERT INTO public.planet VALUES (12, 'xo122', 2, 1, -87.0, 181.0, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 'Yellow Dwarf', 1);
INSERT INTO public.star VALUES (2, 'Hodo', 22, 'Red Giant', 2);
INSERT INTO public.star VALUES (3, 'McFay', 3, 'Newtron', 3);
INSERT INTO public.star VALUES (4, 'Ggg', 2, 'Brown recluse', 5);
INSERT INTO public.star VALUES (5, 'Nono', 4, 'Yellow Dwarf', 4);
INSERT INTO public.star VALUES (6, 'Pindd', 66, 'Yellow Dwarf', 6);
INSERT INTO public.star VALUES (7, 'BrickHouse', 3366, 'Red Giant', 6);


--
-- Data for Name: worm_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.worm_hole VALUES (1, 'Milky Way', false, 'Earth to Mars', 1, 'cum stream');
INSERT INTO public.worm_hole VALUES (2, 'Milky Way', false, 'Earth to Saturn', 1, 'pee');
INSERT INTO public.worm_hole VALUES (3, 'Milky Way', false, 'Earth to Numpi', 2, 'Glister');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: worm_hole_worm_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.worm_hole_worm_hole_id_seq', 1, false);


--
-- Name: worm_hole constraint_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.worm_hole
    ADD CONSTRAINT constraint_name UNIQUE (name);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: worm_hole worm_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.worm_hole
    ADD CONSTRAINT worm_hole_pkey PRIMARY KEY (worm_hole_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: worm_hole worm_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.worm_hole
    ADD CONSTRAINT worm_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
