--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.0
-- Dumped by pg_dump version 9.0.0
-- Started on 2016-05-02 01:04:44

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 381 (class 2612 OID 11574)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- TOC entry 1573 (class 1259 OID 18071)
-- Dependencies: 6
-- Name: secuencia_id_modulex; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_modulex
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secuencia_id_modulex OWNER TO postgres;

--
-- TOC entry 2031 (class 0 OID 0)
-- Dependencies: 1573
-- Name: secuencia_id_modulex; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_modulex', 64, true);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1574 (class 1259 OID 18073)
-- Dependencies: 1893 6
-- Name: adm_modulo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE adm_modulo (
    id integer DEFAULT nextval('secuencia_id_modulex'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    id_padre integer NOT NULL,
    descripcion character varying(255),
    is_leaf boolean
);


ALTER TABLE public.adm_modulo OWNER TO postgres;

--
-- TOC entry 1575 (class 1259 OID 18080)
-- Dependencies: 6
-- Name: secuencia_id_agencia; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_agencia
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secuencia_id_agencia OWNER TO postgres;

--
-- TOC entry 2034 (class 0 OID 0)
-- Dependencies: 1575
-- Name: secuencia_id_agencia; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_agencia', 3, true);


--
-- TOC entry 1576 (class 1259 OID 18082)
-- Dependencies: 1894 6
-- Name: cclouds_agencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cclouds_agencia (
    id_agencia integer DEFAULT nextval('secuencia_id_agencia'::regclass) NOT NULL,
    id_sucursal integer,
    nombre_agencia character varying(255),
    observacion_agencia character varying(500),
    id_representante_agencia integer
);


ALTER TABLE public.cclouds_agencia OWNER TO postgres;

--
-- TOC entry 1577 (class 1259 OID 18089)
-- Dependencies: 6
-- Name: secuencia_id_city; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_city
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secuencia_id_city OWNER TO postgres;

--
-- TOC entry 2037 (class 0 OID 0)
-- Dependencies: 1577
-- Name: secuencia_id_city; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_city', 425, true);


--
-- TOC entry 1578 (class 1259 OID 18091)
-- Dependencies: 1895 1896 6
-- Name: cclouds_city; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cclouds_city (
    id_city integer DEFAULT nextval('secuencia_id_city'::regclass) NOT NULL,
    id_province integer NOT NULL,
    code_city integer NOT NULL,
    name_city character varying(50) NOT NULL,
    description_city character varying(50) DEFAULT ''::character varying
);


ALTER TABLE public.cclouds_city OWNER TO postgres;

--
-- TOC entry 1579 (class 1259 OID 18096)
-- Dependencies: 6
-- Name: secuencia_id_country; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_country
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secuencia_id_country OWNER TO postgres;

--
-- TOC entry 2040 (class 0 OID 0)
-- Dependencies: 1579
-- Name: secuencia_id_country; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_country', 39, true);


--
-- TOC entry 1580 (class 1259 OID 18098)
-- Dependencies: 1897 1898 6
-- Name: cclouds_country; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cclouds_country (
    id_country integer DEFAULT nextval('secuencia_id_country'::regclass) NOT NULL,
    code_country character varying(10) NOT NULL,
    name_country character varying(50) NOT NULL,
    description_country character varying(50) DEFAULT ''::character varying
);


ALTER TABLE public.cclouds_country OWNER TO postgres;

--
-- TOC entry 1581 (class 1259 OID 18103)
-- Dependencies: 6
-- Name: secuencia_id_empresa; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_empresa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secuencia_id_empresa OWNER TO postgres;

--
-- TOC entry 2043 (class 0 OID 0)
-- Dependencies: 1581
-- Name: secuencia_id_empresa; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_empresa', 4, true);


--
-- TOC entry 1582 (class 1259 OID 18105)
-- Dependencies: 1899 1900 6
-- Name: cclouds_empresa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cclouds_empresa (
    id_empresa integer DEFAULT nextval('secuencia_id_empresa'::regclass) NOT NULL,
    nombre_empresa character varying(255),
    observacion_empresa character varying(500),
    id_representante integer,
    rup_empresa character varying(255) DEFAULT '----'::character varying,
    fecha_constitucion_empresa date,
    eslogan_empresa character varying(500),
    imagen_logo_empresa character varying(500)
);


ALTER TABLE public.cclouds_empresa OWNER TO postgres;

--
-- TOC entry 1583 (class 1259 OID 18113)
-- Dependencies: 6
-- Name: secuencia_id_exceptions; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_exceptions
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secuencia_id_exceptions OWNER TO postgres;

--
-- TOC entry 2046 (class 0 OID 0)
-- Dependencies: 1583
-- Name: secuencia_id_exceptions; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_exceptions', 1, true);


--
-- TOC entry 1584 (class 1259 OID 18115)
-- Dependencies: 1901 6
-- Name: cclouds_exceptios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cclouds_exceptios (
    id_exception integer DEFAULT nextval('secuencia_id_exceptions'::regclass) NOT NULL,
    type_exception character varying(25) NOT NULL,
    description_exception character varying(500) NOT NULL,
    params_exception character varying(255),
    message_exception character varying(500),
    action_exception character varying(25)
);


ALTER TABLE public.cclouds_exceptios OWNER TO postgres;

--
-- TOC entry 1585 (class 1259 OID 18122)
-- Dependencies: 6
-- Name: secuencia_id_log; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_log
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secuencia_id_log OWNER TO postgres;

--
-- TOC entry 2049 (class 0 OID 0)
-- Dependencies: 1585
-- Name: secuencia_id_log; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_log', 8, true);


--
-- TOC entry 1586 (class 1259 OID 18124)
-- Dependencies: 1902 6
-- Name: cclouds_logs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cclouds_logs (
    id_log smallint DEFAULT nextval('secuencia_id_log'::regclass) NOT NULL,
    last_date date NOT NULL,
    id_user smallint NOT NULL,
    accion character varying(255),
    table_name character varying(255)
);


ALTER TABLE public.cclouds_logs OWNER TO postgres;

--
-- TOC entry 1587 (class 1259 OID 18131)
-- Dependencies: 6
-- Name: secuencia_id_menu; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_menu
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secuencia_id_menu OWNER TO postgres;

--
-- TOC entry 2052 (class 0 OID 0)
-- Dependencies: 1587
-- Name: secuencia_id_menu; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_menu', 4, true);


--
-- TOC entry 1588 (class 1259 OID 18133)
-- Dependencies: 1903 6
-- Name: cclouds_menu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cclouds_menu (
    id_menu integer DEFAULT nextval('secuencia_id_menu'::regclass) NOT NULL,
    id_module integer NOT NULL,
    description_menu character varying(50)
);


ALTER TABLE public.cclouds_menu OWNER TO postgres;

--
-- TOC entry 1589 (class 1259 OID 18137)
-- Dependencies: 6
-- Name: secuencia_id_module; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_module
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secuencia_id_module OWNER TO postgres;

--
-- TOC entry 2055 (class 0 OID 0)
-- Dependencies: 1589
-- Name: secuencia_id_module; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_module', 18, true);


--
-- TOC entry 1590 (class 1259 OID 18139)
-- Dependencies: 1904 6
-- Name: cclouds_module; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cclouds_module (
    id_module integer DEFAULT nextval('secuencia_id_module'::regclass) NOT NULL,
    name character varying(50),
    description character varying(50)
);


ALTER TABLE public.cclouds_module OWNER TO postgres;

--
-- TOC entry 1591 (class 1259 OID 18143)
-- Dependencies: 6
-- Name: secuencia_id_option; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_option
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secuencia_id_option OWNER TO postgres;

--
-- TOC entry 2058 (class 0 OID 0)
-- Dependencies: 1591
-- Name: secuencia_id_option; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_option', 13, true);


--
-- TOC entry 1592 (class 1259 OID 18145)
-- Dependencies: 1905 6
-- Name: cclouds_options; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cclouds_options (
    id_option integer DEFAULT nextval('secuencia_id_option'::regclass) NOT NULL,
    id_menu integer NOT NULL,
    description_option character varying(50),
    name character varying(50)
);


ALTER TABLE public.cclouds_options OWNER TO postgres;

--
-- TOC entry 1593 (class 1259 OID 18149)
-- Dependencies: 6
-- Name: secuencia_id_parroquia; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_parroquia
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secuencia_id_parroquia OWNER TO postgres;

--
-- TOC entry 2061 (class 0 OID 0)
-- Dependencies: 1593
-- Name: secuencia_id_parroquia; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_parroquia', 1008, true);


--
-- TOC entry 1594 (class 1259 OID 18151)
-- Dependencies: 1906 1907 6
-- Name: cclouds_parroquia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cclouds_parroquia (
    id_parroquia integer DEFAULT nextval('secuencia_id_parroquia'::regclass) NOT NULL,
    id_city integer NOT NULL,
    code_parroquia integer NOT NULL,
    name_parroquia character varying(50) NOT NULL,
    description_parroquia character varying(50) DEFAULT ''::character varying
);


ALTER TABLE public.cclouds_parroquia OWNER TO postgres;

--
-- TOC entry 1595 (class 1259 OID 18156)
-- Dependencies: 6
-- Name: secuencia_id_province; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_province
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secuencia_id_province OWNER TO postgres;

--
-- TOC entry 2064 (class 0 OID 0)
-- Dependencies: 1595
-- Name: secuencia_id_province; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_province', 37, true);


--
-- TOC entry 1596 (class 1259 OID 18158)
-- Dependencies: 1908 6
-- Name: cclouds_province; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cclouds_province (
    id_province integer DEFAULT nextval('secuencia_id_province'::regclass) NOT NULL,
    id_country integer NOT NULL,
    code_province integer NOT NULL,
    name_province character varying(50) NOT NULL,
    description_province character varying(50) NOT NULL
);


ALTER TABLE public.cclouds_province OWNER TO postgres;

--
-- TOC entry 1597 (class 1259 OID 18162)
-- Dependencies: 6
-- Name: secuencia_id_rol; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_rol
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secuencia_id_rol OWNER TO postgres;

--
-- TOC entry 2067 (class 0 OID 0)
-- Dependencies: 1597
-- Name: secuencia_id_rol; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_rol', 83, true);


--
-- TOC entry 1598 (class 1259 OID 18164)
-- Dependencies: 1909 6
-- Name: cclouds_rol; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cclouds_rol (
    id_rol integer DEFAULT nextval('secuencia_id_rol'::regclass) NOT NULL,
    name character varying(255),
    description character varying(255)
);


ALTER TABLE public.cclouds_rol OWNER TO postgres;

--
-- TOC entry 1599 (class 1259 OID 18171)
-- Dependencies: 6
-- Name: secuencia_id_rol_options; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_rol_options
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secuencia_id_rol_options OWNER TO postgres;

--
-- TOC entry 2070 (class 0 OID 0)
-- Dependencies: 1599
-- Name: secuencia_id_rol_options; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_rol_options', 92, true);


--
-- TOC entry 1600 (class 1259 OID 18173)
-- Dependencies: 1910 6
-- Name: cclouds_rol_adm; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cclouds_rol_adm (
    id integer DEFAULT nextval('secuencia_id_rol_options'::regclass) NOT NULL,
    id_rol integer,
    id_options integer
);


ALTER TABLE public.cclouds_rol_adm OWNER TO postgres;

--
-- TOC entry 1612 (class 1259 OID 18379)
-- Dependencies: 6
-- Name: cclouds_servicio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cclouds_servicio (
    id_servicio integer NOT NULL,
    name_servicio character varying(255),
    detalle_servicio character varying(255),
    id_tarifa integer NOT NULL,
    estado_servicio boolean NOT NULL,
    fecha_creacion date NOT NULL,
    id_user integer NOT NULL
);


ALTER TABLE public.cclouds_servicio OWNER TO postgres;

--
-- TOC entry 1613 (class 1259 OID 18385)
-- Dependencies: 1612 6
-- Name: cclouds_servicio_id_servicio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cclouds_servicio_id_servicio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cclouds_servicio_id_servicio_seq OWNER TO postgres;

--
-- TOC entry 2073 (class 0 OID 0)
-- Dependencies: 1613
-- Name: cclouds_servicio_id_servicio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cclouds_servicio_id_servicio_seq OWNED BY cclouds_servicio.id_servicio;


--
-- TOC entry 2074 (class 0 OID 0)
-- Dependencies: 1613
-- Name: cclouds_servicio_id_servicio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cclouds_servicio_id_servicio_seq', 1, false);


--
-- TOC entry 1601 (class 1259 OID 18177)
-- Dependencies: 6
-- Name: cclouds_sex; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cclouds_sex (
    description_sex character varying(255) NOT NULL,
    letter character varying(1),
    id_sex bigint NOT NULL
);


ALTER TABLE public.cclouds_sex OWNER TO postgres;

--
-- TOC entry 1602 (class 1259 OID 18180)
-- Dependencies: 1601 6
-- Name: cclouds_sex_id_sex_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cclouds_sex_id_sex_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cclouds_sex_id_sex_seq OWNER TO postgres;

--
-- TOC entry 2076 (class 0 OID 0)
-- Dependencies: 1602
-- Name: cclouds_sex_id_sex_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cclouds_sex_id_sex_seq OWNED BY cclouds_sex.id_sex;


--
-- TOC entry 2077 (class 0 OID 0)
-- Dependencies: 1602
-- Name: cclouds_sex_id_sex_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cclouds_sex_id_sex_seq', 2, true);


--
-- TOC entry 1603 (class 1259 OID 18182)
-- Dependencies: 6
-- Name: secuencia_id_sub_empresa; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_sub_empresa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secuencia_id_sub_empresa OWNER TO postgres;

--
-- TOC entry 2079 (class 0 OID 0)
-- Dependencies: 1603
-- Name: secuencia_id_sub_empresa; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_sub_empresa', 7, true);


--
-- TOC entry 1604 (class 1259 OID 18184)
-- Dependencies: 1912 6
-- Name: cclouds_sub_empresa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cclouds_sub_empresa (
    id_sub_empresa integer DEFAULT nextval('secuencia_id_sub_empresa'::regclass) NOT NULL,
    id_empresa integer,
    nombre_sub_empresa character varying(255),
    observacion_sub_empresa character varying(500),
    id_tipo_negocio_sub_empresa integer,
    id_representante_1_sub_empresa integer,
    id_representante_2_sub_empresa integer,
    fecha_constitucion_sub_empresa date,
    eslogan_sub_empresa character varying(500),
    imagen_logo_sub_empresa character varying(500)
);


ALTER TABLE public.cclouds_sub_empresa OWNER TO postgres;

--
-- TOC entry 1605 (class 1259 OID 18191)
-- Dependencies: 6
-- Name: secuencia_id_sucursal; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_sucursal
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secuencia_id_sucursal OWNER TO postgres;

--
-- TOC entry 2082 (class 0 OID 0)
-- Dependencies: 1605
-- Name: secuencia_id_sucursal; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_sucursal', 6, true);


--
-- TOC entry 1606 (class 1259 OID 18193)
-- Dependencies: 1913 6
-- Name: cclouds_sucursal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cclouds_sucursal (
    id_sucursal integer DEFAULT nextval('secuencia_id_sucursal'::regclass) NOT NULL,
    id_sub_empresa integer,
    nombre_sucursal character varying(255),
    observacion_sucursal character varying(500),
    id_representante_sucursal integer
);


ALTER TABLE public.cclouds_sucursal OWNER TO postgres;

--
-- TOC entry 1614 (class 1259 OID 18387)
-- Dependencies: 1918 1919 6
-- Name: cclouds_tarifa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cclouds_tarifa (
    id_tarifa integer NOT NULL,
    nombre_tarifa character varying(255),
    detalle_tarifa character varying(255),
    valor_tarifa real DEFAULT 0.0 NOT NULL,
    incluye_impuesto_tarifa boolean NOT NULL,
    impuesto_tarifa real DEFAULT 0.0 NOT NULL,
    estado_tarifa boolean NOT NULL,
    id_usuario integer
);


ALTER TABLE public.cclouds_tarifa OWNER TO postgres;

--
-- TOC entry 1615 (class 1259 OID 18395)
-- Dependencies: 1614 6
-- Name: cclouds_tarifa_id_tarifa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cclouds_tarifa_id_tarifa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cclouds_tarifa_id_tarifa_seq OWNER TO postgres;

--
-- TOC entry 2085 (class 0 OID 0)
-- Dependencies: 1615
-- Name: cclouds_tarifa_id_tarifa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cclouds_tarifa_id_tarifa_seq OWNED BY cclouds_tarifa.id_tarifa;


--
-- TOC entry 2086 (class 0 OID 0)
-- Dependencies: 1615
-- Name: cclouds_tarifa_id_tarifa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cclouds_tarifa_id_tarifa_seq', 1, false);


--
-- TOC entry 1607 (class 1259 OID 18200)
-- Dependencies: 6
-- Name: secuencia_id_usuario; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE secuencia_id_usuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secuencia_id_usuario OWNER TO postgres;

--
-- TOC entry 2087 (class 0 OID 0)
-- Dependencies: 1607
-- Name: secuencia_id_usuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('secuencia_id_usuario', 67, true);


--
-- TOC entry 1608 (class 1259 OID 18202)
-- Dependencies: 1914 1915 6
-- Name: cclouds_usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cclouds_usuario (
    id_user integer DEFAULT nextval('secuencia_id_usuario'::regclass) NOT NULL,
    id_rol integer NOT NULL,
    username character varying(25) NOT NULL,
    password character varying(100) NOT NULL,
    password_reset_token character varying(255),
    phone_number character varying(255),
    user_email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    sex character(1),
    date_birth date,
    db_hash character varying(50),
    plain_text_password character varying(10),
    enabled boolean DEFAULT false NOT NULL,
    parroquia integer,
    id_agencia integer
);


ALTER TABLE public.cclouds_usuario OWNER TO postgres;

--
-- TOC entry 1609 (class 1259 OID 18210)
-- Dependencies: 6
-- Name: cclouds_usuario_rol_agencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cclouds_usuario_rol_agencia (
    id_user integer NOT NULL,
    id_rol integer NOT NULL,
    id_agencia integer NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE public.cclouds_usuario_rol_agencia OWNER TO postgres;

--
-- TOC entry 1610 (class 1259 OID 18213)
-- Dependencies: 6 1609
-- Name: cclouds_usuario_rol_agencia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cclouds_usuario_rol_agencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cclouds_usuario_rol_agencia_id_seq OWNER TO postgres;

--
-- TOC entry 2090 (class 0 OID 0)
-- Dependencies: 1610
-- Name: cclouds_usuario_rol_agencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cclouds_usuario_rol_agencia_id_seq OWNED BY cclouds_usuario_rol_agencia.id;


--
-- TOC entry 2091 (class 0 OID 0)
-- Dependencies: 1610
-- Name: cclouds_usuario_rol_agencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cclouds_usuario_rol_agencia_id_seq', 1, false);


--
-- TOC entry 1611 (class 1259 OID 18215)
-- Dependencies: 6
-- Name: representantes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE representantes (
    id integer NOT NULL,
    id_representante integer,
    id_ integer
);


ALTER TABLE public.representantes OWNER TO postgres;

--
-- TOC entry 1917 (class 2604 OID 18397)
-- Dependencies: 1613 1612
-- Name: id_servicio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE cclouds_servicio ALTER COLUMN id_servicio SET DEFAULT nextval('cclouds_servicio_id_servicio_seq'::regclass);


--
-- TOC entry 1911 (class 2604 OID 18218)
-- Dependencies: 1602 1601
-- Name: id_sex; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE cclouds_sex ALTER COLUMN id_sex SET DEFAULT nextval('cclouds_sex_id_sex_seq'::regclass);


--
-- TOC entry 1920 (class 2604 OID 18398)
-- Dependencies: 1615 1614
-- Name: id_tarifa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE cclouds_tarifa ALTER COLUMN id_tarifa SET DEFAULT nextval('cclouds_tarifa_id_tarifa_seq'::regclass);


--
-- TOC entry 1916 (class 2604 OID 18399)
-- Dependencies: 1610 1609
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE cclouds_usuario_rol_agencia ALTER COLUMN id SET DEFAULT nextval('cclouds_usuario_rol_agencia_id_seq'::regclass);


--
-- TOC entry 2004 (class 0 OID 18073)
-- Dependencies: 1574
-- Data for Name: adm_modulo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO adm_modulo VALUES (7, 'Gestion de Roles', 2, 'Gestion de Roles', false);
INSERT INTO adm_modulo VALUES (8, 'Gestion de Menu', 2, 'Gestion de Menu', false);
INSERT INTO adm_modulo VALUES (1, 'Raiz', 1, 'Raiz', false);
INSERT INTO adm_modulo VALUES (2, 'Administracion', 1, 'Administracion', false);
INSERT INTO adm_modulo VALUES (3, 'Facturacion', 1, 'Facturacion', false);
INSERT INTO adm_modulo VALUES (4, 'Reportes', 1, 'Reportes', false);
INSERT INTO adm_modulo VALUES (5, 'Gestion de Usuarios', 2, 'Gestion de Usuarios', false);
INSERT INTO adm_modulo VALUES (6, 'Gestion de Permisos', 2, 'Gestion de Permisos', false);
INSERT INTO adm_modulo VALUES (9, 'Adicionar Usuario', 5, 'Adicionar Usuario', true);
INSERT INTO adm_modulo VALUES (10, 'Modificar Usuario', 5, 'Modificar Usuario', true);
INSERT INTO adm_modulo VALUES (11, 'Eliminar Usuario', 5, 'Eliminar Usuario', true);
INSERT INTO adm_modulo VALUES (12, 'Adicionar Permiso', 6, 'Adicionar Permiso', true);
INSERT INTO adm_modulo VALUES (13, 'Modificar Permiso', 6, 'Modificar Permiso', true);
INSERT INTO adm_modulo VALUES (14, 'Eliminar Permiso', 6, 'Eliminar Permiso', true);
INSERT INTO adm_modulo VALUES (15, 'Adicionar Rol', 7, 'Adicionar Rol', true);
INSERT INTO adm_modulo VALUES (17, 'Modificar Rol', 7, 'Modificar Rol', true);
INSERT INTO adm_modulo VALUES (18, 'Eliminar Rol', 7, 'Eliminar Rol', true);
INSERT INTO adm_modulo VALUES (19, 'Adicionar Menu', 8, 'Adicionar Menu', true);
INSERT INTO adm_modulo VALUES (20, 'Modificar Menu', 8, 'Modificar Menu', true);
INSERT INTO adm_modulo VALUES (21, 'Eliminar Menu', 8, 'Eliminar Menu', true);
INSERT INTO adm_modulo VALUES (23, 'Listar Usuarios', 5, 'Ver la lista de usuarios.', true);
INSERT INTO adm_modulo VALUES (24, 'Listar Roles', 7, 'Ver todos los roles.', true);
INSERT INTO adm_modulo VALUES (25, 'Eliminar Pais', 22, 'Eliminar pais.', true);
INSERT INTO adm_modulo VALUES (22, 'Gestion de Paises', 2, 'Gestión de países', false);
INSERT INTO adm_modulo VALUES (26, 'Listar Paises', 22, 'Listar Países', true);
INSERT INTO adm_modulo VALUES (27, 'Insertar Pais', 22, 'Insertar País', true);
INSERT INTO adm_modulo VALUES (28, 'Modificar Pais', 22, 'Modificar País', true);
INSERT INTO adm_modulo VALUES (29, 'Gestion de Provincias', 2, 'Gestión de Provincias', false);
INSERT INTO adm_modulo VALUES (30, 'Insertar Provincia', 29, 'Insertar Provincia', true);
INSERT INTO adm_modulo VALUES (31, 'Listar Provincias', 29, 'Listar Provincias', true);
INSERT INTO adm_modulo VALUES (32, 'Modificar Provincia', 29, 'Modificar Provincias', true);
INSERT INTO adm_modulo VALUES (33, 'Eliminar Provincia', 29, 'Eliminar Provincia', true);
INSERT INTO adm_modulo VALUES (35, 'Insertar Ciudad', 34, 'Insertar Ciudad', true);
INSERT INTO adm_modulo VALUES (36, 'Listar Ciudades', 34, 'Listar Ciudades', true);
INSERT INTO adm_modulo VALUES (37, 'Modificar Ciudad', 34, 'Modificar Ciudad', true);
INSERT INTO adm_modulo VALUES (38, 'Eliminar Ciudad', 34, 'Eliminar Ciudad', true);
INSERT INTO adm_modulo VALUES (39, 'Gestion de Parroquias', 2, 'Gestión de Parroquias', false);
INSERT INTO adm_modulo VALUES (40, 'Insertar Parroquia', 39, 'Insertar Parroquia', true);
INSERT INTO adm_modulo VALUES (41, 'Listar Parroquias', 39, 'Listar Parroquias', true);
INSERT INTO adm_modulo VALUES (42, 'Modificar Parroquia', 39, 'Modificar Parroquia', true);
INSERT INTO adm_modulo VALUES (43, 'Eliminar Parroquia', 39, 'Eliminar Parroquia', true);
INSERT INTO adm_modulo VALUES (34, 'Gestion de Ciudades', 2, 'Gestión de Ciudades', false);
INSERT INTO adm_modulo VALUES (44, 'Gestion de Empresas', 2, 'Gestión de Empresas', false);
INSERT INTO adm_modulo VALUES (45, 'Gestion de Subempresas', 2, 'Gestión de Subempresas', false);
INSERT INTO adm_modulo VALUES (46, 'Gestion de Sucursales', 2, 'Gestión de Sucursales', false);
INSERT INTO adm_modulo VALUES (47, 'Gestion de Agencias', 2, 'Gestión de Agencias', false);
INSERT INTO adm_modulo VALUES (48, 'Insertar Empresa', 44, 'Insertar Empresa', true);
INSERT INTO adm_modulo VALUES (49, 'Listar Empresas', 44, 'Listar Empresas', true);
INSERT INTO adm_modulo VALUES (50, 'Modificar Empresa', 44, 'Modificar Empresa', true);
INSERT INTO adm_modulo VALUES (51, 'Eliminar Empresa', 44, 'Eliminar Empresa', true);
INSERT INTO adm_modulo VALUES (52, 'Insertar SubEmpresa', 45, 'Insertar Subempresa', true);
INSERT INTO adm_modulo VALUES (53, 'Listar SubEmpresas', 45, 'Listar Subempresas', true);
INSERT INTO adm_modulo VALUES (54, 'Modificar SubEmpresa', 45, 'Modificar Subempresa', true);
INSERT INTO adm_modulo VALUES (55, 'Eliminar SubEmpresa', 45, 'Eliminar Subempresa', true);
INSERT INTO adm_modulo VALUES (56, 'Insertar Sucursal', 46, 'Insertar Sucursal', true);
INSERT INTO adm_modulo VALUES (57, 'Listar Sucursales', 46, 'Listar Sucursales', true);
INSERT INTO adm_modulo VALUES (58, 'Modificar Sucursal', 46, 'Modificar Sucursal', true);
INSERT INTO adm_modulo VALUES (59, 'Eliminar Sucursal', 46, 'Eliminar Sucursal', true);
INSERT INTO adm_modulo VALUES (60, 'Insertar Agencia', 47, 'Insertar Agencia', true);
INSERT INTO adm_modulo VALUES (61, 'Listar Agencias', 47, 'Listar Agencias', true);
INSERT INTO adm_modulo VALUES (62, 'Modificar Agencia', 47, 'Modificar Agencia', true);
INSERT INTO adm_modulo VALUES (63, 'Eliminar Agencia', 47, 'Eliminar Agencia', true);
INSERT INTO adm_modulo VALUES (64, 'Contabilidad', 1, 'Contabilidad', false);


--
-- TOC entry 2005 (class 0 OID 18082)
-- Dependencies: 1576
-- Data for Name: cclouds_agencia; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2006 (class 0 OID 18091)
-- Dependencies: 1578
-- Data for Name: cclouds_city; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cclouds_city VALUES (16, 2, 1, 'GUARANDA', 'A');
INSERT INTO cclouds_city VALUES (18, 2, 3, 'CHIMBO', 'A');
INSERT INTO cclouds_city VALUES (19, 2, 4, 'ECHEANDIA', 'A');
INSERT INTO cclouds_city VALUES (20, 2, 5, 'SAN MIGUEL', 'A');
INSERT INTO cclouds_city VALUES (21, 2, 6, 'CALUMA', 'A');
INSERT INTO cclouds_city VALUES (22, 2, 7, 'LAS NAVES', 'A');
INSERT INTO cclouds_city VALUES (23, 3, 1, 'AZOGUES', 'A');
INSERT INTO cclouds_city VALUES (24, 3, 2, 'BIBLIAN', 'A');
INSERT INTO cclouds_city VALUES (25, 3, 3, 'CAAR', 'A');
INSERT INTO cclouds_city VALUES (26, 3, 4, 'LA TRONCAL', 'A');
INSERT INTO cclouds_city VALUES (27, 3, 5, 'EL TAMBO', 'A');
INSERT INTO cclouds_city VALUES (28, 3, 6, 'DELEG', 'A');
INSERT INTO cclouds_city VALUES (29, 3, 7, 'SUSCAL', 'A');
INSERT INTO cclouds_city VALUES (30, 4, 1, 'TULCAN', 'A');
INSERT INTO cclouds_city VALUES (31, 4, 2, 'BOLIVAR', 'A');
INSERT INTO cclouds_city VALUES (32, 4, 3, 'ESPEJO', 'A');
INSERT INTO cclouds_city VALUES (33, 4, 4, 'MIRA', 'A');
INSERT INTO cclouds_city VALUES (34, 4, 5, 'MONTUFAR', 'A');
INSERT INTO cclouds_city VALUES (35, 4, 6, 'SAN PEDRO DE HUACA', 'A');
INSERT INTO cclouds_city VALUES (36, 5, 1, 'LATACUNGA', 'A');
INSERT INTO cclouds_city VALUES (37, 5, 2, 'LA MANA', 'A');
INSERT INTO cclouds_city VALUES (38, 5, 3, 'PANGUA', 'A');
INSERT INTO cclouds_city VALUES (39, 5, 4, 'PUJILI', 'A');
INSERT INTO cclouds_city VALUES (40, 5, 5, 'SALCEDO', 'A');
INSERT INTO cclouds_city VALUES (41, 5, 6, 'SAQUISILI', 'A');
INSERT INTO cclouds_city VALUES (42, 5, 7, 'SIGCHOS', 'A');
INSERT INTO cclouds_city VALUES (43, 6, 1, 'RIOBAMBA', 'A');
INSERT INTO cclouds_city VALUES (44, 6, 2, 'ALAUSI', 'A');
INSERT INTO cclouds_city VALUES (45, 6, 3, 'COLTA', 'A');
INSERT INTO cclouds_city VALUES (46, 6, 4, 'CHAMBO', 'A');
INSERT INTO cclouds_city VALUES (47, 6, 5, 'CHUNCHI', 'A');
INSERT INTO cclouds_city VALUES (48, 6, 6, 'GUAMOTE', 'A');
INSERT INTO cclouds_city VALUES (49, 6, 7, 'GUANO', 'A');
INSERT INTO cclouds_city VALUES (50, 6, 8, 'PALLATANGA', 'A');
INSERT INTO cclouds_city VALUES (51, 6, 9, 'PENIPE', 'A');
INSERT INTO cclouds_city VALUES (52, 6, 10, 'CUMANDA', 'A');
INSERT INTO cclouds_city VALUES (53, 7, 1, 'MACHALA', 'A');
INSERT INTO cclouds_city VALUES (54, 7, 2, 'ARENILLAS', 'A');
INSERT INTO cclouds_city VALUES (55, 7, 3, 'ATAHUALPA', 'A');
INSERT INTO cclouds_city VALUES (56, 7, 4, 'BALSAS', 'A');
INSERT INTO cclouds_city VALUES (57, 7, 5, 'CHILLA', 'A');
INSERT INTO cclouds_city VALUES (58, 7, 6, 'EL GUABO', 'A');
INSERT INTO cclouds_city VALUES (59, 7, 7, 'HUAQUILLAS', 'A');
INSERT INTO cclouds_city VALUES (60, 7, 8, 'MARCABELI', 'A');
INSERT INTO cclouds_city VALUES (61, 7, 9, 'PASAJE', 'A');
INSERT INTO cclouds_city VALUES (62, 7, 10, 'PIAS', 'A');
INSERT INTO cclouds_city VALUES (63, 7, 11, 'PORTOVELO', 'A');
INSERT INTO cclouds_city VALUES (64, 7, 12, 'SANTA ROSA', 'A');
INSERT INTO cclouds_city VALUES (65, 7, 13, 'ZARUMA', 'A');
INSERT INTO cclouds_city VALUES (66, 7, 14, 'LAS LAJAS', 'A');
INSERT INTO cclouds_city VALUES (67, 8, 1, 'ESMERALDAS', 'A');
INSERT INTO cclouds_city VALUES (68, 8, 2, 'ELOY ALFARO', 'A');
INSERT INTO cclouds_city VALUES (69, 8, 3, 'MUISNE', 'A');
INSERT INTO cclouds_city VALUES (70, 8, 4, 'QUININDE', 'A');
INSERT INTO cclouds_city VALUES (71, 8, 5, 'SAN LORENZO', 'A');
INSERT INTO cclouds_city VALUES (72, 8, 6, 'ATACAMES', 'A');
INSERT INTO cclouds_city VALUES (73, 8, 7, 'RIOVERDE', 'A');
INSERT INTO cclouds_city VALUES (74, 8, 8, 'LA CONCORDIA', 'A');
INSERT INTO cclouds_city VALUES (75, 9, 1, 'GUAYAQUIL', 'A');
INSERT INTO cclouds_city VALUES (76, 9, 2, 'ALFREDO BAQUERIZO MORENO', 'A');
INSERT INTO cclouds_city VALUES (77, 9, 3, 'BALAO', 'A');
INSERT INTO cclouds_city VALUES (78, 9, 4, 'BALZAR', 'A');
INSERT INTO cclouds_city VALUES (79, 9, 5, 'COLIMES', 'A');
INSERT INTO cclouds_city VALUES (80, 9, 6, 'DAULE', 'A');
INSERT INTO cclouds_city VALUES (81, 9, 7, 'DURAN', 'A');
INSERT INTO cclouds_city VALUES (82, 9, 8, 'EL EMPALME', 'A');
INSERT INTO cclouds_city VALUES (83, 9, 9, 'EL TRIUNFO', 'A');
INSERT INTO cclouds_city VALUES (84, 9, 10, 'MILAGRO', 'A');
INSERT INTO cclouds_city VALUES (85, 9, 11, 'NARANJAL', 'A');
INSERT INTO cclouds_city VALUES (86, 9, 12, 'NARANJITO', 'A');
INSERT INTO cclouds_city VALUES (87, 9, 13, 'PALESTINA', 'A');
INSERT INTO cclouds_city VALUES (88, 9, 14, 'PEDRO CARBO', 'A');
INSERT INTO cclouds_city VALUES (89, 9, 16, 'SAMBORONDON', 'A');
INSERT INTO cclouds_city VALUES (90, 9, 18, 'SANTA LUCIA', 'A');
INSERT INTO cclouds_city VALUES (91, 9, 19, 'SALITRE', 'A');
INSERT INTO cclouds_city VALUES (92, 9, 20, 'SAN JACINTO DE YAGUACHI', 'A');
INSERT INTO cclouds_city VALUES (93, 9, 22, 'SIMON BOLIVAR', 'A');
INSERT INTO cclouds_city VALUES (94, 9, 24, 'LOMAS DE SARGENTILLO', 'A');
INSERT INTO cclouds_city VALUES (95, 9, 25, 'NOBOL', 'A');
INSERT INTO cclouds_city VALUES (96, 9, 27, 'GENERAL ANTONIO ELIZALDE', 'A');
INSERT INTO cclouds_city VALUES (97, 9, 28, 'ISIDRO AYORA', 'A');
INSERT INTO cclouds_city VALUES (98, 10, 1, 'IBARRA', 'A');
INSERT INTO cclouds_city VALUES (99, 10, 2, 'ANTONIO ANTE', 'A');
INSERT INTO cclouds_city VALUES (100, 10, 3, 'COTACACHI', 'A');
INSERT INTO cclouds_city VALUES (101, 10, 4, 'OTAVALO', 'A');
INSERT INTO cclouds_city VALUES (102, 10, 5, 'PIMAMPIRO', 'A');
INSERT INTO cclouds_city VALUES (103, 10, 6, 'SAN MIGUEL DE URCUQUI', 'A');
INSERT INTO cclouds_city VALUES (104, 11, 1, 'LOJA', 'A');
INSERT INTO cclouds_city VALUES (122, 11, 2, 'CALVAS', 'A');
INSERT INTO cclouds_city VALUES (130, 11, 3, 'CATAMAYO', 'A');
INSERT INTO cclouds_city VALUES (136, 11, 4, 'CELICA', 'A');
INSERT INTO cclouds_city VALUES (144, 11, 5, 'CHAGUARPAMBA', 'A');
INSERT INTO cclouds_city VALUES (149, 11, 6, 'ESPINDOLA', 'A');
INSERT INTO cclouds_city VALUES (156, 11, 7, 'GONZANAMA', 'A');
INSERT INTO cclouds_city VALUES (164, 11, 8, 'MACARA', 'A');
INSERT INTO cclouds_city VALUES (170, 11, 9, 'PALTAS', 'A');
INSERT INTO cclouds_city VALUES (171, 11, 10, 'PUYANGO', 'A');
INSERT INTO cclouds_city VALUES (172, 11, 11, 'SARAGURO', 'A');
INSERT INTO cclouds_city VALUES (173, 11, 12, 'SOZORANGA', 'A');
INSERT INTO cclouds_city VALUES (174, 11, 13, 'ZAPOTILLO', 'A');
INSERT INTO cclouds_city VALUES (175, 11, 14, 'PINDAL', 'A');
INSERT INTO cclouds_city VALUES (176, 11, 15, 'QUILANGA', 'A');
INSERT INTO cclouds_city VALUES (177, 11, 16, 'OLMEDO', 'A');
INSERT INTO cclouds_city VALUES (178, 12, 1, 'BABAHOYO', 'A');
INSERT INTO cclouds_city VALUES (188, 12, 2, 'BABA', 'A');
INSERT INTO cclouds_city VALUES (191, 12, 3, 'MONTALVO', 'A');
INSERT INTO cclouds_city VALUES (192, 12, 4, 'PUEBLOVIEJO', 'A');
INSERT INTO cclouds_city VALUES (193, 12, 5, 'QUEVEDO', 'A');
INSERT INTO cclouds_city VALUES (208, 12, 6, 'URDANETA', 'A');
INSERT INTO cclouds_city VALUES (209, 12, 6, 'VENTANAS', 'A');
INSERT INTO cclouds_city VALUES (210, 12, 7, 'VINCES', 'A');
INSERT INTO cclouds_city VALUES (211, 12, 8, 'PALENQUE', 'A');
INSERT INTO cclouds_city VALUES (212, 12, 10, 'BUENA FE', 'A');
INSERT INTO cclouds_city VALUES (213, 12, 11, 'VALENCIA', 'A');
INSERT INTO cclouds_city VALUES (214, 12, 12, 'MOCACHE', 'A');
INSERT INTO cclouds_city VALUES (215, 13, 1, 'PORTOVIEJO', 'A');
INSERT INTO cclouds_city VALUES (229, 13, 2, 'BOLIVAR', 'A');
INSERT INTO cclouds_city VALUES (232, 13, 3, 'CHONE', 'A');
INSERT INTO cclouds_city VALUES (241, 13, 4, 'EL CARMEN', 'A');
INSERT INTO cclouds_city VALUES (245, 13, 5, 'FLAVIO ALFARO', 'A');
INSERT INTO cclouds_city VALUES (247, 13, 6, 'JIPIJAPA', 'A');
INSERT INTO cclouds_city VALUES (260, 13, 7, 'JUNIN', 'A');
INSERT INTO cclouds_city VALUES (261, 13, 8, 'MANTA', 'A');
INSERT INTO cclouds_city VALUES (269, 13, 9, 'MONTECRISTI', 'A');
INSERT INTO cclouds_city VALUES (274, 13, 10, 'PAJAN', 'A');
INSERT INTO cclouds_city VALUES (279, 13, 11, 'PICHINCHA', 'A');
INSERT INTO cclouds_city VALUES (282, 13, 12, 'ROCAFUERTE', 'A');
INSERT INTO cclouds_city VALUES (283, 13, 13, 'SANTA ANA', 'A');
INSERT INTO cclouds_city VALUES (284, 13, 14, 'SUCRE', 'A');
INSERT INTO cclouds_city VALUES (285, 13, 15, 'TOSAGUA', 'A');
INSERT INTO cclouds_city VALUES (286, 13, 16, '24 DE MAYO', 'A');
INSERT INTO cclouds_city VALUES (287, 13, 17, 'PEDERNALES', 'A');
INSERT INTO cclouds_city VALUES (288, 13, 18, 'OLMEDO', 'A');
INSERT INTO cclouds_city VALUES (289, 13, 19, 'PUERTO LOPEZ', 'A');
INSERT INTO cclouds_city VALUES (290, 13, 20, 'JAMA', 'A');
INSERT INTO cclouds_city VALUES (291, 13, 21, 'JARAMIJO', 'A');
INSERT INTO cclouds_city VALUES (292, 13, 22, 'SAN VICENTE', 'A');
INSERT INTO cclouds_city VALUES (293, 14, 1, 'MORONA', 'A');
INSERT INTO cclouds_city VALUES (308, 14, 2, 'GUALAQUIZA', 'A');
INSERT INTO cclouds_city VALUES (318, 14, 3, 'LIMON INDANZA', 'A');
INSERT INTO cclouds_city VALUES (327, 14, 4, 'PALORA', 'A');
INSERT INTO cclouds_city VALUES (332, 14, 5, 'SANTIAGO', 'A');
INSERT INTO cclouds_city VALUES (340, 14, 6, 'SUCUA', 'A');
INSERT INTO cclouds_city VALUES (345, 14, 7, 'HUAMBOYA', 'A');
INSERT INTO cclouds_city VALUES (346, 14, 8, 'SAN JUAN BOSCO', 'A');
INSERT INTO cclouds_city VALUES (347, 14, 9, 'TAISHA', 'A');
INSERT INTO cclouds_city VALUES (348, 14, 10, 'LOGROO', 'A');
INSERT INTO cclouds_city VALUES (349, 14, 11, 'PABLO SEXTO', 'A');
INSERT INTO cclouds_city VALUES (350, 14, 12, 'TIWINTZA', 'A');
INSERT INTO cclouds_city VALUES (351, 15, 1, 'TENA', 'A');
INSERT INTO cclouds_city VALUES (359, 15, 3, 'ARCHIDONA', 'A');
INSERT INTO cclouds_city VALUES (365, 15, 4, 'EL CHACO', 'A');
INSERT INTO cclouds_city VALUES (366, 15, 7, 'QUIJOS', 'A');
INSERT INTO cclouds_city VALUES (367, 15, 9, 'CARLOS JULIO AROSEMENA TOLA', 'A');
INSERT INTO cclouds_city VALUES (368, 16, 1, 'PASTAZA', 'A');
INSERT INTO cclouds_city VALUES (369, 16, 2, 'MERA', 'A');
INSERT INTO cclouds_city VALUES (370, 16, 3, 'SANTA CLARA', 'A');
INSERT INTO cclouds_city VALUES (371, 16, 4, 'ARAJUNO', 'A');
INSERT INTO cclouds_city VALUES (372, 17, 1, 'QUITO', 'A');
INSERT INTO cclouds_city VALUES (373, 17, 2, 'CAYAMBE', 'A');
INSERT INTO cclouds_city VALUES (374, 17, 3, 'MEJIA', 'A');
INSERT INTO cclouds_city VALUES (375, 17, 4, 'PEDRO MONCAYO', 'A');
INSERT INTO cclouds_city VALUES (376, 17, 5, 'RUMIAHUI', 'A');
INSERT INTO cclouds_city VALUES (377, 17, 7, 'SAN MIGUEL DE LOS BANCOS', 'A');
INSERT INTO cclouds_city VALUES (378, 17, 8, 'PEDRO VICENTE MALDONADO', 'A');
INSERT INTO cclouds_city VALUES (379, 17, 9, 'PUERTO QUITO', 'A');
INSERT INTO cclouds_city VALUES (380, 18, 1, 'AMBATO', 'A');
INSERT INTO cclouds_city VALUES (381, 18, 2, 'BAOS DE AGUA SANTA', 'A');
INSERT INTO cclouds_city VALUES (382, 18, 3, 'CEVALLOS', 'A');
INSERT INTO cclouds_city VALUES (383, 18, 4, 'MOCHA', 'A');
INSERT INTO cclouds_city VALUES (384, 18, 5, 'PATATE', 'A');
INSERT INTO cclouds_city VALUES (385, 18, 6, 'QUERO', 'A');
INSERT INTO cclouds_city VALUES (386, 18, 7, 'SAN PEDRO DE PELILEO', 'A');
INSERT INTO cclouds_city VALUES (387, 18, 8, 'SANTIAGO DE PILLARO', 'A');
INSERT INTO cclouds_city VALUES (388, 18, 9, 'TISALEO', 'A');
INSERT INTO cclouds_city VALUES (389, 19, 1, 'ZAMORA', 'A');
INSERT INTO cclouds_city VALUES (390, 19, 2, 'CHINCHIPE', 'A');
INSERT INTO cclouds_city VALUES (391, 19, 3, 'NANGARITZA', 'A');
INSERT INTO cclouds_city VALUES (392, 19, 4, 'YACUAMBI', 'A');
INSERT INTO cclouds_city VALUES (393, 19, 5, 'YANTZAZA', 'A');
INSERT INTO cclouds_city VALUES (394, 19, 6, 'EL PANGUI', 'A');
INSERT INTO cclouds_city VALUES (395, 19, 7, 'CENTINELA DEL CONDOR', 'A');
INSERT INTO cclouds_city VALUES (396, 19, 8, 'PALANDA', 'A');
INSERT INTO cclouds_city VALUES (397, 20, 1, 'SAN CRISTOBAL', 'A');
INSERT INTO cclouds_city VALUES (398, 20, 2, 'ISABELA', 'A');
INSERT INTO cclouds_city VALUES (399, 20, 3, 'SANTA CRUZ', 'A');
INSERT INTO cclouds_city VALUES (400, 21, 1, 'LAGO AGRIO', 'A');
INSERT INTO cclouds_city VALUES (401, 21, 2, 'GONZALO PIZARRO', 'A');
INSERT INTO cclouds_city VALUES (402, 21, 3, 'PUTUMAYO', 'A');
INSERT INTO cclouds_city VALUES (403, 21, 4, 'SHUSHUFINDI', 'A');
INSERT INTO cclouds_city VALUES (404, 21, 5, 'SUCUMBIOS', 'A');
INSERT INTO cclouds_city VALUES (405, 21, 6, 'CASCALES', 'A');
INSERT INTO cclouds_city VALUES (406, 21, 7, 'CUYABENO', 'A');
INSERT INTO cclouds_city VALUES (407, 22, 1, 'ORELLANA', 'A');
INSERT INTO cclouds_city VALUES (408, 22, 2, 'AGUARICO', 'A');
INSERT INTO cclouds_city VALUES (409, 22, 3, 'LA JOYA DE LOS SACHAS', 'A');
INSERT INTO cclouds_city VALUES (410, 22, 4, 'LORETO', 'A');
INSERT INTO cclouds_city VALUES (411, 23, 1, 'SANTO DOMINGO DE LOS COLORADOS', 'A');
INSERT INTO cclouds_city VALUES (412, 24, 1, 'LA LIBERTAD', 'A');
INSERT INTO cclouds_city VALUES (413, 24, 2, 'SALINAS', 'A');
INSERT INTO cclouds_city VALUES (414, 24, 3, 'SANTA ELENA', 'A');
INSERT INTO cclouds_city VALUES (17, 2, 2, 'CHILLANES', 'A');


--
-- TOC entry 2007 (class 0 OID 18098)
-- Dependencies: 1580
-- Data for Name: cclouds_country; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cclouds_country VALUES (1, 'EC', 'ECUADOR', 'EC');


--
-- TOC entry 2008 (class 0 OID 18105)
-- Dependencies: 1582
-- Data for Name: cclouds_empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2009 (class 0 OID 18115)
-- Dependencies: 1584
-- Data for Name: cclouds_exceptios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cclouds_exceptios VALUES (1, '500', 'Internal error', 'creatting user', NULL, NULL);


--
-- TOC entry 2010 (class 0 OID 18124)
-- Dependencies: 1586
-- Data for Name: cclouds_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2011 (class 0 OID 18133)
-- Dependencies: 1588
-- Data for Name: cclouds_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cclouds_menu VALUES (1, 1, 'Gestion de Usuarios');
INSERT INTO cclouds_menu VALUES (2, 1, 'Gestion de Permisos');
INSERT INTO cclouds_menu VALUES (3, 1, 'Gestion de Roles');
INSERT INTO cclouds_menu VALUES (4, 1, 'Gestion de Menu');


--
-- TOC entry 2012 (class 0 OID 18139)
-- Dependencies: 1590
-- Data for Name: cclouds_module; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cclouds_module VALUES (4, 'REPORTES', 'REPORTES');
INSERT INTO cclouds_module VALUES (18, 'CONTABILIDAD', 'CONTABILIDAD');
INSERT INTO cclouds_module VALUES (2, 'FACTURACION', 'FACTURACION');
INSERT INTO cclouds_module VALUES (1, 'ADMINISTRACION', 'ADMINISTRACION');


--
-- TOC entry 2013 (class 0 OID 18145)
-- Dependencies: 1592
-- Data for Name: cclouds_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cclouds_options VALUES (1, 1, 'Adicionar Usuario', NULL);
INSERT INTO cclouds_options VALUES (2, 1, 'Modificar Usuario', NULL);
INSERT INTO cclouds_options VALUES (3, 1, 'Eliminar Usuario', NULL);
INSERT INTO cclouds_options VALUES (4, 2, 'Adicionar Permiso', NULL);
INSERT INTO cclouds_options VALUES (5, 2, 'Modificar Permiso', NULL);
INSERT INTO cclouds_options VALUES (6, 2, 'Eliminar Permiso', NULL);
INSERT INTO cclouds_options VALUES (7, 3, 'Adicionar Rol', NULL);
INSERT INTO cclouds_options VALUES (8, 3, 'Modificar Rol', NULL);
INSERT INTO cclouds_options VALUES (9, 3, 'Eliminar Rol', NULL);
INSERT INTO cclouds_options VALUES (10, 4, 'Adicionar Menu', NULL);
INSERT INTO cclouds_options VALUES (11, 4, 'Modificar Menu', NULL);
INSERT INTO cclouds_options VALUES (12, 4, 'Eliminar Menu', NULL);
INSERT INTO cclouds_options VALUES (13, 4, 'Test Option', 'test_option');


--
-- TOC entry 2014 (class 0 OID 18151)
-- Dependencies: 1594
-- Data for Name: cclouds_parroquia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cclouds_parroquia VALUES (100, 16, 100, 'GUARANDA', 'A');
INSERT INTO cclouds_parroquia VALUES (101, 16, 101, 'ANGEL POLIBIO CHAVES', 'A');
INSERT INTO cclouds_parroquia VALUES (102, 16, 102, 'GABRIEL IGNACIO VEINTIMILLA', 'A');
INSERT INTO cclouds_parroquia VALUES (103, 16, 103, 'GUANUJO', 'A');
INSERT INTO cclouds_parroquia VALUES (104, 16, 104, 'FACUNDO VELA', 'A');
INSERT INTO cclouds_parroquia VALUES (106, 16, 106, 'JULIO E. MORENO', 'A');
INSERT INTO cclouds_parroquia VALUES (107, 16, 107, 'LAS NAVES', 'A');
INSERT INTO cclouds_parroquia VALUES (108, 16, 108, 'SALINAS', 'A');
INSERT INTO cclouds_parroquia VALUES (109, 16, 109, 'SAN LORENZO', 'A');
INSERT INTO cclouds_parroquia VALUES (110, 16, 110, 'SAN SIMON (YACOTO)', 'A');
INSERT INTO cclouds_parroquia VALUES (111, 16, 111, 'SANTAFE (SANTA FE)', 'A');
INSERT INTO cclouds_parroquia VALUES (112, 16, 112, 'SIMIATUG', 'A');
INSERT INTO cclouds_parroquia VALUES (113, 16, 113, 'SAN LUIS DE PAMBIL', 'A');
INSERT INTO cclouds_parroquia VALUES (114, 17, 114, 'CHILLANES', 'A');
INSERT INTO cclouds_parroquia VALUES (115, 17, 115, 'SAN JOSE DEL TAMBO', 'A');
INSERT INTO cclouds_parroquia VALUES (116, 18, 116, 'SAN JOSE DE CHIMBO', 'A');
INSERT INTO cclouds_parroquia VALUES (117, 18, 117, 'ASUNCION (ASANCOTO)', 'A');
INSERT INTO cclouds_parroquia VALUES (118, 18, 118, 'CALUMA', 'A');
INSERT INTO cclouds_parroquia VALUES (119, 18, 119, 'MAGDALENA (CHAPACOTO)', 'A');
INSERT INTO cclouds_parroquia VALUES (120, 18, 120, 'SAN SEBASTIAN', 'A');
INSERT INTO cclouds_parroquia VALUES (121, 18, 121, 'TELIMBELA', 'A');
INSERT INTO cclouds_parroquia VALUES (122, 19, 122, 'ECHEANDIA', 'A');
INSERT INTO cclouds_parroquia VALUES (123, 20, 123, 'BALSAPAMBA', 'A');
INSERT INTO cclouds_parroquia VALUES (124, 20, 124, 'BILOVAN', 'A');
INSERT INTO cclouds_parroquia VALUES (125, 20, 125, 'REGULO DE MORA', 'A');
INSERT INTO cclouds_parroquia VALUES (126, 20, 126, 'SAN PABLO', 'A');
INSERT INTO cclouds_parroquia VALUES (127, 20, 127, 'SANTIAGO', 'A');
INSERT INTO cclouds_parroquia VALUES (128, 20, 128, 'SAN VICENTE', 'A');
INSERT INTO cclouds_parroquia VALUES (129, 21, 129, 'CALUMA', 'A');
INSERT INTO cclouds_parroquia VALUES (130, 22, 130, 'LAS NAVES', 'A');
INSERT INTO cclouds_parroquia VALUES (131, 22, 131, 'LAS MERCEDES', 'A');
INSERT INTO cclouds_parroquia VALUES (132, 22, 132, 'LAS NAVES. R', 'A');
INSERT INTO cclouds_parroquia VALUES (133, 23, 133, 'AZOGUES', 'A');
INSERT INTO cclouds_parroquia VALUES (134, 23, 134, 'AURELIO BAYAS MARTINEZ', 'A');
INSERT INTO cclouds_parroquia VALUES (136, 23, 136, 'BORRERO', 'A');
INSERT INTO cclouds_parroquia VALUES (137, 23, 137, 'SAN FRANCISCO', 'A');
INSERT INTO cclouds_parroquia VALUES (138, 23, 138, 'COJITAMBO', 'A');
INSERT INTO cclouds_parroquia VALUES (139, 23, 139, 'DELEG', 'A');
INSERT INTO cclouds_parroquia VALUES (140, 23, 140, 'GUAPAN', 'A');
INSERT INTO cclouds_parroquia VALUES (141, 23, 141, 'JAVIER LOYOLA (CHUQUIPATA)', 'A');
INSERT INTO cclouds_parroquia VALUES (142, 23, 142, 'LUIS CORDERO', 'A');
INSERT INTO cclouds_parroquia VALUES (143, 23, 143, 'PINDILIG', 'A');
INSERT INTO cclouds_parroquia VALUES (144, 23, 144, 'RIVERA', 'A');
INSERT INTO cclouds_parroquia VALUES (145, 23, 145, 'SAN MIGUEL', 'A');
INSERT INTO cclouds_parroquia VALUES (146, 23, 146, 'SOLANO', 'A');
INSERT INTO cclouds_parroquia VALUES (147, 23, 147, 'TADAY', 'A');
INSERT INTO cclouds_parroquia VALUES (148, 24, 148, 'BIBLIAN', 'A');
INSERT INTO cclouds_parroquia VALUES (149, 24, 149, 'NAZON', 'A');
INSERT INTO cclouds_parroquia VALUES (150, 24, 150, 'SAN FRANCISCO DE SAGEO', 'A');
INSERT INTO cclouds_parroquia VALUES (151, 24, 151, 'TURUPAMBA', 'A');
INSERT INTO cclouds_parroquia VALUES (152, 24, 152, 'JERUSALEN', 'A');
INSERT INTO cclouds_parroquia VALUES (153, 25, 153, 'CHONTAMARCA', 'A');
INSERT INTO cclouds_parroquia VALUES (154, 25, 154, 'CHOROCOPTE', 'A');
INSERT INTO cclouds_parroquia VALUES (155, 25, 155, 'GENERAL MORALES (SOCARTE)', 'A');
INSERT INTO cclouds_parroquia VALUES (156, 25, 156, 'GUALLETURO', 'A');
INSERT INTO cclouds_parroquia VALUES (157, 25, 157, 'HONORATO VASQUEZ (TAMBO VIEJO)', 'A');
INSERT INTO cclouds_parroquia VALUES (158, 25, 158, 'INGAPIRCA', 'A');
INSERT INTO cclouds_parroquia VALUES (159, 25, 159, 'JUNCAL', 'A');
INSERT INTO cclouds_parroquia VALUES (160, 25, 160, 'SAN ANTONIO', 'A');
INSERT INTO cclouds_parroquia VALUES (161, 25, 161, 'SUSCAL', 'A');
INSERT INTO cclouds_parroquia VALUES (162, 25, 162, 'TAMBO', 'A');
INSERT INTO cclouds_parroquia VALUES (163, 25, 163, 'ZHUD', 'A');
INSERT INTO cclouds_parroquia VALUES (164, 25, 164, 'VENTURA', 'A');
INSERT INTO cclouds_parroquia VALUES (165, 25, 165, 'DUCUR', 'A');
INSERT INTO cclouds_parroquia VALUES (166, 26, 166, 'LA TRONCAL', 'A');
INSERT INTO cclouds_parroquia VALUES (167, 26, 167, 'MANUEL J. CALLE', 'A');
INSERT INTO cclouds_parroquia VALUES (168, 26, 168, 'PANCHO NEGRO', 'A');
INSERT INTO cclouds_parroquia VALUES (169, 27, 169, 'EL TAMBO', 'A');
INSERT INTO cclouds_parroquia VALUES (170, 28, 170, 'DELEG', 'A');
INSERT INTO cclouds_parroquia VALUES (171, 28, 171, 'SOLANO', 'A');
INSERT INTO cclouds_parroquia VALUES (172, 29, 172, 'SUSCAL', 'A');
INSERT INTO cclouds_parroquia VALUES (173, 30, 173, 'TULCAN', 'A');
INSERT INTO cclouds_parroquia VALUES (174, 30, 174, 'GONZALEZ SUAREZ', 'A');
INSERT INTO cclouds_parroquia VALUES (176, 30, 176, 'EL CARMELO (EL PUN)', 'A');
INSERT INTO cclouds_parroquia VALUES (177, 30, 177, 'HUACA', 'A');
INSERT INTO cclouds_parroquia VALUES (178, 30, 178, 'JULIO ANDRADE (OREJUELA)', 'A');
INSERT INTO cclouds_parroquia VALUES (179, 30, 179, 'MALDONADO', 'A');
INSERT INTO cclouds_parroquia VALUES (180, 30, 180, 'PIOTER', 'A');
INSERT INTO cclouds_parroquia VALUES (181, 30, 181, 'TOBAR DONOSO', 'A');
INSERT INTO cclouds_parroquia VALUES (182, 30, 182, 'TUFIO', 'A');
INSERT INTO cclouds_parroquia VALUES (183, 30, 183, 'URBINA (TAYA)', 'A');
INSERT INTO cclouds_parroquia VALUES (184, 30, 184, 'EL CHICAL', 'A');
INSERT INTO cclouds_parroquia VALUES (185, 30, 185, 'MARISCAL SUCRE', 'A');
INSERT INTO cclouds_parroquia VALUES (186, 30, 186, 'SANTA MARTHA DE CUBA', 'A');
INSERT INTO cclouds_parroquia VALUES (187, 31, 187, 'BOLIVAR', 'A');
INSERT INTO cclouds_parroquia VALUES (188, 31, 188, 'GARCIA MORENO', 'A');
INSERT INTO cclouds_parroquia VALUES (189, 31, 189, 'LOS ANDES', 'A');
INSERT INTO cclouds_parroquia VALUES (190, 31, 190, 'MONTE OLIVO', 'A');
INSERT INTO cclouds_parroquia VALUES (191, 31, 191, 'SAN VICENTE DE PUSIR', 'A');
INSERT INTO cclouds_parroquia VALUES (192, 31, 192, 'SAN RAFAEL', 'A');
INSERT INTO cclouds_parroquia VALUES (193, 32, 193, 'EL ANGEL', 'A');
INSERT INTO cclouds_parroquia VALUES (194, 32, 194, '27 DE SEPTIEMBRE', 'A');
INSERT INTO cclouds_parroquia VALUES (195, 32, 195, 'EL GOALTAL', 'A');
INSERT INTO cclouds_parroquia VALUES (196, 32, 196, 'LA LIBERTAD (ALIZO)', 'A');
INSERT INTO cclouds_parroquia VALUES (197, 32, 197, 'SAN ISIDRO', 'A');
INSERT INTO cclouds_parroquia VALUES (198, 33, 198, 'MIRA', 'A');
INSERT INTO cclouds_parroquia VALUES (199, 33, 199, 'CONCEPCION', 'A');
INSERT INTO cclouds_parroquia VALUES (200, 33, 200, 'JIJON Y CAAMAO', 'A');
INSERT INTO cclouds_parroquia VALUES (201, 33, 201, 'JUAN MONTALVO', 'A');
INSERT INTO cclouds_parroquia VALUES (202, 34, 202, 'SAN GABRIEL', 'A');
INSERT INTO cclouds_parroquia VALUES (203, 34, 203, 'GONZALEZ SUAREZ', 'A');
INSERT INTO cclouds_parroquia VALUES (204, 34, 204, 'SAN JOSE', 'A');
INSERT INTO cclouds_parroquia VALUES (205, 34, 205, 'CRISTOBAL COLON', 'A');
INSERT INTO cclouds_parroquia VALUES (206, 34, 206, 'CHITAN DE NAVARRETE', 'A');
INSERT INTO cclouds_parroquia VALUES (207, 34, 207, 'FERNANDEZ SALVADOR', 'A');
INSERT INTO cclouds_parroquia VALUES (208, 34, 208, 'LA PAZ', 'A');
INSERT INTO cclouds_parroquia VALUES (209, 34, 209, 'PIARTAL', 'A');
INSERT INTO cclouds_parroquia VALUES (210, 35, 210, 'HUACA', 'A');
INSERT INTO cclouds_parroquia VALUES (211, 35, 211, 'MARISCAL SUCRE', 'A');
INSERT INTO cclouds_parroquia VALUES (212, 36, 212, 'LATACUNGA', 'A');
INSERT INTO cclouds_parroquia VALUES (213, 36, 213, 'ELOY ALFARO  (SAN FELIPE)', 'A');
INSERT INTO cclouds_parroquia VALUES (214, 36, 214, 'IGNACIO FLORES (PARQUE FLORES)', 'A');
INSERT INTO cclouds_parroquia VALUES (215, 36, 215, 'JUAN MONTALVO (SAN SEBASTIAN)', 'A');
INSERT INTO cclouds_parroquia VALUES (216, 36, 216, 'LA MATRIZ', 'A');
INSERT INTO cclouds_parroquia VALUES (217, 36, 217, 'SAN BUENAVENTURA', 'A');
INSERT INTO cclouds_parroquia VALUES (218, 36, 218, 'ALAQUES (ALAQUEZ)', 'A');
INSERT INTO cclouds_parroquia VALUES (219, 36, 219, 'BELISARIO QUEVEDO (GUANAILIN)', 'A');
INSERT INTO cclouds_parroquia VALUES (220, 36, 220, 'GUAITACAMA (GUAYTACAMA)', 'A');
INSERT INTO cclouds_parroquia VALUES (221, 36, 221, 'JOSEGUANGO BAJO', 'A');
INSERT INTO cclouds_parroquia VALUES (222, 36, 222, 'LAS PAMPAS', 'A');
INSERT INTO cclouds_parroquia VALUES (223, 36, 223, 'MULALO', 'A');
INSERT INTO cclouds_parroquia VALUES (224, 36, 224, '11 DE NOVIEMBRE (ILINCHISI)', 'A');
INSERT INTO cclouds_parroquia VALUES (225, 36, 225, 'POALO', 'A');
INSERT INTO cclouds_parroquia VALUES (226, 36, 226, 'SAN JUAN DE PASTOCALLE', 'A');
INSERT INTO cclouds_parroquia VALUES (227, 36, 227, 'SIGCHOS', 'A');
INSERT INTO cclouds_parroquia VALUES (228, 36, 228, 'TANICUCHI', 'A');
INSERT INTO cclouds_parroquia VALUES (229, 36, 229, 'TOACASO', 'A');
INSERT INTO cclouds_parroquia VALUES (230, 36, 230, 'PALO QUEMADO', 'A');
INSERT INTO cclouds_parroquia VALUES (231, 37, 231, 'LA MANA', 'A');
INSERT INTO cclouds_parroquia VALUES (232, 37, 232, 'EL CARMEN', 'A');
INSERT INTO cclouds_parroquia VALUES (233, 37, 233, 'GUASAGANDA', 'A');
INSERT INTO cclouds_parroquia VALUES (234, 37, 234, 'PUCAYACU', 'A');
INSERT INTO cclouds_parroquia VALUES (235, 38, 235, 'EL CORAZON', 'A');
INSERT INTO cclouds_parroquia VALUES (236, 38, 236, 'MORASPUNGO', 'A');
INSERT INTO cclouds_parroquia VALUES (237, 38, 237, 'PINLLOPATA', 'A');
INSERT INTO cclouds_parroquia VALUES (238, 38, 238, 'RAMON CAMPAA', 'A');
INSERT INTO cclouds_parroquia VALUES (239, 39, 239, 'PUJILI', 'A');
INSERT INTO cclouds_parroquia VALUES (240, 39, 240, 'ANGAMARCA', 'A');
INSERT INTO cclouds_parroquia VALUES (241, 39, 241, 'CHUCCHILAN (CHUGCHILAN)', 'A');
INSERT INTO cclouds_parroquia VALUES (242, 39, 242, 'GUANGAJE', 'A');
INSERT INTO cclouds_parroquia VALUES (243, 39, 243, 'ISINLIBI', 'A');
INSERT INTO cclouds_parroquia VALUES (244, 39, 244, 'LA VICTORIA', 'A');
INSERT INTO cclouds_parroquia VALUES (245, 39, 245, 'PILALO', 'A');
INSERT INTO cclouds_parroquia VALUES (246, 39, 246, 'TINGO', 'A');
INSERT INTO cclouds_parroquia VALUES (247, 39, 247, 'ZUMBAHUA', 'A');
INSERT INTO cclouds_parroquia VALUES (248, 40, 248, 'SAN MIGUEL DE SALCEDO', 'A');
INSERT INTO cclouds_parroquia VALUES (249, 40, 249, 'ANTONIO JOSE HOLGUIN', 'A');
INSERT INTO cclouds_parroquia VALUES (250, 40, 250, 'CUSUBAMBA', 'A');
INSERT INTO cclouds_parroquia VALUES (251, 40, 251, 'MULALILLO', 'A');
INSERT INTO cclouds_parroquia VALUES (252, 40, 252, 'MULLIQUINDIL', 'A');
INSERT INTO cclouds_parroquia VALUES (253, 40, 253, 'PANSALEO', 'A');
INSERT INTO cclouds_parroquia VALUES (254, 41, 254, 'SAQUISILI', 'A');
INSERT INTO cclouds_parroquia VALUES (255, 41, 255, 'CANCHAGUA', 'A');
INSERT INTO cclouds_parroquia VALUES (256, 41, 256, 'CHANTILIN', 'A');
INSERT INTO cclouds_parroquia VALUES (257, 41, 257, 'COCHAPAMBA', 'A');
INSERT INTO cclouds_parroquia VALUES (258, 42, 258, 'SIGCHOS', 'A');
INSERT INTO cclouds_parroquia VALUES (259, 42, 259, 'CHUGCHILLAN', 'A');
INSERT INTO cclouds_parroquia VALUES (260, 42, 260, 'ISINLIVI', 'A');
INSERT INTO cclouds_parroquia VALUES (261, 42, 261, 'LAS PAMPAS', 'A');
INSERT INTO cclouds_parroquia VALUES (262, 42, 262, 'PALO QUEMADO', 'A');
INSERT INTO cclouds_parroquia VALUES (263, 43, 263, 'RIOBAMBA', 'A');
INSERT INTO cclouds_parroquia VALUES (264, 43, 264, 'LIZARZABURU', 'A');
INSERT INTO cclouds_parroquia VALUES (265, 43, 265, 'MALDONADO', 'A');
INSERT INTO cclouds_parroquia VALUES (266, 43, 266, 'VELASCO', 'A');
INSERT INTO cclouds_parroquia VALUES (267, 43, 267, 'VELOZ', 'A');
INSERT INTO cclouds_parroquia VALUES (268, 43, 268, 'YARUQUIES', 'A');
INSERT INTO cclouds_parroquia VALUES (269, 43, 269, 'LICAN', 'A');
INSERT INTO cclouds_parroquia VALUES (270, 43, 270, 'CACHA', 'A');
INSERT INTO cclouds_parroquia VALUES (271, 43, 271, 'CALPI', 'A');
INSERT INTO cclouds_parroquia VALUES (272, 43, 272, 'CUBIJIES', 'A');
INSERT INTO cclouds_parroquia VALUES (273, 43, 273, 'FLORES', 'A');
INSERT INTO cclouds_parroquia VALUES (275, 43, 275, 'LICTO', 'A');
INSERT INTO cclouds_parroquia VALUES (276, 43, 276, 'PUNGALA', 'A');
INSERT INTO cclouds_parroquia VALUES (277, 43, 277, 'PUNIN', 'A');
INSERT INTO cclouds_parroquia VALUES (278, 43, 278, 'QUIMIAG', 'A');
INSERT INTO cclouds_parroquia VALUES (279, 43, 279, 'SAN JUAN', 'A');
INSERT INTO cclouds_parroquia VALUES (280, 43, 280, 'SAN LUIS', 'A');
INSERT INTO cclouds_parroquia VALUES (281, 44, 281, 'ALAUSI', 'A');
INSERT INTO cclouds_parroquia VALUES (282, 44, 282, 'ACHUPALLAS', 'A');
INSERT INTO cclouds_parroquia VALUES (283, 44, 283, 'CUMANDA', 'A');
INSERT INTO cclouds_parroquia VALUES (284, 44, 284, 'GUASUNTOS', 'A');
INSERT INTO cclouds_parroquia VALUES (285, 44, 285, 'HUIGRA', 'A');
INSERT INTO cclouds_parroquia VALUES (286, 44, 286, 'MULTITUD', 'A');
INSERT INTO cclouds_parroquia VALUES (287, 44, 287, 'PISTISHI (NARIZ DEL DIABLO)', 'A');
INSERT INTO cclouds_parroquia VALUES (288, 44, 288, 'PUMALLACTA', 'A');
INSERT INTO cclouds_parroquia VALUES (289, 44, 289, 'SEVILLA', 'A');
INSERT INTO cclouds_parroquia VALUES (290, 44, 290, 'SIBAMBE', 'A');
INSERT INTO cclouds_parroquia VALUES (291, 44, 291, 'TIXAN', 'A');
INSERT INTO cclouds_parroquia VALUES (292, 45, 292, 'VILLA LA UNION', 'A');
INSERT INTO cclouds_parroquia VALUES (293, 45, 293, 'CAJABAMBA', 'A');
INSERT INTO cclouds_parroquia VALUES (294, 45, 294, 'SICALPA', 'A');
INSERT INTO cclouds_parroquia VALUES (295, 45, 295, 'CAI', 'A');
INSERT INTO cclouds_parroquia VALUES (296, 45, 296, 'COLUMBE', 'A');
INSERT INTO cclouds_parroquia VALUES (297, 45, 297, 'JUAN DE VELASCO', 'A');
INSERT INTO cclouds_parroquia VALUES (298, 45, 298, 'SANTIAGO DE QUITO', 'A');
INSERT INTO cclouds_parroquia VALUES (299, 46, 299, 'CHAMBO', 'A');
INSERT INTO cclouds_parroquia VALUES (300, 47, 300, 'CHUNCHI', 'A');
INSERT INTO cclouds_parroquia VALUES (301, 47, 301, 'CAPZOL', 'A');
INSERT INTO cclouds_parroquia VALUES (302, 47, 302, 'COMPUD', 'A');
INSERT INTO cclouds_parroquia VALUES (303, 47, 303, 'GONZOL', 'A');
INSERT INTO cclouds_parroquia VALUES (304, 47, 304, 'LLAGOS', 'A');
INSERT INTO cclouds_parroquia VALUES (305, 48, 305, 'GUAMOTE', 'A');
INSERT INTO cclouds_parroquia VALUES (306, 48, 306, 'CEBADAS', 'A');
INSERT INTO cclouds_parroquia VALUES (307, 48, 307, 'PALMIRA', 'A');
INSERT INTO cclouds_parroquia VALUES (308, 49, 308, 'GUANO', 'A');
INSERT INTO cclouds_parroquia VALUES (309, 49, 309, 'EL ROSARIO', 'A');
INSERT INTO cclouds_parroquia VALUES (310, 49, 310, 'LA MATRIZ', 'A');
INSERT INTO cclouds_parroquia VALUES (311, 49, 311, 'GUANANDO', 'A');
INSERT INTO cclouds_parroquia VALUES (312, 49, 312, 'ILAPO', 'A');
INSERT INTO cclouds_parroquia VALUES (313, 49, 313, 'LA PROVIDENCIA', 'A');
INSERT INTO cclouds_parroquia VALUES (314, 49, 314, 'SAN ANDRES', 'A');
INSERT INTO cclouds_parroquia VALUES (315, 49, 315, 'SAN GERARDO DE PACAICAGUAN', 'A');
INSERT INTO cclouds_parroquia VALUES (316, 49, 316, 'SAN ISIDRO DE PATULU', 'A');
INSERT INTO cclouds_parroquia VALUES (317, 49, 317, 'SAN JOSE DEL CHAZO', 'A');
INSERT INTO cclouds_parroquia VALUES (318, 49, 318, 'SANTA FE DE GALAN', 'A');
INSERT INTO cclouds_parroquia VALUES (319, 49, 319, 'VALPARAISO', 'A');
INSERT INTO cclouds_parroquia VALUES (320, 50, 320, 'PALLATANGA', 'A');
INSERT INTO cclouds_parroquia VALUES (321, 51, 321, 'PENIPE', 'A');
INSERT INTO cclouds_parroquia VALUES (322, 51, 322, 'EL ALTAR', 'A');
INSERT INTO cclouds_parroquia VALUES (323, 51, 323, 'MATUS', 'A');
INSERT INTO cclouds_parroquia VALUES (324, 51, 324, 'PUELA', 'A');
INSERT INTO cclouds_parroquia VALUES (325, 51, 325, 'SAN ANTONIO DE BAYUSHIG', 'A');
INSERT INTO cclouds_parroquia VALUES (326, 51, 326, 'LA CANDELARIA', 'A');
INSERT INTO cclouds_parroquia VALUES (327, 51, 327, 'BILBAO', 'A');
INSERT INTO cclouds_parroquia VALUES (328, 52, 328, 'CUMANDA', 'A');
INSERT INTO cclouds_parroquia VALUES (329, 53, 329, 'MACHALA', 'A');
INSERT INTO cclouds_parroquia VALUES (330, 53, 330, 'LA PROVIDENCIA', 'A');
INSERT INTO cclouds_parroquia VALUES (332, 53, 332, 'PUERTO BOLIVAR', 'A');
INSERT INTO cclouds_parroquia VALUES (333, 53, 333, 'NUEVE DE MAYO', 'A');
INSERT INTO cclouds_parroquia VALUES (334, 53, 334, 'EL CAMBIO', 'A');
INSERT INTO cclouds_parroquia VALUES (336, 53, 336, 'EL RETIRO', 'A');
INSERT INTO cclouds_parroquia VALUES (337, 54, 337, 'ARENILLAS', 'A');
INSERT INTO cclouds_parroquia VALUES (338, 54, 338, 'CHACRAS', 'A');
INSERT INTO cclouds_parroquia VALUES (339, 54, 339, 'LA LIBERTAD', 'A');
INSERT INTO cclouds_parroquia VALUES (340, 54, 340, 'LAS LAJAS', 'A');
INSERT INTO cclouds_parroquia VALUES (341, 54, 341, 'PALMALES', 'A');
INSERT INTO cclouds_parroquia VALUES (342, 54, 342, 'CARCABON', 'A');
INSERT INTO cclouds_parroquia VALUES (343, 55, 343, 'PACCHA', 'A');
INSERT INTO cclouds_parroquia VALUES (344, 55, 344, 'AYAPAMBA', 'A');
INSERT INTO cclouds_parroquia VALUES (345, 55, 345, 'CORDONCILLO', 'A');
INSERT INTO cclouds_parroquia VALUES (346, 55, 346, 'MILAGRO', 'A');
INSERT INTO cclouds_parroquia VALUES (347, 55, 347, 'SAN JOSE', 'A');
INSERT INTO cclouds_parroquia VALUES (348, 55, 348, 'SAN JUAN DE CERRO AZUL', 'A');
INSERT INTO cclouds_parroquia VALUES (349, 56, 349, 'BALSAS', 'A');
INSERT INTO cclouds_parroquia VALUES (350, 56, 350, 'BELLAMARIA', 'A');
INSERT INTO cclouds_parroquia VALUES (351, 57, 351, 'CHILLA', 'A');
INSERT INTO cclouds_parroquia VALUES (352, 58, 352, 'EL GUABO', 'A');
INSERT INTO cclouds_parroquia VALUES (353, 58, 353, 'BARBONES', 'A');
INSERT INTO cclouds_parroquia VALUES (354, 58, 354, 'LA IBERIA', 'A');
INSERT INTO cclouds_parroquia VALUES (355, 58, 355, 'TENDALES', 'A');
INSERT INTO cclouds_parroquia VALUES (356, 58, 356, 'RIO BONITO', 'A');
INSERT INTO cclouds_parroquia VALUES (357, 59, 357, 'HUAQUILLAS', 'A');
INSERT INTO cclouds_parroquia VALUES (358, 59, 358, 'ECUADOR', 'A');
INSERT INTO cclouds_parroquia VALUES (359, 59, 359, 'EL PARAISO', 'A');
INSERT INTO cclouds_parroquia VALUES (360, 59, 360, 'HUALTACO', 'A');
INSERT INTO cclouds_parroquia VALUES (361, 59, 361, 'MILTON REYES', 'A');
INSERT INTO cclouds_parroquia VALUES (362, 59, 362, 'UNION LOJANA', 'A');
INSERT INTO cclouds_parroquia VALUES (363, 60, 363, 'MARCABELI', 'A');
INSERT INTO cclouds_parroquia VALUES (364, 60, 364, 'EL INGENIO', 'A');
INSERT INTO cclouds_parroquia VALUES (365, 61, 365, 'BOLIVAR', 'A');
INSERT INTO cclouds_parroquia VALUES (366, 61, 366, 'LOMA DE FRANCO', 'A');
INSERT INTO cclouds_parroquia VALUES (367, 61, 367, 'OCHOA LEON', 'A');
INSERT INTO cclouds_parroquia VALUES (368, 61, 368, 'TRES CERRITOS', 'A');
INSERT INTO cclouds_parroquia VALUES (369, 61, 369, 'BUENAVISTA', 'A');
INSERT INTO cclouds_parroquia VALUES (370, 61, 370, 'CASACAY', 'A');
INSERT INTO cclouds_parroquia VALUES (371, 61, 371, 'LA PEAA', 'A');
INSERT INTO cclouds_parroquia VALUES (372, 61, 372, 'PROGRESO', 'A');
INSERT INTO cclouds_parroquia VALUES (373, 61, 373, 'UZHCURRUMI', 'A');
INSERT INTO cclouds_parroquia VALUES (374, 61, 374, 'CAAQUEMADA', 'A');
INSERT INTO cclouds_parroquia VALUES (375, 62, 375, 'PIAS', 'A');
INSERT INTO cclouds_parroquia VALUES (376, 62, 376, 'LA MATRIZ', 'A');
INSERT INTO cclouds_parroquia VALUES (377, 62, 377, 'LA SUSAYA', 'A');
INSERT INTO cclouds_parroquia VALUES (378, 62, 378, 'PIAS GRANDE', 'A');
INSERT INTO cclouds_parroquia VALUES (379, 62, 379, 'CAPIRO', 'A');
INSERT INTO cclouds_parroquia VALUES (380, 62, 380, 'LA BOCANA', 'A');
INSERT INTO cclouds_parroquia VALUES (381, 62, 381, 'MOROMORO', 'A');
INSERT INTO cclouds_parroquia VALUES (382, 62, 382, 'PIEDRAS', 'A');
INSERT INTO cclouds_parroquia VALUES (383, 62, 383, 'SAN ROQUE (AMBROSIO MALDONADO)', 'A');
INSERT INTO cclouds_parroquia VALUES (384, 62, 384, 'SARACAY', 'A');
INSERT INTO cclouds_parroquia VALUES (385, 63, 385, 'PORTOVELO', 'A');
INSERT INTO cclouds_parroquia VALUES (386, 63, 386, 'CURTINCAPA', 'A');
INSERT INTO cclouds_parroquia VALUES (387, 63, 387, 'MORALES', 'A');
INSERT INTO cclouds_parroquia VALUES (388, 63, 388, 'SALATI', 'A');
INSERT INTO cclouds_parroquia VALUES (389, 64, 389, 'SANTA ROSA', 'A');
INSERT INTO cclouds_parroquia VALUES (390, 64, 390, 'PUERTO JELI', 'A');
INSERT INTO cclouds_parroquia VALUES (391, 64, 391, 'NUEVO SANTA ROSA', 'A');
INSERT INTO cclouds_parroquia VALUES (392, 64, 392, 'BELLAVISTA', 'A');
INSERT INTO cclouds_parroquia VALUES (393, 64, 393, 'JAMBELI', 'A');
INSERT INTO cclouds_parroquia VALUES (394, 64, 394, 'LA AVANZADA', 'A');
INSERT INTO cclouds_parroquia VALUES (395, 64, 395, 'SAN ANTONIO', 'A');
INSERT INTO cclouds_parroquia VALUES (396, 64, 396, 'TORATA', 'A');
INSERT INTO cclouds_parroquia VALUES (397, 64, 397, 'VICTORIA', 'A');
INSERT INTO cclouds_parroquia VALUES (398, 64, 398, 'BELLAMARIA', 'A');
INSERT INTO cclouds_parroquia VALUES (399, 65, 399, 'ZARUMA', 'A');
INSERT INTO cclouds_parroquia VALUES (400, 65, 400, 'ABAIN', 'A');
INSERT INTO cclouds_parroquia VALUES (401, 65, 401, 'ARCAPAMBA', 'A');
INSERT INTO cclouds_parroquia VALUES (402, 65, 402, 'GUANAZAN', 'A');
INSERT INTO cclouds_parroquia VALUES (403, 65, 403, 'GUIZHAGUIA', 'A');
INSERT INTO cclouds_parroquia VALUES (404, 65, 404, 'HUERTAS', 'A');
INSERT INTO cclouds_parroquia VALUES (405, 65, 405, 'MALVAS', 'A');
INSERT INTO cclouds_parroquia VALUES (406, 65, 406, 'MULUNCAY GRANDE', 'A');
INSERT INTO cclouds_parroquia VALUES (407, 65, 407, 'SINSAO', 'A');
INSERT INTO cclouds_parroquia VALUES (408, 65, 408, 'SALVIAS', 'A');
INSERT INTO cclouds_parroquia VALUES (409, 66, 409, 'LA VICTORIA', 'A');
INSERT INTO cclouds_parroquia VALUES (410, 66, 410, 'LA LIBERTAD', 'A');
INSERT INTO cclouds_parroquia VALUES (411, 66, 411, 'EL PARAISO', 'A');
INSERT INTO cclouds_parroquia VALUES (412, 66, 412, 'SAN ISIDRO', 'A');
INSERT INTO cclouds_parroquia VALUES (413, 67, 413, 'ESMERALDAS', 'A');
INSERT INTO cclouds_parroquia VALUES (414, 67, 414, 'BARTOLOME RUIZ', 'A');
INSERT INTO cclouds_parroquia VALUES (415, 67, 415, '5 DE AGOSTO', 'A');
INSERT INTO cclouds_parroquia VALUES (417, 67, 417, 'LUIS TELLO', 'A');
INSERT INTO cclouds_parroquia VALUES (418, 67, 418, 'ATACAMES', 'A');
INSERT INTO cclouds_parroquia VALUES (419, 67, 419, 'CAMARONES (CAB. EN SAN VICENTE', 'A');
INSERT INTO cclouds_parroquia VALUES (420, 67, 420, 'CRNEL. CARLOS CONCHA TORRES (C', 'A');
INSERT INTO cclouds_parroquia VALUES (421, 67, 421, 'CHINCA', 'A');
INSERT INTO cclouds_parroquia VALUES (422, 67, 422, 'CHONTADURO', 'A');
INSERT INTO cclouds_parroquia VALUES (423, 67, 423, 'CHUMUNDE', 'A');
INSERT INTO cclouds_parroquia VALUES (424, 67, 424, 'LAGARTO', 'A');
INSERT INTO cclouds_parroquia VALUES (425, 67, 425, 'LA UNION', 'A');
INSERT INTO cclouds_parroquia VALUES (426, 67, 426, 'MAJUA', 'A');
INSERT INTO cclouds_parroquia VALUES (427, 67, 427, 'MONTALVO', 'A');
INSERT INTO cclouds_parroquia VALUES (428, 67, 428, 'RIO VERDE', 'A');
INSERT INTO cclouds_parroquia VALUES (429, 67, 429, 'ROCAFUERTE', 'A');
INSERT INTO cclouds_parroquia VALUES (430, 67, 430, 'SAN MATEO', 'A');
INSERT INTO cclouds_parroquia VALUES (431, 67, 431, 'SUA', 'A');
INSERT INTO cclouds_parroquia VALUES (432, 67, 432, 'TABIAZO', 'A');
INSERT INTO cclouds_parroquia VALUES (433, 67, 433, 'TACHINA', 'A');
INSERT INTO cclouds_parroquia VALUES (434, 67, 434, 'TONCHIGUE', 'A');
INSERT INTO cclouds_parroquia VALUES (435, 67, 435, 'VUELTA LARGA', 'A');
INSERT INTO cclouds_parroquia VALUES (436, 68, 436, 'VALDEZ', 'A');
INSERT INTO cclouds_parroquia VALUES (437, 68, 437, 'ANCHAYACU', 'A');
INSERT INTO cclouds_parroquia VALUES (438, 68, 438, 'ATAHUALPA', 'A');
INSERT INTO cclouds_parroquia VALUES (439, 68, 439, 'BORBON', 'A');
INSERT INTO cclouds_parroquia VALUES (440, 68, 440, 'LA TOLA', 'A');
INSERT INTO cclouds_parroquia VALUES (441, 68, 441, 'LUIS VARGAS TORRES', 'A');
INSERT INTO cclouds_parroquia VALUES (442, 68, 442, 'MALDONADO', 'A');
INSERT INTO cclouds_parroquia VALUES (443, 68, 443, 'PAMPANAL DE BOLIVAR', 'A');
INSERT INTO cclouds_parroquia VALUES (444, 68, 444, 'SAN FRANCISCO DE ONZOLE', 'A');
INSERT INTO cclouds_parroquia VALUES (445, 68, 445, 'SANTO DOMINGO DE ONZOLE', 'A');
INSERT INTO cclouds_parroquia VALUES (446, 68, 446, 'SELVA ALEGRE', 'A');
INSERT INTO cclouds_parroquia VALUES (447, 68, 447, 'TELEMBI', 'A');
INSERT INTO cclouds_parroquia VALUES (448, 68, 448, 'COLON ELOY DEL MARIA', 'A');
INSERT INTO cclouds_parroquia VALUES (449, 68, 449, 'SAN JOSE DE CAYAPAS', 'A');
INSERT INTO cclouds_parroquia VALUES (450, 68, 450, 'TIMBIRE', 'A');
INSERT INTO cclouds_parroquia VALUES (451, 69, 451, 'MUISNE', 'A');
INSERT INTO cclouds_parroquia VALUES (452, 69, 452, 'BOLIVAR', 'A');
INSERT INTO cclouds_parroquia VALUES (453, 69, 453, 'DAULE', 'A');
INSERT INTO cclouds_parroquia VALUES (454, 69, 454, 'GALERA', 'A');
INSERT INTO cclouds_parroquia VALUES (455, 69, 455, 'QUINGUE', 'A');
INSERT INTO cclouds_parroquia VALUES (456, 69, 456, 'SALIMA', 'A');
INSERT INTO cclouds_parroquia VALUES (457, 69, 457, 'SAN FRANCISCO', 'A');
INSERT INTO cclouds_parroquia VALUES (458, 69, 458, 'SAN GREGORIO', 'A');
INSERT INTO cclouds_parroquia VALUES (459, 69, 459, 'SAN JOSE DE CHAMANGA', 'A');
INSERT INTO cclouds_parroquia VALUES (460, 70, 460, 'QUININDE', 'A');
INSERT INTO cclouds_parroquia VALUES (461, 70, 461, 'ROSA ZARATE', 'A');
INSERT INTO cclouds_parroquia VALUES (462, 70, 462, 'CUBE', 'A');
INSERT INTO cclouds_parroquia VALUES (463, 70, 463, 'CHURA', 'A');
INSERT INTO cclouds_parroquia VALUES (464, 70, 464, 'MALIMPIA', 'A');
INSERT INTO cclouds_parroquia VALUES (465, 70, 465, 'VICHE', 'A');
INSERT INTO cclouds_parroquia VALUES (466, 70, 466, 'LA UNION', 'A');
INSERT INTO cclouds_parroquia VALUES (467, 71, 467, 'SAN LORENZO', 'A');
INSERT INTO cclouds_parroquia VALUES (468, 71, 468, 'ALTO TAMBO', 'A');
INSERT INTO cclouds_parroquia VALUES (469, 71, 469, 'ANCON', 'A');
INSERT INTO cclouds_parroquia VALUES (470, 71, 470, 'CALDERON', 'A');
INSERT INTO cclouds_parroquia VALUES (471, 71, 471, 'CARONDELET', 'A');
INSERT INTO cclouds_parroquia VALUES (472, 71, 472, '5 DE JUNIO', 'A');
INSERT INTO cclouds_parroquia VALUES (473, 71, 473, 'CONCEPCION', 'A');
INSERT INTO cclouds_parroquia VALUES (474, 71, 474, 'MATAJE', 'A');
INSERT INTO cclouds_parroquia VALUES (475, 71, 475, 'SAN JAVIER DE CACHAVI (CAB. EN', 'A');
INSERT INTO cclouds_parroquia VALUES (476, 71, 476, 'SANTA RITA', 'A');
INSERT INTO cclouds_parroquia VALUES (477, 71, 477, 'TAMBILLO', 'A');
INSERT INTO cclouds_parroquia VALUES (478, 71, 478, 'TULULBI', 'A');
INSERT INTO cclouds_parroquia VALUES (479, 71, 479, 'URBINA', 'A');
INSERT INTO cclouds_parroquia VALUES (480, 72, 480, 'ATACAMES', 'A');
INSERT INTO cclouds_parroquia VALUES (481, 72, 481, 'LA UNION', 'A');
INSERT INTO cclouds_parroquia VALUES (482, 72, 482, 'SUA', 'A');
INSERT INTO cclouds_parroquia VALUES (483, 72, 483, 'TONCHIGUE', 'A');
INSERT INTO cclouds_parroquia VALUES (484, 72, 484, 'TONSUPA', 'A');
INSERT INTO cclouds_parroquia VALUES (485, 73, 485, 'RIOVERDE', 'A');
INSERT INTO cclouds_parroquia VALUES (486, 73, 486, 'CHONTADURO', 'A');
INSERT INTO cclouds_parroquia VALUES (487, 73, 487, 'CHUMUNDE', 'A');
INSERT INTO cclouds_parroquia VALUES (488, 73, 488, 'LAGARTO', 'A');
INSERT INTO cclouds_parroquia VALUES (489, 73, 489, 'MONTALVO', 'A');
INSERT INTO cclouds_parroquia VALUES (490, 73, 490, 'ROCAFUERTE', 'A');
INSERT INTO cclouds_parroquia VALUES (491, 74, 491, 'LA CONCORDIA', 'A');
INSERT INTO cclouds_parroquia VALUES (492, 75, 492, 'GUAYAQUIL', 'A');
INSERT INTO cclouds_parroquia VALUES (493, 75, 493, 'AYACUCHO', 'A');
INSERT INTO cclouds_parroquia VALUES (494, 75, 494, 'BOLIVAR', 'A');
INSERT INTO cclouds_parroquia VALUES (495, 75, 495, 'CARBO', 'A');
INSERT INTO cclouds_parroquia VALUES (496, 75, 496, 'FEBRES CORDERO', 'A');
INSERT INTO cclouds_parroquia VALUES (497, 75, 497, 'GARCIA MORENO', 'A');
INSERT INTO cclouds_parroquia VALUES (498, 75, 498, 'LETAMENDI', 'A');
INSERT INTO cclouds_parroquia VALUES (499, 75, 499, 'NUEVE DE OCTUBRE', 'A');
INSERT INTO cclouds_parroquia VALUES (500, 75, 500, 'OLMEDO', 'A');
INSERT INTO cclouds_parroquia VALUES (501, 75, 501, 'ROCA', 'A');
INSERT INTO cclouds_parroquia VALUES (502, 75, 502, 'ROCAFUERTE', 'A');
INSERT INTO cclouds_parroquia VALUES (503, 75, 503, 'SUCRE', 'A');
INSERT INTO cclouds_parroquia VALUES (504, 75, 504, 'TARQUI', 'A');
INSERT INTO cclouds_parroquia VALUES (505, 75, 505, 'URDANETA', 'A');
INSERT INTO cclouds_parroquia VALUES (506, 75, 506, 'XIMENA', 'A');
INSERT INTO cclouds_parroquia VALUES (507, 75, 507, 'CHONGON', 'A');
INSERT INTO cclouds_parroquia VALUES (508, 75, 508, 'PASCUALES', 'A');
INSERT INTO cclouds_parroquia VALUES (510, 75, 510, 'JUAN GOMEZ RENDON (PROGRESO)', 'A');
INSERT INTO cclouds_parroquia VALUES (511, 75, 511, 'MORRO', 'A');
INSERT INTO cclouds_parroquia VALUES (513, 75, 513, 'PLAYAS', 'A');
INSERT INTO cclouds_parroquia VALUES (514, 75, 514, 'POSORJA', 'A');
INSERT INTO cclouds_parroquia VALUES (515, 75, 515, 'PUNA', 'A');
INSERT INTO cclouds_parroquia VALUES (516, 75, 516, 'TENGUEL', 'A');
INSERT INTO cclouds_parroquia VALUES (517, 76, 517, 'ALFREDO BAQUERIZO MORENO', 'A');
INSERT INTO cclouds_parroquia VALUES (518, 77, 518, 'BALAO', 'A');
INSERT INTO cclouds_parroquia VALUES (519, 78, 519, 'BALZAR', 'A');
INSERT INTO cclouds_parroquia VALUES (520, 79, 520, 'COLIMES', 'A');
INSERT INTO cclouds_parroquia VALUES (521, 79, 521, 'SAN JACINTO', 'A');
INSERT INTO cclouds_parroquia VALUES (522, 80, 522, 'DAULE', 'A');
INSERT INTO cclouds_parroquia VALUES (523, 80, 523, 'LA AURORA', 'A');
INSERT INTO cclouds_parroquia VALUES (524, 80, 524, 'ISIDRO AYORA', 'A');
INSERT INTO cclouds_parroquia VALUES (525, 80, 525, 'JUAN BAUTISTA AGUIRRE', 'A');
INSERT INTO cclouds_parroquia VALUES (526, 80, 526, 'LAUREL', 'A');
INSERT INTO cclouds_parroquia VALUES (527, 80, 527, 'LIMONAL', 'A');
INSERT INTO cclouds_parroquia VALUES (528, 80, 528, 'LOMAS DE SARGENTILLO', 'A');
INSERT INTO cclouds_parroquia VALUES (529, 80, 529, 'LOS LOJAS', 'A');
INSERT INTO cclouds_parroquia VALUES (530, 80, 530, 'PIEDRAHITA', 'A');
INSERT INTO cclouds_parroquia VALUES (531, 81, 531, 'ELOY ALFARO', 'A');
INSERT INTO cclouds_parroquia VALUES (532, 82, 532, 'VELASCO IBARRA', 'A');
INSERT INTO cclouds_parroquia VALUES (533, 82, 533, 'GUAYAS', 'A');
INSERT INTO cclouds_parroquia VALUES (534, 82, 534, 'EL ROSARIO', 'A');
INSERT INTO cclouds_parroquia VALUES (535, 83, 535, 'EL TRIUNFO', 'A');
INSERT INTO cclouds_parroquia VALUES (536, 84, 536, 'MILAGRO', 'A');
INSERT INTO cclouds_parroquia VALUES (537, 84, 537, 'CHOBO', 'A');
INSERT INTO cclouds_parroquia VALUES (538, 84, 538, 'GENERAL ELIZALDE', 'A');
INSERT INTO cclouds_parroquia VALUES (539, 84, 539, 'MARISCAL SUCRE', 'A');
INSERT INTO cclouds_parroquia VALUES (540, 84, 540, 'ROBERTO ASTUDILLO', 'A');
INSERT INTO cclouds_parroquia VALUES (541, 85, 541, 'NARANJAL', 'A');
INSERT INTO cclouds_parroquia VALUES (542, 85, 542, 'JESUS MARIA', 'A');
INSERT INTO cclouds_parroquia VALUES (543, 85, 543, 'SAN CARLOS', 'A');
INSERT INTO cclouds_parroquia VALUES (544, 85, 544, 'SANTA ROSA DE FLANDES', 'A');
INSERT INTO cclouds_parroquia VALUES (545, 85, 545, 'TAURA', 'A');
INSERT INTO cclouds_parroquia VALUES (546, 86, 546, 'NARANJITO', 'A');
INSERT INTO cclouds_parroquia VALUES (547, 87, 547, 'PALESTINA', 'A');
INSERT INTO cclouds_parroquia VALUES (548, 88, 548, 'PEDRO CARBO', 'A');
INSERT INTO cclouds_parroquia VALUES (549, 88, 549, 'VALLE DE LA VIRGEN', 'A');
INSERT INTO cclouds_parroquia VALUES (550, 88, 550, 'SABANILLA', 'A');
INSERT INTO cclouds_parroquia VALUES (551, 89, 551, 'SAMBORONDON', 'A');
INSERT INTO cclouds_parroquia VALUES (552, 89, 552, 'TARIFA', 'A');
INSERT INTO cclouds_parroquia VALUES (553, 90, 553, 'SANTA LUCIA', 'A');
INSERT INTO cclouds_parroquia VALUES (554, 91, 554, 'EL SALITRE', 'A');
INSERT INTO cclouds_parroquia VALUES (555, 91, 555, 'BOCANA', 'A');
INSERT INTO cclouds_parroquia VALUES (556, 91, 556, 'CANDILEJOS', 'A');
INSERT INTO cclouds_parroquia VALUES (557, 91, 557, 'CENTRAL', 'A');
INSERT INTO cclouds_parroquia VALUES (558, 91, 558, 'PARAISO', 'A');
INSERT INTO cclouds_parroquia VALUES (559, 91, 559, 'SAN MATEO', 'A');
INSERT INTO cclouds_parroquia VALUES (560, 91, 560, 'GENERAL VERNAZA', 'A');
INSERT INTO cclouds_parroquia VALUES (561, 91, 561, 'LA VICTORIA', 'A');
INSERT INTO cclouds_parroquia VALUES (562, 91, 562, 'JUNQUILLAL', 'A');
INSERT INTO cclouds_parroquia VALUES (563, 92, 563, 'SAN JACINTO DE YAGUACHI', 'A');
INSERT INTO cclouds_parroquia VALUES (564, 92, 564, 'CRNEL. LORENZO DE GARAICOA', 'A');
INSERT INTO cclouds_parroquia VALUES (565, 92, 565, 'CRNEL. MARCELINO MARIDUEA (SA', 'A');
INSERT INTO cclouds_parroquia VALUES (566, 92, 566, 'GRAL. PEDRO J. MONTERO', 'A');
INSERT INTO cclouds_parroquia VALUES (567, 92, 567, 'SIMON BOLIVAR', 'A');
INSERT INTO cclouds_parroquia VALUES (568, 92, 568, 'YAGUACHI VIEJO', 'A');
INSERT INTO cclouds_parroquia VALUES (569, 92, 569, 'VIRGEN DE FATIMA', 'A');
INSERT INTO cclouds_parroquia VALUES (570, 93, 570, 'SIMON BOLIVAR', 'A');
INSERT INTO cclouds_parroquia VALUES (571, 93, 571, 'CRNEL.LORENZO DE GARAICOA', 'A');
INSERT INTO cclouds_parroquia VALUES (572, 94, 572, 'LOMAS DE SARGENTILLO', 'A');
INSERT INTO cclouds_parroquia VALUES (573, 94, 573, 'ISIDRO AYORA', 'A');
INSERT INTO cclouds_parroquia VALUES (574, 95, 574, 'NARCISA DE JESUS', 'A');
INSERT INTO cclouds_parroquia VALUES (575, 96, 575, 'GENERAL ANTONIO ELIZALDE', 'A');
INSERT INTO cclouds_parroquia VALUES (576, 97, 576, 'ISIDRO AYORA', 'A');
INSERT INTO cclouds_parroquia VALUES (577, 98, 577, 'IBARRA', 'A');
INSERT INTO cclouds_parroquia VALUES (578, 98, 578, 'CARANQUI', 'A');
INSERT INTO cclouds_parroquia VALUES (579, 98, 579, 'GUAYAQUIL DE ALPACHACA', 'A');
INSERT INTO cclouds_parroquia VALUES (580, 98, 580, 'SAGRARIO', 'A');
INSERT INTO cclouds_parroquia VALUES (581, 98, 581, 'SAN FRANCISCO', 'A');
INSERT INTO cclouds_parroquia VALUES (582, 98, 582, 'LA DOLOROSA DEL PRIORATO', 'A');
INSERT INTO cclouds_parroquia VALUES (583, 98, 583, 'AMBUQUI', 'A');
INSERT INTO cclouds_parroquia VALUES (584, 98, 584, 'ANGOCHAGUA', 'A');
INSERT INTO cclouds_parroquia VALUES (585, 98, 585, 'CAROLINA', 'A');
INSERT INTO cclouds_parroquia VALUES (586, 98, 586, 'LA ESPERANZA', 'A');
INSERT INTO cclouds_parroquia VALUES (587, 98, 587, 'LITA', 'A');
INSERT INTO cclouds_parroquia VALUES (588, 98, 588, 'SALINAS', 'A');
INSERT INTO cclouds_parroquia VALUES (589, 98, 589, 'SAN ANTONIO', 'A');
INSERT INTO cclouds_parroquia VALUES (590, 99, 590, 'ATUNTAQUI', 'A');
INSERT INTO cclouds_parroquia VALUES (591, 99, 591, 'ANDRADE MARIN', 'A');
INSERT INTO cclouds_parroquia VALUES (593, 99, 593, 'IMBAYA', 'A');
INSERT INTO cclouds_parroquia VALUES (594, 99, 594, 'SAN FRANCISCO DE NATABUELA', 'A');
INSERT INTO cclouds_parroquia VALUES (595, 99, 595, 'SAN JOSE DE CHALTURA', 'A');
INSERT INTO cclouds_parroquia VALUES (596, 99, 596, 'SAN ROQUE', 'A');
INSERT INTO cclouds_parroquia VALUES (597, 100, 597, 'COTACACHI', 'A');
INSERT INTO cclouds_parroquia VALUES (598, 100, 598, 'SAGRARIO', 'A');
INSERT INTO cclouds_parroquia VALUES (599, 100, 599, 'SAN FRANCISCO', 'A');
INSERT INTO cclouds_parroquia VALUES (600, 100, 600, 'APUELA', 'A');
INSERT INTO cclouds_parroquia VALUES (601, 100, 601, 'GARCIA MORENO', 'A');
INSERT INTO cclouds_parroquia VALUES (602, 100, 602, 'IMANTAG', 'A');
INSERT INTO cclouds_parroquia VALUES (603, 100, 603, 'PEAHERRERA', 'A');
INSERT INTO cclouds_parroquia VALUES (604, 100, 604, 'PLAZA GUTIERREZ', 'A');
INSERT INTO cclouds_parroquia VALUES (605, 100, 605, 'QUIROGA', 'A');
INSERT INTO cclouds_parroquia VALUES (606, 100, 606, '6 DE JULIO DE CUELLAJE', 'A');
INSERT INTO cclouds_parroquia VALUES (607, 100, 607, 'VACAS GALINDO', 'A');
INSERT INTO cclouds_parroquia VALUES (608, 101, 608, 'JORDAN', 'A');
INSERT INTO cclouds_parroquia VALUES (609, 101, 609, 'SAN LUIS', 'A');
INSERT INTO cclouds_parroquia VALUES (610, 101, 610, 'DR. MIGUEL EGAS CABEZAS', 'A');
INSERT INTO cclouds_parroquia VALUES (611, 101, 611, 'EUGENIO ESPEJO', 'A');
INSERT INTO cclouds_parroquia VALUES (612, 101, 612, 'GONZALEZ SUAREZ', 'A');
INSERT INTO cclouds_parroquia VALUES (613, 101, 613, 'PATAQUI', 'A');
INSERT INTO cclouds_parroquia VALUES (614, 101, 614, 'SAN JOSE DE QUICHINCHE', 'A');
INSERT INTO cclouds_parroquia VALUES (615, 101, 615, 'SAN JUAN DE ILUMAN', 'A');
INSERT INTO cclouds_parroquia VALUES (616, 101, 616, 'SAN PABLO', 'A');
INSERT INTO cclouds_parroquia VALUES (617, 101, 617, 'SAN RAFAEL', 'A');
INSERT INTO cclouds_parroquia VALUES (618, 101, 618, 'SELVA ALEGRE', 'A');
INSERT INTO cclouds_parroquia VALUES (619, 102, 619, 'PIMAMPIRO', 'A');
INSERT INTO cclouds_parroquia VALUES (620, 102, 620, 'CHUGA', 'A');
INSERT INTO cclouds_parroquia VALUES (621, 102, 621, 'MARIANO ACOSTA', 'A');
INSERT INTO cclouds_parroquia VALUES (622, 102, 622, 'SAN FRANCISCO DE SIGSIPAMBA', 'A');
INSERT INTO cclouds_parroquia VALUES (623, 103, 623, 'URCUQUI', 'A');
INSERT INTO cclouds_parroquia VALUES (624, 103, 624, 'CAHUASQUI', 'A');
INSERT INTO cclouds_parroquia VALUES (625, 103, 625, 'LA MERCED DE BUENOS AIRES', 'A');
INSERT INTO cclouds_parroquia VALUES (626, 103, 626, 'PABLO ARENAS', 'A');
INSERT INTO cclouds_parroquia VALUES (627, 103, 627, 'SAN BLAS', 'A');
INSERT INTO cclouds_parroquia VALUES (628, 103, 628, 'TUMBABIRO', 'A');
INSERT INTO cclouds_parroquia VALUES (629, 104, 629, 'LOJA', 'A');
INSERT INTO cclouds_parroquia VALUES (647, 122, 647, 'CARIAMANGA', 'A');
INSERT INTO cclouds_parroquia VALUES (655, 130, 655, 'CATAMAYO', 'A');
INSERT INTO cclouds_parroquia VALUES (661, 136, 661, 'CELICA', 'A');
INSERT INTO cclouds_parroquia VALUES (669, 144, 669, 'CHAGUARPAMBA', 'A');
INSERT INTO cclouds_parroquia VALUES (674, 149, 674, 'AMALUZA', 'A');
INSERT INTO cclouds_parroquia VALUES (681, 156, 681, 'GONZANAMA', 'A');
INSERT INTO cclouds_parroquia VALUES (689, 164, 689, 'MACARA', 'A');
INSERT INTO cclouds_parroquia VALUES (695, 170, 695, 'CATACOCHA', 'A');
INSERT INTO cclouds_parroquia VALUES (696, 170, 696, 'LOURDES', 'A');
INSERT INTO cclouds_parroquia VALUES (697, 170, 697, 'CANGONAMA', 'A');
INSERT INTO cclouds_parroquia VALUES (698, 170, 698, 'GUACHANAMA', 'A');
INSERT INTO cclouds_parroquia VALUES (699, 170, 699, 'LA TINGUE', 'A');
INSERT INTO cclouds_parroquia VALUES (700, 170, 700, 'LAURO GUERRERO', 'A');
INSERT INTO cclouds_parroquia VALUES (701, 170, 701, 'OLMEDO', 'A');
INSERT INTO cclouds_parroquia VALUES (702, 170, 702, 'ORIANGA', 'A');
INSERT INTO cclouds_parroquia VALUES (703, 170, 703, 'SAN ANTONIO', 'A');
INSERT INTO cclouds_parroquia VALUES (704, 170, 704, 'CASANGA', 'A');
INSERT INTO cclouds_parroquia VALUES (705, 170, 705, 'YAMANA', 'A');
INSERT INTO cclouds_parroquia VALUES (706, 171, 706, 'ALAMOR', 'A');
INSERT INTO cclouds_parroquia VALUES (707, 171, 707, 'CIANO', 'A');
INSERT INTO cclouds_parroquia VALUES (708, 171, 708, 'EL ARENAL', 'A');
INSERT INTO cclouds_parroquia VALUES (709, 171, 709, 'EL LIMO', 'A');
INSERT INTO cclouds_parroquia VALUES (710, 171, 710, 'MERCADILLO', 'A');
INSERT INTO cclouds_parroquia VALUES (711, 171, 711, 'VICENTINO', 'A');
INSERT INTO cclouds_parroquia VALUES (712, 172, 712, 'EL PARAISO DE CELEN', 'A');
INSERT INTO cclouds_parroquia VALUES (713, 172, 713, 'EL TABLON', 'A');
INSERT INTO cclouds_parroquia VALUES (714, 172, 714, 'LLUZHAPA', 'A');
INSERT INTO cclouds_parroquia VALUES (715, 172, 715, 'MANU', 'A');
INSERT INTO cclouds_parroquia VALUES (716, 172, 716, 'SAN ANTONIO DE QUMBE', 'A');
INSERT INTO cclouds_parroquia VALUES (717, 172, 717, 'SAN PABLO DE TENTA', 'A');
INSERT INTO cclouds_parroquia VALUES (718, 172, 718, 'SAN SEBASTIAN DE YULUC', 'A');
INSERT INTO cclouds_parroquia VALUES (719, 172, 719, 'SELVA ALEGRE', 'A');
INSERT INTO cclouds_parroquia VALUES (720, 172, 720, 'URDANETA', 'A');
INSERT INTO cclouds_parroquia VALUES (721, 172, 721, 'SUMAYPAMBA', 'A');
INSERT INTO cclouds_parroquia VALUES (722, 173, 722, 'SOZORANGA', 'A');
INSERT INTO cclouds_parroquia VALUES (723, 173, 723, 'NUEVA FATIMA', 'A');
INSERT INTO cclouds_parroquia VALUES (724, 173, 724, 'TACAMOROS', 'A');
INSERT INTO cclouds_parroquia VALUES (725, 174, 725, 'ZAPOTILLO', 'A');
INSERT INTO cclouds_parroquia VALUES (726, 174, 726, 'CAZADEROS', 'A');
INSERT INTO cclouds_parroquia VALUES (727, 174, 727, 'GARZAREAL', 'A');
INSERT INTO cclouds_parroquia VALUES (728, 174, 728, 'LIMONES', 'A');
INSERT INTO cclouds_parroquia VALUES (729, 174, 729, 'PALETILLAS', 'A');
INSERT INTO cclouds_parroquia VALUES (730, 175, 730, 'CHAQUINAL', 'A');
INSERT INTO cclouds_parroquia VALUES (731, 175, 731, '12 DE DICIEMBRE', 'A');
INSERT INTO cclouds_parroquia VALUES (732, 176, 732, 'FUNDOCHAMBA', 'A');
INSERT INTO cclouds_parroquia VALUES (733, 176, 733, 'SAN ANTONIO DE LAS ARADAS', 'A');
INSERT INTO cclouds_parroquia VALUES (734, 177, 734, 'OLMEDO', 'A');
INSERT INTO cclouds_parroquia VALUES (735, 177, 735, 'LA TINGUE', 'A');
INSERT INTO cclouds_parroquia VALUES (736, 178, 736, 'BABAHOYO', 'A');
INSERT INTO cclouds_parroquia VALUES (746, 188, 746, 'BABA', 'A');
INSERT INTO cclouds_parroquia VALUES (749, 191, 749, 'MONTALVO', 'A');
INSERT INTO cclouds_parroquia VALUES (750, 192, 750, 'PUEBLOVIEJO', 'A');
INSERT INTO cclouds_parroquia VALUES (751, 192, 751, 'PUERTO PECHICHE', 'A');
INSERT INTO cclouds_parroquia VALUES (752, 192, 752, 'SAN JUAN', 'A');
INSERT INTO cclouds_parroquia VALUES (753, 193, 753, 'QUEVEDO', 'A');
INSERT INTO cclouds_parroquia VALUES (768, 208, 768, 'CATARAMA', 'A');
INSERT INTO cclouds_parroquia VALUES (769, 208, 769, 'RICAURTE', 'A');
INSERT INTO cclouds_parroquia VALUES (770, 209, 770, 'QUINSALOMA', 'A');
INSERT INTO cclouds_parroquia VALUES (771, 209, 771, 'ZAPOTAL', 'A');
INSERT INTO cclouds_parroquia VALUES (772, 210, 772, 'ANTONIO SOTOMAYOR', 'A');
INSERT INTO cclouds_parroquia VALUES (773, 211, 773, 'PALENQUE', 'A');
INSERT INTO cclouds_parroquia VALUES (774, 212, 774, 'SAN JACINTO DE BUENA FE', 'A');
INSERT INTO cclouds_parroquia VALUES (776, 212, 776, '7 DE AGOSTO', 'A');
INSERT INTO cclouds_parroquia VALUES (777, 212, 777, '11 DE OCTUBRE', 'A');
INSERT INTO cclouds_parroquia VALUES (778, 212, 778, 'PATRICIA PILAR', 'A');
INSERT INTO cclouds_parroquia VALUES (779, 213, 779, 'VALENCIA', 'A');
INSERT INTO cclouds_parroquia VALUES (780, 214, 780, 'MOCACHE', 'A');
INSERT INTO cclouds_parroquia VALUES (781, 215, 781, 'PORTOVIEJO', 'A');
INSERT INTO cclouds_parroquia VALUES (795, 229, 795, 'CALCETA', 'A');
INSERT INTO cclouds_parroquia VALUES (798, 232, 798, 'CHONE', 'A');
INSERT INTO cclouds_parroquia VALUES (807, 241, 807, 'EL CARMEN', 'A');
INSERT INTO cclouds_parroquia VALUES (811, 245, 811, 'SAN FRANCISCO DE NOVILLO', 'A');
INSERT INTO cclouds_parroquia VALUES (813, 247, 813, 'JIPIJAPA', 'A');
INSERT INTO cclouds_parroquia VALUES (826, 260, 826, 'JUNIN', 'A');
INSERT INTO cclouds_parroquia VALUES (827, 261, 827, 'MANTA', 'A');
INSERT INTO cclouds_parroquia VALUES (835, 269, 835, 'MONTECRISTI', 'A');
INSERT INTO cclouds_parroquia VALUES (840, 274, 840, 'PAJAN', 'A');
INSERT INTO cclouds_parroquia VALUES (845, 279, 845, 'PICHINCHA', 'A');
INSERT INTO cclouds_parroquia VALUES (848, 282, 848, 'ROCAFUERTE', 'A');
INSERT INTO cclouds_parroquia VALUES (849, 283, 849, 'SANTA ANA DE VUELTA LARGA,', 'A');
INSERT INTO cclouds_parroquia VALUES (850, 283, 850, 'LODANA', 'A');
INSERT INTO cclouds_parroquia VALUES (851, 283, 851, 'AYACUCHO', 'A');
INSERT INTO cclouds_parroquia VALUES (852, 283, 852, 'HONORATO VASQUEZ', 'A');
INSERT INTO cclouds_parroquia VALUES (853, 283, 853, 'LA UNION', 'A');
INSERT INTO cclouds_parroquia VALUES (854, 283, 854, 'OLMEDO', 'A');
INSERT INTO cclouds_parroquia VALUES (855, 283, 855, 'SAN PABLO', 'A');
INSERT INTO cclouds_parroquia VALUES (856, 284, 856, 'BAHIA DE CARAQUEZ', 'A');
INSERT INTO cclouds_parroquia VALUES (857, 284, 857, 'LEONIDAS PLAZA GUTIERREZ', 'A');
INSERT INTO cclouds_parroquia VALUES (858, 284, 858, 'CANOA', 'A');
INSERT INTO cclouds_parroquia VALUES (859, 284, 859, 'COJIMIES', 'A');
INSERT INTO cclouds_parroquia VALUES (860, 284, 860, 'CHARAPOTO', 'A');
INSERT INTO cclouds_parroquia VALUES (861, 284, 861, '10 DE AGOSTO', 'A');
INSERT INTO cclouds_parroquia VALUES (862, 284, 862, 'JAMA', 'A');
INSERT INTO cclouds_parroquia VALUES (863, 284, 863, 'PEDERNALES', 'A');
INSERT INTO cclouds_parroquia VALUES (864, 284, 864, 'SAN ISIDRO', 'A');
INSERT INTO cclouds_parroquia VALUES (865, 284, 865, 'SAN VICENTE', 'A');
INSERT INTO cclouds_parroquia VALUES (866, 285, 866, 'TOSAGUA', 'A');
INSERT INTO cclouds_parroquia VALUES (867, 285, 867, 'BACHILLERO', 'A');
INSERT INTO cclouds_parroquia VALUES (868, 285, 868, 'ANGEL PEDRO GILER', 'A');
INSERT INTO cclouds_parroquia VALUES (869, 286, 869, 'SUCRE', 'A');
INSERT INTO cclouds_parroquia VALUES (870, 286, 870, 'BELLAVISTA', 'A');
INSERT INTO cclouds_parroquia VALUES (871, 286, 871, 'NOBOA', 'A');
INSERT INTO cclouds_parroquia VALUES (872, 286, 872, 'ARQ. SIXTO DURAN BALLEN', 'A');
INSERT INTO cclouds_parroquia VALUES (873, 287, 873, 'PEDERNALES', 'A');
INSERT INTO cclouds_parroquia VALUES (874, 287, 874, 'COJIMIES', 'A');
INSERT INTO cclouds_parroquia VALUES (875, 287, 875, '10 DE AGOSTO', 'A');
INSERT INTO cclouds_parroquia VALUES (876, 287, 876, 'ATAHUALPA', 'A');
INSERT INTO cclouds_parroquia VALUES (877, 288, 877, 'OLMEDO', 'A');
INSERT INTO cclouds_parroquia VALUES (878, 289, 878, 'PUERTO LOPEZ', 'A');
INSERT INTO cclouds_parroquia VALUES (879, 289, 879, 'MACHALILLA', 'A');
INSERT INTO cclouds_parroquia VALUES (880, 289, 880, 'SALANGO', 'A');
INSERT INTO cclouds_parroquia VALUES (881, 290, 881, 'JAMA', 'A');
INSERT INTO cclouds_parroquia VALUES (882, 291, 882, 'JARAMIJO', 'A');
INSERT INTO cclouds_parroquia VALUES (883, 292, 883, 'SAN VICENTE', 'A');
INSERT INTO cclouds_parroquia VALUES (884, 292, 884, 'CANOA', 'A');
INSERT INTO cclouds_parroquia VALUES (885, 293, 885, 'MACAS', 'A');
INSERT INTO cclouds_parroquia VALUES (900, 308, 900, 'GUALAQUIZA', 'A');
INSERT INTO cclouds_parroquia VALUES (910, 318, 910, 'LIMON', 'A');
INSERT INTO cclouds_parroquia VALUES (919, 327, 919, 'ARAPICOS', 'A');
INSERT INTO cclouds_parroquia VALUES (924, 332, 924, 'SANTIAGO DE MENDEZ', 'A');
INSERT INTO cclouds_parroquia VALUES (932, 340, 932, 'ASUNCION', 'A');
INSERT INTO cclouds_parroquia VALUES (937, 345, 937, 'CHIGUAZA', 'A');
INSERT INTO cclouds_parroquia VALUES (938, 345, 938, 'PABLO SEXTO', 'A');
INSERT INTO cclouds_parroquia VALUES (939, 346, 939, 'SAN JUAN BOSCO', 'A');
INSERT INTO cclouds_parroquia VALUES (940, 346, 940, 'PAN DE AZUCAR', 'A');
INSERT INTO cclouds_parroquia VALUES (941, 346, 941, 'SAN CARLOS DE LIMON', 'A');
INSERT INTO cclouds_parroquia VALUES (942, 346, 942, 'SAN JACINTO DE WAKAMBEIS', 'A');
INSERT INTO cclouds_parroquia VALUES (943, 346, 943, 'SANTIAGO DE PANANZA', 'A');
INSERT INTO cclouds_parroquia VALUES (944, 347, 944, 'TAISHA', 'A');
INSERT INTO cclouds_parroquia VALUES (945, 347, 945, 'HUASAGA', 'A');
INSERT INTO cclouds_parroquia VALUES (946, 347, 946, 'MACUMA', 'A');
INSERT INTO cclouds_parroquia VALUES (947, 347, 947, 'TUUTINENTZA', 'A');
INSERT INTO cclouds_parroquia VALUES (948, 348, 948, 'LOGROO', 'A');
INSERT INTO cclouds_parroquia VALUES (949, 348, 949, 'YAUPI', 'A');
INSERT INTO cclouds_parroquia VALUES (950, 348, 950, 'SHIMPIS', 'A');
INSERT INTO cclouds_parroquia VALUES (951, 349, 951, 'PABLO SEXTO', 'A');
INSERT INTO cclouds_parroquia VALUES (952, 350, 952, 'SANTIAGO', 'A');
INSERT INTO cclouds_parroquia VALUES (953, 350, 953, 'SAN JOSE DE MORONA', 'A');
INSERT INTO cclouds_parroquia VALUES (954, 351, 954, 'TENA', 'A');
INSERT INTO cclouds_parroquia VALUES (962, 359, 962, 'ARCHIDONA', 'A');
INSERT INTO cclouds_parroquia VALUES (968, 365, 968, 'EL CHACO', 'A');
INSERT INTO cclouds_parroquia VALUES (969, 365, 969, 'GONZALO DIAZ DE PINEDA', 'A');
INSERT INTO cclouds_parroquia VALUES (970, 365, 970, 'LINARES', 'A');
INSERT INTO cclouds_parroquia VALUES (971, 365, 971, 'OYACACHI', 'A');
INSERT INTO cclouds_parroquia VALUES (972, 365, 972, 'SANTA ROSA', 'A');
INSERT INTO cclouds_parroquia VALUES (973, 365, 973, 'SARDINAS', 'A');
INSERT INTO cclouds_parroquia VALUES (974, 366, 974, 'BAEZA', 'A');
INSERT INTO cclouds_parroquia VALUES (975, 366, 975, 'COSANGA', 'A');
INSERT INTO cclouds_parroquia VALUES (976, 366, 976, 'CUYUJA', 'A');
INSERT INTO cclouds_parroquia VALUES (977, 366, 977, 'PAPALLACTA', 'A');
INSERT INTO cclouds_parroquia VALUES (978, 366, 978, 'SAN FRANCISCO DE BORJA (VIRGIL', 'A');
INSERT INTO cclouds_parroquia VALUES (979, 366, 979, 'SAN JOSE DEL PAYAMINO', 'A');
INSERT INTO cclouds_parroquia VALUES (980, 366, 980, 'SUMACO', 'A');
INSERT INTO cclouds_parroquia VALUES (981, 367, 981, 'CARLOS JULIO AROSEMENA TOLA', 'A');
INSERT INTO cclouds_parroquia VALUES (982, 368, 982, 'PUYO', 'A');
INSERT INTO cclouds_parroquia VALUES (983, 368, 983, 'ARAJUNO', 'A');
INSERT INTO cclouds_parroquia VALUES (984, 368, 984, 'CANELOS', 'A');
INSERT INTO cclouds_parroquia VALUES (985, 368, 985, 'CURARAY', 'A');
INSERT INTO cclouds_parroquia VALUES (986, 368, 986, 'DIEZ  DE AGOSTO', 'A');
INSERT INTO cclouds_parroquia VALUES (987, 368, 987, 'FATIMA', 'A');
INSERT INTO cclouds_parroquia VALUES (988, 368, 988, 'MONTALVO (ANDOAS)', 'A');
INSERT INTO cclouds_parroquia VALUES (989, 368, 989, 'POMONA', 'A');
INSERT INTO cclouds_parroquia VALUES (990, 368, 990, 'RIO CORRIENTES', 'A');
INSERT INTO cclouds_parroquia VALUES (991, 368, 991, 'RIO TIGRE', 'A');
INSERT INTO cclouds_parroquia VALUES (992, 368, 992, 'SANTA CLARA', 'A');
INSERT INTO cclouds_parroquia VALUES (993, 368, 993, 'SARAYACU', 'A');
INSERT INTO cclouds_parroquia VALUES (994, 368, 994, 'SIMON BOLIVAR  (CAB. EN MUSHUL', 'A');
INSERT INTO cclouds_parroquia VALUES (995, 368, 995, 'TARQUI', 'A');
INSERT INTO cclouds_parroquia VALUES (996, 368, 996, 'TENIENTE HUGO ORTIZ', 'A');
INSERT INTO cclouds_parroquia VALUES (997, 368, 997, 'VERACRUZ (INDILLAMA) (CAB. EN', 'A');
INSERT INTO cclouds_parroquia VALUES (998, 368, 998, 'EL TRIUNFO', 'A');
INSERT INTO cclouds_parroquia VALUES (999, 369, 999, 'MERA', 'A');
INSERT INTO cclouds_parroquia VALUES (1000, 369, 1000, 'MADRE TIERRA', 'A');


--
-- TOC entry 2015 (class 0 OID 18158)
-- Dependencies: 1596
-- Data for Name: cclouds_province; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cclouds_province VALUES (2, 1, 2, 'BOLIVAR', 'A');
INSERT INTO cclouds_province VALUES (3, 1, 3, 'CAAR', 'A');
INSERT INTO cclouds_province VALUES (4, 1, 4, 'CARCHI', 'A');
INSERT INTO cclouds_province VALUES (5, 1, 5, 'COTOPAXI', 'A');
INSERT INTO cclouds_province VALUES (6, 1, 6, 'CHIMBORAZO', 'A');
INSERT INTO cclouds_province VALUES (7, 1, 7, 'EL ORO', 'A');
INSERT INTO cclouds_province VALUES (8, 1, 8, 'ESMERALDAS', 'A');
INSERT INTO cclouds_province VALUES (9, 1, 9, 'GUAYAS', 'A');
INSERT INTO cclouds_province VALUES (10, 1, 10, 'IMBABURA', 'A');
INSERT INTO cclouds_province VALUES (11, 1, 11, 'LOJA', 'A');
INSERT INTO cclouds_province VALUES (12, 1, 12, 'LOS RIOS', 'A');
INSERT INTO cclouds_province VALUES (13, 1, 13, 'MANABI', 'A');
INSERT INTO cclouds_province VALUES (14, 1, 14, 'MORONA SANTIAGO', 'A');
INSERT INTO cclouds_province VALUES (15, 1, 15, 'NAPO', 'A');
INSERT INTO cclouds_province VALUES (16, 1, 16, 'PASTAZA', 'A');
INSERT INTO cclouds_province VALUES (17, 1, 17, 'PICHINCHA', 'A');
INSERT INTO cclouds_province VALUES (18, 1, 18, 'TUNGURAHUA', 'A');
INSERT INTO cclouds_province VALUES (19, 1, 19, 'ZAMORA CHINCHIPE', 'A');
INSERT INTO cclouds_province VALUES (20, 1, 20, 'GALAPAGOS', 'A');
INSERT INTO cclouds_province VALUES (21, 1, 21, 'SUCUMBIOS', 'A');
INSERT INTO cclouds_province VALUES (22, 1, 22, 'ORELLANA', 'A');
INSERT INTO cclouds_province VALUES (23, 1, 23, 'SANTO DOMINGO DE LOS TSACHILAS', 'A');
INSERT INTO cclouds_province VALUES (24, 1, 24, 'SANTA ELENA', 'A');


--
-- TOC entry 2016 (class 0 OID 18164)
-- Dependencies: 1598
-- Data for Name: cclouds_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cclouds_rol VALUES (3, 'ROLE_INVITADO', 'Invitado');
INSERT INTO cclouds_rol VALUES (1, 'ROLE_ADMIN', 'Adminstrador');
INSERT INTO cclouds_rol VALUES (2, 'ROLE_CLIENTE', 'Cliente');
INSERT INTO cclouds_rol VALUES (66, 'ROLE_SEGURIDAD', 'SEGURIDAD');
INSERT INTO cclouds_rol VALUES (67, 'ROLE_FACTURADOR', 'FACTURADOR');
INSERT INTO cclouds_rol VALUES (68, 'ROLE_INVITADO_2', 'INVITADO');
INSERT INTO cclouds_rol VALUES (81, 'Inserter', 'User inserter');
INSERT INTO cclouds_rol VALUES (82, 'Modifier', 'User modifier');


--
-- TOC entry 2017 (class 0 OID 18173)
-- Dependencies: 1600
-- Data for Name: cclouds_rol_adm; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cclouds_rol_adm VALUES (5, 81, 9);
INSERT INTO cclouds_rol_adm VALUES (8, 1, 15);
INSERT INTO cclouds_rol_adm VALUES (9, 1, 17);
INSERT INTO cclouds_rol_adm VALUES (10, 1, 18);
INSERT INTO cclouds_rol_adm VALUES (16, 1, 12);
INSERT INTO cclouds_rol_adm VALUES (17, 1, 13);
INSERT INTO cclouds_rol_adm VALUES (18, 1, 9);
INSERT INTO cclouds_rol_adm VALUES (23, 66, 10);
INSERT INTO cclouds_rol_adm VALUES (24, 66, 10);
INSERT INTO cclouds_rol_adm VALUES (25, 66, 11);
INSERT INTO cclouds_rol_adm VALUES (26, 1, 11);
INSERT INTO cclouds_rol_adm VALUES (28, 1, 10);
INSERT INTO cclouds_rol_adm VALUES (29, 1, 14);
INSERT INTO cclouds_rol_adm VALUES (30, 1, 23);
INSERT INTO cclouds_rol_adm VALUES (31, 1, 24);
INSERT INTO cclouds_rol_adm VALUES (32, 1, 26);
INSERT INTO cclouds_rol_adm VALUES (34, 1, 27);
INSERT INTO cclouds_rol_adm VALUES (35, 1, 28);
INSERT INTO cclouds_rol_adm VALUES (37, 1, 27);
INSERT INTO cclouds_rol_adm VALUES (38, 1, 28);
INSERT INTO cclouds_rol_adm VALUES (39, 1, 19);
INSERT INTO cclouds_rol_adm VALUES (40, 1, 31);
INSERT INTO cclouds_rol_adm VALUES (41, 1, 27);
INSERT INTO cclouds_rol_adm VALUES (42, 1, 28);
INSERT INTO cclouds_rol_adm VALUES (43, 1, 19);
INSERT INTO cclouds_rol_adm VALUES (44, 1, 31);
INSERT INTO cclouds_rol_adm VALUES (45, 1, 25);
INSERT INTO cclouds_rol_adm VALUES (46, 1, 48);
INSERT INTO cclouds_rol_adm VALUES (47, 1, 49);
INSERT INTO cclouds_rol_adm VALUES (48, 1, 50);
INSERT INTO cclouds_rol_adm VALUES (49, 1, 51);
INSERT INTO cclouds_rol_adm VALUES (50, 1, 52);
INSERT INTO cclouds_rol_adm VALUES (51, 1, 53);
INSERT INTO cclouds_rol_adm VALUES (52, 1, 54);
INSERT INTO cclouds_rol_adm VALUES (53, 1, 55);
INSERT INTO cclouds_rol_adm VALUES (54, 1, 56);
INSERT INTO cclouds_rol_adm VALUES (55, 1, 57);
INSERT INTO cclouds_rol_adm VALUES (56, 1, 58);
INSERT INTO cclouds_rol_adm VALUES (57, 1, 59);
INSERT INTO cclouds_rol_adm VALUES (58, 1, 60);
INSERT INTO cclouds_rol_adm VALUES (59, 1, 61);
INSERT INTO cclouds_rol_adm VALUES (60, 1, 62);
INSERT INTO cclouds_rol_adm VALUES (62, 1, 40);
INSERT INTO cclouds_rol_adm VALUES (63, 1, 41);
INSERT INTO cclouds_rol_adm VALUES (64, 1, 42);
INSERT INTO cclouds_rol_adm VALUES (65, 1, 43);
INSERT INTO cclouds_rol_adm VALUES (66, 1, 48);
INSERT INTO cclouds_rol_adm VALUES (67, 1, 49);
INSERT INTO cclouds_rol_adm VALUES (68, 1, 50);
INSERT INTO cclouds_rol_adm VALUES (69, 1, 51);
INSERT INTO cclouds_rol_adm VALUES (70, 1, 52);
INSERT INTO cclouds_rol_adm VALUES (71, 1, 53);
INSERT INTO cclouds_rol_adm VALUES (72, 1, 54);
INSERT INTO cclouds_rol_adm VALUES (73, 1, 55);
INSERT INTO cclouds_rol_adm VALUES (74, 1, 56);
INSERT INTO cclouds_rol_adm VALUES (75, 1, 57);
INSERT INTO cclouds_rol_adm VALUES (76, 1, 58);
INSERT INTO cclouds_rol_adm VALUES (77, 1, 59);
INSERT INTO cclouds_rol_adm VALUES (78, 1, 60);
INSERT INTO cclouds_rol_adm VALUES (79, 1, 61);
INSERT INTO cclouds_rol_adm VALUES (80, 1, 62);
INSERT INTO cclouds_rol_adm VALUES (82, 1, 40);
INSERT INTO cclouds_rol_adm VALUES (83, 1, 41);
INSERT INTO cclouds_rol_adm VALUES (84, 1, 42);
INSERT INTO cclouds_rol_adm VALUES (85, 1, 43);
INSERT INTO cclouds_rol_adm VALUES (86, 1, 20);
INSERT INTO cclouds_rol_adm VALUES (87, 1, 21);
INSERT INTO cclouds_rol_adm VALUES (88, 81, 36);
INSERT INTO cclouds_rol_adm VALUES (89, 81, 31);
INSERT INTO cclouds_rol_adm VALUES (90, 81, 26);
INSERT INTO cclouds_rol_adm VALUES (91, 1, 36);
INSERT INTO cclouds_rol_adm VALUES (92, 1, 36);


--
-- TOC entry 2024 (class 0 OID 18379)
-- Dependencies: 1612
-- Data for Name: cclouds_servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2018 (class 0 OID 18177)
-- Dependencies: 1601
-- Data for Name: cclouds_sex; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cclouds_sex VALUES ('Masculino', 'M', 1);
INSERT INTO cclouds_sex VALUES ('Femenino', 'F', 2);


--
-- TOC entry 2019 (class 0 OID 18184)
-- Dependencies: 1604
-- Data for Name: cclouds_sub_empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2020 (class 0 OID 18193)
-- Dependencies: 1606
-- Data for Name: cclouds_sucursal; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2025 (class 0 OID 18387)
-- Dependencies: 1614
-- Data for Name: cclouds_tarifa; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2021 (class 0 OID 18202)
-- Dependencies: 1608
-- Data for Name: cclouds_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cclouds_usuario VALUES (1, 1, 'rlavila', '$2a$10$//hw4WwyT8z1GmfMDeQZ/.XTt8oETga92/Qt6FrnsXu.a2ZKeeUhK', 'master', '+5354949463', 'leyvaproenza1@nauta.cu', 'Reinier', 'Leyva Avila', 'M', '2015-01-01', 'test', 'test', true, 101, 3);
INSERT INTO cclouds_usuario VALUES (8, 1, 'isidro', '$2a$10$//hw4WwyT8z1GmfMDeQZ/.XTt8oETga92/Qt6FrnsXu.a2ZKeeUhK', 'prt', '+5354949463', 'isidro89@nauta.cu', 'Isidro', 'Rodriguez Gamez', 'M', '1999-12-31', 'asd', 'ok', true, 116, 2);


--
-- TOC entry 2022 (class 0 OID 18210)
-- Dependencies: 1609
-- Data for Name: cclouds_usuario_rol_agencia; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2023 (class 0 OID 18215)
-- Dependencies: 1611
-- Data for Name: representantes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1922 (class 2606 OID 18221)
-- Dependencies: 1574 1574
-- Name: adm_modulo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY adm_modulo
    ADD CONSTRAINT adm_modulo_pkey PRIMARY KEY (id);


--
-- TOC entry 1924 (class 2606 OID 18223)
-- Dependencies: 1574 1574
-- Name: adm_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY adm_modulo
    ADD CONSTRAINT adm_name_unique UNIQUE (name);


--
-- TOC entry 1926 (class 2606 OID 18225)
-- Dependencies: 1576 1576
-- Name: cclouds_aencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_agencia
    ADD CONSTRAINT cclouds_aencia_pkey PRIMARY KEY (id_agencia);


--
-- TOC entry 1928 (class 2606 OID 18227)
-- Dependencies: 1578 1578
-- Name: cclouds_city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_city
    ADD CONSTRAINT cclouds_city_pkey PRIMARY KEY (id_city);


--
-- TOC entry 1932 (class 2606 OID 18229)
-- Dependencies: 1580 1580
-- Name: cclouds_country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_country
    ADD CONSTRAINT cclouds_country_pkey PRIMARY KEY (id_country);


--
-- TOC entry 1938 (class 2606 OID 18231)
-- Dependencies: 1582 1582
-- Name: cclouds_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_empresa
    ADD CONSTRAINT cclouds_empresa_pkey PRIMARY KEY (id_empresa);


--
-- TOC entry 1940 (class 2606 OID 18233)
-- Dependencies: 1584 1584
-- Name: cclouds_exceptios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_exceptios
    ADD CONSTRAINT cclouds_exceptios_pkey PRIMARY KEY (id_exception);


--
-- TOC entry 1942 (class 2606 OID 18235)
-- Dependencies: 1586 1586
-- Name: cclouds_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_logs
    ADD CONSTRAINT cclouds_logs_pkey PRIMARY KEY (id_log);


--
-- TOC entry 1944 (class 2606 OID 18237)
-- Dependencies: 1588 1588
-- Name: cclouds_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_menu
    ADD CONSTRAINT cclouds_menu_pkey PRIMARY KEY (id_menu);


--
-- TOC entry 1946 (class 2606 OID 18239)
-- Dependencies: 1590 1590
-- Name: cclouds_module_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_module
    ADD CONSTRAINT cclouds_module_pkey PRIMARY KEY (id_module);


--
-- TOC entry 1950 (class 2606 OID 18241)
-- Dependencies: 1592 1592
-- Name: cclouds_options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_options
    ADD CONSTRAINT cclouds_options_pkey PRIMARY KEY (id_option);


--
-- TOC entry 1952 (class 2606 OID 18243)
-- Dependencies: 1594 1594
-- Name: cclouds_parroquia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_parroquia
    ADD CONSTRAINT cclouds_parroquia_pkey PRIMARY KEY (id_parroquia);


--
-- TOC entry 1956 (class 2606 OID 18245)
-- Dependencies: 1596 1596
-- Name: cclouds_province_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_province
    ADD CONSTRAINT cclouds_province_pkey PRIMARY KEY (id_province);


--
-- TOC entry 1964 (class 2606 OID 18247)
-- Dependencies: 1600 1600
-- Name: cclouds_rol_opciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_rol_adm
    ADD CONSTRAINT cclouds_rol_opciones_pkey PRIMARY KEY (id);


--
-- TOC entry 1960 (class 2606 OID 18249)
-- Dependencies: 1598 1598
-- Name: cclouds_rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_rol
    ADD CONSTRAINT cclouds_rol_pkey PRIMARY KEY (id_rol);


--
-- TOC entry 1986 (class 2606 OID 18401)
-- Dependencies: 1612 1612
-- Name: cclouds_servicio_name_servicio_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_servicio
    ADD CONSTRAINT cclouds_servicio_name_servicio_key UNIQUE (name_servicio);


--
-- TOC entry 1988 (class 2606 OID 18403)
-- Dependencies: 1612 1612
-- Name: cclouds_servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_servicio
    ADD CONSTRAINT cclouds_servicio_pkey PRIMARY KEY (id_servicio);


--
-- TOC entry 1970 (class 2606 OID 18251)
-- Dependencies: 1604 1604
-- Name: cclouds_sub_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_sub_empresa
    ADD CONSTRAINT cclouds_sub_empresa_pkey PRIMARY KEY (id_sub_empresa);


--
-- TOC entry 1972 (class 2606 OID 18253)
-- Dependencies: 1606 1606
-- Name: cclouds_sucursal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_sucursal
    ADD CONSTRAINT cclouds_sucursal_pkey PRIMARY KEY (id_sucursal);


--
-- TOC entry 1974 (class 2606 OID 18255)
-- Dependencies: 1608 1608
-- Name: cclouds_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_usuario
    ADD CONSTRAINT cclouds_usuario_pkey PRIMARY KEY (id_user);


--
-- TOC entry 1980 (class 2606 OID 18257)
-- Dependencies: 1609 1609 1609 1609
-- Name: cclouds_usuario_rol_agencia_id_user_id_rol_id_agencia_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_usuario_rol_agencia
    ADD CONSTRAINT cclouds_usuario_rol_agencia_id_user_id_rol_id_agencia_key UNIQUE (id_user, id_rol, id_agencia);


--
-- TOC entry 1982 (class 2606 OID 18259)
-- Dependencies: 1609 1609
-- Name: cclouds_usuario_rol_agencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_usuario_rol_agencia
    ADD CONSTRAINT cclouds_usuario_rol_agencia_pkey PRIMARY KEY (id);


--
-- TOC entry 1976 (class 2606 OID 18261)
-- Dependencies: 1608 1608
-- Name: email; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_usuario
    ADD CONSTRAINT email UNIQUE (user_email);


--
-- TOC entry 1966 (class 2606 OID 18263)
-- Dependencies: 1601 1601
-- Name: pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_sex
    ADD CONSTRAINT pk PRIMARY KEY (id_sex);


--
-- TOC entry 1984 (class 2606 OID 18265)
-- Dependencies: 1611 1611
-- Name: representantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY representantes
    ADD CONSTRAINT representantes_pkey PRIMARY KEY (id);


--
-- TOC entry 1930 (class 2606 OID 18267)
-- Dependencies: 1578 1578 1578
-- Name: unique_city_province; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_city
    ADD CONSTRAINT unique_city_province UNIQUE (id_province, name_city);


--
-- TOC entry 1934 (class 2606 OID 18269)
-- Dependencies: 1580 1580
-- Name: unique_code_country; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_country
    ADD CONSTRAINT unique_code_country UNIQUE (code_country);


--
-- TOC entry 1968 (class 2606 OID 18271)
-- Dependencies: 1601 1601
-- Name: unique_description_sex; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_sex
    ADD CONSTRAINT unique_description_sex UNIQUE (description_sex);


--
-- TOC entry 1962 (class 2606 OID 18273)
-- Dependencies: 1598 1598
-- Name: unique_name; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_rol
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- TOC entry 1936 (class 2606 OID 18275)
-- Dependencies: 1580 1580
-- Name: unique_name_country; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_country
    ADD CONSTRAINT unique_name_country UNIQUE (name_country);


--
-- TOC entry 1948 (class 2606 OID 18277)
-- Dependencies: 1590 1590
-- Name: unique_name_module; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_module
    ADD CONSTRAINT unique_name_module UNIQUE (name);


--
-- TOC entry 1954 (class 2606 OID 18279)
-- Dependencies: 1594 1594 1594
-- Name: unique_parroquia_ciudad; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_parroquia
    ADD CONSTRAINT unique_parroquia_ciudad UNIQUE (id_city, name_parroquia);


--
-- TOC entry 1958 (class 2606 OID 18281)
-- Dependencies: 1596 1596 1596
-- Name: unique_province_country; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_province
    ADD CONSTRAINT unique_province_country UNIQUE (id_country, name_province);


--
-- TOC entry 1978 (class 2606 OID 18283)
-- Dependencies: 1608 1608
-- Name: username; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cclouds_usuario
    ADD CONSTRAINT username UNIQUE (username);


--
-- TOC entry 1997 (class 2606 OID 18284)
-- Dependencies: 1600 1574 1921
-- Name: adm_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_rol_adm
    ADD CONSTRAINT adm_key FOREIGN KEY (id_options) REFERENCES adm_modulo(id);


--
-- TOC entry 1989 (class 2606 OID 18289)
-- Dependencies: 1574 1921 1574
-- Name: adm_modulo_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adm_modulo
    ADD CONSTRAINT adm_modulo_ibfk_1 FOREIGN KEY (id_padre) REFERENCES adm_modulo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1990 (class 2606 OID 18294)
-- Dependencies: 1576 1971 1606
-- Name: cclouds_agencia_id_sucursal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_agencia
    ADD CONSTRAINT cclouds_agencia_id_sucursal_fkey FOREIGN KEY (id_sucursal) REFERENCES cclouds_sucursal(id_sucursal) ON DELETE CASCADE;


--
-- TOC entry 1991 (class 2606 OID 18299)
-- Dependencies: 1955 1578 1596
-- Name: cclouds_city_id_province_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_city
    ADD CONSTRAINT cclouds_city_id_province_fkey FOREIGN KEY (id_province) REFERENCES cclouds_province(id_province) ON DELETE CASCADE;


--
-- TOC entry 1992 (class 2606 OID 18304)
-- Dependencies: 1586 1973 1608
-- Name: cclouds_logs_IdUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_logs
    ADD CONSTRAINT "cclouds_logs_IdUser_fkey" FOREIGN KEY (id_user) REFERENCES cclouds_usuario(id_user);


--
-- TOC entry 1993 (class 2606 OID 18309)
-- Dependencies: 1588 1945 1590
-- Name: cclouds_menu_id_module_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_menu
    ADD CONSTRAINT cclouds_menu_id_module_fkey FOREIGN KEY (id_module) REFERENCES cclouds_module(id_module) ON DELETE CASCADE;


--
-- TOC entry 1994 (class 2606 OID 18314)
-- Dependencies: 1943 1592 1588
-- Name: cclouds_options_id_menu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_options
    ADD CONSTRAINT cclouds_options_id_menu_fkey FOREIGN KEY (id_menu) REFERENCES cclouds_menu(id_menu) ON DELETE CASCADE;


--
-- TOC entry 1995 (class 2606 OID 18319)
-- Dependencies: 1578 1594 1927
-- Name: cclouds_parroquia_id_city_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_parroquia
    ADD CONSTRAINT cclouds_parroquia_id_city_fkey FOREIGN KEY (id_city) REFERENCES cclouds_city(id_city) ON DELETE CASCADE;


--
-- TOC entry 1996 (class 2606 OID 18324)
-- Dependencies: 1596 1580 1931
-- Name: cclouds_province_id_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_province
    ADD CONSTRAINT cclouds_province_id_country_fkey FOREIGN KEY (id_country) REFERENCES cclouds_country(id_country) ON DELETE CASCADE;


--
-- TOC entry 1998 (class 2606 OID 18329)
-- Dependencies: 1598 1600 1959
-- Name: cclouds_rol_opciones_id_rol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_rol_adm
    ADD CONSTRAINT cclouds_rol_opciones_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES cclouds_rol(id_rol) ON DELETE CASCADE;


--
-- TOC entry 1999 (class 2606 OID 18334)
-- Dependencies: 1604 1582 1937
-- Name: cclouds_sub_empresa_id_empresa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_sub_empresa
    ADD CONSTRAINT cclouds_sub_empresa_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES cclouds_empresa(id_empresa) ON DELETE CASCADE;


--
-- TOC entry 2000 (class 2606 OID 18339)
-- Dependencies: 1606 1969 1604
-- Name: cclouds_sucursal_id_sub_empresa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_sucursal
    ADD CONSTRAINT cclouds_sucursal_id_sub_empresa_fkey FOREIGN KEY (id_sub_empresa) REFERENCES cclouds_sub_empresa(id_sub_empresa) ON DELETE CASCADE;


--
-- TOC entry 2001 (class 2606 OID 18344)
-- Dependencies: 1925 1609 1576
-- Name: cclouds_usuario_rol_agencia_id_agencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_usuario_rol_agencia
    ADD CONSTRAINT cclouds_usuario_rol_agencia_id_agencia_fkey FOREIGN KEY (id_agencia) REFERENCES cclouds_agencia(id_agencia);


--
-- TOC entry 2002 (class 2606 OID 18349)
-- Dependencies: 1959 1609 1598
-- Name: cclouds_usuario_rol_agencia_id_rol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_usuario_rol_agencia
    ADD CONSTRAINT cclouds_usuario_rol_agencia_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES cclouds_rol(id_rol);


--
-- TOC entry 2003 (class 2606 OID 18354)
-- Dependencies: 1608 1973 1609
-- Name: cclouds_usuario_rol_agencia_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cclouds_usuario_rol_agencia
    ADD CONSTRAINT cclouds_usuario_rol_agencia_id_user_fkey FOREIGN KEY (id_user) REFERENCES cclouds_usuario(id_user);


--
-- TOC entry 2030 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 2032 (class 0 OID 0)
-- Dependencies: 1573
-- Name: secuencia_id_modulex; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE secuencia_id_modulex FROM PUBLIC;
REVOKE ALL ON SEQUENCE secuencia_id_modulex FROM postgres;
GRANT ALL ON SEQUENCE secuencia_id_modulex TO postgres;


--
-- TOC entry 2033 (class 0 OID 0)
-- Dependencies: 1574
-- Name: adm_modulo; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE adm_modulo FROM PUBLIC;
REVOKE ALL ON TABLE adm_modulo FROM postgres;
GRANT ALL ON TABLE adm_modulo TO postgres;


--
-- TOC entry 2035 (class 0 OID 0)
-- Dependencies: 1575
-- Name: secuencia_id_agencia; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE secuencia_id_agencia FROM PUBLIC;
REVOKE ALL ON SEQUENCE secuencia_id_agencia FROM postgres;
GRANT ALL ON SEQUENCE secuencia_id_agencia TO postgres;


--
-- TOC entry 2036 (class 0 OID 0)
-- Dependencies: 1576
-- Name: cclouds_agencia; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cclouds_agencia FROM PUBLIC;
REVOKE ALL ON TABLE cclouds_agencia FROM postgres;
GRANT ALL ON TABLE cclouds_agencia TO postgres;


--
-- TOC entry 2038 (class 0 OID 0)
-- Dependencies: 1577
-- Name: secuencia_id_city; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE secuencia_id_city FROM PUBLIC;
REVOKE ALL ON SEQUENCE secuencia_id_city FROM postgres;
GRANT ALL ON SEQUENCE secuencia_id_city TO postgres;


--
-- TOC entry 2039 (class 0 OID 0)
-- Dependencies: 1578
-- Name: cclouds_city; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cclouds_city FROM PUBLIC;
REVOKE ALL ON TABLE cclouds_city FROM postgres;
GRANT ALL ON TABLE cclouds_city TO postgres;


--
-- TOC entry 2041 (class 0 OID 0)
-- Dependencies: 1579
-- Name: secuencia_id_country; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE secuencia_id_country FROM PUBLIC;
REVOKE ALL ON SEQUENCE secuencia_id_country FROM postgres;
GRANT ALL ON SEQUENCE secuencia_id_country TO postgres;


--
-- TOC entry 2042 (class 0 OID 0)
-- Dependencies: 1580
-- Name: cclouds_country; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cclouds_country FROM PUBLIC;
REVOKE ALL ON TABLE cclouds_country FROM postgres;
GRANT ALL ON TABLE cclouds_country TO postgres;


--
-- TOC entry 2044 (class 0 OID 0)
-- Dependencies: 1581
-- Name: secuencia_id_empresa; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE secuencia_id_empresa FROM PUBLIC;
REVOKE ALL ON SEQUENCE secuencia_id_empresa FROM postgres;
GRANT ALL ON SEQUENCE secuencia_id_empresa TO postgres;


--
-- TOC entry 2045 (class 0 OID 0)
-- Dependencies: 1582
-- Name: cclouds_empresa; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cclouds_empresa FROM PUBLIC;
REVOKE ALL ON TABLE cclouds_empresa FROM postgres;
GRANT ALL ON TABLE cclouds_empresa TO postgres;


--
-- TOC entry 2047 (class 0 OID 0)
-- Dependencies: 1583
-- Name: secuencia_id_exceptions; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE secuencia_id_exceptions FROM PUBLIC;
REVOKE ALL ON SEQUENCE secuencia_id_exceptions FROM postgres;
GRANT ALL ON SEQUENCE secuencia_id_exceptions TO postgres;


--
-- TOC entry 2048 (class 0 OID 0)
-- Dependencies: 1584
-- Name: cclouds_exceptios; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cclouds_exceptios FROM PUBLIC;
REVOKE ALL ON TABLE cclouds_exceptios FROM postgres;
GRANT ALL ON TABLE cclouds_exceptios TO postgres;


--
-- TOC entry 2050 (class 0 OID 0)
-- Dependencies: 1585
-- Name: secuencia_id_log; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE secuencia_id_log FROM PUBLIC;
REVOKE ALL ON SEQUENCE secuencia_id_log FROM postgres;
GRANT ALL ON SEQUENCE secuencia_id_log TO postgres;


--
-- TOC entry 2051 (class 0 OID 0)
-- Dependencies: 1586
-- Name: cclouds_logs; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cclouds_logs FROM PUBLIC;
REVOKE ALL ON TABLE cclouds_logs FROM postgres;
GRANT ALL ON TABLE cclouds_logs TO postgres;


--
-- TOC entry 2053 (class 0 OID 0)
-- Dependencies: 1587
-- Name: secuencia_id_menu; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE secuencia_id_menu FROM PUBLIC;
REVOKE ALL ON SEQUENCE secuencia_id_menu FROM postgres;
GRANT ALL ON SEQUENCE secuencia_id_menu TO postgres;


--
-- TOC entry 2054 (class 0 OID 0)
-- Dependencies: 1588
-- Name: cclouds_menu; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cclouds_menu FROM PUBLIC;
REVOKE ALL ON TABLE cclouds_menu FROM postgres;
GRANT ALL ON TABLE cclouds_menu TO postgres;


--
-- TOC entry 2056 (class 0 OID 0)
-- Dependencies: 1589
-- Name: secuencia_id_module; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE secuencia_id_module FROM PUBLIC;
REVOKE ALL ON SEQUENCE secuencia_id_module FROM postgres;
GRANT ALL ON SEQUENCE secuencia_id_module TO postgres;


--
-- TOC entry 2057 (class 0 OID 0)
-- Dependencies: 1590
-- Name: cclouds_module; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cclouds_module FROM PUBLIC;
REVOKE ALL ON TABLE cclouds_module FROM postgres;
GRANT ALL ON TABLE cclouds_module TO postgres;


--
-- TOC entry 2059 (class 0 OID 0)
-- Dependencies: 1591
-- Name: secuencia_id_option; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE secuencia_id_option FROM PUBLIC;
REVOKE ALL ON SEQUENCE secuencia_id_option FROM postgres;
GRANT ALL ON SEQUENCE secuencia_id_option TO postgres;


--
-- TOC entry 2060 (class 0 OID 0)
-- Dependencies: 1592
-- Name: cclouds_options; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cclouds_options FROM PUBLIC;
REVOKE ALL ON TABLE cclouds_options FROM postgres;
GRANT ALL ON TABLE cclouds_options TO postgres;


--
-- TOC entry 2062 (class 0 OID 0)
-- Dependencies: 1593
-- Name: secuencia_id_parroquia; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE secuencia_id_parroquia FROM PUBLIC;
REVOKE ALL ON SEQUENCE secuencia_id_parroquia FROM postgres;
GRANT ALL ON SEQUENCE secuencia_id_parroquia TO postgres;


--
-- TOC entry 2063 (class 0 OID 0)
-- Dependencies: 1594
-- Name: cclouds_parroquia; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cclouds_parroquia FROM PUBLIC;
REVOKE ALL ON TABLE cclouds_parroquia FROM postgres;
GRANT ALL ON TABLE cclouds_parroquia TO postgres;


--
-- TOC entry 2065 (class 0 OID 0)
-- Dependencies: 1595
-- Name: secuencia_id_province; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE secuencia_id_province FROM PUBLIC;
REVOKE ALL ON SEQUENCE secuencia_id_province FROM postgres;
GRANT ALL ON SEQUENCE secuencia_id_province TO postgres;


--
-- TOC entry 2066 (class 0 OID 0)
-- Dependencies: 1596
-- Name: cclouds_province; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cclouds_province FROM PUBLIC;
REVOKE ALL ON TABLE cclouds_province FROM postgres;
GRANT ALL ON TABLE cclouds_province TO postgres;


--
-- TOC entry 2068 (class 0 OID 0)
-- Dependencies: 1597
-- Name: secuencia_id_rol; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE secuencia_id_rol FROM PUBLIC;
REVOKE ALL ON SEQUENCE secuencia_id_rol FROM postgres;
GRANT ALL ON SEQUENCE secuencia_id_rol TO postgres;


--
-- TOC entry 2069 (class 0 OID 0)
-- Dependencies: 1598
-- Name: cclouds_rol; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cclouds_rol FROM PUBLIC;
REVOKE ALL ON TABLE cclouds_rol FROM postgres;
GRANT ALL ON TABLE cclouds_rol TO postgres;


--
-- TOC entry 2071 (class 0 OID 0)
-- Dependencies: 1599
-- Name: secuencia_id_rol_options; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE secuencia_id_rol_options FROM PUBLIC;
REVOKE ALL ON SEQUENCE secuencia_id_rol_options FROM postgres;
GRANT ALL ON SEQUENCE secuencia_id_rol_options TO postgres;


--
-- TOC entry 2072 (class 0 OID 0)
-- Dependencies: 1600
-- Name: cclouds_rol_adm; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cclouds_rol_adm FROM PUBLIC;
REVOKE ALL ON TABLE cclouds_rol_adm FROM postgres;
GRANT ALL ON TABLE cclouds_rol_adm TO postgres;


--
-- TOC entry 2075 (class 0 OID 0)
-- Dependencies: 1601
-- Name: cclouds_sex; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cclouds_sex FROM PUBLIC;
REVOKE ALL ON TABLE cclouds_sex FROM postgres;
GRANT ALL ON TABLE cclouds_sex TO postgres;


--
-- TOC entry 2078 (class 0 OID 0)
-- Dependencies: 1602
-- Name: cclouds_sex_id_sex_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE cclouds_sex_id_sex_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE cclouds_sex_id_sex_seq FROM postgres;
GRANT ALL ON SEQUENCE cclouds_sex_id_sex_seq TO postgres;


--
-- TOC entry 2080 (class 0 OID 0)
-- Dependencies: 1603
-- Name: secuencia_id_sub_empresa; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE secuencia_id_sub_empresa FROM PUBLIC;
REVOKE ALL ON SEQUENCE secuencia_id_sub_empresa FROM postgres;
GRANT ALL ON SEQUENCE secuencia_id_sub_empresa TO postgres;


--
-- TOC entry 2081 (class 0 OID 0)
-- Dependencies: 1604
-- Name: cclouds_sub_empresa; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cclouds_sub_empresa FROM PUBLIC;
REVOKE ALL ON TABLE cclouds_sub_empresa FROM postgres;
GRANT ALL ON TABLE cclouds_sub_empresa TO postgres;


--
-- TOC entry 2083 (class 0 OID 0)
-- Dependencies: 1605
-- Name: secuencia_id_sucursal; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE secuencia_id_sucursal FROM PUBLIC;
REVOKE ALL ON SEQUENCE secuencia_id_sucursal FROM postgres;
GRANT ALL ON SEQUENCE secuencia_id_sucursal TO postgres;


--
-- TOC entry 2084 (class 0 OID 0)
-- Dependencies: 1606
-- Name: cclouds_sucursal; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cclouds_sucursal FROM PUBLIC;
REVOKE ALL ON TABLE cclouds_sucursal FROM postgres;
GRANT ALL ON TABLE cclouds_sucursal TO postgres;


--
-- TOC entry 2088 (class 0 OID 0)
-- Dependencies: 1607
-- Name: secuencia_id_usuario; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE secuencia_id_usuario FROM PUBLIC;
REVOKE ALL ON SEQUENCE secuencia_id_usuario FROM postgres;
GRANT ALL ON SEQUENCE secuencia_id_usuario TO postgres;


--
-- TOC entry 2089 (class 0 OID 0)
-- Dependencies: 1608
-- Name: cclouds_usuario; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cclouds_usuario FROM PUBLIC;
REVOKE ALL ON TABLE cclouds_usuario FROM postgres;
GRANT ALL ON TABLE cclouds_usuario TO postgres;


--
-- TOC entry 2092 (class 0 OID 0)
-- Dependencies: 1611
-- Name: representantes; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE representantes FROM PUBLIC;
REVOKE ALL ON TABLE representantes FROM postgres;
GRANT ALL ON TABLE representantes TO postgres;


-- Completed on 2016-05-02 01:04:44

--
-- PostgreSQL database dump complete
--

