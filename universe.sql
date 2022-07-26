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
    age_billion_years integer,
    star_id integer,
    irregular_galaxy boolean NOT NULL
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
    diameter_km numeric,
    distance_fromplanet_km numeric
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
-- Name: moons_per_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moons_per_planet (
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    planet_name character varying(30),
    moon_name character varying(30),
    moons_per_planet_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.moons_per_planet OWNER TO freecodecamp;

--
-- Name: moons_per_planet_moons_per_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moons_per_planet_moons_per_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moons_per_planet_moons_per_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moons_per_planet_moons_per_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moons_per_planet_moons_per_planet_id_seq OWNED BY public.moons_per_planet.moons_per_planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_moon boolean,
    star_id integer,
    place_solar_system integer,
    diameter_km numeric NOT NULL,
    description text
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
    age_billion_years integer,
    solar_system boolean NOT NULL,
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
-- Name: moons_per_planet moons_per_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moons_per_planet ALTER COLUMN moons_per_planet_id SET DEFAULT nextval('public.moons_per_planet_moons_per_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda I', 10, 2, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda II', 10, 3, false);
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 13, 1, false);
INSERT INTO public.galaxy VALUES (4, 'Large Megallenic Cloud', 1, 4, true);
INSERT INTO public.galaxy VALUES (5, 'Small Megallenic Cloud', 1, 5, true);
INSERT INTO public.galaxy VALUES (6, 'Mayall''s Object', 12, 6, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth''s Moon', 3, NULL, 385000);
INSERT INTO public.moon VALUES (2, 'Deimos', 4, NULL, 6000);
INSERT INTO public.moon VALUES (3, 'Phobos', 4, NULL, 6000);
INSERT INTO public.moon VALUES (4, 'Io', 5, NULL, 262369);
INSERT INTO public.moon VALUES (5, 'Europa', 5, NULL, 414918);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, NULL, 664537);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Adraste', 5, NULL, 129000);
INSERT INTO public.moon VALUES (9, 'Aitne', 5, 1.5, 23.2);
INSERT INTO public.moon VALUES (10, 'Amalthea', 5, 83.5, 181400);
INSERT INTO public.moon VALUES (11, 'Ananke', 5, 14, 21.3);
INSERT INTO public.moon VALUES (12, 'Aoede', 5, 2, 14.9);
INSERT INTO public.moon VALUES (13, 'Arche', 5, 1, 14.5);
INSERT INTO public.moon VALUES (14, 'Autonoe', 5, 2, 24);
INSERT INTO public.moon VALUES (15, 'Callirrhoe', 5, 4.3, 24.1);
INSERT INTO public.moon VALUES (16, 'Carme', 5, NULL, 14.5);
INSERT INTO public.moon VALUES (17, 'Carpo', 5, 3, 10.5);
INSERT INTO public.moon VALUES (18, 'Chaldene', 5, 1.9, 23.1);
INSERT INTO public.moon VALUES (19, 'Enceladus', 6, 504, 238000);
INSERT INTO public.moon VALUES (20, 'Titan', 6, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Aegaeon', 6, 0.12, 167500);


--
-- Data for Name: moons_per_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moons_per_planet VALUES (3, 1, NULL, NULL, 1, NULL);
INSERT INTO public.moons_per_planet VALUES (4, 2, NULL, NULL, 2, NULL);
INSERT INTO public.moons_per_planet VALUES (4, 3, NULL, NULL, 3, NULL);
INSERT INTO public.moons_per_planet VALUES (5, 4, NULL, NULL, 4, NULL);
INSERT INTO public.moons_per_planet VALUES (5, 5, NULL, NULL, 5, NULL);
INSERT INTO public.moons_per_planet VALUES (5, 6, NULL, NULL, 6, NULL);
INSERT INTO public.moons_per_planet VALUES (5, 7, NULL, NULL, 7, NULL);
INSERT INTO public.moons_per_planet VALUES (5, 8, NULL, NULL, 8, NULL);
INSERT INTO public.moons_per_planet VALUES (5, 9, NULL, NULL, 9, NULL);
INSERT INTO public.moons_per_planet VALUES (5, 10, NULL, NULL, 10, NULL);
INSERT INTO public.moons_per_planet VALUES (5, 11, NULL, NULL, 11, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 1, 1, 2.440, 'Mercury—the smallest planet in our solar system and closest to the Sun—is only slightly larger than Earth''s Moon. Mercury is the fastest planet, zipping around the Sun every 88 Earth days.
');
INSERT INTO public.planet VALUES (2, 'Venus', false, 1, 2, 6.052, 'Venus is the second planet from the Sun and is Earth’s closest planetary neighbor. It’s one of the four inner, terrestrial (or rocky) planets, and it’s often called Earth’s twin because it’s similar in size and density. These are not identical twins, however – there are radical differences between the two worlds.');
INSERT INTO public.planet VALUES (3, 'Earth', true, 1, 3, 6.371, 'Our home planet is the third planet from the Sun, and the only place we know of so far that’s inhabited by living things.');
INSERT INTO public.planet VALUES (4, 'Mars', true, 1, 4, 3.390, ' Mars is the fourth planet from the Sun – a dusty, cold, desert world with a very thin atmosphere. Mars is also a dynamic planet with seasons, polar ice caps, canyons, extinct volcanoes, and evidence that it was even more active in the past.');
INSERT INTO public.planet VALUES (5, 'Jupiter', true, 1, 5, 69.911, 'Jupiter has a long history of surprising scientists – all the way back to 1610 when Galileo Galilei found the first moons beyond Earth. That discovery changed the way we see the universe.
');
INSERT INTO public.planet VALUES (6, 'Saturn', true, 1, 6, 58.232, 'Saturn is the sixth planet from the Sun and the second-largest planet in our solar system.');
INSERT INTO public.planet VALUES (7, 'Uranus', true, 1, 7, 25.362, 'Uranus is the seventh planet from the Sun, and has the third-largest diameter in our solar system. It was the first planet found with the aid of a telescope, Uranus was discovered in 1781 by astronomer William Herschel, although he originally thought it was either a comet or a star.');
INSERT INTO public.planet VALUES (8, 'Neptune', true, 1, 8, 24.622, 'Dark, cold, and whipped by supersonic winds, ice giant Neptune is the eighth and most distant planet in our solar system.
');
INSERT INTO public.planet VALUES (9, 'Pluto', true, 1, 9, 1.1883, 'The key difference between a planet and a dwarf planet is the kinds of objects that share its orbit around the Sun. Pluto, for example, has not cleared its orbit of similar objects while Earth or Jupiter have no similarly-sized worlds on the same path around the Sun.');
INSERT INTO public.planet VALUES (10, 'PA-99-N2', false, 2, NULL, 69.911, NULL);
INSERT INTO public.planet VALUES (11, 'PA-01-N2', true, 2, NULL, 25.362, NULL);
INSERT INTO public.planet VALUES (12, 'PA-02-N2', true, 2, NULL, 6.052, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4, true, 3);
INSERT INTO public.star VALUES (2, 'Alpha Andromedae', 1, false, 1);
INSERT INTO public.star VALUES (3, 'Beta Andromedae', 1, false, 2);
INSERT INTO public.star VALUES (4, 'R71', 6, false, 4);
INSERT INTO public.star VALUES (5, 'SN 1987A', 4, false, 5);
INSERT INTO public.star VALUES (6, 'Arp 148', 10, false, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: moons_per_planet_moons_per_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moons_per_planet_moons_per_planet_id_seq', 11, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: moon moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moons_per_planet moons_per_planet_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moons_per_planet
    ADD CONSTRAINT moons_per_planet_moon_id_key UNIQUE (moon_id);


--
-- Name: moons_per_planet moons_per_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moons_per_planet
    ADD CONSTRAINT moons_per_planet_pkey PRIMARY KEY (moons_per_planet_id);


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
-- PostgreSQL database dump complete
--

