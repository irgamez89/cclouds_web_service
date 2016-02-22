--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.0
-- Dumped by pg_dump version 9.5.0

-- Started on 2016-02-19 15:37:19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 190 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2161 (class 0 OID 0)
-- Dependencies: 190
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 180 (class 1259 OID 24921)
-- Name: secuencia_id_log; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_log
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE secuencia_id_log OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 24923)
-- Name: cclouds_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cclouds_logs (
    id_log integer DEFAULT nextval('secuencia_id_log'::regclass) NOT NULL,
    create_date date NOT NULL,
    update_date date NOT NULL,
    id_user integer NOT NULL,
    accion character varying(255),
    id_table integer
);


ALTER TABLE cclouds_logs OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 24927)
-- Name: secuencia_id_module; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_module
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE secuencia_id_module OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 24929)
-- Name: cclouds_module; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cclouds_module (
    id_module integer DEFAULT nextval('secuencia_id_module'::regclass) NOT NULL,
    name character varying(50),
    description character varying(50)
);


ALTER TABLE cclouds_module OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 24933)
-- Name: secuencia_id_rol; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_rol
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE secuencia_id_rol OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 24935)
-- Name: cclouds_rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cclouds_rol (
    id_rol integer DEFAULT nextval('secuencia_id_rol'::regclass) NOT NULL,
    name character varying(255),
    description character varying(255)
);


ALTER TABLE cclouds_rol OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 24942)
-- Name: cclouds_rol_module; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cclouds_rol_module (
    id integer NOT NULL,
    id_rol integer,
    id_module integer
);


ALTER TABLE cclouds_rol_module OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 24945)
-- Name: secuencia_id_usuario; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_usuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE secuencia_id_usuario OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 24947)
-- Name: cclouds_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cclouds_usuario (
    id_user integer DEFAULT nextval('secuencia_id_usuario'::regclass) NOT NULL,
    id_rol integer NOT NULL,
    username character varying(25) NOT NULL,
    password character varying(50) NOT NULL,
    password_reset_token character varying(255),
    phone_number character varying(255),
    user_email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    sex character(1),
    date_birth date NOT NULL,
    db_hash character varying(50) NOT NULL,
    plain_text_password character varying(10) NOT NULL,
    country character varying(50),
    province character varying(50),
    city character varying(50),
    enabled boolean DEFAULT false NOT NULL
);


ALTER TABLE cclouds_usuario OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 24954)
-- Name: secuencia_id_rol_module; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_rol_module
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE secuencia_id_rol_module OWNER TO postgres;

--
-- TOC entry 2145 (class 0 OID 24923)
-- Dependencies: 181
-- Data for Name: cclouds_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2147 (class 0 OID 24929)
-- Dependencies: 183
-- Data for Name: cclouds_module; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2149 (class 0 OID 24935)
-- Dependencies: 185
-- Data for Name: cclouds_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cclouds_rol VALUES (1, 'ROLE_USER', 'Administrador');


--
-- TOC entry 2150 (class 0 OID 24942)
-- Dependencies: 186
-- Data for Name: cclouds_rol_module; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2152 (class 0 OID 24947)
-- Dependencies: 188
-- Data for Name: cclouds_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cclouds_usuario VALUES (1, 1, 'rlavila', 'master', 'master', '54949463', 'rlavila@enet.cu', 'Reinier', 'Leyva', 'M', '2015-01-01', 'test', 'test', NULL, NULL, NULL, true);
INSERT INTO cclouds_usuario VALUES (8, 1, 'isidro', 'pass', 'prt', '123', 'emaild@ok.com', 'Isidro', 'rod', 'm', '2000-01-01', 'asd', 'ok', 'r', 'm', 'c', false);


--
-- TOC entry 2162 (class 0 OID 0)
-- Dependencies: 180
-- Name: secuencia_id_log; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_log', 1, false);


--
-- TOC entry 2163 (class 0 OID 0)
-- Dependencies: 182
-- Name: secuencia_id_module; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_module', 1, false);


--
-- TOC entry 2164 (class 0 OID 0)
-- Dependencies: 184
-- Name: secuencia_id_rol; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_rol', 1, false);


--
-- TOC entry 2165 (class 0 OID 0)
-- Dependencies: 189
-- Name: secuencia_id_rol_module; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_rol_module', 1, false);


--
-- TOC entry 2166 (class 0 OID 0)
-- Dependencies: 187
-- Name: secuencia_id_usuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_usuario', 15, true);


--
-- TOC entry 2013 (class 2606 OID 24957)
-- Name: cclouds_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_logs
    ADD CONSTRAINT cclouds_logs_pkey PRIMARY KEY (id_log);


--
-- TOC entry 2015 (class 2606 OID 24959)
-- Name: cclouds_module_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_module
    ADD CONSTRAINT cclouds_module_pkey PRIMARY KEY (id_module);


--
-- TOC entry 2019 (class 2606 OID 24961)
-- Name: cclouds_rol_module_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_rol_module
    ADD CONSTRAINT cclouds_rol_module_pkey PRIMARY KEY (id);


--
-- TOC entry 2017 (class 2606 OID 24963)
-- Name: cclouds_rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_rol
    ADD CONSTRAINT cclouds_rol_pkey PRIMARY KEY (id_rol);


--
-- TOC entry 2021 (class 2606 OID 24965)
-- Name: cclouds_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_usuario
    ADD CONSTRAINT cclouds_usuario_pkey PRIMARY KEY (id_user);


--
-- TOC entry 2023 (class 2606 OID 25008)
-- Name: email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_usuario
    ADD CONSTRAINT email UNIQUE (user_email);


--
-- TOC entry 2025 (class 2606 OID 25006)
-- Name: username; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_usuario
    ADD CONSTRAINT username UNIQUE (username);


--
-- TOC entry 2026 (class 2606 OID 24966)
-- Name: cclouds_logs_IdUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_logs
    ADD CONSTRAINT "cclouds_logs_IdUser_fkey" FOREIGN KEY (id_user) REFERENCES cclouds_usuario(id_user);


--
-- TOC entry 2027 (class 2606 OID 24971)
-- Name: cclouds_rol_module_IdModule_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_rol_module
    ADD CONSTRAINT "cclouds_rol_module_IdModule_fkey" FOREIGN KEY (id_module) REFERENCES cclouds_module(id_module);


--
-- TOC entry 2028 (class 2606 OID 24976)
-- Name: cclouds_rol_module_IdRol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_rol_module
    ADD CONSTRAINT "cclouds_rol_module_IdRol_fkey" FOREIGN KEY (id_rol) REFERENCES cclouds_rol(id_rol);


--
-- TOC entry 2029 (class 2606 OID 24994)
-- Name: id_rol_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_usuario
    ADD CONSTRAINT id_rol_fk FOREIGN KEY (id_rol) REFERENCES cclouds_rol(id_rol) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2160 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-02-19 15:37:19

--
-- PostgreSQL database dump complete
--

