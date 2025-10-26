--
-- PostgreSQL database dump
--

\restrict owUk7GD65VutyDzZfhkettRcpLXahyKwa0WmcbJeiCx3yUJng7LfRprjoZbb8lV

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2025-10-26 17:56:58

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 861 (class 1247 OID 16396)
-- Name: title_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.title_type AS ENUM (
    'movie',
    'series'
);


ALTER TYPE public.title_type OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 16429)
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    genre_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16428)
-- Name: genre_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genre_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genre_genre_id_seq OWNER TO postgres;

--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 223
-- Name: genre_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genre_genre_id_seq OWNED BY public.genre.genre_id;


--
-- TOC entry 222 (class 1259 OID 16420)
-- Name: people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.people (
    people_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.people OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16419)
-- Name: people_people_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.people_people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_people_id_seq OWNER TO postgres;

--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 221
-- Name: people_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.people_people_id_seq OWNED BY public.people.people_id;


--
-- TOC entry 226 (class 1259 OID 16438)
-- Name: ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratings (
    title_id integer,
    rating_id integer NOT NULL,
    score numeric(2,1) NOT NULL
);


ALTER TABLE public.ratings OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16437)
-- Name: ratings_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ratings_rating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ratings_rating_id_seq OWNER TO postgres;

--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 225
-- Name: ratings_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ratings_rating_id_seq OWNED BY public.ratings.rating_id;


--
-- TOC entry 228 (class 1259 OID 16483)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    title_id integer NOT NULL,
    people_id integer NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16466)
-- Name: title_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.title_genre (
    title_id integer NOT NULL,
    genre_id integer NOT NULL
);


ALTER TABLE public.title_genre OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16402)
-- Name: titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titles (
    title_id integer NOT NULL,
    title_name character varying(255) NOT NULL,
    type public.title_type NOT NULL,
    release_year integer
);


ALTER TABLE public.titles OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16401)
-- Name: titles_title_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.titles_title_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.titles_title_id_seq OWNER TO postgres;

--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 219
-- Name: titles_title_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.titles_title_id_seq OWNED BY public.titles.title_id;


--
-- TOC entry 4884 (class 2604 OID 16432)
-- Name: genre genre_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre ALTER COLUMN genre_id SET DEFAULT nextval('public.genre_genre_id_seq'::regclass);


--
-- TOC entry 4883 (class 2604 OID 16423)
-- Name: people people_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.people ALTER COLUMN people_id SET DEFAULT nextval('public.people_people_id_seq'::regclass);


--
-- TOC entry 4885 (class 2604 OID 16441)
-- Name: ratings rating_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings ALTER COLUMN rating_id SET DEFAULT nextval('public.ratings_rating_id_seq'::regclass);


--
-- TOC entry 4882 (class 2604 OID 16405)
-- Name: titles title_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles ALTER COLUMN title_id SET DEFAULT nextval('public.titles_title_id_seq'::regclass);


--
-- TOC entry 4891 (class 2606 OID 16436)
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genre_id);


--
-- TOC entry 4889 (class 2606 OID 16427)
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (people_id);


--
-- TOC entry 4893 (class 2606 OID 16445)
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (rating_id);


--
-- TOC entry 4897 (class 2606 OID 16489)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (title_id, people_id);


--
-- TOC entry 4895 (class 2606 OID 16472)
-- Name: title_genre title_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.title_genre
    ADD CONSTRAINT title_genre_pkey PRIMARY KEY (title_id, genre_id);


--
-- TOC entry 4887 (class 2606 OID 16410)
-- Name: titles titles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_pkey PRIMARY KEY (title_id);


--
-- TOC entry 4898 (class 2606 OID 16446)
-- Name: ratings fk_r_title; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT fk_r_title FOREIGN KEY (title_id) REFERENCES public.titles(title_id);


--
-- TOC entry 4901 (class 2606 OID 16495)
-- Name: roles roles_people_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_people_id_fkey FOREIGN KEY (people_id) REFERENCES public.people(people_id);


--
-- TOC entry 4902 (class 2606 OID 16490)
-- Name: roles roles_title_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_title_id_fkey FOREIGN KEY (title_id) REFERENCES public.titles(title_id);


--
-- TOC entry 4899 (class 2606 OID 16478)
-- Name: title_genre title_genre_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.title_genre
    ADD CONSTRAINT title_genre_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genre(genre_id);


--
-- TOC entry 4900 (class 2606 OID 16473)
-- Name: title_genre title_genre_title_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.title_genre
    ADD CONSTRAINT title_genre_title_id_fkey FOREIGN KEY (title_id) REFERENCES public.titles(title_id);


-- Completed on 2025-10-26 17:56:58

--
-- PostgreSQL database dump complete
--

\unrestrict owUk7GD65VutyDzZfhkettRcpLXahyKwa0WmcbJeiCx3yUJng7LfRprjoZbb8lV

