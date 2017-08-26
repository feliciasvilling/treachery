--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.8
-- Dumped by pg_dump version 9.5.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO felicia;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO felicia;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO felicia;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO felicia;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO felicia;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO felicia;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO felicia;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO felicia;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO felicia;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO felicia;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO felicia;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO felicia;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO felicia;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO felicia;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_comment_flags; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE django_comment_flags (
    id integer NOT NULL,
    flag character varying(30) NOT NULL,
    flag_date timestamp with time zone NOT NULL,
    comment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE django_comment_flags OWNER TO felicia;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE django_comment_flags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_comment_flags_id_seq OWNER TO felicia;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE django_comment_flags_id_seq OWNED BY django_comment_flags.id;


--
-- Name: django_comments; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE django_comments (
    id integer NOT NULL,
    object_pk text NOT NULL,
    user_name character varying(50) NOT NULL,
    user_email character varying(254) NOT NULL,
    user_url character varying(200) NOT NULL,
    comment text NOT NULL,
    submit_date timestamp with time zone NOT NULL,
    ip_address inet,
    is_public boolean NOT NULL,
    is_removed boolean NOT NULL,
    content_type_id integer NOT NULL,
    site_id integer NOT NULL,
    user_id integer
);


ALTER TABLE django_comments OWNER TO felicia;

--
-- Name: django_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE django_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_comments_id_seq OWNER TO felicia;

--
-- Name: django_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE django_comments_id_seq OWNED BY django_comments.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO felicia;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO felicia;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO felicia;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO felicia;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO felicia;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE django_site OWNER TO felicia;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_site_id_seq OWNER TO felicia;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: players_action; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_action (
    id integer NOT NULL,
    willpower boolean NOT NULL,
    description text NOT NULL,
    resolved character varying(20) NOT NULL,
    action_type_id integer NOT NULL,
    character_id integer NOT NULL,
    session_id integer NOT NULL,
    result integer NOT NULL,
    CONSTRAINT players_action_result_check CHECK ((result >= 0))
);


ALTER TABLE players_action OWNER TO felicia;

--
-- Name: players_action_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_action_id_seq OWNER TO felicia;

--
-- Name: players_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_action_id_seq OWNED BY players_action.id;


--
-- Name: players_actionoption; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_actionoption (
    id integer NOT NULL,
    count integer NOT NULL,
    name character varying(200) NOT NULL,
    CONSTRAINT players_actionoption_count_check CHECK ((count >= 0))
);


ALTER TABLE players_actionoption OWNER TO felicia;

--
-- Name: players_actionoption_action_types; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_actionoption_action_types (
    id integer NOT NULL,
    actionoption_id integer NOT NULL,
    actiontype_id integer NOT NULL
);


ALTER TABLE players_actionoption_action_types OWNER TO felicia;

--
-- Name: players_actionoption_action_types_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_actionoption_action_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_actionoption_action_types_id_seq OWNER TO felicia;

--
-- Name: players_actionoption_action_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_actionoption_action_types_id_seq OWNED BY players_actionoption_action_types.id;


--
-- Name: players_actionoption_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_actionoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_actionoption_id_seq OWNER TO felicia;

--
-- Name: players_actionoption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_actionoption_id_seq OWNED BY players_actionoption.id;


--
-- Name: players_actiontype; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_actiontype (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    template text NOT NULL,
    no_roll boolean NOT NULL,
    aid_action boolean NOT NULL
);


ALTER TABLE players_actiontype OWNER TO felicia;

--
-- Name: players_actiontype_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_actiontype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_actiontype_id_seq OWNER TO felicia;

--
-- Name: players_actiontype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_actiontype_id_seq OWNED BY players_actiontype.id;


--
-- Name: players_activedisciplines; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_activedisciplines (
    id integer NOT NULL,
    character_id integer NOT NULL,
    session_id integer NOT NULL
);


ALTER TABLE players_activedisciplines OWNER TO felicia;

--
-- Name: players_activedisciplines_disciplines; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_activedisciplines_disciplines (
    id integer NOT NULL,
    activedisciplines_id integer NOT NULL,
    discipline_id integer NOT NULL
);


ALTER TABLE players_activedisciplines_disciplines OWNER TO felicia;

--
-- Name: players_activedisciplines_disciplines_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_activedisciplines_disciplines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_activedisciplines_disciplines_id_seq OWNER TO felicia;

--
-- Name: players_activedisciplines_disciplines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_activedisciplines_disciplines_id_seq OWNED BY players_activedisciplines_disciplines.id;


--
-- Name: players_activedisciplines_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_activedisciplines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_activedisciplines_id_seq OWNER TO felicia;

--
-- Name: players_activedisciplines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_activedisciplines_id_seq OWNED BY players_activedisciplines.id;


--
-- Name: players_advantage; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_advantage (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    costs character varying(200) NOT NULL,
    humanity boolean NOT NULL
);


ALTER TABLE players_advantage OWNER TO felicia;

--
-- Name: players_advantage_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_advantage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_advantage_id_seq OWNER TO felicia;

--
-- Name: players_advantage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_advantage_id_seq OWNED BY players_advantage.id;


--
-- Name: players_advantagerating; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_advantagerating (
    id integer NOT NULL,
    learned boolean NOT NULL,
    learning boolean NOT NULL,
    mentor boolean NOT NULL,
    value integer NOT NULL,
    exp integer NOT NULL,
    advantage_id integer,
    character_id integer,
    CONSTRAINT players_advantagerating_exp_check CHECK ((exp >= 0)),
    CONSTRAINT players_advantagerating_value_check CHECK ((value >= 0))
);


ALTER TABLE players_advantagerating OWNER TO felicia;

--
-- Name: players_advantagerating_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_advantagerating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_advantagerating_id_seq OWNER TO felicia;

--
-- Name: players_advantagerating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_advantagerating_id_seq OWNED BY players_advantagerating.id;


--
-- Name: players_age; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_age (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    backgrounds integer NOT NULL,
    generation integer NOT NULL,
    CONSTRAINT players_age_backgrounds_check CHECK ((backgrounds >= 0)),
    CONSTRAINT players_age_generation_check CHECK ((generation >= 0))
);


ALTER TABLE players_age OWNER TO felicia;

--
-- Name: players_age_action_options; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_age_action_options (
    id integer NOT NULL,
    age_id integer NOT NULL,
    actionoption_id integer NOT NULL
);


ALTER TABLE players_age_action_options OWNER TO felicia;

--
-- Name: players_age_action_options_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_age_action_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_age_action_options_id_seq OWNER TO felicia;

--
-- Name: players_age_action_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_age_action_options_id_seq OWNED BY players_age_action_options.id;


--
-- Name: players_age_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_age_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_age_id_seq OWNER TO felicia;

--
-- Name: players_age_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_age_id_seq OWNED BY players_age.id;


--
-- Name: players_aidaction; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_aidaction (
    action_ptr_id integer NOT NULL,
    name character varying(200) NOT NULL,
    action_id integer NOT NULL,
    helpee_id integer NOT NULL
);


ALTER TABLE players_aidaction OWNER TO felicia;

--
-- Name: players_aspect; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_aspect (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE players_aspect OWNER TO felicia;

--
-- Name: players_assignxp; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_assignxp (
    action_ptr_id integer NOT NULL,
    target_id integer NOT NULL
);


ALTER TABLE players_assignxp OWNER TO felicia;

--
-- Name: players_attribute; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_attribute (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE players_attribute OWNER TO felicia;

--
-- Name: players_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_attribute_id_seq OWNER TO felicia;

--
-- Name: players_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_attribute_id_seq OWNED BY players_attribute.id;


--
-- Name: players_attributerating; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_attributerating (
    id integer NOT NULL,
    learned boolean NOT NULL,
    elder_blood boolean NOT NULL,
    mentor boolean NOT NULL,
    value integer NOT NULL,
    exp integer NOT NULL,
    attribute_id integer,
    learning boolean NOT NULL,
    character_id integer,
    CONSTRAINT players_attributerating_exp_check CHECK ((exp >= 0)),
    CONSTRAINT players_attributerating_value_check CHECK ((value >= 0))
);


ALTER TABLE players_attributerating OWNER TO felicia;

--
-- Name: players_attributerating_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_attributerating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_attributerating_id_seq OWNER TO felicia;

--
-- Name: players_attributerating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_attributerating_id_seq OWNED BY players_attributerating.id;


--
-- Name: players_boon; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_boon (
    id integer NOT NULL,
    size character varying(10) NOT NULL,
    number integer NOT NULL,
    signer_id integer NOT NULL,
    CONSTRAINT players_boon_number_check CHECK ((number >= 0))
);


ALTER TABLE players_boon OWNER TO felicia;

--
-- Name: players_boon_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_boon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_boon_id_seq OWNER TO felicia;

--
-- Name: players_boon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_boon_id_seq OWNED BY players_boon.id;


--
-- Name: players_canonfact; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_canonfact (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    description text NOT NULL
);


ALTER TABLE players_canonfact OWNER TO felicia;

--
-- Name: players_canonfact_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_canonfact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_canonfact_id_seq OWNER TO felicia;

--
-- Name: players_canonfact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_canonfact_id_seq OWNED BY players_canonfact.id;


--
-- Name: players_changegoal; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_changegoal (
    id integer NOT NULL,
    theme character varying(20) NOT NULL,
    belief character varying(100) NOT NULL,
    action character varying(100) NOT NULL,
    open_goal boolean NOT NULL,
    character_id integer,
    goal_id integer NOT NULL,
    session_id integer
);


ALTER TABLE players_changegoal OWNER TO felicia;

--
-- Name: players_changegoal_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_changegoal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_changegoal_id_seq OWNER TO felicia;

--
-- Name: players_changegoal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_changegoal_id_seq OWNED BY players_changegoal.id;


--
-- Name: players_character; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_character (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    generation integer NOT NULL,
    blood integer NOT NULL,
    assets integer NOT NULL,
    concept character varying(50) NOT NULL,
    herd integer NOT NULL,
    haven integer NOT NULL,
    exp integer NOT NULL,
    humanity_exp integer NOT NULL,
    additional_notes text NOT NULL,
    age_id integer NOT NULL,
    clan_id integer,
    nature_id integer,
    political_faction_id integer,
    sire_id integer,
    user_id integer,
    aggravated integer NOT NULL,
    superficial integer NOT NULL,
    willpower integer NOT NULL,
    firearms integer NOT NULL,
    melee integer NOT NULL,
    haven_description text NOT NULL,
    haven_domain_id integer,
    herd_description text NOT NULL,
    status integer NOT NULL,
    pronoun_id integer NOT NULL,
    defined boolean NOT NULL,
    CONSTRAINT players_character_aggravated_check CHECK ((aggravated >= 0)),
    CONSTRAINT players_character_assets_f340be48_check CHECK ((assets >= 0)),
    CONSTRAINT players_character_blood_check CHECK ((blood >= 0)),
    CONSTRAINT players_character_exp_check CHECK ((exp >= 0)),
    CONSTRAINT players_character_firearms_check CHECK ((firearms >= 0)),
    CONSTRAINT players_character_generation_check CHECK ((generation >= 0)),
    CONSTRAINT players_character_haven_check CHECK ((haven >= 0)),
    CONSTRAINT players_character_herd_check CHECK ((herd >= 0)),
    CONSTRAINT players_character_humanity_exp_check CHECK ((humanity_exp >= 0)),
    CONSTRAINT players_character_melee_check CHECK ((melee >= 0)),
    CONSTRAINT players_character_superficial_381068e3_check CHECK ((superficial >= 0)),
    CONSTRAINT players_character_willpower_check CHECK ((willpower >= 0))
);


ALTER TABLE players_character OWNER TO felicia;

--
-- Name: players_character_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_character_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_character_id_seq OWNER TO felicia;

--
-- Name: players_character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_character_id_seq OWNED BY players_character.id;


--
-- Name: players_character_rituals; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_character_rituals (
    id integer NOT NULL,
    character_id integer NOT NULL,
    ritualrating_id integer NOT NULL
);


ALTER TABLE players_character_rituals OWNER TO felicia;

--
-- Name: players_character_rituals_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_character_rituals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_character_rituals_id_seq OWNER TO felicia;

--
-- Name: players_character_rituals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_character_rituals_id_seq OWNED BY players_character_rituals.id;


--
-- Name: players_character_specializations; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_character_specializations (
    id integer NOT NULL,
    character_id integer NOT NULL,
    specialization_id integer NOT NULL
);


ALTER TABLE players_character_specializations OWNER TO felicia;

--
-- Name: players_character_specializations_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_character_specializations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_character_specializations_id_seq OWNER TO felicia;

--
-- Name: players_character_specializations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_character_specializations_id_seq OWNED BY players_character_specializations.id;


--
-- Name: players_character_titles; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_character_titles (
    id integer NOT NULL,
    character_id integer NOT NULL,
    title_id integer NOT NULL
);


ALTER TABLE players_character_titles OWNER TO felicia;

--
-- Name: players_character_titles_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_character_titles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_character_titles_id_seq OWNER TO felicia;

--
-- Name: players_character_titles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_character_titles_id_seq OWNED BY players_character_titles.id;


--
-- Name: players_clan; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_clan (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    theme text NOT NULL
);


ALTER TABLE players_clan OWNER TO felicia;

--
-- Name: players_clan_clan_disciplines; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_clan_clan_disciplines (
    id integer NOT NULL,
    clan_id integer NOT NULL,
    discipline_id integer NOT NULL
);


ALTER TABLE players_clan_clan_disciplines OWNER TO felicia;

--
-- Name: players_clan_clan_disciplines_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_clan_clan_disciplines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_clan_clan_disciplines_id_seq OWNER TO felicia;

--
-- Name: players_clan_clan_disciplines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_clan_clan_disciplines_id_seq OWNED BY players_clan_clan_disciplines.id;


--
-- Name: players_clan_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_clan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_clan_id_seq OWNER TO felicia;

--
-- Name: players_clan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_clan_id_seq OWNED BY players_clan.id;


--
-- Name: players_conservedomain; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_conservedomain (
    action_ptr_id integer NOT NULL,
    domain_id integer NOT NULL
);


ALTER TABLE players_conservedomain OWNER TO felicia;

--
-- Name: players_conserveinfluence; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_conserveinfluence (
    action_ptr_id integer NOT NULL,
    influence_id integer NOT NULL
);


ALTER TABLE players_conserveinfluence OWNER TO felicia;

--
-- Name: players_discipline; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_discipline (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE players_discipline OWNER TO felicia;

--
-- Name: players_discipline_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_discipline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_discipline_id_seq OWNER TO felicia;

--
-- Name: players_discipline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_discipline_id_seq OWNED BY players_discipline.id;


--
-- Name: players_disciplinerating; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_disciplinerating (
    id integer NOT NULL,
    value integer NOT NULL,
    learned boolean NOT NULL,
    elder_blood boolean NOT NULL,
    in_clan boolean NOT NULL,
    mentor boolean NOT NULL,
    exp integer NOT NULL,
    discipline_id integer,
    learning boolean NOT NULL,
    character_id integer,
    CONSTRAINT players_disciplinerating_exp_check CHECK ((exp >= 0)),
    CONSTRAINT players_disciplinerating_value_check CHECK ((value >= 0))
);


ALTER TABLE players_disciplinerating OWNER TO felicia;

--
-- Name: players_disciplinerating_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_disciplinerating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_disciplinerating_id_seq OWNER TO felicia;

--
-- Name: players_disciplinerating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_disciplinerating_id_seq OWNED BY players_disciplinerating.id;


--
-- Name: players_domain; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_domain (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    feeding_capacity integer NOT NULL,
    status character varying(200) NOT NULL,
    influence character varying(200) NOT NULL,
    masquerade character varying(200) NOT NULL,
    owner_id integer,
    CONSTRAINT players_domain_feeding_capacity_check CHECK ((feeding_capacity >= 0))
);


ALTER TABLE players_domain OWNER TO felicia;

--
-- Name: players_domain_allowed; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_domain_allowed (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    character_id integer NOT NULL
);


ALTER TABLE players_domain_allowed OWNER TO felicia;

--
-- Name: players_domain_allowed_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_domain_allowed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_domain_allowed_id_seq OWNER TO felicia;

--
-- Name: players_domain_allowed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_domain_allowed_id_seq OWNED BY players_domain_allowed.id;


--
-- Name: players_domain_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_domain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_domain_id_seq OWNER TO felicia;

--
-- Name: players_domain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_domain_id_seq OWNED BY players_domain.id;


--
-- Name: players_domain_place; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_domain_place (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    place_id integer NOT NULL
);


ALTER TABLE players_domain_place OWNER TO felicia;

--
-- Name: players_domain_place_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_domain_place_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_domain_place_id_seq OWNER TO felicia;

--
-- Name: players_domain_place_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_domain_place_id_seq OWNED BY players_domain_place.id;


--
-- Name: players_domain_population; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_domain_population (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    population_id integer NOT NULL
);


ALTER TABLE players_domain_population OWNER TO felicia;

--
-- Name: players_domain_population_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_domain_population_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_domain_population_id_seq OWNER TO felicia;

--
-- Name: players_domain_population_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_domain_population_id_seq OWNED BY players_domain_population.id;


--
-- Name: players_elderpower; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_elderpower (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    description text NOT NULL,
    discipline_id integer
);


ALTER TABLE players_elderpower OWNER TO felicia;

--
-- Name: players_elderpower_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_elderpower_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_elderpower_id_seq OWNER TO felicia;

--
-- Name: players_elderpower_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_elderpower_id_seq OWNED BY players_elderpower.id;


--
-- Name: players_equipment; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_equipment (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    specialization_id integer,
    owner_id integer
);


ALTER TABLE players_equipment OWNER TO felicia;

--
-- Name: players_equipment_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_equipment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_equipment_id_seq OWNER TO felicia;

--
-- Name: players_equipment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_equipment_id_seq OWNED BY players_equipment.id;


--
-- Name: players_eventreport; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_eventreport (
    id integer NOT NULL,
    open_goal1 boolean NOT NULL,
    open_goal2 boolean NOT NULL,
    hidden_goal boolean NOT NULL,
    humanity integer NOT NULL,
    willpower integer NOT NULL,
    blood integer NOT NULL,
    superficial integer NOT NULL,
    aggravated integer NOT NULL,
    character_id integer,
    session_id integer,
    assets integer NOT NULL
);


ALTER TABLE players_eventreport OWNER TO felicia;

--
-- Name: players_eventreport_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_eventreport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_eventreport_id_seq OWNER TO felicia;

--
-- Name: players_eventreport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_eventreport_id_seq OWNED BY players_eventreport.id;


--
-- Name: players_expadvantagespending; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_expadvantagespending (
    id integer NOT NULL,
    exp boolean NOT NULL,
    advantage_id integer NOT NULL,
    character_id integer,
    session_id integer
);


ALTER TABLE players_expadvantagespending OWNER TO felicia;

--
-- Name: players_expadvantagespending_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_expadvantagespending_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_expadvantagespending_id_seq OWNER TO felicia;

--
-- Name: players_expadvantagespending_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_expadvantagespending_id_seq OWNED BY players_expadvantagespending.id;


--
-- Name: players_expattributespending; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_expattributespending (
    id integer NOT NULL,
    exp boolean NOT NULL,
    attribute_id integer NOT NULL,
    character_id integer,
    session_id integer
);


ALTER TABLE players_expattributespending OWNER TO felicia;

--
-- Name: players_expattributespending_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_expattributespending_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_expattributespending_id_seq OWNER TO felicia;

--
-- Name: players_expattributespending_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_expattributespending_id_seq OWNED BY players_expattributespending.id;


--
-- Name: players_expdisciplinespending; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_expdisciplinespending (
    id integer NOT NULL,
    exp boolean NOT NULL,
    character_id integer,
    discipline_id integer NOT NULL,
    session_id integer
);


ALTER TABLE players_expdisciplinespending OWNER TO felicia;

--
-- Name: players_expdisciplinespending_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_expdisciplinespending_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_expdisciplinespending_id_seq OWNER TO felicia;

--
-- Name: players_expdisciplinespending_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_expdisciplinespending_id_seq OWNED BY players_expdisciplinespending.id;


--
-- Name: players_feeding; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_feeding (
    id integer NOT NULL,
    feeding_points integer NOT NULL,
    description text NOT NULL,
    resolved character varying(10) NOT NULL,
    character_id integer NOT NULL,
    discipline_id integer,
    domain_id integer NOT NULL,
    session_id integer NOT NULL,
    has_good_method boolean NOT NULL,
    incident_roll integer NOT NULL,
    incidents integer NOT NULL,
    CONSTRAINT players_feeding_feeding_points_check CHECK ((feeding_points >= 0)),
    CONSTRAINT players_feeding_incident_roll_check CHECK ((incident_roll >= 0)),
    CONSTRAINT players_feeding_incidents_check CHECK ((incidents >= 0))
);


ALTER TABLE players_feeding OWNER TO felicia;

--
-- Name: players_feeding_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_feeding_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_feeding_id_seq OWNER TO felicia;

--
-- Name: players_feeding_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_feeding_id_seq OWNED BY players_feeding.id;


--
-- Name: players_ghoul; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_ghoul (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    level integer NOT NULL,
    hook_id integer,
    master_id integer,
    CONSTRAINT players_ghoul_level_check CHECK ((level >= 0))
);


ALTER TABLE players_ghoul OWNER TO felicia;

--
-- Name: players_ghoul_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_ghoul_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_ghoul_id_seq OWNER TO felicia;

--
-- Name: players_ghoul_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_ghoul_id_seq OWNED BY players_ghoul.id;


--
-- Name: players_ghoul_specializations; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_ghoul_specializations (
    id integer NOT NULL,
    ghoul_id integer NOT NULL,
    specialization_id integer NOT NULL
);


ALTER TABLE players_ghoul_specializations OWNER TO felicia;

--
-- Name: players_ghoul_specializations_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_ghoul_specializations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_ghoul_specializations_id_seq OWNER TO felicia;

--
-- Name: players_ghoul_specializations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_ghoul_specializations_id_seq OWNED BY players_ghoul_specializations.id;


--
-- Name: players_ghoulaidaction; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_ghoulaidaction (
    action_ptr_id integer NOT NULL,
    name character varying(200) NOT NULL,
    action_id integer NOT NULL,
    ghoul_id integer NOT NULL,
    helpee_id integer NOT NULL
);


ALTER TABLE players_ghoulaidaction OWNER TO felicia;

--
-- Name: players_ghouldisciplinerating; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_ghouldisciplinerating (
    id integer NOT NULL,
    value integer NOT NULL,
    discipline_id integer,
    ghoul_id integer NOT NULL,
    CONSTRAINT players_ghouldisciplinerating_value_check CHECK ((value >= 0))
);


ALTER TABLE players_ghouldisciplinerating OWNER TO felicia;

--
-- Name: players_ghouldisciplinerating_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_ghouldisciplinerating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_ghouldisciplinerating_id_seq OWNER TO felicia;

--
-- Name: players_ghouldisciplinerating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_ghouldisciplinerating_id_seq OWNED BY players_ghouldisciplinerating.id;


--
-- Name: players_goal; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_goal (
    id integer NOT NULL,
    theme character varying(20) NOT NULL,
    belief character varying(100) NOT NULL,
    action character varying(100) NOT NULL,
    character_id integer,
    open_goal boolean NOT NULL
);


ALTER TABLE players_goal OWNER TO felicia;

--
-- Name: players_goal_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_goal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_goal_id_seq OWNER TO felicia;

--
-- Name: players_goal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_goal_id_seq OWNED BY players_goal.id;


--
-- Name: players_healingreport; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_healingreport (
    id integer NOT NULL,
    superficial integer NOT NULL,
    aggravated integer NOT NULL,
    character_id integer,
    session_id integer,
    CONSTRAINT players_healingreport_aggravated_b6d6d4f2_check CHECK ((aggravated >= 0)),
    CONSTRAINT players_healingreport_superficial_247db11d_check CHECK ((superficial >= 0))
);


ALTER TABLE players_healingreport OWNER TO felicia;

--
-- Name: players_healingreport_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_healingreport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_healingreport_id_seq OWNER TO felicia;

--
-- Name: players_healingreport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_healingreport_id_seq OWNED BY players_healingreport.id;


--
-- Name: players_hook; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_hook (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    influence_id integer NOT NULL,
    concept character varying(200) NOT NULL,
    master_id integer
);


ALTER TABLE players_hook OWNER TO felicia;

--
-- Name: players_hook_aspects; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_hook_aspects (
    id integer NOT NULL,
    hook_id integer NOT NULL,
    aspect_id integer NOT NULL
);


ALTER TABLE players_hook_aspects OWNER TO felicia;

--
-- Name: players_hook_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_hook_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_hook_attributes_id_seq OWNER TO felicia;

--
-- Name: players_hook_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_hook_attributes_id_seq OWNED BY players_hook_aspects.id;


--
-- Name: players_hook_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_hook_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_hook_id_seq OWNER TO felicia;

--
-- Name: players_hook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_hook_id_seq OWNED BY players_hook.id;


--
-- Name: players_hookattribute_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_hookattribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_hookattribute_id_seq OWNER TO felicia;

--
-- Name: players_hookattribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_hookattribute_id_seq OWNED BY players_aspect.id;


--
-- Name: players_influence; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_influence (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE players_influence OWNER TO felicia;

--
-- Name: players_influence_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_influence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_influence_id_seq OWNER TO felicia;

--
-- Name: players_influence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_influence_id_seq OWNED BY players_influence.id;


--
-- Name: players_influencedestroy; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_influencedestroy (
    action_ptr_id integer NOT NULL,
    name character varying(200) NOT NULL,
    influence_id integer NOT NULL
);


ALTER TABLE players_influencedestroy OWNER TO felicia;

--
-- Name: players_influencerating; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_influencerating (
    id integer NOT NULL,
    rating integer NOT NULL,
    character_id integer NOT NULL,
    influence_id integer NOT NULL,
    CONSTRAINT players_influencerating_rating_check CHECK ((rating >= 0))
);


ALTER TABLE players_influencerating OWNER TO felicia;

--
-- Name: players_influencerating_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_influencerating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_influencerating_id_seq OWNER TO felicia;

--
-- Name: players_influencerating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_influencerating_id_seq OWNED BY players_influencerating.id;


--
-- Name: players_influencesteal; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_influencesteal (
    action_ptr_id integer NOT NULL,
    name character varying(200) NOT NULL,
    influence_id integer NOT NULL
);


ALTER TABLE players_influencesteal OWNER TO felicia;

--
-- Name: players_influencewant; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_influencewant (
    id integer NOT NULL,
    wanted integer NOT NULL,
    dislodged integer NOT NULL,
    final boolean NOT NULL,
    character_id integer NOT NULL,
    influence_id integer NOT NULL,
    elder boolean NOT NULL
);


ALTER TABLE players_influencewant OWNER TO felicia;

--
-- Name: players_influencewant_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_influencewant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_influencewant_id_seq OWNER TO felicia;

--
-- Name: players_influencewant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_influencewant_id_seq OWNED BY players_influencewant.id;


--
-- Name: players_investequipment; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_investequipment (
    action_ptr_id integer NOT NULL,
    name character varying(200) NOT NULL,
    specialization_id integer NOT NULL
);


ALTER TABLE players_investequipment OWNER TO felicia;

--
-- Name: players_investghoul; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_investghoul (
    action_ptr_id integer NOT NULL,
    name character varying(200) NOT NULL,
    discipline_id integer NOT NULL,
    specialization_id integer NOT NULL
);


ALTER TABLE players_investghoul OWNER TO felicia;

--
-- Name: players_investhaven; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_investhaven (
    action_ptr_id integer NOT NULL
);


ALTER TABLE players_investhaven OWNER TO felicia;

--
-- Name: players_investherd; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_investherd (
    action_ptr_id integer NOT NULL
);


ALTER TABLE players_investherd OWNER TO felicia;

--
-- Name: players_investigatecharacterdowntimeactions; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_investigatecharacterdowntimeactions (
    action_ptr_id integer NOT NULL,
    target_id integer NOT NULL
);


ALTER TABLE players_investigatecharacterdowntimeactions OWNER TO felicia;

--
-- Name: players_investigatecharacterinfluence; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_investigatecharacterinfluence (
    action_ptr_id integer NOT NULL,
    target_id integer NOT NULL
);


ALTER TABLE players_investigatecharacterinfluence OWNER TO felicia;

--
-- Name: players_investigatecharacterresources; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_investigatecharacterresources (
    action_ptr_id integer NOT NULL,
    target_id integer NOT NULL
);


ALTER TABLE players_investigatecharacterresources OWNER TO felicia;

--
-- Name: players_investigatecounterspionage; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_investigatecounterspionage (
    action_ptr_id integer NOT NULL
);


ALTER TABLE players_investigatecounterspionage OWNER TO felicia;

--
-- Name: players_investigateinfluence; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_investigateinfluence (
    action_ptr_id integer NOT NULL,
    influence_id integer NOT NULL
);


ALTER TABLE players_investigateinfluence OWNER TO felicia;

--
-- Name: players_investigatephenomenon; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_investigatephenomenon (
    action_ptr_id integer NOT NULL,
    phenonemon text NOT NULL
);


ALTER TABLE players_investigatephenomenon OWNER TO felicia;

--
-- Name: players_investweapon; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_investweapon (
    action_ptr_id integer NOT NULL,
    weapon character varying(20) NOT NULL
);


ALTER TABLE players_investweapon OWNER TO felicia;

--
-- Name: players_keepersquestion; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_keepersquestion (
    action_ptr_id integer NOT NULL,
    question text NOT NULL,
    target_id integer NOT NULL
);


ALTER TABLE players_keepersquestion OWNER TO felicia;

--
-- Name: players_learnadvantage; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_learnadvantage (
    action_ptr_id integer NOT NULL,
    advantage_id integer NOT NULL
);


ALTER TABLE players_learnadvantage OWNER TO felicia;

--
-- Name: players_learnattribute; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_learnattribute (
    action_ptr_id integer NOT NULL,
    attribute_id integer NOT NULL,
    trainer_id integer,
    blood boolean NOT NULL
);


ALTER TABLE players_learnattribute OWNER TO felicia;

--
-- Name: players_learndiscipline; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_learndiscipline (
    action_ptr_id integer NOT NULL,
    discipline_id integer NOT NULL,
    trainer_id integer,
    blood boolean NOT NULL
);


ALTER TABLE players_learndiscipline OWNER TO felicia;

--
-- Name: players_learnspecialization; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_learnspecialization (
    action_ptr_id integer NOT NULL,
    new_specialization_id integer NOT NULL,
    old_specialization_id integer NOT NULL,
    trainer_id integer
);


ALTER TABLE players_learnspecialization OWNER TO felicia;

--
-- Name: players_losthook; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_losthook (
    id integer NOT NULL,
    character_id integer NOT NULL,
    hook_id integer NOT NULL,
    session_id integer NOT NULL
);


ALTER TABLE players_losthook OWNER TO felicia;

--
-- Name: players_losthook_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_losthook_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_losthook_id_seq OWNER TO felicia;

--
-- Name: players_losthook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_losthook_id_seq OWNED BY players_losthook.id;


--
-- Name: players_mentorattribute; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_mentorattribute (
    action_ptr_id integer NOT NULL,
    attribute_id integer NOT NULL,
    student_id integer NOT NULL,
    blood boolean NOT NULL
);


ALTER TABLE players_mentorattribute OWNER TO felicia;

--
-- Name: players_mentordiscipline; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_mentordiscipline (
    action_ptr_id integer NOT NULL,
    discipline_id integer NOT NULL,
    student_id integer NOT NULL,
    blood boolean NOT NULL
);


ALTER TABLE players_mentordiscipline OWNER TO felicia;

--
-- Name: players_mentorspecialization; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_mentorspecialization (
    action_ptr_id integer NOT NULL,
    specialization_id integer NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE players_mentorspecialization OWNER TO felicia;

--
-- Name: players_nature; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_nature (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE players_nature OWNER TO felicia;

--
-- Name: players_nature_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_nature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_nature_id_seq OWNER TO felicia;

--
-- Name: players_nature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_nature_id_seq OWNED BY players_nature.id;


--
-- Name: players_neglectdomain; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_neglectdomain (
    action_ptr_id integer NOT NULL,
    domain_id integer NOT NULL
);


ALTER TABLE players_neglectdomain OWNER TO felicia;

--
-- Name: players_patroldomain; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_patroldomain (
    action_ptr_id integer NOT NULL,
    domain_id integer NOT NULL
);


ALTER TABLE players_patroldomain OWNER TO felicia;

--
-- Name: players_place; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_place (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE players_place OWNER TO felicia;

--
-- Name: players_place_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_place_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_place_id_seq OWNER TO felicia;

--
-- Name: players_place_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_place_id_seq OWNED BY players_place.id;


--
-- Name: players_politicalfaction; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_politicalfaction (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    description text NOT NULL
);


ALTER TABLE players_politicalfaction OWNER TO felicia;

--
-- Name: players_politicalfaction_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_politicalfaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_politicalfaction_id_seq OWNER TO felicia;

--
-- Name: players_politicalfaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_politicalfaction_id_seq OWNED BY players_politicalfaction.id;


--
-- Name: players_population; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_population (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE players_population OWNER TO felicia;

--
-- Name: players_population_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_population_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_population_id_seq OWNER TO felicia;

--
-- Name: players_population_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_population_id_seq OWNED BY players_population.id;


--
-- Name: players_primogensaidaction; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_primogensaidaction (
    action_ptr_id integer NOT NULL,
    name character varying(200) NOT NULL,
    action_id integer NOT NULL,
    helpee_id integer NOT NULL
);


ALTER TABLE players_primogensaidaction OWNER TO felicia;

--
-- Name: players_primogensquestion; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_primogensquestion (
    action_ptr_id integer NOT NULL,
    question text NOT NULL,
    target_id integer NOT NULL
);


ALTER TABLE players_primogensquestion OWNER TO felicia;

--
-- Name: players_pronoun; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_pronoun (
    id integer NOT NULL,
    subjective character varying(10) NOT NULL,
    objective character varying(10) NOT NULL,
    possessive character varying(10) NOT NULL
);


ALTER TABLE players_pronoun OWNER TO felicia;

--
-- Name: players_pronoun_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_pronoun_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_pronoun_id_seq OWNER TO felicia;

--
-- Name: players_pronoun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_pronoun_id_seq OWNED BY players_pronoun.id;


--
-- Name: players_relationship; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_relationship (
    id integer NOT NULL,
    complicated boolean NOT NULL,
    description character varying(100) NOT NULL,
    blood_bond integer NOT NULL,
    character_id integer NOT NULL,
    other_character_id integer,
    CONSTRAINT players_relationship_blood_bond_check CHECK ((blood_bond >= 0))
);


ALTER TABLE players_relationship OWNER TO felicia;

--
-- Name: players_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_relationship_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_relationship_id_seq OWNER TO felicia;

--
-- Name: players_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_relationship_id_seq OWNED BY players_relationship.id;


--
-- Name: players_rest; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_rest (
    action_ptr_id integer NOT NULL
);


ALTER TABLE players_rest OWNER TO felicia;

--
-- Name: players_ritual; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_ritual (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    level integer NOT NULL,
    description text NOT NULL,
    CONSTRAINT players_ritual_level_check CHECK ((level >= 0))
);


ALTER TABLE players_ritual OWNER TO felicia;

--
-- Name: players_ritual_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_ritual_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_ritual_id_seq OWNER TO felicia;

--
-- Name: players_ritual_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_ritual_id_seq OWNED BY players_ritual.id;


--
-- Name: players_ritualrating; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_ritualrating (
    id integer NOT NULL,
    exp boolean NOT NULL,
    invested integer NOT NULL,
    ritual_id integer NOT NULL,
    CONSTRAINT players_ritualrating_invested_check CHECK ((invested >= 0))
);


ALTER TABLE players_ritualrating OWNER TO felicia;

--
-- Name: players_ritualrating_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_ritualrating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_ritualrating_id_seq OWNER TO felicia;

--
-- Name: players_ritualrating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_ritualrating_id_seq OWNED BY players_ritualrating.id;


--
-- Name: players_rumor; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_rumor (
    id integer NOT NULL,
    description text NOT NULL,
    gm_note text NOT NULL,
    rumor_type character varying(15) NOT NULL,
    "canonFact_id" integer,
    influence_id integer,
    session_id integer NOT NULL
);


ALTER TABLE players_rumor OWNER TO felicia;

--
-- Name: players_rumor_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_rumor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_rumor_id_seq OWNER TO felicia;

--
-- Name: players_rumor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_rumor_id_seq OWNED BY players_rumor.id;


--
-- Name: players_rumor_recipients; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_rumor_recipients (
    id integer NOT NULL,
    rumor_id integer NOT NULL,
    character_id integer NOT NULL
);


ALTER TABLE players_rumor_recipients OWNER TO felicia;

--
-- Name: players_rumor_recipients_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_rumor_recipients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_rumor_recipients_id_seq OWNER TO felicia;

--
-- Name: players_rumor_recipients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_rumor_recipients_id_seq OWNED BY players_rumor_recipients.id;


--
-- Name: players_season; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_season (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    theme text NOT NULL,
    is_open boolean NOT NULL
);


ALTER TABLE players_season OWNER TO felicia;

--
-- Name: players_season_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_season_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_season_id_seq OWNER TO felicia;

--
-- Name: players_season_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_season_id_seq OWNED BY players_season.id;


--
-- Name: players_session; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_session (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_open boolean NOT NULL,
    is_special boolean NOT NULL,
    action_set_id integer,
    previous_id integer,
    season_id integer
);


ALTER TABLE players_session OWNER TO felicia;

--
-- Name: players_session_feeding_domains; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_session_feeding_domains (
    id integer NOT NULL,
    session_id integer NOT NULL,
    domain_id integer NOT NULL
);


ALTER TABLE players_session_feeding_domains OWNER TO felicia;

--
-- Name: players_session_feeding_domains_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_session_feeding_domains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_session_feeding_domains_id_seq OWNER TO felicia;

--
-- Name: players_session_feeding_domains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_session_feeding_domains_id_seq OWNED BY players_session_feeding_domains.id;


--
-- Name: players_session_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_session_id_seq OWNER TO felicia;

--
-- Name: players_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_session_id_seq OWNED BY players_session.id;


--
-- Name: players_specialization; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_specialization (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE players_specialization OWNER TO felicia;

--
-- Name: players_specialization_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_specialization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_specialization_id_seq OWNER TO felicia;

--
-- Name: players_specialization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_specialization_id_seq OWNED BY players_specialization.id;


--
-- Name: players_statusassignment; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_statusassignment (
    id integer NOT NULL,
    status integer NOT NULL,
    assigner_id integer NOT NULL,
    session_id integer NOT NULL,
    target_id integer NOT NULL
);


ALTER TABLE players_statusassignment OWNER TO felicia;

--
-- Name: players_statusassignment_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_statusassignment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_statusassignment_id_seq OWNER TO felicia;

--
-- Name: players_statusassignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_statusassignment_id_seq OWNED BY players_statusassignment.id;


--
-- Name: players_title; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_title (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE players_title OWNER TO felicia;

--
-- Name: players_title_action_options; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_title_action_options (
    id integer NOT NULL,
    title_id integer NOT NULL,
    actionoption_id integer NOT NULL
);


ALTER TABLE players_title_action_options OWNER TO felicia;

--
-- Name: players_title_action_options_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_title_action_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_title_action_options_id_seq OWNER TO felicia;

--
-- Name: players_title_action_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_title_action_options_id_seq OWNED BY players_title_action_options.id;


--
-- Name: players_title_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_title_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_title_id_seq OWNER TO felicia;

--
-- Name: players_title_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_title_id_seq OWNED BY players_title.id;


--
-- Name: players_weapon; Type: TABLE; Schema: public; Owner: felicia
--

CREATE TABLE players_weapon (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    mod integer NOT NULL,
    damage_type character varying(200) NOT NULL,
    assets integer NOT NULL,
    ranged boolean NOT NULL,
    CONSTRAINT players_weapon_assets_b00b32f9_check CHECK ((assets >= 0)),
    CONSTRAINT players_weapon_mod_check CHECK ((mod >= 0))
);


ALTER TABLE players_weapon OWNER TO felicia;

--
-- Name: players_weapon_id_seq; Type: SEQUENCE; Schema: public; Owner: felicia
--

CREATE SEQUENCE players_weapon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_weapon_id_seq OWNER TO felicia;

--
-- Name: players_weapon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felicia
--

ALTER SEQUENCE players_weapon_id_seq OWNED BY players_weapon.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_comment_flags ALTER COLUMN id SET DEFAULT nextval('django_comment_flags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_comments ALTER COLUMN id SET DEFAULT nextval('django_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_action ALTER COLUMN id SET DEFAULT nextval('players_action_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_actionoption ALTER COLUMN id SET DEFAULT nextval('players_actionoption_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_actionoption_action_types ALTER COLUMN id SET DEFAULT nextval('players_actionoption_action_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_actiontype ALTER COLUMN id SET DEFAULT nextval('players_actiontype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_activedisciplines ALTER COLUMN id SET DEFAULT nextval('players_activedisciplines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_activedisciplines_disciplines ALTER COLUMN id SET DEFAULT nextval('players_activedisciplines_disciplines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_advantage ALTER COLUMN id SET DEFAULT nextval('players_advantage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_advantagerating ALTER COLUMN id SET DEFAULT nextval('players_advantagerating_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_age ALTER COLUMN id SET DEFAULT nextval('players_age_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_age_action_options ALTER COLUMN id SET DEFAULT nextval('players_age_action_options_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_aspect ALTER COLUMN id SET DEFAULT nextval('players_hookattribute_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_attribute ALTER COLUMN id SET DEFAULT nextval('players_attribute_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_attributerating ALTER COLUMN id SET DEFAULT nextval('players_attributerating_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_boon ALTER COLUMN id SET DEFAULT nextval('players_boon_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_canonfact ALTER COLUMN id SET DEFAULT nextval('players_canonfact_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_changegoal ALTER COLUMN id SET DEFAULT nextval('players_changegoal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character ALTER COLUMN id SET DEFAULT nextval('players_character_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character_rituals ALTER COLUMN id SET DEFAULT nextval('players_character_rituals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character_specializations ALTER COLUMN id SET DEFAULT nextval('players_character_specializations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character_titles ALTER COLUMN id SET DEFAULT nextval('players_character_titles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_clan ALTER COLUMN id SET DEFAULT nextval('players_clan_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_clan_clan_disciplines ALTER COLUMN id SET DEFAULT nextval('players_clan_clan_disciplines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_discipline ALTER COLUMN id SET DEFAULT nextval('players_discipline_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_disciplinerating ALTER COLUMN id SET DEFAULT nextval('players_disciplinerating_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_domain ALTER COLUMN id SET DEFAULT nextval('players_domain_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_domain_allowed ALTER COLUMN id SET DEFAULT nextval('players_domain_allowed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_domain_place ALTER COLUMN id SET DEFAULT nextval('players_domain_place_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_domain_population ALTER COLUMN id SET DEFAULT nextval('players_domain_population_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_elderpower ALTER COLUMN id SET DEFAULT nextval('players_elderpower_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_equipment ALTER COLUMN id SET DEFAULT nextval('players_equipment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_eventreport ALTER COLUMN id SET DEFAULT nextval('players_eventreport_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_expadvantagespending ALTER COLUMN id SET DEFAULT nextval('players_expadvantagespending_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_expattributespending ALTER COLUMN id SET DEFAULT nextval('players_expattributespending_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_expdisciplinespending ALTER COLUMN id SET DEFAULT nextval('players_expdisciplinespending_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_feeding ALTER COLUMN id SET DEFAULT nextval('players_feeding_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ghoul ALTER COLUMN id SET DEFAULT nextval('players_ghoul_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ghoul_specializations ALTER COLUMN id SET DEFAULT nextval('players_ghoul_specializations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ghouldisciplinerating ALTER COLUMN id SET DEFAULT nextval('players_ghouldisciplinerating_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_goal ALTER COLUMN id SET DEFAULT nextval('players_goal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_healingreport ALTER COLUMN id SET DEFAULT nextval('players_healingreport_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_hook ALTER COLUMN id SET DEFAULT nextval('players_hook_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_hook_aspects ALTER COLUMN id SET DEFAULT nextval('players_hook_attributes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_influence ALTER COLUMN id SET DEFAULT nextval('players_influence_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_influencerating ALTER COLUMN id SET DEFAULT nextval('players_influencerating_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_influencewant ALTER COLUMN id SET DEFAULT nextval('players_influencewant_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_losthook ALTER COLUMN id SET DEFAULT nextval('players_losthook_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_nature ALTER COLUMN id SET DEFAULT nextval('players_nature_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_place ALTER COLUMN id SET DEFAULT nextval('players_place_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_politicalfaction ALTER COLUMN id SET DEFAULT nextval('players_politicalfaction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_population ALTER COLUMN id SET DEFAULT nextval('players_population_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_pronoun ALTER COLUMN id SET DEFAULT nextval('players_pronoun_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_relationship ALTER COLUMN id SET DEFAULT nextval('players_relationship_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ritual ALTER COLUMN id SET DEFAULT nextval('players_ritual_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ritualrating ALTER COLUMN id SET DEFAULT nextval('players_ritualrating_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_rumor ALTER COLUMN id SET DEFAULT nextval('players_rumor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_rumor_recipients ALTER COLUMN id SET DEFAULT nextval('players_rumor_recipients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_season ALTER COLUMN id SET DEFAULT nextval('players_season_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_session ALTER COLUMN id SET DEFAULT nextval('players_session_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_session_feeding_domains ALTER COLUMN id SET DEFAULT nextval('players_session_feeding_domains_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_specialization ALTER COLUMN id SET DEFAULT nextval('players_specialization_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_statusassignment ALTER COLUMN id SET DEFAULT nextval('players_statusassignment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_title ALTER COLUMN id SET DEFAULT nextval('players_title_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_title_action_options ALTER COLUMN id SET DEFAULT nextval('players_title_action_options_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_weapon ALTER COLUMN id SET DEFAULT nextval('players_weapon_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
537	Can add log entry	179	add_logentry
538	Can change log entry	179	change_logentry
539	Can delete log entry	179	delete_logentry
540	Can add permission	180	add_permission
541	Can change permission	180	change_permission
542	Can delete permission	180	delete_permission
543	Can add group	181	add_group
544	Can change group	181	change_group
545	Can delete group	181	delete_group
546	Can add user	182	add_user
547	Can change user	182	change_user
548	Can delete user	182	delete_user
549	Can add content type	183	add_contenttype
550	Can change content type	183	change_contenttype
551	Can delete content type	183	delete_contenttype
552	Can add session	184	add_session
553	Can change session	184	change_session
554	Can delete session	184	delete_session
555	Can add site	185	add_site
556	Can change site	185	change_site
557	Can delete site	185	delete_site
558	Can add comment	186	add_comment
559	Can change comment	186	change_comment
560	Can delete comment	186	delete_comment
561	Can moderate comments	186	can_moderate
562	Can add comment flag	187	add_commentflag
563	Can change comment flag	187	change_commentflag
564	Can delete comment flag	187	delete_commentflag
565	Can add action type	188	add_actiontype
566	Can change action type	188	change_actiontype
567	Can delete action type	188	delete_actiontype
568	Can add action option	189	add_actionoption
569	Can change action option	189	change_actionoption
570	Can delete action option	189	delete_actionoption
571	Can add influence	190	add_influence
572	Can change influence	190	change_influence
573	Can delete influence	190	delete_influence
574	Can add population	191	add_population
575	Can change population	191	change_population
576	Can delete population	191	delete_population
577	Can add elder power	192	add_elderpower
578	Can change elder power	192	change_elderpower
579	Can delete elder power	192	delete_elderpower
580	Can add discipline	193	add_discipline
581	Can change discipline	193	change_discipline
582	Can delete discipline	193	delete_discipline
583	Can add discipline rating	194	add_disciplinerating
584	Can change discipline rating	194	change_disciplinerating
585	Can delete discipline rating	194	delete_disciplinerating
586	Can add exp discipline spending	195	add_expdisciplinespending
587	Can change exp discipline spending	195	change_expdisciplinespending
588	Can delete exp discipline spending	195	delete_expdisciplinespending
589	Can add attribute	196	add_attribute
590	Can change attribute	196	change_attribute
591	Can delete attribute	196	delete_attribute
592	Can add attribute rating	197	add_attributerating
593	Can change attribute rating	197	change_attributerating
594	Can delete attribute rating	197	delete_attributerating
595	Can add exp attribute spending	198	add_expattributespending
596	Can change exp attribute spending	198	change_expattributespending
597	Can delete exp attribute spending	198	delete_expattributespending
598	Can add specialization	199	add_specialization
599	Can change specialization	199	change_specialization
600	Can delete specialization	199	delete_specialization
601	Can add weapon	200	add_weapon
602	Can change weapon	200	change_weapon
603	Can delete weapon	200	delete_weapon
604	Can add title	201	add_title
605	Can change title	201	change_title
606	Can delete title	201	delete_title
607	Can add age	202	add_age
608	Can change age	202	change_age
609	Can delete age	202	delete_age
610	Can add clan	203	add_clan
611	Can change clan	203	change_clan
612	Can delete clan	203	delete_clan
613	Can add political faction	204	add_politicalfaction
614	Can change political faction	204	change_politicalfaction
615	Can delete political faction	204	delete_politicalfaction
616	Can add canon fact	205	add_canonfact
617	Can change canon fact	205	change_canonfact
618	Can delete canon fact	205	delete_canonfact
619	Can add nature	206	add_nature
620	Can change nature	206	change_nature
621	Can delete nature	206	delete_nature
622	Can add relationship	207	add_relationship
623	Can change relationship	207	change_relationship
624	Can delete relationship	207	delete_relationship
625	Can add ritual	208	add_ritual
626	Can change ritual	208	change_ritual
627	Can delete ritual	208	delete_ritual
628	Can add ritual rating	209	add_ritualrating
629	Can change ritual rating	209	change_ritualrating
630	Can delete ritual rating	209	delete_ritualrating
631	Can add hook	210	add_hook
632	Can change hook	210	change_hook
633	Can delete hook	210	delete_hook
634	Can add boon	211	add_boon
635	Can change boon	211	change_boon
636	Can delete boon	211	delete_boon
637	Can add equipment	212	add_equipment
638	Can change equipment	212	change_equipment
639	Can delete equipment	212	delete_equipment
640	Can add ghoul	213	add_ghoul
641	Can change ghoul	213	change_ghoul
642	Can delete ghoul	213	delete_ghoul
643	Can add domain	214	add_domain
644	Can change domain	214	change_domain
645	Can delete domain	214	delete_domain
646	Can add character	215	add_character
647	Can change character	215	change_character
648	Can delete character	215	delete_character
649	Can add influence rating	216	add_influencerating
650	Can change influence rating	216	change_influencerating
651	Can delete influence rating	216	delete_influencerating
652	Can add session	217	add_session
653	Can change session	217	change_session
654	Can delete session	217	delete_session
655	Can add action	218	add_action
656	Can change action	218	change_action
657	Can delete action	218	delete_action
658	Can add aid action	219	add_aidaction
659	Can change aid action	219	change_aidaction
660	Can delete aid action	219	delete_aidaction
661	Can add primogens aid action	220	add_primogensaidaction
662	Can change primogens aid action	220	change_primogensaidaction
663	Can delete primogens aid action	220	delete_primogensaidaction
664	Can add ghoul aid action	221	add_ghoulaidaction
665	Can change ghoul aid action	221	change_ghoulaidaction
666	Can delete ghoul aid action	221	delete_ghoulaidaction
667	Can add conserve influence	222	add_conserveinfluence
668	Can change conserve influence	222	change_conserveinfluence
669	Can delete conserve influence	222	delete_conserveinfluence
670	Can add conserve domain	223	add_conservedomain
671	Can change conserve domain	223	change_conservedomain
672	Can delete conserve domain	223	delete_conservedomain
673	Can add lost hook	224	add_losthook
674	Can change lost hook	224	change_losthook
675	Can delete lost hook	224	delete_losthook
676	Can add influence steal	225	add_influencesteal
677	Can change influence steal	225	change_influencesteal
678	Can delete influence steal	225	delete_influencesteal
679	Can add influence destroy	226	add_influencedestroy
680	Can change influence destroy	226	change_influencedestroy
681	Can delete influence destroy	226	delete_influencedestroy
682	Can add investigate character influence	227	add_investigatecharacterinfluence
683	Can change investigate character influence	227	change_investigatecharacterinfluence
684	Can delete investigate character influence	227	delete_investigatecharacterinfluence
685	Can add investigate character resources	228	add_investigatecharacterresources
686	Can change investigate character resources	228	change_investigatecharacterresources
687	Can delete investigate character resources	228	delete_investigatecharacterresources
688	Can add investigate character downtime actions	229	add_investigatecharacterdowntimeactions
689	Can change investigate character downtime actions	229	change_investigatecharacterdowntimeactions
690	Can delete investigate character downtime actions	229	delete_investigatecharacterdowntimeactions
691	Can add investigate counter spionage	230	add_investigatecounterspionage
692	Can change investigate counter spionage	230	change_investigatecounterspionage
693	Can delete investigate counter spionage	230	delete_investigatecounterspionage
694	Can add investigate phenomenon	231	add_investigatephenomenon
695	Can change investigate phenomenon	231	change_investigatephenomenon
696	Can delete investigate phenomenon	231	delete_investigatephenomenon
697	Can add investigate influence	232	add_investigateinfluence
698	Can change investigate influence	232	change_investigateinfluence
699	Can delete investigate influence	232	delete_investigateinfluence
700	Can add learn attribute	233	add_learnattribute
701	Can change learn attribute	233	change_learnattribute
702	Can delete learn attribute	233	delete_learnattribute
703	Can add learn discipline	234	add_learndiscipline
704	Can change learn discipline	234	change_learndiscipline
705	Can delete learn discipline	234	delete_learndiscipline
706	Can add learn specialization	235	add_learnspecialization
707	Can change learn specialization	235	change_learnspecialization
708	Can delete learn specialization	235	delete_learnspecialization
709	Can add invest ghoul	236	add_investghoul
710	Can change invest ghoul	236	change_investghoul
711	Can delete invest ghoul	236	delete_investghoul
712	Can add invest equipment	237	add_investequipment
713	Can change invest equipment	237	change_investequipment
714	Can delete invest equipment	237	delete_investequipment
715	Can add invest weapon	238	add_investweapon
716	Can change invest weapon	238	change_investweapon
717	Can delete invest weapon	238	delete_investweapon
718	Can add invest herd	239	add_investherd
719	Can change invest herd	239	change_investherd
720	Can delete invest herd	239	delete_investherd
721	Can add invest haven	240	add_investhaven
722	Can change invest haven	240	change_investhaven
723	Can delete invest haven	240	delete_investhaven
724	Can add mentor attribute	241	add_mentorattribute
725	Can change mentor attribute	241	change_mentorattribute
726	Can delete mentor attribute	241	delete_mentorattribute
727	Can add mentor discipline	242	add_mentordiscipline
728	Can change mentor discipline	242	change_mentordiscipline
729	Can delete mentor discipline	242	delete_mentordiscipline
730	Can add mentor specialization	243	add_mentorspecialization
731	Can change mentor specialization	243	change_mentorspecialization
732	Can delete mentor specialization	243	delete_mentorspecialization
733	Can add rest	244	add_rest
734	Can change rest	244	change_rest
735	Can delete rest	244	delete_rest
736	Can add neglect domain	245	add_neglectdomain
737	Can change neglect domain	245	change_neglectdomain
738	Can delete neglect domain	245	delete_neglectdomain
739	Can add patrol domain	246	add_patroldomain
740	Can change patrol domain	246	change_patroldomain
741	Can delete patrol domain	246	delete_patroldomain
742	Can add keepers question	247	add_keepersquestion
743	Can change keepers question	247	change_keepersquestion
744	Can delete keepers question	247	delete_keepersquestion
745	Can add primogens question	248	add_primogensquestion
746	Can change primogens question	248	change_primogensquestion
747	Can delete primogens question	248	delete_primogensquestion
748	Can add event report	249	add_eventreport
749	Can change event report	249	change_eventreport
750	Can delete event report	249	delete_eventreport
751	Can add healing report	250	add_healingreport
752	Can change healing report	250	change_healingreport
753	Can delete healing report	250	delete_healingreport
754	Can add feeding	251	add_feeding
755	Can change feeding	251	change_feeding
756	Can delete feeding	251	delete_feeding
757	Can add active disciplines	252	add_activedisciplines
758	Can change active disciplines	252	change_activedisciplines
759	Can delete active disciplines	252	delete_activedisciplines
760	Can add rumor	253	add_rumor
761	Can change rumor	253	change_rumor
762	Can delete rumor	253	delete_rumor
763	Can add aspect	254	add_aspect
764	Can change aspect	254	change_aspect
765	Can delete aspect	254	delete_aspect
766	Can add ghoul discipline rating	255	add_ghouldisciplinerating
767	Can change ghoul discipline rating	255	change_ghouldisciplinerating
768	Can delete ghoul discipline rating	255	delete_ghouldisciplinerating
769	Can add season	256	add_season
770	Can change season	256	change_season
771	Can delete season	256	delete_season
772	Can add goal	257	add_goal
773	Can change goal	257	change_goal
774	Can delete goal	257	delete_goal
775	Can add change goal	258	add_changegoal
776	Can change change goal	258	change_changegoal
777	Can delete change goal	258	delete_changegoal
778	Can add advantage	259	add_advantage
779	Can change advantage	259	change_advantage
780	Can delete advantage	259	delete_advantage
781	Can add advantage rating	260	add_advantagerating
782	Can change advantage rating	260	change_advantagerating
783	Can delete advantage rating	260	delete_advantagerating
784	Can add learn advantage	261	add_learnadvantage
785	Can change learn advantage	261	change_learnadvantage
786	Can delete learn advantage	261	delete_learnadvantage
787	Can add exp advantage spending	262	add_expadvantagespending
788	Can change exp advantage spending	262	change_expadvantagespending
789	Can delete exp advantage spending	262	delete_expadvantagespending
790	Can add pronoun	263	add_pronoun
791	Can change pronoun	263	change_pronoun
792	Can delete pronoun	263	delete_pronoun
793	Can add assign xp	264	add_assignxp
794	Can change assign xp	264	change_assignxp
795	Can delete assign xp	264	delete_assignxp
796	Can add status assignment	265	add_statusassignment
797	Can change status assignment	265	change_statusassignment
798	Can delete status assignment	265	delete_statusassignment
799	Can add influence want	266	add_influencewant
800	Can change influence want	266	change_influencewant
801	Can delete influence want	266	delete_influencewant
802	Can add place	267	add_place
803	Can change place	267	change_place
804	Can delete place	267	delete_place
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('auth_permission_id_seq', 804, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
39	pbkdf2_sha256$24000$qbreOFM8i7Cs$3DhUytKXx2HmZz+FjRFP1hzsEYiyrdIPjyurQZzhBdk=	2017-05-25 22:21:06.718+00	t	smz			erik@gartner.io	t	t	2017-01-23 22:42:38.874+00
41	pbkdf2_sha256$24000$SgGqYLdSNQua$ZYH1kJk/0QLfO+EltcuFn1PE/AQ2ZvBK7n0XRn9pGvs=	2017-05-18 14:14:08.088+00	t	Johannes_Jörgensen	Johannes	Jörgensen	joergensen.arbete@gmail.com	t	t	2017-01-24 09:09:55+00
42	pbkdf2_sha256$24000$TCixvJTeGh6M$4c4xfYyYRcQOMQ9Bru0IfxvLKQF//IRMfrrPqr3wlJE=	2017-04-27 18:35:07.171+00	f	AnMu	Anton	Muller	kinganton93@gmail.com	f	t	2017-01-24 09:20:21+00
43	pbkdf2_sha256$24000$DUDYQW5oMsi8$/PoMbY0Y07dxEUpGBnwdkHKRTUXa9yBeLqJXr82fNjI=	2017-04-05 20:07:55.096+00	f	DeLi	Dennis	Lindberg	dennis.lindberg93@gmail.com	f	t	2017-01-24 09:20:43+00
44	pbkdf2_sha256$24000$KFN2H2ZfWxpW$v96yVb21v3+YcxYR3sM6OVHVvZVJXQa8CNRT++WTL38=	2017-05-18 15:35:33.475+00	f	MaLu	Martin	Lundmark	carlmartinlundmark@gmail.com	f	t	2017-01-24 09:21:28+00
45	pbkdf2_sha256$24000$wmqhBHA2ByXo$uDoMgKKFll8+fY2oJo6Uuq4xJdy6gO1daLjpGx+FRQE=	2017-05-20 16:21:35.205+00	f	EmHa	Emil	Hannu	emil.hannu@gmail.com	f	t	2017-01-24 09:22:08+00
46	pbkdf2_sha256$24000$SJzoKwtgrMS5$dQBiX1TFTge9tYmFfD+LRcjrerZJqsdJj4K+ZJHoxbY=	\N	f	JoBå				f	t	2017-01-24 09:25:32.171+00
47	pbkdf2_sha256$24000$blIlXuhrUVZu$o/eHe9JH3/yVhydTwObsBj6z8dsmoxaw82B+yahaQEg=	2017-05-19 23:04:35.252+00	f	JeGy	Jerome	Gylling	alexgylling@gmail.com	f	t	2017-01-24 09:26:16+00
48	pbkdf2_sha256$24000$gXkYKKIMIYtW$6RmFcSTPtDg4o17sgqvEvU9mZAGBff4LPNr09L+JyzM=	\N	f	SeLu	Sebastian	Luszczak	ruby.carbunkle@gmail.com	f	t	2017-01-24 09:28:03+00
49	pbkdf2_sha256$24000$I8XYgZo1woj4$Y1rWzf+JSLP7hgxBFCWaWu2SSt/Yqq/K5yl7ynZmhwc=	2017-05-15 16:18:03.212+00	f	SeLi	Sebastian	Lindeberg	SebastianLindeberg@hotmail.com	f	t	2017-01-24 09:29:29+00
50	pbkdf2_sha256$24000$FDy00CRA0BJU$X4DaiCfl5VkdXorf/lbYuak/a3terWrcagcfr86hiVE=	\N	f	EmBe				f	t	2017-01-24 09:30:14.497+00
51	pbkdf2_sha256$24000$2o1HvPtUrX4Z$GbP/GpKD3poJUzng2g1gxO8RlEwivtDmpmiM5Q71ixM=	2017-01-26 11:12:48.636+00	f	MaTe				f	t	2017-01-24 09:30:58.596+00
52	pbkdf2_sha256$24000$FMKgE07ntnSn$XGC+fnL94EtSoc4cb2VbkSrnfE4xTiSgNQMGdOQZgRs=	2017-04-08 17:50:37.722+00	f	DeCe	Denniz	Cederquist	denniz.cederquist@gmail.com	f	t	2017-01-24 09:31:56+00
54	pbkdf2_sha256$24000$Ggly9Q9VraB4$1rzi7W9iV0oq3XsD4wQwL0I/rqYgnRiWk8XSo3qDPiA=	2017-05-20 13:34:40.167+00	f	TiOl	Tim	Olsson	olsson.ti@gmail.com	f	t	2017-01-24 09:33:18+00
55	pbkdf2_sha256$24000$j2EwLxwgO9N7$MdUC9k6OHtumX6sfHBjeqCrNgwAtabV7dFswNYq4eYo=	2017-05-15 20:31:51.267+00	f	DeNi	Dennis	Nilsson	jester9322@gmail.com	f	t	2017-01-24 09:34:01+00
56	pbkdf2_sha256$24000$FzScng8MjsPT$OwlZi71SUCF14A/JzEeqMiv0bwTV/fG/LUFJEM8zMXo=	2017-05-20 15:12:12.538+00	f	ToKr	Tomas	Kronvall	tomas@cernael.com	f	t	2017-01-24 09:34:46+00
57	pbkdf2_sha256$24000$voBPtcrkeMev$O7kAoTkQpatSO31wX0CEKjbaEuhpFe9735gMjuk3AyY=	2017-05-15 16:06:41.472+00	f	PeBj	Peter	Björklund	Petter_k_bjorklund@hotmail.com	f	t	2017-01-24 09:35:28+00
58	pbkdf2_sha256$24000$PYd6sSOjXeH2$zlXXnAPHtHZLCu01kiH/PRk6z9bI3H0ENzXwixvolQk=	2017-05-20 16:00:53.591+00	f	SaMa	Sara	Magnusson	srmgnssn@gmail.com	f	t	2017-01-24 09:35:59+00
59	pbkdf2_sha256$24000$X0WpJenZcxZC$DX/+VxYFIxVbcrXB78YEH1IFgey+MxN4aukzAATpgMo=	2017-05-20 14:07:48.444+00	f	AnNi	Angelika	Nilsson	angelika@nanunanu.se	f	t	2017-01-24 09:36:30+00
60	pbkdf2_sha256$24000$BUhrd8wCrPiu$qNuj6Ew+sywsNsLcwgJJ3NTVY1fjqO70kBBaSdw5hLc=	2017-05-19 22:20:17.52+00	f	HaRe	Hannes	Reventlid	en_snubbe15@hotmail.com	f	t	2017-01-24 09:37:33+00
61	pbkdf2_sha256$24000$kFMIZWrgAjWq$PIhQpnMqBPTtSSQPcfCTA4m219o/sdbrGgUICoYHYiE=	2017-05-20 15:46:43.118+00	f	JaAn	Janni	Andersen	janni.andersen@live.se	f	t	2017-01-24 09:38:34+00
62	pbkdf2_sha256$24000$34W0SNJlRPDk$vNEFenGEsidBKNXmc6m9Z9MMrVKE7PCKWmBcrkuTp4Q=	2017-01-26 08:35:31.279+00	f	ChBo				f	t	2017-01-24 09:39:14.516+00
63	pbkdf2_sha256$24000$zTkU1mfYAEOZ$H9EHrtJTNYL9X/FkKWJYOEbfkUYPOlOVPU6Udegzjhs=	2017-05-20 11:13:57.249+00	f	HeRo	Henrik	Roos	xetroxerion@gmail.com	f	t	2017-01-24 09:40:03+00
64	pbkdf2_sha256$24000$d3idLYSpCRmd$mFZj2yYKZT+x/Flr7e+828CjJAq1nkn5hxNL17o82uE=	2017-05-15 08:14:43.963+00	f	JoAl	Jonas	Ahlgård	joniebonie9110@hotmail.com	f	t	2017-01-24 09:40:38+00
65	pbkdf2_sha256$24000$7pzv7Rf8PGd8$B43riW10tKvuJtGUnJpxQr/CdAHAXyiypLYXcriNCQg=	2017-05-25 22:25:41.655+00	f	erik_test	erik	test konto		f	t	2017-01-24 12:03:44+00
66	pbkdf2_sha256$24000$j42gDDTxpXGq$+jsR5Evbnt9iduFQsKcE3GDM+pYsdO6cB/z4vnNp/Ng=	2017-05-15 07:25:05.507+00	f	JoJö				f	t	2017-01-24 15:19:08.271+00
67	pbkdf2_sha256$24000$LyWAr0P3k7sj$4jSE79SHJd/wpL1P4aQOB7nbRYos7I08KRT1QWPqiiE=	2017-04-07 16:22:23.497+00	t	Frans				t	t	2017-01-24 20:31:15+00
68	pbkdf2_sha256$24000$6MZFRxYDG2mB$vfpcMInErglk26JLoUekey4HSxa+sbOK5XoA/wT/3Ho=	2017-04-05 20:24:41.284+00	f	MaDa	Matilda	Dahl	matilda.l.dahl89@gmail.com	f	t	2017-01-24 20:58:13+00
69	pbkdf2_sha256$24000$ZBgZyxWsVmp5$afLBFrqHT+KYDukE9u9BjOc4XWeghlLJNc/XNjx2/NA=	2017-02-11 18:31:44.328+00	f	FrSö	Fredrik	Söderqvist		f	t	2017-02-11 18:28:31+00
70	pbkdf2_sha256$24000$IxoZN2li91Su$zv4hx/xTze2FkNbadD3ZSIBXAZuysCmZdvUYJU1jkdM=	2017-03-03 14:16:12.603+00	f	xia				f	t	2017-02-27 18:51:08.761+00
71	pbkdf2_sha256$24000$fc7pCqpL09Sr$W+1mtkbOGhOKlbk3MA6O5P2SpJPHmeYrSszkVlkWmJU=	2017-03-03 14:15:55.213+00	f	lo				f	t	2017-02-27 19:46:01.712+00
72	pbkdf2_sha256$24000$VmLJext3FIVG$eAoLtHrHXZ0urtTor8Kj8DkzShpU30r9C8z5Zra73JM=	2017-05-15 12:10:00.919+00	f	WaHa	Wander	Havir	oliver.havir@gmail.com	f	t	2017-03-27 16:33:54+00
73	pbkdf2_sha256$24000$AAWdmTIm7gI2$X5fWaoN5VKkKspcrzDx+f+zxs0+E0Vmo1wP9cInRiys=	2017-05-20 16:23:12.094+00	f	OrSv	Orion	Sveinsson	orion1323@outlook.com	f	t	2017-03-27 16:34:10+00
74	pbkdf2_sha256$24000$Pb7ShxKx6uUP$mYARJFZkxzJQ0tZhvIpTflScPYhhQ9Ne8egwotFeakU=	2017-05-20 14:16:08.63+00	f	DaSt	Daniel	Strömholm	stromholm@gmail.com	f	t	2017-04-02 11:51:30+00
75	pbkdf2_sha256$24000$shpdIU5ksqLw$3EZjGU8W62Wh9qmq3gI5preZ5BcSw1GHVpqemp1DEfA=	2017-05-20 04:36:45.244+00	f	NaJo	Nathaniel	Johansson	kratash@gmail.com	f	t	2017-05-02 14:36:40+00
53	pbkdf2_sha256$24000$DhTumR1vfiER$HJqx6nlumFA9e7cIleeLvhxC5DolBD/E48x+5ukvh7E=	2017-08-11 16:13:06.211663+00	f	MaOr	Max	Ortman	phyrean@gmail.com	f	t	2017-01-24 09:32:41+00
40	pbkdf2_sha256$24000$snLxEPCdTO9K$5cbsoXSx7sEQbdsbaPTE4jHKFTtGmOYPx/EPd6wlbKQ=	2017-08-19 13:59:46.676246+00	t	felicia	Felicia	Svilling	felicia@svilling.eu	t	t	2017-01-23 22:44:12+00
76	pbkdf2_sha256$24000$iDFhntKfb8C4$O1RENv0FVdj7UIwQ27vtwKMXWohQjFrJKGjBv6iLSB0=	2017-08-21 16:10:31.900074+00	f	lola				f	t	2017-07-25 21:08:58.699+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('auth_user_id_seq', 76, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-07-25 21:08:58.723+00	38	lola	1	Added.	182	40
2	2017-07-26 10:38:37.442+00	1	[open] inför lajv 2	2	Changed is_open.	217	40
3	2017-07-26 10:46:32.081+00	1	Goal object	1	Added.	257	40
4	2017-07-26 10:47:03.754+00	2	Goal object	1	Added.	257	40
5	2017-07-26 10:47:39.512+00	3	Goal object	1	Added.	257	40
6	2017-07-26 18:56:40.146+00	1	Helsingkrona	1	Added.	256	40
7	2017-07-26 18:56:59.64+00	1	[open] inför lajv 2	2	Changed season.	217	40
8	2017-08-01 20:08:37.306+00	1210	[inför lajv 2] Elspeth (lola): Investigate (Character: Influence)	2	Changed resolved.	227	40
9	2017-08-01 20:09:46.109+00	1210	[inför lajv 2] Elspeth (lola): Investigate (Character: Influence)	2	Changed description and resolved.	227	40
10	2017-08-01 20:11:01.345+00	1210	[inför lajv 2] Elspeth (lola): Investigate (Character: Influence)	2	Changed description and resolved.	227	40
11	2017-08-01 20:11:49.627+00	1210	[inför lajv 2] Elspeth (lola): Investigate (Character: Influence)	2	No fields changed.	227	40
12	2017-08-01 20:43:10.127+00	148	Bo Kant	2	Changed master.	210	40
13	2017-08-01 20:43:20.683+00	149	Ali Al-Khan	2	Changed master.	210	40
14	2017-08-01 20:43:29.031+00	147	Daniel Engström	2	Changed master.	210	40
15	2017-08-01 20:43:49.841+00	1210	[inför lajv 2] Elspeth (lola): Investigate (Character: Influence)	2	Changed description and resolved.	227	40
16	2017-08-01 20:47:47.189+00	1210	[inför lajv 2] Elspeth (lola): Investigate (Character: Influence)	2	Changed description and resolved.	227	40
17	2017-08-01 20:53:35.042+00	1210	[inför lajv 2] Elspeth (lola): Investigate (Character: Influence)	2	Changed description and resolved.	227	40
18	2017-08-01 21:01:12.417+00	1210	[inför lajv 2] Elspeth (lola): Investigate (Character: Influence)	2	Changed description and resolved.	227	40
19	2017-08-01 21:04:44.931+00	1210	[inför lajv 2] Elspeth (lola): Investigate (Character: Influence)	2	Changed description and resolved.	227	40
20	2017-08-01 23:22:17.973+00	1215	[inför lajv 2] Elspeth (lola): Investigate (Character: Resources)	2	Changed description and resolved.	228	40
21	2017-08-01 23:22:24.22+00	1216	[inför lajv 2] Elspeth (lola): Investigate (Character: Resources)	2	Changed description and resolved.	228	40
22	2017-08-01 23:24:33.583+00	1216	[inför lajv 2] Elspeth (lola): Investigate (Character: Resources)	2	Changed description and resolved.	228	40
23	2017-08-01 23:24:40.35+00	1215	[inför lajv 2] Elspeth (lola): Investigate (Character: Resources)	2	Changed description and resolved.	228	40
24	2017-08-01 23:26:10.475+00	1216	[inför lajv 2] Elspeth (lola): Investigate (Character: Resources)	2	Changed description and resolved.	228	40
25	2017-08-01 23:57:55.951+00	34	Learn (Advantage)	1	Added.	188	40
26	2017-08-01 23:58:57.63+00	1	Humanity	1	Added.	259	40
27	2017-08-02 00:00:55.277+00	2	Willpower	1	Added.	259	40
28	2017-08-02 00:18:41.629+00	1	[Aid Action or Conserve (Influence) or Conserve (Domain) or Influence (Forge) or Influence (Steal) or Influence (Destroy) or Investigate (Character: Influence) or Investigate (Character: Resources) or	2	Changed action_types.	189	40
29	2017-08-02 00:19:24.296+00	1	Humanity 1	1	Added.	260	40
30	2017-08-02 00:19:34.253+00	2	Willpower 1	1	Added.	260	40
31	2017-08-02 01:01:29.198+00	2	Willpower 1	2	Changed learned.	260	40
32	2017-08-02 17:42:14.676+00	84	[open] inför lajv 2: Elspeth (lola)	3		249	40
33	2017-08-03 13:26:58.766+00	1239	[inför lajv 2] Elspeth (lola): Invest (Herd)	3		218	40
34	2017-08-03 13:26:58.804+00	1238	[inför lajv 2] Elspeth (lola): Rest	3		218	40
35	2017-08-03 13:26:58.814+00	1237	[inför lajv 2] Elspeth (lola): Invest (Herd)	3		218	40
36	2017-08-03 13:26:58.825+00	1236	[inför lajv 2] Elspeth (lola): Rest	3		218	40
37	2017-08-03 13:26:58.838+00	1235	[inför lajv 2] Elspeth (lola): Invest (Herd)	3		218	40
38	2017-08-03 13:26:58.849+00	1234	[inför lajv 2] Elspeth (lola): Rest	3		218	40
39	2017-08-03 13:39:06.83+00	1253	[inför lajv 2] Elspeth (lola): Invest (Herd)	3		218	40
40	2017-08-03 13:39:06.841+00	1252	[inför lajv 2] Elspeth (lola): Rest	3		218	40
41	2017-08-03 13:39:06.851+00	1251	[inför lajv 2] Elspeth (lola): Invest (Herd)	3		218	40
42	2017-08-03 13:39:06.861+00	1250	[inför lajv 2] Elspeth (lola): Rest	3		218	40
43	2017-08-03 13:39:06.871+00	1249	[inför lajv 2] Elspeth (lola): Invest (Herd)	3		218	40
44	2017-08-03 13:39:06.881+00	1248	[inför lajv 2] Elspeth (lola): Rest	3		218	40
45	2017-08-03 13:39:06.891+00	1247	[inför lajv 2] Elspeth (lola): Invest (Herd)	3		218	40
46	2017-08-03 13:39:06.901+00	1246	[inför lajv 2] Elspeth (lola): Rest	3		218	40
47	2017-08-03 13:39:06.912+00	1245	[inför lajv 2] Elspeth (lola): Invest (Herd)	3		218	40
48	2017-08-03 13:39:06.922+00	1244	[inför lajv 2] Elspeth (lola): Rest	3		218	40
49	2017-08-03 13:39:06.932+00	1243	[inför lajv 2] Elspeth (lola): Invest (Herd)	3		218	40
50	2017-08-03 13:39:06.943+00	1242	[inför lajv 2] Elspeth (lola): Rest	3		218	40
51	2017-08-03 13:39:06.954+00	1241	[inför lajv 2] Elspeth (lola): Invest (Herd)	3		218	40
52	2017-08-03 13:39:06.964+00	1240	[inför lajv 2] Elspeth (lola): Rest	3		218	40
53	2017-08-03 13:39:06.974+00	1233	[inför lajv 2] Elspeth (lola): Invest (Herd)	3		218	40
54	2017-08-03 19:35:09.763+00	85	None: None	3		249	40
55	2017-08-03 19:35:20.481+00	90	[open] inför lajv 2: Elspeth (lola)	2	Changed open_goal2 and superficial.	249	40
56	2017-08-03 20:02:09.826+00	3	Based on Faction: Elspeth believes that Min faction är bäst and will therefor jag ska propagera.	2	Changed label.	257	40
57	2017-08-03 20:02:20.861+00	2	Based on Clan Theme: Elspeth believes that min klan är bäst and will therefor alla andra klaner sk.	2	Changed label.	257	40
58	2017-08-03 20:23:07.755+00	57	[open] inför lajv 2: Elspeth (lola)	3		258	40
59	2017-08-03 20:23:07.791+00	56	[open] inför lajv 2: Elspeth (lola)	3		258	40
60	2017-08-03 20:23:07.801+00	55	[open] inför lajv 2: Elspeth (lola)	3		258	40
61	2017-08-03 21:11:34.468+00	1260	[inför lajv 2] Elspeth (lola): Rest	3		218	40
62	2017-08-03 21:11:34.497+00	1259	[inför lajv 2] Elspeth (lola): Rest	3		218	40
63	2017-08-03 21:11:34.507+00	1258	[inför lajv 2] Elspeth (lola): Rest	3		218	40
64	2017-08-03 21:11:34.517+00	1257	[inför lajv 2] Elspeth (lola): Rest	3		218	40
65	2017-08-03 21:11:34.526+00	1256	[inför lajv 2] Elspeth (lola): Rest	3		218	40
66	2017-08-03 21:11:34.536+00	1255	[inför lajv 2] Elspeth (lola): Rest	3		218	40
67	2017-08-03 21:11:34.546+00	1254	[inför lajv 2] Elspeth (lola): Rest	3		218	40
68	2017-08-03 21:57:08.695+00	63	[open] inför lajv 2: Elspeth (lola)	3		258	40
69	2017-08-03 21:57:08.739+00	62	[open] inför lajv 2: Elspeth (lola)	3		258	40
70	2017-08-03 21:57:08.749+00	61	[open] inför lajv 2: Elspeth (lola)	3		258	40
71	2017-08-03 21:59:20.87+00	1267	[inför lajv 2] Elspeth (lola): Rest	3		218	40
72	2017-08-03 21:59:20.883+00	1266	[inför lajv 2] Elspeth (lola): Rest	3		218	40
73	2017-08-03 21:59:20.893+00	1265	[inför lajv 2] Elspeth (lola): Rest	3		218	40
74	2017-08-03 21:59:20.904+00	1264	[inför lajv 2] Elspeth (lola): Rest	3		218	40
75	2017-08-03 21:59:20.916+00	1263	[inför lajv 2] Elspeth (lola): Rest	3		218	40
76	2017-08-03 21:59:20.927+00	1262	[inför lajv 2] Elspeth (lola): Rest	3		218	40
77	2017-08-03 21:59:20.938+00	1261	[inför lajv 2] Elspeth (lola): Rest	3		218	40
78	2017-08-03 22:12:10.475+00	1274	[inför lajv 2] Elspeth (lola): Rest	3		218	40
79	2017-08-03 22:12:10.492+00	1273	[inför lajv 2] Elspeth (lola): Rest	3		218	40
80	2017-08-03 22:12:10.504+00	1272	[inför lajv 2] Elspeth (lola): Rest	3		218	40
81	2017-08-03 22:12:10.515+00	1271	[inför lajv 2] Elspeth (lola): Rest	3		218	40
82	2017-08-04 00:06:56.494+00	1281	[inför lajv 2] Elspeth (lola): Rest	3		218	40
83	2017-08-04 00:06:56.505+00	1280	[inför lajv 2] Elspeth (lola): Rest	3		218	40
84	2017-08-04 00:06:56.516+00	1279	[inför lajv 2] Elspeth (lola): Rest	3		218	40
85	2017-08-04 00:06:56.525+00	1278	[inför lajv 2] Elspeth (lola): Rest	3		218	40
86	2017-08-04 00:06:56.535+00	1277	[inför lajv 2] Elspeth (lola): Rest	3		218	40
87	2017-08-04 00:06:56.546+00	1276	[inför lajv 2] Elspeth (lola): Rest	3		218	40
88	2017-08-04 00:06:56.562+00	1275	[inför lajv 2] Elspeth (lola): Rest	3		218	40
89	2017-08-04 00:06:56.575+00	1232	[inför lajv 2] Elspeth (lola): Rest	3		218	40
90	2017-08-04 00:08:19.095+00	22	[open] inför lajv 2: Elspeth (lola)	3		262	40
91	2017-08-04 00:11:18.753+00	2	[closed] inför lajv 3	2	Changed previous.	217	40
92	2017-08-04 00:12:08.573+00	4	[open] inför lajv 5	1	Added.	217	40
93	2017-08-04 00:44:58.307+00	1	hen	1	Added.	263	40
94	2017-08-04 00:45:12.171+00	2	hon	1	Added.	263	40
95	2017-08-04 00:45:21.325+00	3	han	1	Added.	263	40
96	2017-08-04 00:55:32.992+00	44	Elspeth (lola)	3		215	40
97	2017-08-04 00:55:33.027+00	43	Elspeth (None)	3		215	40
98	2017-08-04 00:55:33.041+00	42	Lärjunge av 7e graden nummer 36 (Sebastian Lindeberg)	3		215	40
99	2017-08-04 00:55:33.052+00	41	Dr Mortimer Harringer (Nathaniel Johansson)	3		215	40
100	2017-08-04 00:55:33.095+00	40	Enzo (Orion Sveinsson)	3		215	40
101	2017-08-04 00:55:33.105+00	37	Jörgen Sallerup (Daniel Strömholm)	3		215	40
102	2017-08-04 00:55:33.116+00	29	Albin Bonde (Martin Lundmark)	3		215	40
103	2017-08-04 00:55:33.126+00	27	Lydia Pauli (Janni Andersen)	3		215	40
104	2017-08-04 00:55:33.136+00	26	Thordon (None)	3		215	40
105	2017-08-04 00:55:33.146+00	20	Kato (Emil Hannu)	3		215	40
106	2017-08-04 00:55:33.157+00	19	Diakon Whinther (None)	3		215	40
107	2017-08-04 00:55:33.168+00	18	Marion (Angelika Nilsson)	3		215	40
108	2017-08-04 00:55:33.179+00	15	Harriet (Sara Magnusson)	3		215	40
109	2017-08-04 00:55:33.189+00	5	Einar Brorsson (Hannes Reventlid)	3		215	40
110	2017-08-04 00:55:33.199+00	4	Samuel Lilja (Jonas Ahlgård)	3		215	40
111	2017-08-04 00:55:33.209+00	2	Crane Mikkelsen (Jerome Gylling)	3		215	40
112	2017-08-04 00:55:46.801+00	32	Faye Morgan (Max Ortman)	2	Changed pronoun.	215	40
113	2017-08-04 00:55:55.715+00	28	Pierre Steen (Tomas Kronvall)	2	Changed pronoun.	215	40
114	2017-08-04 00:56:33.965+00	25	Zelda Mörck (Matilda Dahl)	2	Changed pronoun and picture.	215	40
115	2017-08-04 00:56:49.652+00	17	Robin (Denniz Cederquist)	2	Changed pronoun and picture.	215	40
116	2017-08-04 00:57:36.056+00	16	Filch (Peter Björklund)	2	Changed pronoun.	215	40
117	2017-08-04 00:57:52.721+00	14	Dante (Dennis Nilsson)	2	Changed pronoun and picture.	215	40
118	2017-08-04 00:58:19.729+00	13	Hans Liljenkrantz (Henrik Roos)	2	Changed pronoun and picture.	215	40
119	2017-08-04 00:58:34.081+00	12	Erik (Anton Muller)	2	Changed pronoun and picture.	215	40
120	2017-08-04 00:58:47.962+00	32	Faye Morgan (Max Ortman)	2	Changed picture.	215	40
121	2017-08-04 01:21:21.785+00	32	Faye Morgan (Max Ortman)	2	Changed picture.	215	40
122	2017-08-04 01:23:35.214+00	32	Faye Morgan (Max Ortman)	2	Changed picture.	215	40
123	2017-08-04 01:23:50.318+00	32	Faye Morgan (Max Ortman)	2	Changed picture.	215	40
124	2017-08-04 01:38:37.5+00	32	Faye Morgan (Max Ortman)	2	Changed picture.	215	40
125	2017-08-04 01:38:51.804+00	32	Faye Morgan (Max Ortman)	2	Changed picture.	215	40
126	2017-08-04 11:50:28.595+00	4	Based on Humanity: Erik believes that Vampyrer är bajs and will therefor bli människa.	1	Added.	257	40
127	2017-08-04 11:50:59.07+00	5	Based on Clan Theme: Erik believes that Brujah vet bäst and will therefor veta allt.	1	Added.	257	40
128	2017-08-04 11:51:53.264+00	6	Based on Faction: Erik believes that människor är bäst and will therefor hjälpa gammla damer och herrar.	1	Added.	257	40
129	2017-08-04 13:51:17.321+00	35	Assign XP	1	Added.	188	40
130	2017-08-04 13:52:02.361+00	18	[Assign XP]1	1	Added.	189	40
131	2017-08-04 13:52:34.647+00	6	Harpya	2	Changed action_options.	201	40
132	2017-08-05 17:38:28.179+00	33	Monster (Jerome Gylling)	1	Added.	215	40
133	2017-08-05 17:47:12.315+00	33	Monster (Jerome Gylling)	2	Changed defined and nature.	215	40
134	2017-08-05 17:47:49.741+00	1	Monster wants Politik 3	1	Added.	266	40
135	2017-08-05 18:08:57.272+00	2	Hans Liljenkrantz wants Kyrkan 3	1	Added.	266	40
136	2017-08-05 18:09:09.173+00	3	Robin wants Kyrkan 3	1	Added.	266	40
137	2017-08-05 18:09:17.224+00	4	Robin wants Media 0	1	Added.	266	40
138	2017-08-05 18:09:27.53+00	5	Hans Liljenkrantz wants Universitet 2	1	Added.	266	40
139	2017-08-05 18:09:42.686+00	6	Faye Morgan wants Polis 3	1	Added.	266	40
140	2017-08-05 19:30:50.307+00	2	Hans Liljenkrantz wants Kyrkan 3	2	Changed wanted and dislodged.	266	40
141	2017-08-05 19:34:41.033+00	3	Robin wants Kyrkan 3	2	Changed wanted and dislodged.	266	40
142	2017-08-05 19:39:39.806+00	3	Robin wants Kyrkan 3 Final	2	Changed wanted.	266	40
143	2017-08-06 12:51:15.545+00	35	Elspeth (lola)	3		215	40
144	2017-08-06 14:08:21.285+00	10	Skogsområdet - Feeding Points: 0, Status: 0, Masquerade: Worse	2	Changed allowed.	214	40
145	2017-08-06 14:08:29.621+00	9	Soptippen - Feeding Points: 5, Status: 0, Masquerade: Worse	2	Changed allowed.	214	40
146	2017-08-06 14:08:37.631+00	4	Skavtång - Feeding Points: 10, Status: 3, Masquerade: Better	2	Changed allowed.	214	40
147	2017-08-06 14:15:23.358+00	10	Skogsområdet - Feeding Points: 0, Status: 0, Masquerade: Worse	2	Changed owner.	214	40
148	2017-08-06 14:15:43.899+00	34	Liliana (None)	2	Changed name.	215	40
149	2017-08-06 15:26:05.343+00	10	Humanity 0	3		260	40
150	2017-08-06 15:26:05.379+00	9	Willpower 0	3		260	40
151	2017-08-06 15:26:05.409+00	8	Humanity 0	3		260	40
152	2017-08-06 15:26:05.422+00	7	Willpower 0	3		260	40
153	2017-08-06 15:26:05.435+00	6	Humanity 0	3		260	40
154	2017-08-06 15:26:05.448+00	5	Willpower 0	3		260	40
155	2017-08-06 15:26:31.646+00	12	Humanity 0	3		260	40
156	2017-08-06 15:26:31.684+00	11	Willpower 0	3		260	40
157	2017-08-06 18:45:39.637+00	118	Mental 0	3		197	40
158	2017-08-06 18:45:39.807+00	117	Physical 0	3		197	40
159	2017-08-06 18:45:39.989+00	116	Social 0	3		197	40
160	2017-08-06 18:45:40.151+00	115	Mental 0	3		197	40
161	2017-08-06 18:45:40.325+00	114	Physical 0	3		197	40
162	2017-08-06 18:45:40.485+00	113	Social 0	3		197	40
163	2017-08-06 18:45:40.673+00	112	Mental 0	3		197	40
164	2017-08-06 18:45:40.848+00	111	Physical 0	3		197	40
165	2017-08-06 18:45:41.037+00	110	Social 0	3		197	40
166	2017-08-06 18:45:41.178+00	109	Mental 0	3		197	40
167	2017-08-06 18:45:41.339+00	108	Physical 0	3		197	40
168	2017-08-06 18:45:41.534+00	107	Social 0	3		197	40
169	2017-08-06 18:45:41.722+00	100	Mental 0	3		197	40
170	2017-08-06 18:45:41.913+00	99	Physical 0	3		197	40
171	2017-08-06 18:45:42.226+00	98	Social 0	3		197	40
172	2017-08-06 18:55:02.623+00	22	Mental 2	3		197	40
173	2017-08-06 18:55:02.91+00	21	Physical 3	3		197	40
174	2017-08-06 18:55:03.078+00	20	Social 4	3		197	40
175	2017-08-06 18:56:27.121+00	28	Mental 3	2	Changed character.	197	40
176	2017-08-06 18:56:37.018+00	27	Physical 4	2	Changed character.	197	40
177	2017-08-06 18:56:47.277+00	26	Social 1	2	Changed character.	197	40
178	2017-08-06 18:57:38.222+00	29	Social 5	2	Changed character.	197	40
179	2017-08-06 18:57:50.151+00	30	Physical 1	2	Changed character.	197	40
180	2017-08-06 18:58:09.103+00	31	Mental 1	2	Changed character.	197	40
181	2017-08-06 18:59:14.602+00	32	Social 2	2	Changed character.	197	40
182	2017-08-06 19:02:52.382+00	33	Physical 5	2	Changed character.	197	40
183	2017-08-06 19:03:06.715+00	34	Mental 5	2	Changed character.	197	40
184	2017-08-06 19:03:40.65+00	38	Social 2	2	Changed character.	197	40
185	2017-08-06 19:03:59.765+00	39	Physical 6	2	Changed character.	197	40
186	2017-08-06 19:04:15.397+00	40	Mental 3	2	Changed character.	197	40
187	2017-08-06 19:04:59.943+00	67	Mental 5	2	Changed character.	197	40
188	2017-08-06 19:05:28.492+00	66	Physical 1	2	Changed character.	197	40
189	2017-08-06 19:05:41.449+00	65	Social 1	2	Changed character.	197	40
190	2017-08-06 19:09:27.033+00	53	Social 3	2	Changed character.	197	40
191	2017-08-06 19:09:50.71+00	54	Physical 3	2	Changed character.	197	40
192	2017-08-06 19:10:07.756+00	55	Mental 5	2	Changed character.	197	40
193	2017-08-06 19:12:56.327+00	82	Physical 3	2	No fields changed.	197	40
194	2017-08-06 19:15:07.517+00	94	Mental 1	3		197	40
195	2017-08-06 19:15:07.686+00	93	Physical 1	3		197	40
196	2017-08-06 19:15:07.819+00	92	Social 4	3		197	40
197	2017-08-06 19:15:07.963+00	91	Mental 4	3		197	40
198	2017-08-06 19:15:08.108+00	90	Physical 1	3		197	40
199	2017-08-06 19:15:08.213+00	89	Social 3	3		197	40
200	2017-08-06 19:15:08.332+00	88	Mental 1	3		197	40
201	2017-08-06 19:15:08.442+00	87	Physical 4	3		197	40
202	2017-08-06 19:15:08.593+00	86	Social 2	3		197	40
203	2017-08-06 19:15:08.742+00	85	Physical 1	3		197	40
204	2017-08-06 19:15:08.852+00	84	Mental 4	3		197	40
205	2017-08-06 19:15:09.015+00	83	Social 3	3		197	40
206	2017-08-06 19:15:09.159+00	82	Physical 3	3		197	40
207	2017-08-06 19:15:09.264+00	81	Mental 3	3		197	40
208	2017-08-06 19:15:09.411+00	80	Social 2	3		197	40
209	2017-08-06 19:15:09.518+00	79	Mental 3	3		197	40
210	2017-08-06 19:15:09.68+00	78	Physical 3	3		197	40
211	2017-08-06 19:15:09.774+00	77	Social 1	3		197	40
212	2017-08-06 19:15:09.979+00	76	Mental 6	3		197	40
213	2017-08-06 19:15:10.071+00	75	Physical 2	3		197	40
214	2017-08-06 19:15:10.191+00	74	Social 6	3		197	40
215	2017-08-06 19:15:10.346+00	64	Mental 3	3		197	40
216	2017-08-06 19:15:10.497+00	63	Physical 5	3		197	40
217	2017-08-06 19:15:10.671+00	62	Social 7	3		197	40
218	2017-08-06 19:15:10.794+00	61	Mental 3	3		197	40
219	2017-08-06 19:15:10.939+00	60	Physical 1	3		197	40
220	2017-08-06 19:15:11.072+00	59	Social 4	3		197	40
221	2017-08-06 19:15:11.263+00	58	Mental 4	3		197	40
222	2017-08-06 19:15:11.431+00	57	Physical 3	3		197	40
223	2017-08-06 19:15:11.615+00	56	Social 1	3		197	40
224	2017-08-06 19:15:11.751+00	52	Mental 5	3		197	40
225	2017-08-06 19:15:11.914+00	51	Physical 1	3		197	40
226	2017-08-06 19:15:12.051+00	50	Social 4	3		197	40
227	2017-08-06 19:15:12.199+00	49	Mental 1	3		197	40
228	2017-08-06 19:15:12.304+00	48	Physical 5	3		197	40
229	2017-08-06 19:15:12.436+00	47	Social 1	3		197	40
230	2017-08-06 19:15:12.545+00	46	Mental 5	3		197	40
231	2017-08-06 19:15:12.658+00	45	Physical 1	3		197	40
232	2017-08-06 19:15:12.919+00	44	Social 3	3		197	40
233	2017-08-06 19:15:13.035+00	43	Mental 5	3		197	40
234	2017-08-06 19:15:13.191+00	42	Physical 1	3		197	40
235	2017-08-06 19:15:13.313+00	41	Social 1	3		197	40
236	2017-08-06 19:15:13.413+00	37	Mental 3	3		197	40
237	2017-08-06 19:15:13.546+00	36	Physical 5	3		197	40
238	2017-08-06 19:15:13.679+00	35	Social 6	3		197	40
239	2017-08-06 19:15:13.832+00	25	Mental 1	3		197	40
240	2017-08-06 19:15:13.992+00	24	Physical 4	3		197	40
241	2017-08-06 19:15:14.118+00	23	Social 1	3		197	40
242	2017-08-06 19:15:14.315+00	13	Mental 5	3		197	40
243	2017-08-06 19:15:14.446+00	12	Physical 6	3		197	40
244	2017-08-06 19:15:14.591+00	11	Social 4	3		197	40
245	2017-08-06 19:15:14.715+00	10	Social 1	3		197	40
246	2017-08-06 19:15:14.843+00	9	Mental 3	3		197	40
247	2017-08-06 19:15:15.065+00	8	Physical 2	3		197	40
248	2017-08-06 19:15:15.166+00	7	Social 5	3		197	40
249	2017-08-06 19:15:15.323+00	6	Mental 3	3		197	40
250	2017-08-06 19:15:15.46+00	5	Physical 1	3		197	40
251	2017-08-06 19:15:15.565+00	4	Social 4	3		197	40
252	2017-08-06 19:15:15.753+00	3	Mental 4	3		197	40
253	2017-08-06 19:15:15.875+00	2	Physical 3	3		197	40
254	2017-08-06 19:15:16.009+00	1	Social 4	3		197	40
255	2017-08-06 19:16:53.167+00	36	Ivan Kallenberg	2	Changed master.	210	40
256	2017-08-06 19:17:33.773+00	128	Katarina Hill	2	Changed master.	210	40
257	2017-08-06 19:18:23.421+00	129	Gregg Stone	2	Changed master.	210	40
258	2017-08-06 19:19:13.491+00	37	Kenneth Dar	2	Changed master.	210	40
259	2017-08-06 19:19:54.436+00	39	Klaus Dow	2	Changed master.	210	40
260	2017-08-06 19:20:27.05+00	42	Louise Uppercut	2	Changed master.	210	40
261	2017-08-06 19:21:04.419+00	11	Sven-Göran Gelin	2	Changed master.	210	40
262	2017-08-06 19:21:42.465+00	47	Mahmoud Nejem	2	Changed master.	210	40
263	2017-08-06 19:22:01.271+00	152	David Golitais	2	Changed master.	210	40
264	2017-08-06 19:22:42.415+00	44	Joanna Öhrn	2	Changed master.	210	40
265	2017-08-06 19:23:27.688+00	45	Katarina Ågren	2	Changed master.	210	40
266	2017-08-06 19:24:36.857+00	140	Natanael Augustsson	2	Changed master.	210	40
267	2017-08-06 19:25:29.095+00	53	Sven Piper	2	Changed master.	210	40
268	2017-08-06 19:26:47.06+00	52	Leif Palm	2	Changed master.	210	40
269	2017-08-06 19:27:31.916+00	56	Martin Oddshammar	2	Changed master.	210	40
270	2017-08-06 19:28:13.663+00	57	Mattias Nesselqvist	2	Changed master.	210	40
271	2017-08-06 19:28:43.084+00	90	Cassandra Kahn	2	Changed master.	210	40
272	2017-08-06 19:28:47.382+00	90	Cassandra Kahn	2	No fields changed.	210	40
273	2017-08-06 19:29:27.844+00	58	Maria Mattisdotter	2	Changed master.	210	40
274	2017-08-06 19:30:28.254+00	38	Greta Star	2	Changed master.	210	40
275	2017-08-06 19:31:04.475+00	101	Sven-Olof Hieta	2	Changed master.	210	40
276	2017-08-06 19:31:20.637+00	102	Susanna Karlsdotter	2	Changed master.	210	40
277	2017-08-06 19:31:44.845+00	103	Tobias von Knorring	2	Changed master.	210	40
278	2017-08-06 19:32:38.21+00	130	Elvira	2	Changed master.	210	40
279	2017-08-06 19:33:05.286+00	41	Greg Stone	2	Changed master.	210	40
280	2017-08-06 19:33:30.734+00	40	Doug Underhill	2	Changed master.	210	40
281	2017-08-06 19:35:09.595+00	146	Fader Johannes Graah	2	Changed master.	210	40
282	2017-08-06 19:35:28.674+00	145	Fred Gregori	2	Changed master.	210	40
283	2017-08-06 19:35:47.877+00	144	Johannes Nielsen	2	Changed master.	210	40
284	2017-08-06 19:53:18.291+00	2	Konstapel Karl (Level: 3,Combat,Legwork,Protection,None) 	2	No fields changed.	213	40
285	2017-08-06 19:56:14.404+00	65	Ace K Rowan	3		210	40
286	2017-08-06 19:56:14.424+00	51	Alex Reimer	3		210	40
287	2017-08-06 19:56:14.444+00	67	Alexander Svartén	3		210	40
288	2017-08-06 19:56:14.457+00	162	Ann Wistedt	3		210	40
289	2017-08-06 19:56:14.473+00	112	Anna Nilsson	3		210	40
290	2017-08-06 19:56:14.487+00	97	Arvid Lindgren	3		210	40
291	2017-08-06 19:56:14.507+00	110	Bang Olauson	3		210	40
292	2017-08-06 19:56:14.525+00	125	Beatrice Eldh	3		210	40
293	2017-08-06 19:56:14.541+00	151	Bosse Carlsson	3		210	40
294	2017-08-06 19:56:14.559+00	109	Carl Löfquist	3		210	40
295	2017-08-06 19:56:14.573+00	89	Dean Lauritzen	3		210	40
296	2017-08-06 19:56:14.59+00	46	Elise Yxfeldt	3		210	40
297	2017-08-06 19:56:14.608+00	49	Erling Ufving	3		210	40
298	2017-08-06 19:56:14.625+00	91	Fergus Henrysson	3		210	40
299	2017-08-06 19:56:14.642+00	157	Festus Lax	3		210	40
300	2017-08-06 19:56:14.664+00	48	Gabriella Seger	3		210	40
301	2017-08-06 19:56:14.704+00	93	Glen Svensson	3		210	40
302	2017-08-06 19:56:14.721+00	100	Gustav Strand	3		210	40
303	2017-08-06 19:56:14.736+00	126	Gösta Grahn	3		210	40
304	2017-08-06 19:56:14.755+00	156	Harald Krempf	3		210	40
305	2017-08-06 19:56:14.769+00	62	Jan Book	3		210	40
306	2017-08-06 19:56:14.784+00	154	Joakim Hipstar	3		210	40
307	2017-08-06 19:56:14.8+00	55	Johan Fall	3		210	40
308	2017-08-06 19:56:14.823+00	161	Josef Ström	3		210	40
309	2017-08-06 19:56:14.845+00	105	Juliana Conde	3		210	40
310	2017-08-06 19:56:14.864+00	131	Karl Vansten	3		210	40
311	2017-08-06 19:56:14.881+00	5	Karolin Olofsdotter	3		210	40
312	2017-08-06 19:56:14.899+00	106	Kertin Bergenfeldt	3		210	40
313	2017-08-06 19:56:14.92+00	124	Konrad Hult	3		210	40
314	2017-08-06 19:56:14.941+00	127	Leif Persson	3		210	40
315	2017-08-06 19:56:14.955+00	98	Leonard Hansson	3		210	40
316	2017-08-06 19:56:14.968+00	96	Lina Ebbasdotter	3		210	40
317	2017-08-06 19:56:14.991+00	54	Lina Fäladsson	3		210	40
318	2017-08-06 19:56:15.008+00	66	Loranna Hart	3		210	40
319	2017-08-06 19:56:15.024+00	3	Ludvig Eklund	3		210	40
320	2017-08-06 19:56:15.041+00	8	Magdalena Dahl	3		210	40
321	2017-08-06 19:56:15.055+00	50	Maja Thorzén	3		210	40
322	2017-08-06 19:56:15.076+00	155	Malte Svedin	3		210	40
323	2017-08-06 19:56:15.095+00	163	Maria Westberg	3		210	40
324	2017-08-06 19:56:15.111+00	92	Marie Gravvold	3		210	40
325	2017-08-06 19:56:15.126+00	43	Martin Abelsen	3		210	40
326	2017-08-06 19:56:15.143+00	117	Maximilian Elmersson	3		210	40
327	2017-08-06 19:56:15.159+00	95	Michelle Falk	3		210	40
328	2017-08-06 19:56:15.18+00	63	My Bo	3		210	40
329	2017-08-06 19:56:15.193+00	104	Nadia Dahlkvist	3		210	40
330	2017-08-06 19:56:15.209+00	4	Nora Ljung	3		210	40
331	2017-08-06 19:56:15.226+00	119	Olivia Berglund	3		210	40
332	2017-08-06 19:56:15.241+00	7	Paula Mårdh	3		210	40
333	2017-08-06 19:56:15.254+00	153	Per Pettersson	3		210	40
334	2017-08-06 19:56:15.269+00	111	Petra Caspersen	3		210	40
335	2017-08-06 19:56:15.289+00	159	Pia Staker	3		210	40
336	2017-08-06 19:56:15.303+00	35	Professor Wallenberg	3		210	40
337	2017-08-06 19:56:15.317+00	150	Rasmus Blomkvist	3		210	40
338	2017-08-06 19:56:15.334+00	139	Sam Hansson	3		210	40
339	2017-08-06 19:56:15.347+00	88	Samuel Markesjö	3		210	40
340	2017-08-06 19:56:15.36+00	158	Spicy McGee	3		210	40
341	2017-08-06 19:56:15.373+00	6	Sture Vång	3		210	40
342	2017-08-06 19:56:15.387+00	59	Tod Smith	3		210	40
343	2017-08-06 19:56:15.401+00	160	Tryggve Horesson	3		210	40
344	2017-08-06 19:56:15.416+00	64	Ursula Kafort	3		210	40
345	2017-08-06 19:56:15.431+00	61	Vera Sköld	3		210	40
346	2017-08-06 19:56:15.447+00	138	Vira Bergman	3		210	40
347	2017-08-06 19:56:15.463+00	118	Virginia Varg	3		210	40
348	2017-08-06 20:03:17.051+00	161	Auspex 1 exp: 0	2	Changed character.	194	40
349	2017-08-06 20:03:58.861+00	105	Celerity 2 exp: 0	2	Changed character.	194	40
350	2017-08-06 20:09:07.027+00	156	Presence 1 exp: 0	2	Changed character.	194	40
351	2017-08-06 20:09:34.693+00	107	Protean 1 exp: 0	2	Changed character.	194	40
352	2017-08-06 20:10:31.269+00	158	Auspex 2 exp: 0	2	Changed character.	194	40
353	2017-08-06 20:11:08.652+00	45	Celerity 0 exp: 0	2	No fields changed.	194	40
354	2017-08-06 20:11:45.474+00	137	Obfuscate 4 exp: 0	2	Changed character.	194	40
355	2017-08-06 20:12:06.801+00	46	Potence 0 exp: 0	2	Changed character.	194	40
356	2017-08-06 20:13:00.796+00	47	Presence 5 exp: 0	2	Changed character.	194	40
357	2017-08-06 20:13:49.972+00	148	Potence 2 exp: 0	2	Changed character.	194	40
358	2017-08-06 20:14:18.233+00	136	Presence 1 exp: 0	2	Changed character.	194	40
359	2017-08-06 20:15:31.539+00	154	Auspex 1 exp: 0	2	Changed character.	194	40
360	2017-08-06 20:16:03.051+00	84	Celerity 1 exp: 0	2	Changed character.	194	40
361	2017-08-06 20:17:09.147+00	103	Fortitude 1 exp: 0	2	Changed character.	194	40
362	2017-08-06 20:17:41.92+00	98	Auspex 0 exp: 0	2	Changed character.	194	40
363	2017-08-06 20:18:10.362+00	48	Demenation 3 exp: 0	2	Changed character.	194	40
364	2017-08-06 20:18:34.349+00	146	Obfuscate 0 exp: 0	2	Changed character.	194	40
365	2017-08-06 20:19:10.52+00	86	Fortitude 1 exp: 0	2	Changed character.	194	40
366	2017-08-06 20:20:16.661+00	60	Demenation 1 exp: 2	2	Changed character.	194	40
367	2017-08-06 20:21:01.818+00	61	Obfuscate 2 exp: 2	2	Changed character.	194	40
368	2017-08-06 20:21:53.911+00	144	Auspex 2 exp: 0	2	Changed character.	194	40
369	2017-08-06 20:22:23.877+00	153	Dominate 0 exp: 0	2	Changed character.	194	40
370	2017-08-06 20:23:06.885+00	133	Demenation 0 exp: 2	2	Changed character.	194	40
371	2017-08-06 20:23:58.192+00	92	Thaumaturgy 1 exp: 1	2	Changed character.	194	40
372	2017-08-06 20:24:43.36+00	152	Presence 0 exp: 0	2	Changed character.	194	40
373	2017-08-06 20:25:22.748+00	100	Thaumaturgy 4 exp: 3	2	Changed character.	194	40
374	2017-08-06 20:26:23.884+00	49	Auspex 0 exp: 0	2	Changed character.	194	40
375	2017-08-06 20:26:54.216+00	126	Dominate 0 exp: 0	2	Changed character.	194	40
376	2017-08-06 20:31:33.554+00	147	Auspex 1 exp: 0	3		194	40
377	2017-08-06 20:31:33.601+00	141	Auspex 1 exp: 0	3		194	40
378	2017-08-06 20:31:33.616+00	131	Auspex 1 exp: 0	3		194	40
379	2017-08-06 20:31:33.672+00	68	Auspex 1 exp: 0	3		194	40
380	2017-08-06 20:31:33.693+00	62	Auspex 1 exp: 0	3		194	40
381	2017-08-06 20:31:33.712+00	42	Auspex 1 exp: 0	3		194	40
382	2017-08-06 20:31:33.739+00	138	Auspex 2 exp: 0	3		194	40
383	2017-08-06 20:31:33.762+00	128	Auspex 2 exp: 0	3		194	40
384	2017-08-06 20:31:33.779+00	125	Auspex 2 exp: 0	3		194	40
385	2017-08-06 20:31:33.795+00	122	Auspex 2 exp: 0	3		194	40
386	2017-08-06 20:31:33.809+00	119	Auspex 2 exp: 0	3		194	40
387	2017-08-06 20:31:33.836+00	91	Auspex 2 exp: 0	3		194	40
388	2017-08-06 20:31:33.853+00	2	Auspex 2 exp: 0	3		194	40
389	2017-08-06 20:31:33.872+00	101	Auspex 3 exp: 0	3		194	40
390	2017-08-06 20:31:33.887+00	162	Auspex 4 exp: 0	3		194	40
391	2017-08-06 20:31:33.905+00	4	Auspex 4 exp: 0	3		194	40
392	2017-08-06 20:31:33.92+00	87	Auspex 5 exp: 0	3		194	40
393	2017-08-06 20:31:33.939+00	134	Animalism 1 exp: 0	3		194	40
394	2017-08-06 20:31:33.956+00	116	Animalism 1 exp: 0	3		194	40
395	2017-08-06 20:31:33.973+00	93	Animalism 1 exp: 0	3		194	40
396	2017-08-06 20:31:33.987+00	32	Animalism 1 exp: 0	3		194	40
397	2017-08-06 20:31:34.002+00	109	Animalism 2 exp: 1	3		194	40
398	2017-08-06 20:31:34.017+00	22	Animalism 5 exp: 0	3		194	40
399	2017-08-06 20:31:34.034+00	15	Animalism 5 exp: 0	3		194	40
400	2017-08-06 20:31:34.073+00	8	Animalism 5 exp: 0	3		194	40
401	2017-08-06 20:31:34.089+00	45	Celerity 0 exp: 0	3		194	40
402	2017-08-06 20:31:34.109+00	81	Celerity 1 exp: 0	3		194	40
403	2017-08-06 20:31:34.144+00	78	Celerity 1 exp: 0	3		194	40
404	2017-08-06 20:31:34.159+00	75	Celerity 1 exp: 0	3		194	40
405	2017-08-06 20:31:34.186+00	72	Celerity 1 exp: 0	3		194	40
406	2017-08-06 20:31:34.204+00	57	Celerity 1 exp: 1	3		194	40
407	2017-08-06 20:31:34.231+00	39	Celerity 1 exp: 0	3		194	40
408	2017-08-06 20:31:34.257+00	36	Celerity 1 exp: 0	3		194	40
409	2017-08-06 20:31:34.327+00	33	Celerity 1 exp: 0	3		194	40
410	2017-08-06 20:31:34.342+00	43	Celerity 2 exp: 0	3		194	40
411	2017-08-06 20:31:34.358+00	26	Celerity 2 exp: 0	3		194	40
412	2017-08-06 20:31:34.38+00	19	Celerity 2 exp: 0	3		194	40
413	2017-08-06 20:31:34.397+00	12	Celerity 2 exp: 0	3		194	40
414	2017-08-06 20:31:34.422+00	30	Celerity 3 exp: 0	3		194	40
415	2017-08-06 20:31:34.439+00	54	Celerity 5 exp: 0	3		194	40
416	2017-08-06 20:31:34.453+00	164	Demenation 0 exp: 0	3		194	40
417	2017-08-06 20:31:34.466+00	145	Demenation 1 exp: 0	3		194	40
418	2017-08-06 20:31:34.484+00	66	Demenation 5 exp: 0	3		194	40
419	2017-08-06 20:31:34.506+00	132	Dominate 0 exp: 3	3		194	40
420	2017-08-06 20:31:34.525+00	129	Dominate 0 exp: 0	3		194	40
421	2017-08-06 20:31:34.565+00	123	Dominate 0 exp: 0	3		194	40
422	2017-08-06 20:31:34.585+00	120	Dominate 0 exp: 0	3		194	40
423	2017-08-06 20:31:34.601+00	99	Dominate 0 exp: 0	3		194	40
424	2017-08-06 20:31:34.615+00	159	Dominate 1 exp: 0	3		194	40
425	2017-08-06 20:31:34.633+00	151	Dominate 2 exp: 0	3		194	40
426	2017-08-06 20:31:34.65+00	142	Dominate 2 exp: 0	3		194	40
427	2017-08-06 20:31:34.671+00	108	Dominate 3 exp: 0	3		194	40
428	2017-08-06 20:31:34.684+00	96	Dominate 3 exp: 0	3		194	40
429	2017-08-06 20:31:34.709+00	5	Dominate 4 exp: 0	3		194	40
430	2017-08-06 20:31:34.723+00	89	Dominate 5 exp: 0	3		194	40
431	2017-08-06 20:31:34.736+00	118	Fortitude 0 exp: 0	3		194	40
432	2017-08-06 20:31:34.752+00	104	Fortitude 1 exp: 2	3		194	40
433	2017-08-06 20:31:34.791+00	83	Fortitude 1 exp: 0	3		194	40
434	2017-08-06 20:31:34.806+00	80	Fortitude 1 exp: 0	3		194	40
435	2017-08-06 20:31:34.82+00	77	Fortitude 1 exp: 0	3		194	40
436	2017-08-06 20:31:34.835+00	74	Fortitude 1 exp: 0	3		194	40
437	2017-08-06 20:31:34.851+00	51	Fortitude 1 exp: 0	3		194	40
438	2017-08-06 20:31:34.881+00	65	Fortitude 2 exp: 1	3		194	40
439	2017-08-06 20:31:34.916+00	55	Fortitude 3 exp: 0	3		194	40
440	2017-08-06 20:31:34.952+00	27	Fortitude 3 exp: 0	3		194	40
441	2017-08-06 20:31:34.97+00	20	Fortitude 3 exp: 0	3		194	40
442	2017-08-06 20:31:34.988+00	13	Fortitude 3 exp: 0	3		194	40
443	2017-08-06 20:31:35.005+00	23	Fortitude 7 exp: 0	3		194	40
444	2017-08-06 20:31:35.043+00	16	Fortitude 7 exp: 0	3		194	40
445	2017-08-06 20:31:35.061+00	9	Fortitude 7 exp: 0	3		194	40
446	2017-08-06 20:31:35.09+00	50	Obfuscate 0 exp: 0	3		194	40
447	2017-08-06 20:31:35.104+00	140	Obfuscate 1 exp: 0	3		194	40
448	2017-08-06 20:31:35.12+00	95	Obfuscate 1 exp: 0	3		194	40
449	2017-08-06 20:31:35.156+00	70	Obfuscate 1 exp: 0	3		194	40
450	2017-08-06 20:31:35.173+00	63	Obfuscate 2 exp: 0	3		194	40
451	2017-08-06 20:31:35.191+00	67	Obfuscate 3 exp: 2	3		194	40
452	2017-08-06 20:31:35.206+00	160	Potence 1 exp: 0	3		194	40
453	2017-08-06 20:31:35.223+00	157	Potence 1 exp: 0	3		194	40
454	2017-08-06 20:31:35.243+00	155	Potence 1 exp: 0	3		194	40
455	2017-08-06 20:31:35.288+00	139	Potence 1 exp: 0	3		194	40
456	2017-08-06 20:31:35.311+00	135	Potence 1 exp: 0	3		194	40
457	2017-08-06 20:31:35.335+00	115	Potence 1 exp: 0	3		194	40
458	2017-08-06 20:31:35.365+00	114	Potence 1 exp: 0	3		194	40
459	2017-08-06 20:31:35.408+00	113	Potence 1 exp: 0	3		194	40
460	2017-08-06 20:31:35.427+00	112	Potence 1 exp: 0	3		194	40
461	2017-08-06 20:31:35.455+00	111	Potence 1 exp: 0	3		194	40
462	2017-08-06 20:31:35.471+00	110	Potence 1 exp: 0	3		194	40
463	2017-08-06 20:31:35.488+00	106	Potence 1 exp: 0	3		194	40
464	2017-08-06 20:31:35.504+00	85	Potence 1 exp: 0	3		194	40
465	2017-08-06 20:31:35.517+00	82	Potence 1 exp: 0	3		194	40
466	2017-08-06 20:31:35.543+00	79	Potence 1 exp: 0	3		194	40
467	2017-08-06 20:31:35.567+00	76	Potence 1 exp: 0	3		194	40
468	2017-08-06 20:31:35.603+00	73	Potence 1 exp: 0	3		194	40
469	2017-08-06 20:31:35.67+00	71	Potence 1 exp: 0	3		194	40
470	2017-08-06 20:31:35.684+00	40	Potence 1 exp: 0	3		194	40
471	2017-08-06 20:31:35.701+00	28	Potence 1 exp: 0	3		194	40
472	2017-08-06 20:31:35.719+00	21	Potence 1 exp: 0	3		194	40
473	2017-08-06 20:31:35.76+00	14	Potence 1 exp: 0	3		194	40
474	2017-08-06 20:31:35.775+00	58	Potence 2 exp: 0	3		194	40
475	2017-08-06 20:31:35.789+00	37	Potence 2 exp: 0	3		194	40
476	2017-08-06 20:33:11.053+00	34	Potence 2 exp: 0	3		194	40
477	2017-08-06 20:33:11.068+00	25	Potence 2 exp: 0	3		194	40
478	2017-08-06 20:33:11.086+00	18	Potence 2 exp: 0	3		194	40
479	2017-08-06 20:33:11.098+00	11	Potence 2 exp: 0	3		194	40
480	2017-08-06 20:33:11.109+00	31	Potence 3 exp: 0	3		194	40
481	2017-08-06 20:33:11.125+00	53	Potence 6 exp: 0	3		194	40
482	2017-08-06 20:33:11.139+00	149	Presence 0 exp: 0	3		194	40
483	2017-08-06 20:33:11.154+00	38	Presence 0 exp: 0	3		194	40
484	2017-08-06 20:33:11.172+00	35	Presence 0 exp: 0	3		194	40
485	2017-08-06 20:33:11.222+00	102	Presence 1 exp: 1	3		194	40
486	2017-08-06 20:33:11.241+00	59	Presence 1 exp: 0	3		194	40
487	2017-08-06 20:33:11.28+00	41	Presence 1 exp: 0	3		194	40
488	2017-08-06 20:33:11.296+00	90	Presence 6 exp: 0	3		194	40
489	2017-08-06 20:33:11.34+00	29	Presence 6 exp: 0	3		194	40
490	2017-08-06 20:33:11.418+00	52	Presence 7 exp: 0	3		194	40
491	2017-08-06 20:33:11.454+00	10	Protean 0 exp: 0	3		194	40
492	2017-08-06 20:33:11.475+00	44	Protean 1 exp: 0	3		194	40
493	2017-08-06 20:33:11.522+00	117	Protean 2 exp: 0	3		194	40
494	2017-08-06 20:33:11.564+00	94	Protean 2 exp: 0	3		194	40
495	2017-08-06 20:33:11.607+00	56	Protean 2 exp: 0	3		194	40
496	2017-08-06 20:33:11.622+00	64	Protean 3 exp: 0	3		194	40
497	2017-08-06 20:33:11.637+00	1	Protean 3 exp: 0	3		194	40
498	2017-08-06 20:33:11.652+00	24	Protean 6 exp: 0	3		194	40
499	2017-08-06 20:33:11.666+00	17	Protean 6 exp: 0	3		194	40
500	2017-08-06 20:33:11.679+00	143	Thaumaturgy 0 exp: 0	3		194	40
501	2017-08-06 20:33:11.696+00	150	Thaumaturgy 1 exp: 0	3		194	40
502	2017-08-06 20:33:11.713+00	130	Thaumaturgy 1 exp: 0	3		194	40
503	2017-08-06 20:33:11.764+00	127	Thaumaturgy 1 exp: 0	3		194	40
504	2017-08-06 20:33:11.803+00	124	Thaumaturgy 1 exp: 0	3		194	40
505	2017-08-06 20:33:11.817+00	121	Thaumaturgy 1 exp: 0	3		194	40
506	2017-08-06 20:33:11.832+00	97	Thaumaturgy 1 exp: 0	3		194	40
507	2017-08-06 20:33:11.848+00	69	Thaumaturgy 1 exp: 0	3		194	40
508	2017-08-06 20:33:11.867+00	6	Thaumaturgy 1 exp: 0	3		194	40
509	2017-08-06 20:33:11.888+00	3	Thaumaturgy 1 exp: 0	3		194	40
510	2017-08-06 20:33:11.906+00	7	Thaumaturgy 3 exp: 0	3		194	40
511	2017-08-06 20:33:11.943+00	88	Thaumaturgy 5 exp: 0	3		194	40
512	2017-08-06 20:35:59.11+00	13	Humanity 8	1	Added.	260	40
513	2017-08-06 20:36:27.705+00	14	Willpower 4	1	Added.	260	40
514	2017-08-06 20:37:10.256+00	15	Humanity 7	1	Added.	260	40
515	2017-08-06 20:37:29.877+00	16	Willpower 5	1	Added.	260	40
516	2017-08-06 20:37:59.964+00	17	Humanity 6	1	Added.	260	40
517	2017-08-06 20:38:25.79+00	18	Willpower 4	1	Added.	260	40
518	2017-08-06 20:38:59.3+00	19	Humanity 4	1	Added.	260	40
519	2017-08-06 20:39:28.828+00	20	Willpower 9	1	Added.	260	40
520	2017-08-06 20:40:21.939+00	21	Humanity 6	1	Added.	260	40
521	2017-08-06 20:40:49.996+00	22	Willpower 4	1	Added.	260	40
522	2017-08-06 20:41:13.87+00	23	Humanity 7	1	Added.	260	40
523	2017-08-06 20:41:37.677+00	24	Willpower 4	1	Added.	260	40
524	2017-08-06 20:45:09.537+00	25	Humanity 7	1	Added.	260	40
525	2017-08-06 20:45:30.86+00	26	Willpower 5	1	Added.	260	40
526	2017-08-06 20:46:20.519+00	119	Social 2	1	Added.	197	40
527	2017-08-06 20:46:45.306+00	120	Physical 5	1	Added.	197	40
528	2017-08-06 20:47:11.909+00	121	Mental 5	1	Added.	197	40
529	2017-08-06 20:48:20.329+00	166	Celerity 1 exp: 0	1	Added.	194	40
530	2017-08-06 20:48:46.347+00	167	Potence 1 exp: 0	1	Added.	194	40
531	2017-08-06 20:49:06.167+00	168	Fortitude 1 exp: 0	1	Added.	194	40
532	2017-08-08 15:09:18.905+00	5	[Invest (Equipment) or Invest (Ghoul) or Invest (Haven) or Invest (Herd) or Invest (Weapon) or Learn (Attribute) or Learn (Discipline) or Learn (Specialization) or Learn (Advantage)]1	2	Changed action_types.	189	40
533	2017-08-08 15:09:28.056+00	5	[Invest (Equipment) or Invest (Ghoul) or Invest (Haven) or Invest (Herd) or Invest (Weapon) or Learn (Attribute) or Learn (Discipline) or Learn (Specialization) or Learn (Advantage)]1	2	No fields changed.	189	40
534	2017-08-08 15:09:38.11+00	2	[Mentor (Specialization) or Invest (Equipment) or Invest (Ghoul) or Invest (Haven) or Invest (Herd) or Invest (Weapon) or Learn (Attribute) or Learn (Discipline) or Learn (Specialization) or Mentor (A	2	Changed action_types.	189	40
535	2017-08-08 15:10:09.778+00	1	[Aid Action or Conserve (Influence) or Conserve (Domain) or Influence (Steal) or Influence (Destroy) or Investigate (Character: Influence) or Investigate (Character: Resources) or Investigate (Charact	2	Changed action_types.	189	40
536	2017-08-08 15:58:03.986+00	122	Social 3	2	Changed learned, learning and value.	197	40
537	2017-08-08 15:59:40.3+00	1294	[inför lajv 5] Faye Morgan (Max Ortman): Rest	3		218	40
538	2017-08-08 15:59:40.329+00	1293	[inför lajv 5] Faye Morgan (Max Ortman): Rest	3		218	40
539	2017-08-08 15:59:40.34+00	1292	[inför lajv 5] Faye Morgan (Max Ortman): Rest	3		218	40
540	2017-08-08 15:59:40.351+00	1291	[inför lajv 5] Faye Morgan (Max Ortman): Rest	3		218	40
541	2017-08-08 15:59:40.361+00	1290	[inför lajv 5] Faye Morgan (Max Ortman): Learn (Attribute)	3		218	40
542	2017-08-08 15:59:40.371+00	1289	[inför lajv 5] Faye Morgan (Max Ortman): Learn (Advantage)	3		218	40
543	2017-08-08 15:59:40.381+00	1288	[inför lajv 5] Faye Morgan (Max Ortman): Rest	3		218	40
544	2017-08-08 15:59:40.394+00	1287	[inför lajv 5] Faye Morgan (Max Ortman): Rest	3		218	40
545	2017-08-08 15:59:40.404+00	1284	[inför lajv 5] Faye Morgan (Max Ortman): Rest	3		218	40
546	2017-08-08 15:59:40.414+00	1283	[inför lajv 5] Faye Morgan (Max Ortman): Rest	3		218	40
547	2017-08-08 16:45:03.877+00	10	Investigate (Counterespionage)	2	Changed name.	188	40
548	2017-08-08 16:45:24.421+00	4	Influence (Forge)	3		188	40
549	2017-08-08 16:45:46.643+00	5	Acquire (Influence)	2	Changed name.	188	40
550	2017-08-08 16:46:22.061+00	6	Destroy (Influence)	2	Changed name.	188	40
551	2017-08-08 16:55:55.97+00	35	Assign (XP)	2	Changed name.	188	40
552	2017-08-08 16:56:13.912+00	33	Aid Action (Ghoul)	2	Changed name.	188	40
553	2017-08-08 16:56:37.468+00	20	Aid Action (Primogen)	2	Changed name.	188	40
554	2017-08-08 16:56:51.926+00	21	Question (Primogen)	2	Changed name.	188	40
555	2017-08-08 16:57:14.649+00	19	Question (Keeper)	2	Changed name.	188	40
556	2017-08-08 16:57:32.144+00	18	Neglect (Domain)	2	Changed name.	188	40
557	2017-08-08 16:57:53.986+00	17	Patrol (Domain)	2	Changed name.	188	40
558	2017-08-08 17:21:18.878+00	1304	[inför lajv 5] Faye Morgan (Max Ortman): Investigate (Counterespionage)	3		218	40
559	2017-08-08 17:21:18.928+00	1303	[inför lajv 5] Faye Morgan (Max Ortman): Learn (Attribute)	3		218	40
560	2017-08-08 17:21:18.938+00	1302	[inför lajv 5] Faye Morgan (Max Ortman): Learn (Advantage)	3		218	40
561	2017-08-08 17:21:18.949+00	1301	[inför lajv 5] Faye Morgan (Max Ortman): Learn (Attribute)	3		218	40
562	2017-08-08 17:21:18.96+00	1300	[inför lajv 5] Faye Morgan (Max Ortman): Learn (Advantage)	3		218	40
563	2017-08-08 17:21:18.97+00	1298	[inför lajv 5] Faye Morgan (Max Ortman): Learn (Attribute)	3		218	40
564	2017-08-08 17:21:18.98+00	1297	[inför lajv 5] Faye Morgan (Max Ortman): Learn (Advantage)	3		218	40
565	2017-08-08 17:21:18.99+00	1296	[inför lajv 5] Faye Morgan (Max Ortman): Learn (Attribute)	3		218	40
566	2017-08-08 17:21:19+00	1295	[inför lajv 5] Faye Morgan (Max Ortman): Learn (Advantage)	3		218	40
567	2017-08-08 17:24:51.665+00	14	Tobias von Knorring (Level: 1,Stealth,Faye Morgan (Max Ortman)) 	2	Changed master.	213	40
568	2017-08-08 17:24:58.306+00	13	Varhajen Cecilia (Level: 3,Athletics,Combat,Lore,Faye Morgan (Max Ortman)) 	2	Changed master.	213	40
569	2017-08-08 17:25:07.274+00	12	Sven-Göran Gelin (Level: 1,Ockult,Faye Morgan (Max Ortman)) 	2	Changed master.	213	40
570	2017-08-08 17:34:06.374+00	1305	[inför lajv 5] Faye Morgan (Max Ortman): Aid Action (Ghoul)	3		218	40
571	2017-08-08 17:43:05.445+00	1311	[inför lajv 5] Faye Morgan (Max Ortman): Invest (Haven)	3		218	40
572	2017-08-08 17:43:05.476+00	1310	[inför lajv 5] Faye Morgan (Max Ortman): Rest	3		218	40
573	2017-08-08 17:43:05.486+00	1309	[inför lajv 5] Faye Morgan (Max Ortman): Invest (Haven)	3		218	40
574	2017-08-08 17:43:05.497+00	1308	[inför lajv 5] Faye Morgan (Max Ortman): Rest	3		218	40
575	2017-08-08 18:00:32.636+00	1314	[inför lajv 5] Faye Morgan (Max Ortman): Rest	3		218	40
576	2017-08-08 18:00:32.674+00	1313	[inför lajv 5] Faye Morgan (Max Ortman): Rest	3		218	40
577	2017-08-08 18:02:28.616+00	1316	[inför lajv 5] Faye Morgan (Max Ortman): Rest	2	Changed result.	244	40
578	2017-08-08 18:04:12.499+00	1317	[inför lajv 5] Faye Morgan (Max Ortman): Rest	3		218	40
579	2017-08-08 18:04:12.527+00	1316	[inför lajv 5] Faye Morgan (Max Ortman): Rest	3		218	40
580	2017-08-08 20:27:09.857+00	7	Based on Humanity: Faye Morgan believes that Vampyrer är bajs and will therefor Döda alla vampyrer.	1	Added.	257	40
581	2017-08-08 20:27:24.215+00	8	Based on Clan Theme: Faye Morgan believes that min klan är bäst and will therefor jag ska ta all makt.	1	Added.	257	40
582	2017-08-08 20:28:05.919+00	9	Based on Season Theme: Faye Morgan believes that kunskap är ond and will therefor förstöra alla bevis på att jag är en diablerist.	1	Added.	257	40
583	2017-08-08 21:21:11.466+00	32	Faye Morgan (Max Ortman)	2	Changed herd_description, haven_description, haven_domain, firearms and melee.	215	40
584	2017-08-08 21:23:56.834+00	2	Laptop (Investigation)	2	Changed owner.	212	40
585	2017-08-08 21:24:04.347+00	1	Axebody spray (Apperance)	2	Changed owner.	212	40
586	2017-08-08 21:46:09.762+00	1	Animalism 1	1	Added.	255	40
587	2017-08-08 21:46:24.7+00	2	Fortitude 3	1	Added.	255	40
588	2017-08-09 12:22:21.071+00	7	Tremere	2	Changed theme.	203	40
589	2017-08-09 12:26:43.147+00	1	Helsingkrona	2	Changed is_open.	256	40
590	2017-08-09 20:54:47.879+00	17	[Aid Action (Ghoul)]1	2	Changed name.	189	40
591	2017-08-09 20:54:58.289+00	18	[Assign (XP)]1	2	Changed name.	189	40
592	2017-08-09 20:56:10.937+00	13	Aid Action (Primogen): [Aid Action (Primogen)]1	2	Changed name.	189	40
593	2017-08-09 20:56:33.05+00	12	Question (Primogen): [Question (Primogen)]1	2	Changed name.	189	40
594	2017-08-09 20:56:42.083+00	11	Question (Keeper): [Question (Keeper)]3	2	Changed name.	189	40
595	2017-08-09 20:56:54.968+00	9	Neglect (Domain): [Neglect (Domain)]1	2	Changed name.	189	40
596	2017-08-09 20:57:04.534+00	8	Patrol (Domain): [Patrol (Domain)]1	2	Changed name.	189	40
597	2017-08-09 22:42:49.42+00	16	Rest	2	Changed no_roll.	188	40
598	2017-08-09 22:43:28.404+00	35	Assign (XP)	2	No fields changed.	188	40
599	2017-08-09 22:43:31.915+00	34	Learn (Advantage)	2	No fields changed.	188	40
600	2017-08-09 22:43:37.433+00	33	Aid Action (Ghoul)	2	Changed aid_action.	188	40
601	2017-08-09 22:43:45.633+00	32	Mentor (Specialization)	2	Changed no_roll.	188	40
602	2017-08-09 22:43:49.624+00	31	Mentor (Discipline)	2	Changed no_roll.	188	40
603	2017-08-09 22:43:53.564+00	31	Mentor (Discipline)	2	No fields changed.	188	40
604	2017-08-09 22:43:57.536+00	30	Mentor (Attribute)	2	Changed no_roll.	188	40
605	2017-08-09 22:44:03.076+00	29	Learn (Specialization)	2	Changed no_roll.	188	40
606	2017-08-09 22:44:08.426+00	28	Learn (Discipline)	2	Changed no_roll.	188	40
607	2017-08-09 22:44:14.498+00	27	Learn (Attribute)	2	Changed no_roll.	188	40
608	2017-08-09 22:44:20.956+00	26	Invest (Weapon)	2	Changed no_roll.	188	40
609	2017-08-09 22:44:26.118+00	25	Invest (Herd)	2	Changed no_roll.	188	40
610	2017-08-09 22:44:30.299+00	24	Invest (Haven)	2	Changed no_roll.	188	40
611	2017-08-09 22:44:35.436+00	23	Invest (Ghoul)	2	Changed no_roll.	188	40
612	2017-08-09 22:44:40.884+00	22	Invest (Equipment)	2	Changed no_roll.	188	40
613	2017-08-09 22:44:45.759+00	21	Question (Primogen)	2	Changed no_roll.	188	40
614	2017-08-09 22:44:50.818+00	20	Aid Action (Primogen)	2	Changed aid_action.	188	40
615	2017-08-09 22:44:56.386+00	19	Question (Keeper)	2	Changed no_roll.	188	40
616	2017-08-09 22:45:06.536+00	18	Neglect (Domain)	2	Changed no_roll.	188	40
617	2017-08-09 22:45:12.67+00	17	Patrol (Domain)	2	Changed no_roll.	188	40
618	2017-08-09 22:45:18.607+00	16	Rest	2	No fields changed.	188	40
619	2017-08-09 22:45:33.253+00	1	Aid Action	2	Changed template and aid_action.	188	40
620	2017-08-09 23:04:47.408+00	1323	[inför lajv 5] Faye Morgan (Max Ortman): Aid Action (Ghoul)	3		218	40
621	2017-08-09 23:04:47.418+00	1322	[inför lajv 5] Faye Morgan (Max Ortman): Assign (XP)	3		218	40
622	2017-08-09 23:04:47.429+00	1321	[inför lajv 5] Faye Morgan (Max Ortman): Investigate (Character: Downtime Actions)	3		218	40
623	2017-08-09 23:04:47.439+00	1320	[inför lajv 5] Faye Morgan (Max Ortman): Investigate (Character: Resources)	3		218	40
624	2017-08-09 23:04:47.45+00	1319	[inför lajv 5] Faye Morgan (Max Ortman): Investigate (Character: Influence)	3		218	40
625	2017-08-09 23:04:47.46+00	1318	[inför lajv 5] Faye Morgan (Max Ortman): Destroy (Influence)	3		218	40
626	2017-08-09 23:08:03.923+00	1324	[inför lajv 5] Faye Morgan (Max Ortman): Aid Action (Ghoul)	3		218	40
627	2017-08-09 23:10:02.207+00	1325	[inför lajv 5] Faye Morgan (Max Ortman): Conserve (Domain)	3		218	40
628	2017-08-10 10:22:41.074+00	32	Faye Morgan (Max Ortman)	2	Changed titles.	215	40
629	2017-08-10 10:41:23.747+00	135	Zero Day	2	Changed master.	210	40
630	2017-08-10 10:41:35.704+00	121	Lova Vinge	2	Changed master.	210	40
631	2017-08-10 10:41:55.911+00	31	Till Hansson	2	Changed master.	210	40
632	2017-08-10 10:42:13.716+00	13	Sverker Olofson	2	Changed master.	210	40
633	2017-08-10 10:42:51.635+00	31	Till Hansson	2	Changed master.	210	40
634	2017-08-10 10:43:17.189+00	30	Max Stenström	2	Changed master.	210	40
635	2017-08-10 10:43:31.376+00	9	Lillith	2	Changed master.	210	40
636	2017-08-11 16:01:58.092+00	1337	[inför lajv 5] Faye Morgan (Max Ortman): Patrol (Domain)	3		218	40
637	2017-08-11 16:01:58.112+00	1336	[inför lajv 5] Faye Morgan (Max Ortman): Aid Action	3		218	40
638	2017-08-11 16:01:58.123+00	1335	[inför lajv 5] Faye Morgan (Max Ortman): Aid Action	3		218	40
639	2017-08-11 16:01:58.135+00	1334	[inför lajv 5] Faye Morgan (Max Ortman): Conserve (Influence)	3		218	40
640	2017-08-11 16:01:58.149+00	1333	[inför lajv 5] Faye Morgan (Max Ortman): Assign (XP)	3		218	40
641	2017-08-11 16:01:58.159+00	1332	[inför lajv 5] Faye Morgan (Max Ortman): Investigate (Influence)	3		218	40
642	2017-08-11 16:01:58.169+00	1331	[inför lajv 5] Faye Morgan (Max Ortman): Invest (Herd)	3		218	40
643	2017-08-11 16:01:58.183+00	1330	[inför lajv 5] Faye Morgan (Max Ortman): Invest (Haven)	3		218	40
644	2017-08-11 16:01:58.194+00	1329	[inför lajv 5] Faye Morgan (Max Ortman): Rest	3		218	40
645	2017-08-11 16:01:58.21+00	1328	[inför lajv 5] Faye Morgan (Max Ortman): Rest	3		218	40
646	2017-08-11 16:01:58.221+00	1327	[inför lajv 5] Faye Morgan (Max Ortman): Rest	3		218	40
647	2017-08-11 16:01:58.231+00	1326	[inför lajv 5] Faye Morgan (Max Ortman): Rest	3		218	40
648	2017-08-11 16:01:58.245+00	1151	[inför lajv 4] Pierre Steen (Tomas Kronvall): Investigate (Phenomenon)	3		218	40
649	2017-08-11 16:01:58.266+00	1150	[inför lajv 4] Pierre Steen (Tomas Kronvall): Invest (Ghoul)	3		218	40
650	2017-08-11 16:01:58.278+00	1149	[inför lajv 4] Pierre Steen (Tomas Kronvall): Learn (Attribute)	3		218	40
651	2017-08-11 16:01:58.292+00	1148	[inför lajv 4] Pierre Steen (Tomas Kronvall): Acquire (Influence)	3		218	40
652	2017-08-11 16:01:58.308+00	1147	[inför lajv 4] Pierre Steen (Tomas Kronvall): Acquire (Influence)	3		218	40
653	2017-08-11 16:01:58.32+00	1146	[inför lajv 4] Pierre Steen (Tomas Kronvall): Acquire (Influence)	3		218	40
654	2017-08-11 16:01:58.332+00	1145	[inför lajv 4] Pierre Steen (Tomas Kronvall): Acquire (Influence)	3		218	40
655	2017-08-11 16:01:58.346+00	1121	[inför lajv 4] Faye Morgan (Max Ortman): Investigate (Phenomenon)	3		218	40
656	2017-08-11 16:01:58.361+00	1120	[inför lajv 4] Faye Morgan (Max Ortman): Investigate (Phenomenon)	3		218	40
657	2017-08-11 16:01:58.374+00	1119	[inför lajv 4] Faye Morgan (Max Ortman): Investigate (Counterespionage)	3		218	40
658	2017-08-11 16:01:58.388+00	1118	[inför lajv 4] Faye Morgan (Max Ortman): Investigate (Phenomenon)	3		218	40
659	2017-08-11 16:01:58.4+00	1111	[inför lajv 4] Dante (Dennis Nilsson): Rest	3		218	40
660	2017-08-11 16:01:58.413+00	1108	[inför lajv 4] Filch (Peter Björklund): Investigate (Counterespionage)	3		218	40
661	2017-08-11 16:01:58.424+00	1107	[inför lajv 4] Filch (Peter Björklund): Conserve (Domain)	3		218	40
662	2017-08-11 16:01:58.436+00	1106	[inför lajv 4] Filch (Peter Björklund): Conserve (Domain)	3		218	40
663	2017-08-11 16:01:58.452+00	1105	[inför lajv 4] Filch (Peter Björklund): Conserve (Domain)	3		218	40
664	2017-08-11 16:01:58.471+00	1104	[inför lajv 4] Filch (Peter Björklund): Rest	3		218	40
665	2017-08-11 16:01:58.489+00	947	[inför lajv 4] Hans Liljenkrantz (Henrik Roos): Patrol (Domain)	3		218	40
666	2017-08-11 16:01:58.505+00	946	[inför lajv 4] Hans Liljenkrantz (Henrik Roos): Invest (Ghoul)	3		218	40
667	2017-08-11 16:01:58.516+00	943	[inför lajv 4] Hans Liljenkrantz (Henrik Roos): Rest	3		218	40
668	2017-08-11 16:01:58.531+00	942	[inför lajv 4] Hans Liljenkrantz (Henrik Roos): Acquire (Influence)	3		218	40
669	2017-08-11 16:01:58.542+00	941	[inför lajv 4] Hans Liljenkrantz (Henrik Roos): Acquire (Influence)	3		218	40
670	2017-08-11 16:01:58.553+00	865	[inför lajv 4] Erik (Anton Muller): Acquire (Influence)	3		218	40
671	2017-08-11 16:01:58.564+00	864	[inför lajv 4] Erik (Anton Muller): Acquire (Influence)	3		218	40
672	2017-08-11 16:01:58.575+00	863	[inför lajv 4] Erik (Anton Muller): Investigate (Phenomenon)	3		218	40
673	2017-08-11 16:01:58.587+00	862	[inför lajv 4] Erik (Anton Muller): Rest	3		218	40
674	2017-08-11 16:01:58.599+00	860	[inför lajv 4] Erik (Anton Muller): Invest (Herd)	3		218	40
675	2017-08-11 16:01:58.611+00	852	[inför lajv 3] Pierre Steen (Tomas Kronvall): Invest (Haven)	3		218	40
676	2017-08-11 16:01:58.632+00	851	[inför lajv 3] Pierre Steen (Tomas Kronvall): Investigate (Character: Downtime Actions)	3		218	40
677	2017-08-11 16:01:58.643+00	850	[inför lajv 3] Pierre Steen (Tomas Kronvall): Investigate (Character: Influence)	3		218	40
678	2017-08-11 16:01:58.656+00	849	[inför lajv 3] Pierre Steen (Tomas Kronvall): Investigate (Phenomenon)	3		218	40
679	2017-08-11 16:01:58.667+00	848	[inför lajv 3] Pierre Steen (Tomas Kronvall): Investigate (Phenomenon)	3		218	40
680	2017-08-11 16:01:58.678+00	817	[inför lajv 3] Faye Morgan (Max Ortman): Invest (Haven)	3		218	40
681	2017-08-11 16:01:58.688+00	816	[inför lajv 3] Faye Morgan (Max Ortman): Invest (Herd)	3		218	40
682	2017-08-11 16:01:58.703+00	815	[inför lajv 3] Faye Morgan (Max Ortman): Investigate (Phenomenon)	3		218	40
683	2017-08-11 16:01:58.716+00	814	[inför lajv 3] Faye Morgan (Max Ortman): Investigate (Influence)	3		218	40
684	2017-08-11 16:01:58.729+00	813	[inför lajv 3] Faye Morgan (Max Ortman): Investigate (Phenomenon)	3		218	40
685	2017-08-11 16:01:58.739+00	812	[inför lajv 3] Faye Morgan (Max Ortman): Investigate (Counterespionage)	3		218	40
686	2017-08-11 16:01:58.75+00	805	[inför lajv 3] Dante (Dennis Nilsson): Rest	3		218	40
687	2017-08-11 16:01:58.76+00	662	[inför lajv 3] Filch (Peter Björklund): Investigate (Phenomenon)	3		218	40
688	2017-08-11 16:01:58.772+00	660	[inför lajv 3] Filch (Peter Björklund): Invest (Weapon)	3		218	40
689	2017-08-11 16:01:58.784+00	658	[inför lajv 3] Filch (Peter Björklund): Rest	3		218	40
690	2017-08-11 16:01:58.796+00	657	[inför lajv 3] Filch (Peter Björklund): Conserve (Domain)	3		218	40
691	2017-08-11 16:01:58.807+00	630	[inför lajv 3] Robin (Denniz Cederquist): Investigate (Influence)	3		218	40
692	2017-08-11 16:01:58.824+00	629	[inför lajv 3] Robin (Denniz Cederquist): Acquire (Influence)	3		218	40
693	2017-08-11 16:01:58.841+00	628	[inför lajv 3] Robin (Denniz Cederquist): Acquire (Influence)	3		218	40
694	2017-08-11 16:01:58.854+00	614	[inför lajv 3] Hans Liljenkrantz (Henrik Roos): Investigate (Influence)	3		218	40
695	2017-08-11 16:01:58.864+00	611	[inför lajv 3] Hans Liljenkrantz (Henrik Roos): Acquire (Influence)	3		218	40
696	2017-08-11 16:01:58.875+00	610	[inför lajv 3] Hans Liljenkrantz (Henrik Roos): Acquire (Influence)	3		218	40
697	2017-08-11 16:01:58.885+00	609	[inför lajv 3] Hans Liljenkrantz (Henrik Roos): Acquire (Influence)	3		218	40
698	2017-08-11 16:01:58.896+00	608	[inför lajv 3] Hans Liljenkrantz (Henrik Roos): Acquire (Influence)	3		218	40
699	2017-08-11 16:01:58.907+00	519	[inför lajv 3] Erik (Anton Muller): Invest (Equipment)	3		218	40
700	2017-08-11 16:01:58.917+00	518	[inför lajv 3] Erik (Anton Muller): Learn (Discipline)	3		218	40
701	2017-08-11 16:01:58.938+00	517	[inför lajv 3] Erik (Anton Muller): Investigate (Influence)	3		218	40
702	2017-08-11 16:01:58.949+00	516	[inför lajv 3] Erik (Anton Muller): Acquire (Influence)	3		218	40
703	2017-08-11 16:01:58.96+00	515	[inför lajv 3] Erik (Anton Muller): Learn (Specialization)	3		218	40
704	2017-08-11 16:01:58.972+00	514	[inför lajv 3] Erik (Anton Muller): Rest	3		218	40
705	2017-08-11 16:01:58.983+00	469	[inför lajv 2] Zelda Mörck (Matilda Dahl): Investigate (Phenomenon)	3		218	40
706	2017-08-11 16:01:58.994+00	468	[inför lajv 2] Zelda Mörck (Matilda Dahl): Investigate (Phenomenon)	3		218	40
707	2017-08-11 16:01:59.006+00	467	[inför lajv 2] Zelda Mörck (Matilda Dahl): Investigate (Phenomenon)	3		218	40
708	2017-08-11 16:01:59.017+00	466	[inför lajv 2] Zelda Mörck (Matilda Dahl): Investigate (Phenomenon)	3		218	40
709	2017-08-11 16:01:59.03+00	423	[inför lajv 2] Robin (Denniz Cederquist): Investigate (Influence)	3		218	40
710	2017-08-11 16:01:59.057+00	422	[inför lajv 2] Robin (Denniz Cederquist): Investigate (Influence)	3		218	40
711	2017-08-11 16:01:59.073+00	397	[inför lajv 2] Pierre Steen (Tomas Kronvall): Learn (Discipline)	3		218	40
712	2017-08-11 16:01:59.084+00	396	[inför lajv 2] Pierre Steen (Tomas Kronvall): Learn (Attribute)	3		218	40
713	2017-08-11 16:01:59.097+00	395	[inför lajv 2] Pierre Steen (Tomas Kronvall): Investigate (Phenomenon)	3		218	40
714	2017-08-11 16:01:59.108+00	394	[inför lajv 2] Pierre Steen (Tomas Kronvall): Investigate (Influence)	3		218	40
715	2017-08-11 16:01:59.119+00	393	[inför lajv 2] Pierre Steen (Tomas Kronvall): Investigate (Influence)	3		218	40
716	2017-08-11 16:01:59.13+00	355	[inför lajv 2] Faye Morgan (Max Ortman): Investigate (Phenomenon)	3		218	40
717	2017-08-11 16:01:59.141+00	354	[inför lajv 2] Faye Morgan (Max Ortman): Learn (Discipline)	3		218	40
718	2017-08-11 16:01:59.158+00	353	[inför lajv 2] Faye Morgan (Max Ortman): Learn (Discipline)	3		218	40
719	2017-08-11 16:01:59.174+00	352	[inför lajv 2] Faye Morgan (Max Ortman): Acquire (Influence)	3		218	40
720	2017-08-11 16:01:59.186+00	351	[inför lajv 2] Faye Morgan (Max Ortman): Acquire (Influence)	3		218	40
721	2017-08-11 16:01:59.197+00	350	[inför lajv 2] Faye Morgan (Max Ortman): Investigate (Phenomenon)	3		218	40
722	2017-08-11 16:01:59.206+00	349	[inför lajv 2] Faye Morgan (Max Ortman): Investigate (Counterespionage)	3		218	40
723	2017-08-11 16:01:59.216+00	117	[inför lajv 2] Hans Liljenkrantz (Henrik Roos): Invest (Herd)	3		218	40
724	2017-08-11 16:01:59.228+00	116	[inför lajv 2] Hans Liljenkrantz (Henrik Roos): Investigate (Influence)	3		218	40
725	2017-08-11 16:01:59.239+00	115	[inför lajv 2] Hans Liljenkrantz (Henrik Roos): Investigate (Influence)	3		218	40
726	2017-08-11 16:01:59.25+00	114	[inför lajv 2] Hans Liljenkrantz (Henrik Roos): Acquire (Influence)	3		218	40
727	2017-08-11 16:01:59.267+00	113	[inför lajv 2] Hans Liljenkrantz (Henrik Roos): Acquire (Influence)	3		218	40
728	2017-08-11 16:01:59.281+00	70	[inför lajv 2] Erik (Anton Muller): Learn (Discipline)	3		218	40
729	2017-08-11 16:01:59.299+00	69	[inför lajv 2] Erik (Anton Muller): Learn (Discipline)	3		218	40
730	2017-08-11 16:01:59.31+00	68	[inför lajv 2] Erik (Anton Muller): Investigate (Phenomenon)	3		218	40
731	2017-08-11 16:01:59.324+00	67	[inför lajv 2] Erik (Anton Muller): Invest (Equipment)	3		218	40
732	2017-08-11 16:01:59.345+00	66	[inför lajv 2] Erik (Anton Muller): Investigate (Phenomenon)	3		218	40
733	2017-08-11 16:01:59.358+00	65	[inför lajv 2] Erik (Anton Muller): Learn (Discipline)	3		218	40
734	2017-08-11 16:01:59.369+00	43	[inför lajv 2] Filch (Peter Björklund): Learn (Discipline)	3		218	40
735	2017-08-11 16:01:59.381+00	41	[inför lajv 2] Filch (Peter Björklund): Rest	3		218	40
736	2017-08-11 16:02:09.532+00	40	[inför lajv 2] Filch (Peter Björklund): Conserve (Domain)	3		218	40
737	2017-08-11 16:03:44.515+00	53	[inför lajv 5] Faye Morgan (Max Ortman): Thaumaturgy	3		252	40
738	2017-08-11 16:03:44.534+00	47	[inför lajv 4] Pierre Steen (Tomas Kronvall): 	3		252	40
739	2017-08-11 16:03:44.55+00	39	[inför lajv 4] Hans Liljenkrantz (Henrik Roos): 	3		252	40
740	2017-08-11 16:03:44.565+00	36	[inför lajv 4] Erik (Anton Muller): 	3		252	40
741	2017-08-11 16:03:44.58+00	35	[inför lajv 3] Pierre Steen (Tomas Kronvall): 	3		252	40
742	2017-08-11 16:03:44.597+00	32	[inför lajv 3] Dante (Dennis Nilsson): 	3		252	40
743	2017-08-11 16:03:44.611+00	22	[inför lajv 3] Robin (Denniz Cederquist): 	3		252	40
744	2017-08-11 16:03:44.627+00	20	[inför lajv 3] Hans Liljenkrantz (Henrik Roos): 	3		252	40
745	2017-08-11 16:03:44.642+00	9	[inför lajv 2] Pierre Steen (Tomas Kronvall): 	3		252	40
746	2017-08-11 16:04:46.507+00	138	[open] inför lajv 5: Faye Morgan (Max Ortman)	3		249	40
747	2017-08-11 16:04:46.527+00	60	[closed] inför lajv 4: Pierre Steen (Tomas Kronvall)	3		249	40
748	2017-08-11 16:04:46.541+00	58	[closed] inför lajv 4: Faye Morgan (Max Ortman)	3		249	40
749	2017-08-11 16:04:46.55+00	57	[closed] inför lajv 4: Dante (Dennis Nilsson)	3		249	40
750	2017-08-11 16:04:46.561+00	55	[closed] inför lajv 4: Filch (Peter Björklund)	3		249	40
751	2017-08-11 16:04:46.574+00	42	[closed] inför lajv 4: Hans Liljenkrantz (Henrik Roos)	3		249	40
752	2017-08-11 16:04:46.584+00	35	[closed] inför lajv 4: Erik (Anton Muller)	3		249	40
753	2017-08-11 16:04:46.595+00	34	[closed] inför lajv 3: Pierre Steen (Tomas Kronvall)	3		249	40
754	2017-08-11 16:04:46.605+00	31	[closed] inför lajv 3: Zelda Mörck (Matilda Dahl)	3		249	40
755	2017-08-11 16:04:46.616+00	30	[closed] inför lajv 3: Faye Morgan (Max Ortman)	3		249	40
756	2017-08-11 16:04:46.634+00	29	[closed] inför lajv 3: Dante (Dennis Nilsson)	3		249	40
757	2017-08-11 16:04:46.645+00	17	[closed] inför lajv 3: Filch (Peter Björklund)	3		249	40
758	2017-08-11 16:04:46.654+00	14	[closed] inför lajv 3: Robin (Denniz Cederquist)	3		249	40
759	2017-08-11 16:04:46.663+00	12	[closed] inför lajv 3: Hans Liljenkrantz (Henrik Roos)	3		249	40
760	2017-08-11 16:04:46.673+00	4	[closed] inför lajv 3: Erik (Anton Muller)	3		249	40
761	2017-08-11 16:05:01.774+00	31	[open] inför lajv 5: Faye Morgan (Max Ortman)	3		262	40
762	2017-08-11 16:05:01.794+00	30	[open] inför lajv 5: Faye Morgan (Max Ortman)	3		262	40
763	2017-08-11 16:05:12.95+00	25	[open] inför lajv 5: Faye Morgan (Max Ortman)	3		198	40
764	2017-08-11 16:05:12.964+00	20	[open] inför lajv 5: Faye Morgan (Max Ortman)	3		198	40
765	2017-08-11 16:05:12.974+00	19	[open] inför lajv 5: Faye Morgan (Max Ortman)	3		198	40
766	2017-08-11 16:05:12.983+00	9	[closed] inför lajv 4: Pierre Steen (Tomas Kronvall)	3		198	40
767	2017-08-11 16:05:12.996+00	8	[closed] inför lajv 4: Hans Liljenkrantz (Henrik Roos)	3		198	40
768	2017-08-11 16:05:13.007+00	5	[closed] inför lajv 3: Pierre Steen (Tomas Kronvall)	3		198	40
769	2017-08-11 16:05:23.726+00	132	[open] inför lajv 5: Faye Morgan (Max Ortman)	3		195	40
770	2017-08-11 16:05:23.744+00	131	[open] inför lajv 5: Faye Morgan (Max Ortman)	3		195	40
771	2017-08-11 16:05:23.755+00	130	[open] inför lajv 5: Faye Morgan (Max Ortman)	3		195	40
772	2017-08-11 16:05:23.764+00	63	[closed] inför lajv 4: Pierre Steen (Tomas Kronvall)	3		195	40
773	2017-08-11 16:05:23.774+00	62	[closed] inför lajv 4: Pierre Steen (Tomas Kronvall)	3		195	40
774	2017-08-11 16:05:23.784+00	61	[closed] inför lajv 4: Pierre Steen (Tomas Kronvall)	3		195	40
775	2017-08-11 16:05:23.796+00	58	[closed] inför lajv 4: Faye Morgan (Max Ortman)	3		195	40
776	2017-08-11 16:05:23.808+00	57	[closed] inför lajv 4: Faye Morgan (Max Ortman)	3		195	40
777	2017-08-11 16:05:23.822+00	49	[closed] inför lajv 4: Hans Liljenkrantz (Henrik Roos)	3		195	40
778	2017-08-11 16:05:23.833+00	42	[closed] inför lajv 3: Pierre Steen (Tomas Kronvall)	3		195	40
779	2017-08-11 16:05:23.859+00	41	[closed] inför lajv 3: Pierre Steen (Tomas Kronvall)	3		195	40
780	2017-08-11 16:05:23.898+00	40	[closed] inför lajv 3: Faye Morgan (Max Ortman)	3		195	40
781	2017-08-11 16:05:23.923+00	31	[closed] inför lajv 3: Filch (Peter Björklund)	3		195	40
782	2017-08-11 16:05:23.935+00	28	[closed] inför lajv 3: Robin (Denniz Cederquist)	3		195	40
783	2017-08-11 16:05:23.946+00	27	[closed] inför lajv 3: Robin (Denniz Cederquist)	3		195	40
784	2017-08-11 16:05:23.956+00	25	[closed] inför lajv 3: Hans Liljenkrantz (Henrik Roos)	3		195	40
785	2017-08-11 16:05:37.898+00	141	[inför lajv 5] Filch (Peter Björklund): 8points from Skogsområdet - Feeding Points: 0, Status: 0, Masquerade: Worse	3		251	40
786	2017-08-11 16:05:37.918+00	140	[inför lajv 5] Faye Morgan (Max Ortman): 6points from Skavtång - Feeding Points: 10, Status: 3, Masquerade: Better	3		251	40
787	2017-08-11 16:05:37.929+00	131	[inför lajv 5] Filch (Peter Björklund): 8points from Skogsområdet - Feeding Points: 0, Status: 0, Masquerade: Worse	3		251	40
788	2017-08-11 16:05:37.941+00	97	[inför lajv 4] Filch (Peter Björklund): 8points from Skogsområdet - Feeding Points: 0, Status: 0, Masquerade: Worse	3		251	40
789	2017-08-11 16:05:37.956+00	74	[inför lajv 3] Zelda Mörck (Matilda Dahl): 5points from Skavtång - Feeding Points: 10, Status: 3, Masquerade: Better	3		251	40
790	2017-08-11 16:05:37.967+00	59	[inför lajv 3] Filch (Peter Björklund): 5points from Skogsområdet - Feeding Points: 0, Status: 0, Masquerade: Worse	3		251	40
791	2017-08-11 16:05:37.978+00	57	[inför lajv 3] Robin (Denniz Cederquist): 3points from Skavtång - Feeding Points: 10, Status: 3, Masquerade: Better	3		251	40
792	2017-08-11 16:05:37.992+00	37	[inför lajv 2] Robin (Denniz Cederquist): 2points from Skavtång - Feeding Points: 10, Status: 3, Masquerade: Better	3		251	40
793	2017-08-11 16:05:38.004+00	4	[inför lajv 2] Filch (Peter Björklund): 9points from Skogsområdet - Feeding Points: 0, Status: 0, Masquerade: Worse	3		251	40
794	2017-08-11 16:05:51.831+00	9	Based on Season Theme: Faye Morgan believes that kunskap är ond and will therefor förstöra alla bevis på att jag är en diablerist.	3		257	40
795	2017-08-11 16:05:51.843+00	8	Based on Clan Theme: Faye Morgan believes that min klan är bäst and will therefor jag ska ta all makt.	3		257	40
796	2017-08-11 16:05:51.853+00	7	Based on Humanity: Faye Morgan believes that Vampyrer är bajs and will therefor Döda alla vampyrer.	3		257	40
797	2017-08-11 16:05:51.867+00	6	Based on Faction: Erik believes that människor är bäst and will therefor hjälpa gammla damer och herrar.	3		257	40
798	2017-08-11 16:05:51.878+00	5	Based on Clan Theme: Erik believes that Brujah vet bäst and will therefor veta allt.	3		257	40
799	2017-08-11 16:05:51.889+00	4	Based on Humanity: Erik believes that Vampyrer är bajs and will therefor bli människa.	3		257	40
800	2017-08-11 16:06:18.064+00	38	[open] inför lajv 5: Faye Morgan (Max Ortman)	3		250	40
801	2017-08-11 16:06:18.083+00	9	[closed] inför lajv 4: Filch (Peter Björklund)	3		250	40
802	2017-08-11 16:06:18.094+00	3	[closed] inför lajv 4: Erik (Anton Muller)	3		250	40
803	2017-08-11 16:06:58.75+00	13	[Hans Liljenkrantz (Henrik Roos)] [closed] inför lajv 4: Greta Star	3		224	40
804	2017-08-11 16:06:58.763+00	7	[Zelda Mörck (Matilda Dahl)] [closed] inför lajv 3: Cassandra Kahn	3		224	40
805	2017-08-11 16:06:58.773+00	6	[Erik (Anton Muller)] [closed] inför lajv 3: Ivan Kallenberg	3		224	40
806	2017-08-11 16:06:58.785+00	1	[Hans Liljenkrantz (Henrik Roos)] [closed] inför lajv 2: Greg Stone	3		224	40
807	2017-08-11 16:07:34.318+00	372	Erika: 1 from Faye Morgan in [open] inför lajv 5	3		265	40
808	2017-08-11 16:07:34.333+00	371	Jenny McCarty: 1 from Faye Morgan in [open] inför lajv 5	3		265	40
809	2017-08-11 16:07:34.345+00	370	Liliana: 1 from Faye Morgan in [open] inför lajv 5	3		265	40
810	2017-08-11 16:07:34.355+00	369	Monster: -1 from Faye Morgan in [open] inför lajv 5	3		265	40
811	2017-08-11 16:07:34.365+00	368	Faye Morgan: 1 from Faye Morgan in [open] inför lajv 5	3		265	40
812	2017-08-11 16:07:34.375+00	367	Pierre Steen: 1 from Faye Morgan in [open] inför lajv 5	3		265	40
813	2017-08-11 16:07:34.386+00	366	Zelda Mörck: 1 from Faye Morgan in [open] inför lajv 5	3		265	40
814	2017-08-11 16:07:34.397+00	365	Robin: 1 from Faye Morgan in [open] inför lajv 5	3		265	40
815	2017-08-11 16:07:34.407+00	364	Filch: 1 from Faye Morgan in [open] inför lajv 5	3		265	40
816	2017-08-11 16:07:34.419+00	363	Dante: -1 from Faye Morgan in [open] inför lajv 5	3		265	40
817	2017-08-11 16:07:34.435+00	362	Hans Liljenkrantz: 1 from Faye Morgan in [open] inför lajv 5	3		265	40
818	2017-08-11 16:07:34.446+00	361	Erik: 0 from Faye Morgan in [open] inför lajv 5	3		265	40
819	2017-08-11 16:07:34.456+00	12	Pierre Steen: 0 from Faye Morgan in [closed] inför lajv 2	3		265	40
820	2017-08-11 16:07:34.467+00	11	Filch: 0 from Faye Morgan in [closed] inför lajv 2	3		265	40
821	2017-08-11 16:07:34.478+00	10	Zelda Mörck: 0 from Faye Morgan in [closed] inför lajv 2	3		265	40
822	2017-08-11 16:07:34.495+00	9	Zelda Mörck: 0 from Faye Morgan in [closed] inför lajv 2	3		265	40
823	2017-08-11 16:07:34.507+00	8	Filch: 0 from Faye Morgan in [closed] inför lajv 2	3		265	40
824	2017-08-11 16:07:34.518+00	7	Robin: 0 from Faye Morgan in [closed] inför lajv 2	3		265	40
825	2017-08-11 16:07:34.528+00	6	Dante: 0 from Faye Morgan in [closed] inför lajv 2	3		265	40
826	2017-08-11 16:07:34.541+00	5	Erik: 0 from Faye Morgan in [closed] inför lajv 2	3		265	40
827	2017-08-11 16:07:34.552+00	4	Robin: 0 from Faye Morgan in [closed] inför lajv 2	3		265	40
828	2017-08-11 16:07:34.564+00	3	Dante: 0 from Faye Morgan in [closed] inför lajv 2	3		265	40
829	2017-08-11 16:07:34.593+00	2	Erik: 0 from Faye Morgan in [closed] inför lajv 2	3		265	40
830	2017-08-11 16:07:34.607+00	1	Erik: 1 from Faye Morgan in [closed] inför lajv 2	3		265	40
831	2017-08-19 21:40:58.284834+00	1	Based on Humanity: Faye Morgan believes that Adrian påminer mig om hur jag var som människa and will therefor få Adrian att älska mig..	1	Added.	257	40
832	2017-08-19 21:41:55.858936+00	2	Based on Season Theme: Faye Morgan believes that Kunskapen ska vara fri and will therefor avslöja klanens hemligheter.	1	Added.	257	40
833	2017-08-19 21:43:16.73656+00	3	Based on Faction: Faye Morgan believes that Lilith led för att få kunskap and will therefor se till att Jane får lida..	1	Added.	257	40
834	2017-08-19 21:48:19.351405+00	32	Faye Morgan (Max Ortman)	2	Changed titles.	215	40
835	2017-08-19 21:48:50.07583+00	13	Varhajen Cecilia (Level: 3,Athletics,Combat,Lore,None) 	2	Changed master.	213	40
836	2017-08-19 21:49:00.421847+00	12	Sven-Göran Gelin (Level: 1,Ockult,None) 	2	Changed master.	213	40
837	2017-08-19 21:49:21.76506+00	14	Tobias von Knorring (Level: 1,Stealth,None) 	2	Changed master.	213	40
838	2017-08-19 21:49:34.385074+00	9	Lilja Jr, Ephraim (Level: 3,Combat,Investigation,Subterfuge,Faye Morgan (Max Ortman)) 	2	Changed master.	213	40
839	2017-08-21 16:09:36.796734+00	25	Zelda Mörck (Matilda Dahl)	2	Changed concept and haven_domain.	215	40
840	2017-08-21 16:22:59.095687+00	36	Jenny McCarty (None)	2	Changed user.	215	40
841	2017-08-21 16:23:45.750188+00	37	Erika (None)	2	Changed nature, clan, haven_description and haven_domain.	215	40
842	2017-08-21 16:23:57.989672+00	37	Erika (lola)	2	Changed user.	215	40
843	2017-08-22 16:23:31.484453+00	4	[open] inför lajv 5	3		217	40
844	2017-08-22 16:23:31.545831+00	3	[closed] inför lajv 4	3		217	40
845	2017-08-22 16:23:31.54853+00	2	[closed] inför lajv 3	3		217	40
846	2017-08-22 16:23:31.5512+00	1	[closed] inför lajv 2	3		217	40
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 846, true);


--
-- Data for Name: django_comment_flags; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY django_comment_flags (id, flag, flag_date, comment_id, user_id) FROM stdin;
\.


--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('django_comment_flags_id_seq', 1, false);


--
-- Data for Name: django_comments; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY django_comments (id, object_pk, user_name, user_email, user_url, comment, submit_date, ip_address, is_public, is_removed, content_type_id, site_id, user_id) FROM stdin;
1	99	felicia	email@mail.com		Thordon is doing the following actions, you can if you want you can chose one of these actions and set a scene to intervene in: \r\n\r\n1. Thordon is conserving Kärnkraftverket.\r\n\r\n2. Thordon is investigating Samuel Lilja's downtime actions.\r\n\r\n3. Thordon is doing counter espionage.\r\n\r\n4. Thordon is investigating: Jag vill undersöka Spöket som jag fick på brev från en av mina hooks.\r\nJag vill veta vem det var/är.\r\nVad det vill och vad jag kan få ut av det.	2017-03-07 21:16:05.412+00	172.17.0.1	t	f	218	1	40
2	381	felicia	email@mail.com		Thordon is doing the following actions, you can if you want you can chose one of these actions and set a scene to intervene in: \r\n\r\n1. Diakon Whinther is conserving Ångsholmen.\r\n\r\n2. Diakon Whinther is mentoring Filch on Fortitude.\r\n\r\n3. Diakon Whinther is learning Potence. With Filch as teacher.\r\n\r\n4. Diakon Whinther is resting.\r\n\r\n5. Diakon Whinther is conserving Innerstaden.\r\n\r\n6. Diakon Whinther is investigating: Tatot demonen. Har fått info från Sheriffen om detta.\r\n\r\n7. Diakon Whinther is investing in the weapon Explosives.	2017-03-07 21:19:58.218+00	172.17.0.1	t	f	218	1	40
3	142	felicia	email@mail.com		Att Camarillan faller och att Liliths mysterier går förlorade.	2017-03-07 21:35:28.068+00	172.17.0.1	t	f	218	1	40
4	246	felicia	email@mail.com		Diakon Whinther declined to answer and does now owe you one enkel gäld.	2017-03-07 21:47:39.447+00	172.17.0.1	t	f	218	1	40
5	440	felicia	email@mail.com		Marion answers that: Jag skämdes att berätta det först och sen när kvällen var slut så berätta jag hemma	2017-03-07 21:53:08.589+00	172.17.0.1	t	f	218	1	40
6	143	felicia	email@mail.com		Lydias största rädsla är att förlora sin makt.	2017-03-07 22:20:16.291+00	172.17.0.1	t	f	218	1	40
7	100	felicia	email@mail.com		Man ska egentligen inte kunna skaffa equipment som ger bonus på combat. Kan du tänka dig att skaffa ett annat equipment, eller ett vapen?	2017-03-07 22:37:24.535+00	172.17.0.1	t	f	218	1	40
8	412	felicia	email@mail.com		Jag känner till generella hot mot Camarillan men det har ingenting med klanäldste att göra	2017-03-07 23:07:37.749+00	172.17.0.1	t	f	218	1	40
9	458	felicia	email@mail.com		Samuel Lilja is doing the following actions, you can if you want you can chose one of these actions and set a scene to intervene in:\r\n\r\n1. Samuel Lilja is investigating: Det finns en sekt-liknande organisation med korrupta byråkrater i kommunen som kallas Deltagarna. Jag vill ta reda på vilka medlemmarna är och vad deras agenda är.\r\n\r\n2. Samuel Lilja is investigating: Jag har i min ägo en artifakt som ser ut som en svart egyptisk katt som stals från den Hermenautiska Sällskapet. Jag vill ta reda på dess historia och vad dess funktion är. Jag använder min ghoul Eva Lordes aid action och min ritual identify magic för att göra detta\r\n\r\n3. Samuel Lilja is helping their clanmember Faye Morgan with Influence (Steal) on Greg Stone.\r\n\r\n4. Samuel Lilja asked their clanmember Felix Ahlcrona: Vem i domänen skulle kunna såra dig djupast?\r\n\r\n5. Samuel Lilja is helping Faye Morgan with Influence (Steal) on Doug Underhill.\r\n\r\n6. Samuel Lilja is stealing Sverker Olofson in the influence Ockult.\r\n\r\n7. Samuel Lilja is investing in the ghoul Lilja Jr, Ephraim, which is getting Dominate and Investigation.\r\n\r\n8. Samuel Lilja is investing in the ghoul Lilja Jr, Ephraim, which is getting Dominate and Combat.\r\n\r\n9. Samuel Lilja is investing in the ghoul Lilja Jr, Ephraim, which is getting Dominate and Subterfuge.	2017-03-08 14:31:09.143+00	172.17.0.1	t	f	218	1	40
10	439	felicia	email@mail.com		Du måste ha namnet på en hook för att kunna stjäla den.	2017-03-08 15:30:09.254+00	172.17.0.1	t	f	218	1	40
11	409	felicia	email@mail.com		Someone else has stolen Edvin Lundkvist and they got more success than you.	2017-03-08 16:14:33.046+00	172.17.0.1	t	f	218	1	40
12	114	felicia	email@mail.com		Success	2017-03-08 16:47:34.491+00	172.17.0.1	t	f	218	1	40
13	407	felicia	email@mail.com		Success	2017-03-08 16:47:54.781+00	172.17.0.1	t	f	218	1	40
14	139	felicia	email@mail.com		Petra Caspersen becomes dislodged.	2017-03-08 16:48:20.354+00	172.17.0.1	t	f	218	1	40
15	141	felicia	email@mail.com		Success	2017-03-08 16:48:46.018+00	172.17.0.1	t	f	218	1	40
16	113	felicia	email@mail.com		Success	2017-03-08 16:49:09.387+00	172.17.0.1	t	f	218	1	40
17	70	felicia	email@mail.com		Det hade räckt med en sådan här action, det blir samma effekt.	2017-03-08 17:03:52.955+00	172.17.0.1	t	f	218	1	40
18	354	felicia	email@mail.com		Det hade räckt med att göra en sådan här action.	2017-03-08 17:07:43.839+00	172.17.0.1	t	f	218	1	40
19	425	felicia	email@mail.com		Det hade räckt med att göra en sådan här action.	2017-03-08 17:17:24.51+00	172.17.0.1	t	f	218	1	40
20	116	felicia	email@mail.com		Master: Einar Brorsson\r\nContender: Faye Morgan\r\nContender: Zelda Mörck\r\n\r\nHooks:\r\nIvan Kallenberg (Lurker)\r\nInga Fjällström (Master)\r\nKarl Vansten (Contender)\r\nSven-Göran Gelin (Master)	2017-03-08 17:50:03.345+00	172.17.0.1	t	f	218	1	40
21	115	felicia	email@mail.com		Master: Samuel Lilja\r\nContender: Lydia Pauli\r\nContender: Harriet\r\n\r\nSven-Olof Hieta (Lurker)\r\nMarie Gravvold (Lurker)\r\nMartin Oddshammar (Lurker)\r\nKonrad Hult (Master)	2017-03-08 17:52:58.976+00	172.17.0.1	t	f	218	1	40
22	436	felicia	email@mail.com		Master: Einar Brorsson\r\nContender: Faye Morgan\r\nContender: Zelda Mörck\r\n\r\nHooks:\r\nCassandra Kahn (Contender)\r\nGösta Grahn (Lurker)\r\nDoug Underhill (Lurker)	2017-03-08 17:54:39.699+00	172.17.0.1	t	f	218	1	40
23	369	felicia	email@mail.com		Master: Samuel Lilja\r\nContender: Lydia Pauli\r\nContender: Harriet\r\n\r\nSven-Olof Hieta (Lurker)\r\nTod Smith (Lurker)\r\nBang Olauson (Lurker)\r\nKim Strand (Lurker)\r\nNils Cronholm (Lurker)\r\nGabriella Seger (Contender)	2017-03-08 17:57:10.224+00	172.17.0.1	t	f	218	1	40
24	382	felicia	email@mail.com		Master: Samuel Lilja\r\nContender: Primus\r\nContender: Harriet	2017-03-08 17:59:33.148+00	172.17.0.1	t	f	218	1	40
25	393	felicia	email@mail.com		Master: Hans\r\nContender: Thordon\r\nContender: Dante\r\n\r\nMaria Mattisdotter (Lurker)\r\nKatarina Hill (Master)	2017-03-08 18:01:50.483+00	172.17.0.1	t	f	218	1	40
26	394	felicia	email@mail.com		Master: Einar Brorsson\r\nContender: Faye Morgan\r\nContender: Zelda Mörck\r\n\r\nHooks:\r\nSven-Göran Gelin (Master)	2017-03-08 18:03:12.663+00	172.17.0.1	t	f	218	1	40
27	422	felicia	email@mail.com		Master: Hans\r\nContender: Thordon\r\nContender: Dante\r\n\r\nhooks:\r\nNadia Dahlkvist (Contender)\r\nLina Ebbasdotter (Contender)	2017-03-08 18:05:21.783+00	172.17.0.1	t	f	218	1	40
28	423	felicia	email@mail.com		Master: Samuel Lilja\r\nContender: Primus\r\nContender: Harriet\r\n\r\nhooks:\r\nErik Blom (Lurker)	2017-03-08 18:06:17.684+00	172.17.0.1	t	f	218	1	40
29	144	felicia	email@mail.com		Att tappa greppet om verkligen.\r\nBli ett själlöst vrak	2017-03-08 18:42:25.471+00	172.17.0.1	t	f	218	1	40
30	66	Johannes Jörgensen	joergensen.arbete@gmail.com		Erik (Anton M) 3\r\nHur man förför en hamnskiftare: Att förföra en Lo är nästan lönlöst, de hatar dig. Men en björn, eller en haj, å andra sidan. Bästa sättet är att ta vägen om dess mänskliga släktingar, få en bra introduktion, någon/några i dess inre cirkel som kan sälja in dig.	2017-03-08 20:43:08.498+00	172.17.0.1	t	f	218	1	41
31	68	Johannes Jörgensen	joergensen.arbete@gmail.com		Erik (Anton M) 2\r\nMedborgargardet: Alex Waldemarsson är inte chef för någonting, han var ett offer för ett misslyckeát Feeding som flytt. Hans trovärdighet har krossats av en smutskastningskampanj och han betraktas som en galning. Ledaren för medborgargardet heter Magda Wall	2017-03-08 20:44:58.16+00	172.17.0.1	t	f	218	1	41
32	102	Johannes Jörgensen	joergensen.arbete@gmail.com		Crane (Jerome G) 4\r\nSabbat: Dina kontakter ger tre namn. Ulla Wrangel, Vittran och Valentin. Deras mål med intrång i staden är att stjäla resurser för att berika sig själva och förneka camarillan. De har redan fått tag på böcker om Lillith en viss Diakon Olsson tog till staden, men inte allt.	2017-03-08 20:45:53.779+00	172.17.0.1	t	f	218	1	41
33	254	Johannes Jörgensen	joergensen.arbete@gmail.com		Albin Bonde (Martin L) 4\r\nEva: En läkare har undersökt Eva. Hen har noterat spår av avancerade ingrepp som förstärkt hennes kognitiva förmåga med en extrem Magnitud. Hon är nu betydligt intelligentare än människor. Eva tror på ett utomjordiskt ursprung. Hon hävdar att det finns ett implantat i hennes panna  som kan användas att kontakta aliens.	2017-03-08 20:46:46.343+00	172.17.0.1	t	f	218	1	41
34	255	Johannes Jörgensen	joergensen.arbete@gmail.com		Albin Bonde (Martin L) 5 \r\nPresstödet: Hoten om indraget presstöd har via ombud utgått från en chef på skatteverkets administrativa enhet: Henrietta Olander, och det uppenbara syftet är att skrämma publikationer som har kritiserat Olanders närmaste krets, bland annat Ewert Johnsson. Denna grupp kallas “deltagarna”, och även om gruppen är känd inom den statliga byråkratin är ingen intresserad av att peka ut deras medlemmar. En internrevisor på skatteverket tog sitt liv i samband med att försöka utreda Olander.	2017-03-08 20:47:16.712+00	172.17.0.1	t	f	218	1	41
35	472	Johannes Jörgensen	joergensen.arbete@gmail.com		Primus (Tim Olsson) 1\r\nMagikonventet: En Bastet-statyett blev stulen under konventet av Diakon Whinther.	2017-03-08 20:48:13.968+00	172.17.0.1	t	f	218	1	41
36	278	Johannes Jörgensen	joergensen.arbete@gmail.com		Samuel Lilja (Jonas A) 1\r\nDeltagarna: Du hittar ett namn. Henrietta Olander.	2017-03-08 20:49:15.79+00	172.17.0.1	t	f	218	1	41
37	279	Johannes Jörgensen	joergensen.arbete@gmail.com		Samuel Lilja (Jonas A) 2 +Ritual\r\nBastet: Statyetten kan ge dig visioner av allt den har sett sedan du först tog den i din hand. När du sover känner du närvaron av en enorm katt som vill berätta om jaktens skönhet och euforin i att känna små sprattlande ben knäckas i munnen. Om du får tag på en papyrus som är relaterad till statyetten så kan nya större förmågor låsas upp.	2017-03-08 20:49:49.352+00	172.17.0.1	t	f	218	1	41
38	469	Johannes Jörgensen	joergensen.arbete@gmail.com		Zelda Mörck (Matilda Dahl) 4\r\nBoken har legat på Universitetets boklager sedan 1937. Den är riktad mot metoder att binda och betvinga demoner, inte åkalla dem. Boken innehas just nu av Lisa Hiroto.	2017-03-08 20:51:56.809+00	172.17.0.1	t	f	218	1	41
39	466	Johannes Jörgensen	joergensen.arbete@gmail.com		Zelda Mörck (Matilda Dahl) 3\r\nVem är Eli? : Eli Zelic är en ung målare som är en av de bästa människor du kan hitta. Han kan hjälpa dig att bli det med (bättre människa) genom sitt måleri. Hans Tavla är bara speciell för den den föreställer.	2017-03-08 20:52:24.06+00	172.17.0.1	t	f	218	1	41
40	467	Johannes Jörgensen	joergensen.arbete@gmail.com		Zelda Mörck (Matilda Dahl) 3\r\nVem var Frida Wall? : Frieda Wall är en död squatter. Hon växte upp i Malmö, jobbade på ICA i Skavtång under flera år innan hon drog på sig en heroin-vana och föll. Hon hittades med ett märkligt Tarotkort i handen. Ett sigill på kortet ska enligt utsago vara ennyckel för åkallan av en demon. Kortet finns nu i polisens bevislager.	2017-03-08 20:52:50.766+00	172.17.0.1	t	f	218	1	41
41	468	Johannes Jörgensen	joergensen.arbete@gmail.com		Zelda Mörck (Matilda Dahl) 3\r\nWagner och hans Bastet: Carl Wagner är en känd Magiker från England. Han tillber statyetten som en personlig gudinna och kan enligt hans adept uppleva allt statyetten upplever. Den har stor personlig betydelse för honom. Det mesta tyder på att statyetten är betydligt mer än bara en magisk inspelningsapparat dock.	2017-03-08 20:53:17.454+00	172.17.0.1	t	f	218	1	41
42	395	Johannes Jörgensen	joergensen.arbete@gmail.com		Pierre Steen (Tomas K) 4\r\nEva: Gorillan heter Eva. Hon är inte försvunnen utan sitter isolerad på Zooets Laboratorium. Hon Läser allt hon kommer över. Flera andra vampyrer har varit hos henne och hon kan vara delvis blodsbunden. Själv säger hon att hon varit kidnappad av aliens.	2017-03-08 20:54:07.057+00	172.17.0.1	t	f	218	1	41
43	350	Johannes Jörgensen	joergensen.arbete@gmail.com		Faye Morgan (Max Ortman) 7\r\nLisa Hiroto: Hon är journalist vid Västsvenskan. Hon bor i Villakvarteren (letande krävdes; hemlig adress) och lånade för lite mer än en månad sen en icke namngiven bok av okänd författare från tidigt 1600-tal om Demonologi, specifikt fördrivning och kontroll av dessa fenomen. Hon har boken, för det mesta med sig. Hon är hemma de flesta nätter men jobbar ofta sent på redaktionen. Hon lär sig Latin i rasande fart. Hon tycks vara paranoid. Hon använda boken för lite över en månad sedan i ett försök att rädda ett demonbesatt barn. Demonen fördrevs, möjligtvis skadad, men barnet var förvandlat till ett monster och Lisa flydde i panik.	2017-03-08 20:55:03.183+00	172.17.0.1	t	f	218	1	41
44	350	Johannes Jörgensen	joergensen.arbete@gmail.com		Faye Morgan (Max Ortman) 7\r\nDemonen och Boken: Du hittar incidenter som tyder på att demonen varit aktiv i årtionden. Boken har legat på Universitetets boklager sedan 1937. Den är riktad mot metoder att binda och betvinga demoner, inte åkalla dem. Åkallan har att göra med demonens sigill, som företrädelsevis kommer i form av ett kort. Boken innehas just nu av Lisa Hiroto.	2017-03-08 20:55:31.427+00	172.17.0.1	t	f	218	1	41
45	355	Johannes Jörgensen	joergensen.arbete@gmail.com		Faye Morgan (Max Ortman) 7\r\nDemonen och Boken: Du hittar incidenter som tyder på att demonen varit aktiv i årtionden. Boken har legat på Universitetets boklager sedan 1937. Den är riktad mot metoder att binda och betvinga demoner, inte åkalla dem. Åkallan har att göra med demonens sigill, som företrädelsevis kommer i form av ett kort. Boken innehas just nu av Lisa Hiroto.	2017-03-08 20:56:21.803+00	172.17.0.1	t	f	218	1	41
46	383	Johannes Jörgensen	joergensen.arbete@gmail.com		Marion (Angelika N) 6\r\nSabbath i Helsingkrona: Dina kontakter ger tre namn. Ulla Wrangel, Vittran och Valentin. Deras mål med intrång i staden är att stjäla resurser. De har redan stulit ovärderliga dagböcker från en Lillithpräst såväl som andra böcker. De har inget bestämt ställe de hänger men ska ha besökt Orlocks ställe flera gånger.	2017-03-08 20:58:35.768+00	172.17.0.1	t	f	218	1	41
47	371	Johannes Jörgensen	joergensen.arbete@gmail.com		Lydia Pauli (Janni A) 4\r\nSkatteverket Granskar: Ryktet är sant, de ska börja göra detta. Kirsten Mårdh heter den du kan hitta som i grunden ligger bakom initiativet. Hon har annars mest med skolpolitik att göra. Hon umgås mycket med Mark Adolvsson, socialarbetare, och har refererat till de två som “Deltagare”.	2017-03-08 20:59:24.519+00	172.17.0.1	t	f	218	1	41
48	299	Johannes Jörgensen	joergensen.arbete@gmail.com		Diakon Whinther (Sebastian L) 3\r\nDemonen: Du hittar incidenter som tyder på att demonen varit aktiv i årtionden. Åkallan har att göra med demonens sigill som finns på Tarotkort. Boken innehas just nu av Lisa Hiroto.	2017-03-08 21:00:47.127+00	172.17.0.1	t	f	218	1	41
86	759	Felicia Svilling	felicia@svilling.eu		Aliens besätter människor och undersöker vad som är typiskt mänskligt.	2017-04-07 21:13:40.945+00	172.17.0.1	t	f	218	1	40
87	771	Felicia Svilling	felicia@svilling.eu		Diakon Winther skapade Gossip Vampire för att misscreditera Crane.	2017-04-07 21:14:14.711+00	172.17.0.1	t	f	218	1	40
49	244	Johannes Jörgensen	joergensen.arbete@gmail.com		Einar Brorsson (Hannes R) 5\r\nDenne Gangrel heter Lupov. Du spårar honom till en kloak under stadshuset i Borås och fångar honom i armarna på hans älskare Nosferatun Valentin. Du kan utöva dina påtryckningar i vilket fall Lupov lovar att aldrig komma tillbaka till dina jaktmarker. Du har hans telefonnummer och råttorna som följde efter de hem har berättat var i Jönköping de sover om dagarna.	2017-03-08 21:01:32.183+00	172.17.0.1	t	f	218	1	41
50	460	Johannes Jörgensen	joergensen.arbete@gmail.com		Thordon (Dennis L) 4\r\nSpöket på Soptippen: Det är inget spöke. Det är ett barn. Ett Vampyrbarn. det sitter och gråter och ropar på sin mamma. Men när någon försöker hjälpa den så äter den upp den. På sistone har den slutat gråta och man kan höra ljudet av barn som leker.	2017-03-08 21:02:23.228+00	172.17.0.1	t	f	218	1	41
51	279	Jonas Ahlgård	joniebonie9110@hotmail.com		Kom du ihåg min ghouls aid action? 3 i dicepool verkar för lite	2017-03-08 22:28:07.772+00	172.17.0.1	t	f	218	1	64
52	380	felicia	felicia@svilling.eu		Haven: 2 \r\nNo other backgrounds.\r\n0 resource points.	2017-03-09 12:51:18.154+00	172.17.0.1	t	f	218	1	40
53	257	felicia	felicia@svilling.eu		0 rescource points.\r\nHaven: 2 \r\nHerd: 0\r\nNo weapon \r\nNo other resources.	2017-03-09 12:53:15.075+00	172.17.0.1	t	f	218	1	40
54	256	felicia	felicia@svilling.eu		Lurker: Politik\r\nLurker: Kyrkan	2017-03-09 13:04:43.071+00	172.17.0.1	t	f	218	1	40
55	421	felicia	felicia@svilling.eu		Hooks:\r\nBeatrice Eldh (Universitetet)\r\nSamuel Lilja has no hooks in Kyrkan\r\nGösta Grahn (Ockult)	2017-03-09 13:08:01.658+00	172.17.0.1	t	f	218	1	40
56	392	felicia	felicia@svilling.eu		Lurker: Politik\r\nLurker: Kyrkan	2017-03-09 13:11:09.043+00	172.17.0.1	t	f	218	1	40
57	434	felicia	felicia@svilling.eu		Edith Nordek (Politik)\r\nVirginia Varg (Politik)	2017-03-09 13:12:53.759+00	172.17.0.1	t	f	218	1	40
58	370	felicia	felicia@svilling.eu		Nils Cronholm (Media)\r\nSverker Olofson (Ockult)\r\nErik Blom (Universitet)\r\nKertin Bergenfeldt (Konst och Underhållning)\r\nMaster och Contender nivåer:\r\nMaster: Ockult	2017-03-09 13:17:13.356+00	172.17.0.1	t	f	218	1	40
59	471	felicia	felicia@svilling.eu		Jan Book (Kyrkan)	2017-03-09 13:18:10.11+00	172.17.0.1	t	f	218	1	40
60	282	felicia	felicia@svilling.eu		Felix Ahlcrona är död.	2017-03-09 13:19:21.565+00	172.17.0.1	t	f	218	1	40
61	4	Johannes Jörgensen	joergensen.arbete@gmail.com		Filch: 2 incidenter (två olika)\r\n[En fågelskådare i skogsområdet säger att han har fotograferat en svartklädd gestalt som sitter böjd över en joggare]\r\n[En pensionär har hittats utslagen över sin rullator i skogsområdet med akut blodbrist. Hon är intagen på sjukhuset och medicinsk utredning kommer att inledas strax.]	2017-03-09 17:04:51.678+00	172.17.0.1	t	f	251	1	41
62	7	Johannes Jörgensen	joergensen.arbete@gmail.com		Erik: 1 incident\r\n[Herren ger och herren tar. En av Leo Rasks ynglingar eskorterade mig hem från festen i församlingshemmet i lördags. Plötsligt böjde han sig över min axel som om han tänkte bita mig, men istället spydde han över hela min kappa och sprang sin väg! Kappan är alldeles blodig. Den hänger i hallen. Jag funderar på att gå till polisen. Eller åtminstone fråga herr Rask vad det är för folk han har!]	2017-03-09 17:05:40.471+00	172.17.0.1	t	f	251	1	41
63	18	Johannes Jörgensen	joergensen.arbete@gmail.com		Albin Bonde: 1 incident\r\n[Goddag Herr Bonde! Jag ringer från Etiska Nämnden. Jag har fått det här telefonnumret från en före detta försöksperson hos er. Vad är det för experiment ni gör egentligen?]	2017-03-09 17:07:00.357+00	172.17.0.1	t	f	251	1	41
64	35	Johannes Jörgensen	joergensen.arbete@gmail.com		Pierre Steen: 1 incident\r\n[Han sa att Han var tvungen att dricka mitt blod för att kontakta min inre best och kunna exorcera mina drifter. Men det funkade inte, han bara sög och stack. Som en Vampyr! Stina Svensson berättade det på syjuntan i söndags.]	2017-03-09 17:08:24.44+00	172.17.0.1	t	f	251	1	41
65	7	Johannes Jörgensen	joergensen.arbete@gmail.com		[disregard incident] Den här incidenten kom ut av misstag pga en felangiven domän. Incidenten hände aldrig. Ursäkta.	2017-03-10 23:10:19.879+00	172.17.0.1	t	f	251	1	41
66	18	Johannes Jörgensen	joergensen.arbete@gmail.com		[disregard incident] Den här incidenten kom ut av misstag pga en felangiven domän. Incidenten hände aldrig. Ursäkta.	2017-03-10 23:10:58.057+00	172.17.0.1	t	f	251	1	41
67	785	Sara Magnusson	srmgnssn@gmail.com		Erbjuder blod om han vill	2017-04-04 14:19:00.685+00	172.17.0.1	t	f	218	1	58
68	458	Dennis Lindberg	dennis.lindberg93@gmail.com		Investigate action nr 1.	2017-04-05 20:17:58.996+00	172.17.0.1	t	f	218	1	43
69	460	Dennis Lindberg	dennis.lindberg93@gmail.com		Jag vill ta med henne till min sire och fråga vad vi ska göra för med henne.	2017-04-05 20:27:09.193+00	172.17.0.1	t	f	218	1	43
70	585	Felicia Svilling	felicia@svilling.eu		Lydia Pauli är inte en medlem i din klan, så du kan inte fråga henne.	2017-04-07 11:03:46.129+00	172.17.0.1	t	f	218	1	40
71	707	Felicia Svilling	felicia@svilling.eu		Being rejected by my sier/senpi	2017-04-07 11:04:21.635+00	172.17.0.1	t	f	218	1	40
72	706	Felicia Svilling	felicia@svilling.eu		Winther vill inte svara på den frågan och blir istället skyldig dig en liten gäld.	2017-04-07 11:32:38.646+00	172.17.0.1	t	f	218	1	40
73	646	Felicia Svilling	felicia@svilling.eu		Winther vill inte svara på den frågan utan blir istället skyldig dig en enkel gäld.	2017-04-07 11:33:53.334+00	172.17.0.1	t	f	218	1	40
74	802	Felicia Svilling	felicia@svilling.eu		hamnbytare eller sabbaten, osäker på vilken jag tycker kan vara största hotet dock	2017-04-07 13:31:16.191+00	172.17.0.1	t	f	218	1	40
75	704	Felicia Svilling	felicia@svilling.eu		You succed, but there is no space available above you in Universitet, so the hook becomes dislodged.	2017-04-07 17:11:02.08+00	172.17.0.1	t	f	218	1	40
76	611	Felicia Svilling	felicia@svilling.eu		Succes	2017-04-07 17:11:28.812+00	172.17.0.1	t	f	218	1	40
77	717	Felicia Svilling	felicia@svilling.eu		Success!	2017-04-07 17:12:09.786+00	172.17.0.1	t	f	218	1	40
78	747	Felicia Svilling	felicia@svilling.eu		Success!	2017-04-07 17:12:30.019+00	172.17.0.1	t	f	218	1	40
79	628	Felicia Svilling	felicia@svilling.eu		Success!	2017-04-07 17:12:44.101+00	172.17.0.1	t	f	218	1	40
80	629	Felicia Svilling	felicia@svilling.eu		Success!	2017-04-07 17:12:59.08+00	172.17.0.1	t	f	218	1	40
81	705	Felicia Svilling	felicia@svilling.eu		Att bli diableriserad av mina childs	2017-04-07 20:01:28.619+00	172.17.0.1	t	f	218	1	40
82	732	Felicia Svilling	felicia@svilling.eu		Ulla Wrangel har köpt upp gamla etnologen.\r\nValentin har fått tag på en lilith dyrkares dagbok.	2017-04-07 21:12:01.127+00	172.17.0.1	t	f	218	1	40
83	733	Felicia Svilling	felicia@svilling.eu		För att stalka Harriet så bör du göra en investigate character downtime action. För att finna hennes haven måste du göra en investigate charater resources.	2017-04-07 21:12:28.866+00	172.17.0.1	t	f	218	1	40
84	594	Felicia Svilling	felicia@svilling.eu		Adam Vinslätt, 6 år, blev förvandlad till en vampyr av demonen Svarte.\r\nAdam omfamnade Elma Berthelot.\r\nAdam hade presence 5\r\nBåda är nu döda.	2017-04-07 21:12:51.306+00	172.17.0.1	t	f	218	1	40
85	596	Felicia Svilling	felicia@svilling.eu		Det finns ett tarot kort som kan användas för att åkalla demonen Svarte.\r\nWrangels Biokemiska Institut har en hand från en varhaj.	2017-04-07 21:13:21.354+00	172.17.0.1	t	f	218	1	40
88	662	Felicia Svilling	felicia@svilling.eu		En Tremere skulle nog kunna skapa ett magiskt vapen.	2017-04-07 21:14:38.146+00	172.17.0.1	t	f	218	1	40
89	813	Felicia Svilling	felicia@svilling.eu		Den startades av Leo Rask som oroade sig över alla överfall i staden.\r\nLeo Rask är numera fullt medveten om vampyrers existens, och har organiserat anfal på flera i staden.\r\nGrann-organisationen är numera allierad med St Annas Kyrka.\r\nFader Elias i St Annas församling har true faith.	2017-04-07 21:15:05.474+00	172.17.0.1	t	f	218	1	40
90	815	Felicia Svilling	felicia@svilling.eu		Demoner i helsingkrona:\r\nNysrog, även kallad Svarte kan åkallas med ett tarot kort.\r\nHismael agerar online under nicket UserRed.\r\nHismael har en deal med Henrietta Olander på skatteverket.\r\nFörövrigt beskriver din bok hur man kan exorsera demoner.	2017-04-07 21:15:31.499+00	172.17.0.1	t	f	218	1	40
91	848	Felicia Svilling	felicia@svilling.eu		Lydia Pauli. Hon bjud hem fulla ungdomsgäng på "efterfest", men raderade sedan deras minnen med dominate. Hon drack ganska mycket blod.	2017-04-07 21:15:53.556+00	172.17.0.1	t	f	218	1	40
92	849	Felicia Svilling	felicia@svilling.eu		En man gick runt och lärde folk krafter genom att utsätta dem för smärta.\r\nHan hette Ash Wolf och var någon slags magiker tillhörande en grupp kallad Red Thorn Dedicants. \r\nHan berättade att Lilith skapat både vampyrer, hamnskiftare och magiker.\r\n(Klubben hette Laretz)	2017-04-07 21:16:27.057+00	172.17.0.1	t	f	218	1	40
93	580	Felicia Svilling	felicia@svilling.eu		Success! Edith Nordek har blivit driven till vansinne. Hon kan inte sluta prata om att alla runt henne är döda och håller på att rutna. Du förlorar ne humanity för att ha förstört en människas liv.	2017-04-07 21:18:09.503+00	172.17.0.1	t	f	218	1	40
94	644	Felicia Svilling	felicia@svilling.eu		success!	2017-04-07 21:19:05.03+00	172.17.0.1	t	f	218	1	40
95	659	Felicia Svilling	felicia@svilling.eu		Success! Din hook heter Nathanael Augustsson.	2017-04-07 21:20:30.458+00	172.17.0.1	t	f	218	1	40
96	715	Felicia Svilling	felicia@svilling.eu		success!	2017-04-07 21:20:46.172+00	172.17.0.1	t	f	218	1	40
97	716	Felicia Svilling	felicia@svilling.eu		Minst fem spelare måste skapa polis hooks för att det ska finnas någon contender i området.	2017-04-07 21:21:23.136+00	172.17.0.1	t	f	218	1	40
98	1122	Max Ortman	phyrean@gmail.com		Have received blood for this 3 times.	2017-05-15 22:38:07.056+00	172.17.0.1	t	f	218	1	53
99	1123	Max Ortman	phyrean@gmail.com		Should be receiving mentoring. Have received blood	2017-05-15 22:39:04.421+00	172.17.0.1	t	f	218	1	53
100	1097	Felicia Svilling	felicia@svilling.eu		Att bli en obstinat byrokrat eller gammaldags som einar och tappa greppet om verkligheten och gå runt utan skor.	2017-05-19 14:30:58.362+00	172.17.0.1	t	f	218	1	40
101	1098	Felicia Svilling	felicia@svilling.eu		Att "dö" den slutgiltiga döden	2017-05-19 15:46:41.199+00	172.17.0.1	t	f	218	1	40
102	1167	Felicia Svilling	felicia@svilling.eu		nej	2017-05-19 16:05:28.076+00	172.17.0.1	t	f	218	1	40
103	1185	Felicia Svilling	felicia@svilling.eu		Yes. sire!	2017-05-19 16:07:30.985+00	172.17.0.1	t	f	218	1	40
104	1095	Felicia Svilling	felicia@svilling.eu		Så länge det redan finns en master så kan du bara bli ny master om den gammla mastern blir av med en hook.	2017-05-19 16:55:20.737+00	172.17.0.1	t	f	218	1	40
105	1118	Johannes Jörgensen	joergensen.arbete@gmail.com		Svar: Du behöver hans kort för det. Kortet har synts i polisen Mia Löfgrens ägo. Hon tycks gömma sig för tillfället, är visst rädd för att någon hon utrett/utreder ska mörda henne. Baserat på var hon har rört sig tidigare så tror du att hon finns i Ljunghagen.	2017-05-19 18:16:01.21+00	172.17.0.1	t	f	218	1	41
106	1199	Johannes Jörgensen	joergensen.arbete@gmail.com		Svar: En spelarkaraktär är inte ett fenomen, du kan inte använda den här action till detta.	2017-05-19 18:18:40.041+00	172.17.0.1	t	f	218	1	41
107	1079	Johannes Jörgensen	joergensen.arbete@gmail.com		Det är vanligt som en del av Helsingkronas nyanattklubbssväng och kunde vara ett bra sätt att Jaga. Sexmagiker som Ordo Templis Orientis är kända för att ägna sig åt det i sina ritualer.	2017-05-19 18:20:37.412+00	172.17.0.1	t	f	218	1	41
108	863	Johannes Jörgensen	joergensen.arbete@gmail.com		Svar: Det finns många myter; en svart kittel i den tidiga medeltidens Glastonbury, en källa som kunde klä en vampyr i levande kött för en dag i Mexico innan spanjorernas ankomst. Men det är föga mer än myter. Två vägar verkar mer givande: Antingen gå vägen via den mytiska Golconda, det finns viskningar om en man i Dalhem som kan veta mer. Eller så byter man kropp med någon dödlig, det sägs att det har hänt ibland.	2017-05-19 18:22:12.076+00	172.17.0.1	t	f	218	1	41
109	957	Johannes Jörgensen	joergensen.arbete@gmail.com		Svar: Den döde Stockholmaren var en politisk kontakt Lydia Pauli försökt odla i Stockholm i ett försök att etablera ett nät av Hooks i staden och ta över den istället för exil-camarillan i Uppsala. Huvudet var en varning från nämnda uppsalabor att de visste vad hon höll på med och ett försök att skrämma bort henne.	2017-05-19 18:24:46.508+00	172.17.0.1	t	f	218	1	41
110	1066	Johannes Jörgensen	joergensen.arbete@gmail.com		Aliens har inte tycks intresserade av sex med varandra i syfte att föröka sig. Allt du hittar antyder att de är mer intresserade av människors sexualitet, men förstår den inte riktigt (vilket förmodligen driver på intresset).	2017-05-19 18:26:37.11+00	172.17.0.1	t	f	218	1	41
111	1077	Johannes Jörgensen	joergensen.arbete@gmail.com		Svar: Einars skog, Varbyskogen, är extremt väl bevakad, dels av Einar, dels av hans djur. En sabbathmedlem blev för några månader sedan fångad här av Einar som dock släppte den igen. För någon månad sedan grävde Einar ner ett stort byllte i skogen.	2017-05-19 18:27:44.589+00	172.17.0.1	t	f	218	1	41
112	1120	Johannes Jörgensen	joergensen.arbete@gmail.com		Svar: Lillith är vampyrernas moder (enligt många myter), hon var den första kvinnan, gjorde uppror mot JHVH, åt av både kunskapens och livets träd och blev hans jämbördige. Dumpade honom och stack. Hon vägrade vika sig och led för det, men i lidandet fann hon styrka, sanning, mening och frihet. Skapade en egen trädgård och tog Lucifer som älskare. Hon finns närvarande varje gång någon krossar sina bojor och väljer smärta och frihet framför liknöjdhet och rädsla.	2017-05-19 18:28:43.788+00	172.17.0.1	t	f	218	1	41
113	1197	Johannes Jörgensen	joergensen.arbete@gmail.com		Svar: Sorry, du kan inte ställa fråor om spelarkaraktärer via den actionen.	2017-05-19 18:30:14.151+00	172.17.0.1	t	f	218	1	41
114	1121	Johannes Jörgensen	joergensen.arbete@gmail.com		Svar: Tyrfing är ett mytiskt magiskt svärd som krävde ett liv varje gång den drogs. Den ska ha en koppling till Varbyskogens stenring, men exakt vad det är för koppling behöver man hjälp av en Varbjörn för att lösa.	2017-05-19 18:30:59.22+00	172.17.0.1	t	f	218	1	41
115	1151	Johannes Jörgensen	joergensen.arbete@gmail.com		Svar: Tessan ledde en liga som specialiserade sig på kidnappning av rika personer. För någon månad sedan råkade de kidnappa Lydia Pauli’s make Nicolaus Pauli, som dock räddades av Faye Morgan. Delar av gänget är troligtvis döda, medan resten ligger extremt lågt. Troligtvis nere i södra Europa. De är dock duktiga och kan nås via tessan@removals.com.	2017-05-19 18:31:52.473+00	172.17.0.1	t	f	218	1	41
116	900	Johannes Jörgensen	joergensen.arbete@gmail.com		Om Alien Mating: Svar: Aliens har inte tyckts vara intresserade av sex med varandra i syfte att föröka sig. Allt du hittar antyder att de är mer intresserade av människors sexualitet, men förstår den inte riktigt (vilket förmodligen driver på intresset). De Två som tycks vara aktiva i Helsingkrona skulle förmodligen bägge kunna intresseras för ämnet, men deras experiment skulle vara väldigt olika. Den ene är extremt sadistisk, den andra mest intresserad av hur människor beter sig i udda situationer.	2017-05-19 18:33:59.221+00	172.17.0.1	t	f	218	1	41
117	902	Johannes Jörgensen	joergensen.arbete@gmail.com		Henrietta Olander, Revisorn, Skatteverket, Mark Adolvsson, Socialarbetare, och \r\nEwert Johnsson, Statsplanerare på Svenska institutet, Dessa tre träffas ofta privat och verkar ha något fuffens för sig.	2017-05-19 18:39:05.529+00	172.17.0.1	t	f	218	1	41
118	86	Johannes Jörgensen	joergensen.arbete@gmail.com		[När du snirklat dig in med din lögn om att vara detektiv hos Agda Hansson visar det sig att Agda är nervig över att hon odlar Marijuana i en garderob. Hon attackerar dig med en kolsyrebrandsläckare, när UVlampan får din hy att bete sig konstigt,  får syn på dina huggtänder och försöker fly. Dödar du henne och förlorar eventuellt humanity  eller tar du risken för maskeradbrott?]	2017-05-19 18:56:14.597+00	172.17.0.1	t	f	251	1	41
119	97	Johannes Jörgensen	joergensen.arbete@gmail.com		2 incidenter:\r\n1 : [Joggaren i spåret du smugit dig upp på har en kompis som kommer upp bakifrån. Hen fotograferar dig i full färd att äta. Dödar du dem bägge  och förlorar eventuellt humanity  eller tar du risken för maskeradbrott?]\r\n2: [En äldre dam kommer på dig när du tvättar bort blodet du är täckt i på en offentlig toalett. Röjer du undan henne eller låter du henne löpa med sin historia, dvs förlorar eventuellt humanity  eller tar risken för maskeradbrott?]	2017-05-19 19:06:40.11+00	172.17.0.1	t	f	251	1	41
\.


--
-- Name: django_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('django_comments_id_seq', 119, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY django_content_type (id, app_label, model) FROM stdin;
179	admin	logentry
180	auth	permission
181	auth	group
182	auth	user
183	contenttypes	contenttype
184	sessions	session
185	sites	site
186	django_comments	comment
187	django_comments	commentflag
188	players	actiontype
189	players	actionoption
190	players	influence
191	players	population
192	players	elderpower
193	players	discipline
194	players	disciplinerating
195	players	expdisciplinespending
196	players	attribute
197	players	attributerating
198	players	expattributespending
199	players	specialization
200	players	weapon
201	players	title
202	players	age
203	players	clan
204	players	politicalfaction
205	players	canonfact
206	players	nature
207	players	relationship
208	players	ritual
209	players	ritualrating
210	players	hook
211	players	boon
212	players	equipment
213	players	ghoul
214	players	domain
215	players	character
216	players	influencerating
217	players	session
218	players	action
219	players	aidaction
220	players	primogensaidaction
221	players	ghoulaidaction
222	players	conserveinfluence
223	players	conservedomain
224	players	losthook
225	players	influencesteal
226	players	influencedestroy
227	players	investigatecharacterinfluence
228	players	investigatecharacterresources
229	players	investigatecharacterdowntimeactions
230	players	investigatecounterspionage
231	players	investigatephenomenon
232	players	investigateinfluence
233	players	learnattribute
234	players	learndiscipline
235	players	learnspecialization
236	players	investghoul
237	players	investequipment
238	players	investweapon
239	players	investherd
240	players	investhaven
241	players	mentorattribute
242	players	mentordiscipline
243	players	mentorspecialization
244	players	rest
245	players	neglectdomain
246	players	patroldomain
247	players	keepersquestion
248	players	primogensquestion
249	players	eventreport
250	players	healingreport
251	players	feeding
252	players	activedisciplines
253	players	rumor
254	players	aspect
255	players	ghouldisciplinerating
256	players	season
257	players	goal
258	players	changegoal
259	players	advantage
260	players	advantagerating
261	players	learnadvantage
262	players	expadvantagespending
263	players	pronoun
264	players	assignxp
265	players	statusassignment
266	players	influencewant
267	players	place
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('django_content_type_id_seq', 267, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-08-11 15:10:27.849111+00
2	auth	0001_initial	2017-08-11 15:10:28.126203+00
3	admin	0001_initial	2017-08-11 15:10:28.198434+00
4	admin	0002_logentry_remove_auto_add	2017-08-11 15:10:28.240539+00
5	contenttypes	0002_remove_content_type_name	2017-08-11 15:10:28.359963+00
6	auth	0002_alter_permission_name_max_length	2017-08-11 15:10:28.398891+00
7	auth	0003_alter_user_email_max_length	2017-08-11 15:10:28.436751+00
8	auth	0004_alter_user_username_opts	2017-08-11 15:10:28.467403+00
9	auth	0005_alter_user_last_login_null	2017-08-11 15:10:28.510707+00
10	auth	0006_require_contenttypes_0002	2017-08-11 15:10:28.521758+00
11	auth	0007_alter_validators_add_error_messages	2017-08-11 15:10:28.55593+00
12	sites	0001_initial	2017-08-11 15:10:28.577363+00
13	django_comments	0001_initial	2017-08-11 15:10:28.75748+00
14	django_comments	0002_update_user_email_field_length	2017-08-11 15:10:28.814+00
15	players	0001_initial	2017-08-11 15:10:51.88714+00
16	players	0002_character_max_willpower	2017-08-11 15:10:52.196073+00
17	players	0003_hook_concept	2017-08-11 15:10:52.596109+00
18	players	0004_auto_20170315_1226	2017-08-11 15:10:55.044031+00
19	players	0005_auto_20170315_1227	2017-08-11 15:10:55.935989+00
20	players	0006_auto_20170315_1232	2017-08-11 15:10:56.737931+00
21	players	0007_character_willpower	2017-08-11 15:10:57.003313+00
22	players	0008_auto_20170315_1255	2017-08-11 15:10:58.674142+00
23	players	0009_auto_20170319_1413	2017-08-11 15:10:59.064714+00
24	players	0010_auto_20170320_1653	2017-08-11 15:10:59.776624+00
25	players	0011_auto_20170320_1655	2017-08-11 15:11:00.100582+00
26	players	0012_auto_20170320_1702	2017-08-11 15:11:01.366686+00
27	players	0013_eventreport_resources	2017-08-11 15:11:01.616577+00
28	players	0014_auto_20170320_1758	2017-08-11 15:11:02.196709+00
29	players	0015_actiontype_no_roll	2017-08-11 15:11:02.443322+00
30	players	0016_actiontype_aid_action	2017-08-11 15:11:02.669318+00
31	players	0017_remove_character_health	2017-08-11 15:11:02.917455+00
32	players	0018_expdisciplinespending	2017-08-11 15:11:03.180769+00
33	players	0019_auto_20170321_1716	2017-08-11 15:11:04.677685+00
34	players	0020_expattributespending	2017-08-11 15:11:05.119752+00
35	players	0021_auto_20170322_1753	2017-08-11 15:11:06.663736+00
36	players	0022_auto_20170329_0900	2017-08-11 15:11:07.166846+00
37	players	0023_action_result	2017-08-11 15:11:07.700465+00
38	players	0024_auto_20170331_1601	2017-08-11 15:11:08.469372+00
39	players	0025_session_previous	2017-08-11 15:11:08.915374+00
40	players	0026_auto_20170406_1638	2017-08-11 15:11:09.317689+00
41	players	0027_auto_20170725_2101	2017-08-11 15:11:14.838823+00
42	players	0028_auto_20170726_1044	2017-08-11 15:11:15.977626+00
43	players	0029_auto_20170726_1054	2017-08-11 15:11:16.984749+00
44	players	0030_auto_20170726_1147	2017-08-11 15:11:17.877401+00
45	players	0031_session_season	2017-08-11 15:11:18.344314+00
46	players	0032_auto_20170801_1821	2017-08-11 15:11:19.573677+00
47	players	0033_auto_20170801_1827	2017-08-11 15:11:20.067199+00
48	players	0034_auto_20170801_1834	2017-08-11 15:11:22.0356+00
49	players	0035_auto_20170801_1837	2017-08-11 15:11:22.673496+00
50	players	0036_remove_character_demeanor	2017-08-11 15:11:22.95957+00
51	players	0037_auto_20170801_1904	2017-08-11 15:11:23.417201+00
52	players	0038_auto_20170801_1910	2017-08-11 15:11:24.590938+00
53	players	0039_auto_20170801_1939	2017-08-11 15:11:29.424927+00
54	players	0040_auto_20170801_2238	2017-08-11 15:11:30.397947+00
55	players	0041_auto_20170801_2243	2017-08-11 15:11:31.392061+00
56	players	0042_auto_20170801_2315	2017-08-11 15:11:31.759011+00
57	players	0043_advantage_advantagerating_learnadvantage	2017-08-11 15:11:32.681054+00
58	players	0044_auto_20170802_0023	2017-08-11 15:11:33.571377+00
59	players	0045_auto_20170802_0031	2017-08-11 15:11:36.968543+00
60	players	0046_auto_20170802_0031	2017-08-11 15:11:37.234612+00
61	players	0047_expadvantagespending	2017-08-11 15:11:37.79032+00
62	players	0048_remove_character_max_willpower	2017-08-11 15:11:38.090426+00
63	players	0049_remove_character_humanity	2017-08-11 15:11:38.519264+00
64	players	0050_goal_label	2017-08-11 15:11:38.916314+00
65	players	0051_remove_goal_label	2017-08-11 15:11:39.317536+00
66	players	0052_auto_20170804_0042	2017-08-11 15:11:39.913501+00
67	players	0053_character_pronoun	2017-08-11 15:11:40.261092+00
68	players	0054_auto_20170804_0100	2017-08-11 15:11:40.768789+00
69	players	0055_auto_20170804_0110	2017-08-11 15:11:41.082688+00
70	players	0056_auto_20170804_0119	2017-08-11 15:11:41.350864+00
71	players	0057_auto_20170804_1343	2017-08-11 15:11:43.27739+00
72	players	0058_auto_20170805_1740	2017-08-11 15:11:44.279854+00
73	players	0059_auto_20170805_1746	2017-08-11 15:11:45.150391+00
74	players	0060_influencewant_master	2017-08-11 15:11:45.519156+00
75	players	0061_remove_influencewant_master	2017-08-11 15:11:46.134728+00
76	players	0062_auto_20170805_1757	2017-08-11 15:11:46.613238+00
77	players	0063_influencewant_elder	2017-08-11 15:11:46.938376+00
78	players	0064_auto_20170806_1340	2017-08-11 15:11:47.720325+00
79	players	0065_domain_allowed	2017-08-11 15:11:48.237811+00
80	players	0066_remove_feeding_has_permission	2017-08-11 15:11:48.730246+00
81	players	0067_auto_20170808_2143	2017-08-11 15:11:49.13644+00
82	players	0068_season_is_open	2017-08-11 15:11:49.852466+00
83	players	0069_auto_20170809_2042	2017-08-11 15:11:51.690351+00
84	players	0070_auto_20170809_2050	2017-08-11 15:11:52.305887+00
85	players	0071_auto_20170809_2118	2017-08-11 15:11:52.742134+00
86	players	0072_auto_20170810_1426	2017-08-11 15:11:53.844291+00
87	sessions	0001_initial	2017-08-11 15:11:53.924431+00
88	sites	0002_alter_domain_unique	2017-08-11 15:11:54.2781+00
89	players	0073_remove_character_picture	2017-08-16 17:07:40.491282+00
90	players	0074_auto_20170821_1648	2017-08-21 16:49:15.832683+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('django_migrations_id_seq', 90, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
0t6g10ogcip3xt4xmo4hy44t4azpjnu0	NmUwYTViYmUzMzAxZDI4NWU0MTE3ODQ5Y2ZjYjI4YTExN2NkZTIyYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhOTg0ODg4NDY5MzA2YmZlZmQ3MDY1Yjg0OGE3YTQ1NmM5NGU2YTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2017-08-16 16:22:15.659+00
drylhqan9bm0vcwx83oiru5tq5l727r2	M2NlN2ViZGI1MzQ3ZGEwM2M3MzEyYTRkZTkyNjliMmEzZmIwYjJhMjp7Il9hdXRoX3VzZXJfaWQiOiIzOCIsIndpemFyZF9zdWJtaXRfd2l6YXJkIjp7InN0ZXBfZmlsZXMiOnt9LCJzdGVwIjpudWxsLCJzdGVwX2RhdGEiOnt9LCJleHRyYV9kYXRhIjp7fX0sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwid2l6YXJkX2FjdGlvbl93aXphcmQiOnsic3RlcF9maWxlcyI6e30sInN0ZXAiOm51bGwsInN0ZXBfZGF0YSI6e30sImV4dHJhX2RhdGEiOnt9fSwiX2F1dGhfdXNlcl9oYXNoIjoiZWRkZDgyMmU2ZGIyZmI1MTM0ODBlODg3N2FhOTA5MjhiMGYzYjljNSJ9	2017-08-16 01:46:36.207+00
i6v8annpm2nn2xpqadg6jtno00g6w0fy	ZmRmZmNkN2RiODRkM2ZlODk3MTJjYTZiYjAyMDIxMDYzYzAzN2YyYzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYTk4NDg4ODQ2OTMwNmJmZWZkNzA2NWI4NDhhN2E0NTZjOTRlNmE5In0=	2017-08-08 21:01:58.165+00
j7mtofx6vhtr2yvc0h7ekq0p6scjs90q	ZTE3MjJjNjQzMDg2MmZlZDk2N2QzM2NlMTdmZDU0MmQ2Mjc4MDI0Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhOTg0ODg4NDY5MzA2YmZlZmQ3MDY1Yjg0OGE3YTQ1NmM5NGU2YTkiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-07-06 18:43:27.136+00
uni37b2ooo63nur8oiqma2dhqjyby0q4	NmUwYTViYmUzMzAxZDI4NWU0MTE3ODQ5Y2ZjYjI4YTExN2NkZTIyYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhOTg0ODg4NDY5MzA2YmZlZmQ3MDY1Yjg0OGE3YTQ1NmM5NGU2YTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2017-06-13 11:05:40.044+00
zi85ykncnv3s6y5zxp1bt90dusu28idk	NWU2MzNjZjRhNjQ4YTBlMjQxMDliOWVjN2ZmODNkOTViMTY2MjA5Yjp7IndpemFyZF9zdWJtaXRfd2l6YXJkIjp7ImV4dHJhX2RhdGEiOnt9LCJzdGVwX2RhdGEiOnt9LCJzdGVwIjpudWxsLCJzdGVwX2ZpbGVzIjp7fX0sIl9hdXRoX3VzZXJfaGFzaCI6Ijc0NjI0YzAzMzI4OGU4ZTZjOWExMGQ0MGM1ZTcyYWNiMzk0MTExMzYiLCJ3aXphcmRfYWN0aW9uX3dpemFyZCI6eyJleHRyYV9kYXRhIjp7fSwic3RlcF9kYXRhIjp7fSwic3RlcCI6bnVsbCwic3RlcF9maWxlcyI6e319LCJfYXV0aF91c2VyX2lkIjoiMTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2017-08-24 19:07:35.82+00
rdf77s10hae0rttgol0rp9jar8ov4ncl	MTY0NzMwYTFhNjEyZTkzOGQ3Zjk2OGVlMDFiZjNhYTU1OTY4N2Y5ZTp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfaGFzaCI6IjJhOTg0ODg4NDY5MzA2YmZlZmQ3MDY1Yjg0OGE3YTQ1NmM5NGU2YTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2017-09-02 13:59:46.789439+00
po1fjd6btsmruw14j272p4i4uyoghitf	MjIxYTg5Y2YwYjkwOWJlMTJhMDhhODNjMGM0MzEzMDdmNjg2ZDk4Yzp7Il9hdXRoX3VzZXJfaWQiOiI3NiIsIl9hdXRoX3VzZXJfaGFzaCI6ImVkZGQ4MjJlNmRiMmZiNTEzNDgwZTg4NzdhYTkwOTI4YjBmM2I5YzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2017-09-04 16:10:31.905349+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: players_action; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_action (id, willpower, description, resolved, action_type_id, character_id, session_id, result) FROM stdin;
\.


--
-- Name: players_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_action_id_seq', 1, false);


--
-- Data for Name: players_actionoption; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_actionoption (id, count, name) FROM stdin;
1	4	Any Action
2	1	Mentor / Invest / Learn
3	1	Mentor
4	1	Influence Steal
5	1	Invest / Learn
6	1	Conserve (Influence)
7	1	Aid Action
8	1	Patrol (Domain)
9	1	Neglect (Domain)
10	1	Investigate
11	3	Question (Keeper)
12	1	Question (Primogen)
13	1	Aid Action (Primogen)
14	1	Aid Action
15	2	Investigate
16	2	Aid Action
17	1	Aid Action (Ghoul)
18	1	Assign (XP)
\.


--
-- Data for Name: players_actionoption_action_types; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_actionoption_action_types (id, actionoption_id, actiontype_id) FROM stdin;
217	1	1
218	1	2
219	1	3
220	1	5
221	1	6
222	1	7
223	1	8
224	1	9
225	1	10
226	1	11
227	1	12
228	1	16
229	1	22
230	1	23
231	1	24
232	1	25
233	1	26
234	1	27
235	1	28
236	1	29
237	1	30
238	1	31
239	1	32
240	1	34
241	2	32
242	2	34
243	2	22
244	2	23
245	2	24
246	2	25
247	2	26
248	2	27
249	2	28
250	2	29
251	2	30
252	2	31
253	3	32
254	3	30
255	3	31
256	4	5
257	5	34
258	5	22
259	5	23
260	5	24
261	5	25
262	5	26
263	5	27
264	5	28
265	5	29
266	6	2
267	7	1
268	8	17
269	9	18
270	10	7
271	10	8
272	10	9
273	10	10
274	10	11
275	10	12
276	11	19
277	12	21
278	13	20
279	14	1
280	15	7
281	15	8
282	15	9
283	15	10
284	15	11
285	15	12
286	16	1
287	17	33
288	18	35
\.


--
-- Name: players_actionoption_action_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_actionoption_action_types_id_seq', 288, true);


--
-- Name: players_actionoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_actionoption_id_seq', 18, true);


--
-- Data for Name: players_actiontype; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_actiontype (id, name, template, no_roll, aid_action) FROM stdin;
1	Aid Action	**Slag:** Varierar\r\n\r\nDu hjälper/eller stjälper en annan karaktär. Du skickar in en Aid Action-handling och anger en handling som en annan karaktär tänker genomföra och om du vill hjälpa eller stjälpa. Om de har skickat in handlingen som du anger så får de välja om de vill motta din Aid Action. De från INTE veta om du kommer hjälpa eller stjälpa (du får givetvis påstå vad du vill). Om de vill ta emot din hjälp slår du samma slag som de gör och lägger till/drar ifrån dina lyckade till deras. Den du hjälper är dock den som får effekten av en lyckad handling. Om handlingen du hjälper innebär en risk så kan den drabba även dig.	f	t
2	Conserve (Influence)	**Slag:**\r\n\r\n- **SKYDDA DOMÄN:** Charisma + Inflytandets Ability + Dominate\\* + 3 Automatiska lyckade VS Motståndarens slag för INFLUENCE (Steal) eller INFLUENCE (destroy)\r\n- **SPÅRA ANGRIPARE:** Manipulation + Inflytandets Ability + Auspex\\* VS Motståndarens slag för att dölja sig\r\n\r\nDu förstärker din kontroll över ett av dina etablerade inflytandeområden och får möjlighet att upptäcka vem som genomför eventuella angrepp. Vanligtvis försvarar du ditt inflytande med Inflytandets ability + Dominate, men med conserve influence-handlingen får du lägga till din charisma och får dessutom tre automatiska lyckade.	f	f
3	Conserve (Domain)	**Slag:** \r\n\r\n- **HINDRA PROBLEM:** Intelligence + Leadership/Streetwise + Animalism VS Svårighetsgrad på problem\r\n- **UPPTÄCKA JAKT:** Wits + Leadership/Streetwise + Protean\\* VS Motståndarens slag för att dölja sig\r\n\r\nDu minskar de omedelbara effekterna av problem som uppstår på din domän till följd av ploter, downtimehandlingar och overfeeding. Du får också slå slag för att upptäcka vem/vilka som overfeedat i din domän.	f	f
5	Acquire (Influence)	**Slag:**\r\n\r\n- **STJÄLA HOOK:** Charisma + Inflytandes Ability + Presence\\* VS Moståndarens basslag (Inflytandets Ability + Dominate\\*) ELLER CONSERVE (Influence)\r\n- **DÖLJA SPÅR:** Manipulation + Stealth + Obfuscate\\* VS Motståndarens slag för att upptäcka \r\n\r\nKrav: Namngiven karaktär som är en hook tillhörande en annan karaktär\r\n\r\nDu stjäl en ny hook förutsatt att det finns en ledig plats för dig. I annat fall frigörs hooken så att ingen längre kontrollerar den. Du får slå ett slag för att dölja din inblandning. Se Influence (Forge) för mer information.	f	f
6	Destroy (Influence)	**Slag:**\r\n\r\n- **FÖRSTÖRA INFLYTANDE:** Valfri kombination av Strength/Charisma/Intelligence + Inflytandets \t\t\t\t\t\tAbility/Combat/Intimidation + Celerity*/Fortitude*/Potence*/Dementation* VS Moståndarens basslag (Inflytandets Ability + Dominate*) ELLER CONSERVE (Influence)\r\n- **DÖLJA SPÅR:** Manipulation + Stealth + Obfuscate* VS Motståndarens slag för att upptäcka\r\n\r\n**Krav:** Namngiven karaktär som är en hook tillhörande en annan karaktär OCH Förlora en Humanitynivå\r\n\r\nDu förstör permanent en hook. Du får slå ett slag för att dölja din inblandning.	f	f
7	Investigate (Character: Influence)	**Slag:** Manipulation + Investigation + Auspex\\* VS Special\r\n\r\nDu undersöker en karaktärs inflytande. Du får spendera dina lyckade för att få information enligt följande:\r\n\r\n* Alla Masternivåer 1\r\n* Alla Master och Contendernivåer 2\r\n* Alla Inflytandenivåer 3\r\n* Alla hooks i ett valt inflytande 2\r\n* En hook i ett valt inflytande 1\r\n* En känd hooks keywords 1\r\n\r\nNär tärningarna slagits så spenderar du alla dina lyckade samtidigt. Om det inte finns någon information att hämta så går dina lyckade åt för att få reda på det. Om du inte kan spendera dina lyckade jämnt så går oanvända till spillo.	f	f
8	Investigate (Character: Resources)	**Slag:** Wits + Investigation + Protean\\* VS Special\r\n\r\nDu undersöker en karaktärs backgrounds och feeding. Du får spendera dina lyckade för att få information enligt följande:\r\n\r\nEn slumpmässigt background 1\r\nEn vald typ av background 1\r\nHur mycket blod som tagits och var 3\r\nHur många Resource points karaktären har 3\r\n\r\nNär tärningarna slagits så spenderar du alla dina lyckade samtidigt. Om du spenderar mer lyckade än det finns backgrounds så går de till spillo.	f	f
9	Investigate (Character: Downtime Actions)	**Slag:** Wits + Investigation + Protean\\* VS Wits + Stealth + Obfuscate\\*\r\n\r\nDu undersöker vilka downtime-handlingar en spelare har valt och kan välja att ingripa för att stoppa någon av dem. Om du lyckas så får du en lista av handlingar och kan sätta en scen där du ingriper på ett sätt som du finner lämpligt.\r\n	f	f
10	Investigate (Counterespionage)	**Slag:** Wits + Investigation + Protean\\* VS Wits + Stealth + Obfuscate\\*\r\n\r\nDu undersöker om någon försöker ta reda på saker om dig eller dina inflytanden. Du får en lista på alla om har undersökt dig som du har fått lika många eller fler lyckade som.	f	f
11	Investigate (Phenomenon)	**Slag:** Wits + Investigation + Dementation\\* VS Special\r\n\r\nDu försöker ta reda på information om ett settingelement. Fler lyckade ger mer, bättre information. Det är möjligt att välja ett inflytandeområde, i sådana fall ger 1 lyckad ett osäkert rykte och 3 lyckade ett säkert rykte.	f	f
12	Investigate (Influence)	**Slag:** Manipulation + Inflytandes Ability + Auspex\\*  VS Special\r\n\r\nDu undersöker det allmänna läget inom ett inflytandeområde. Den första lyckade ger vem som är master och contenders, alla följande lyckade ger slumpmässiga hooks inom inflytandet.	f	f
16	Rest	Du återfår alla spenderad Willpower.	t	f
17	Patrol (Domain)	Lagmannen kan välja ett område där det uppstår ett Problem mindre under downtime.	t	f
18	Neglect (Domain)	Lagmannen kan välja ett område där det uppstår ett Problem mer under downtime.	t	f
19	Question (Keeper)	Elysiemästaren får ställa vars en personlig fråga till tre valfria besökare på Elysium. Besökaren måste svara ärligt eller betala en Liten Gäld. Om information avslöjas beslutar spelarna hur den har framkommit.	t	f
20	Aid Action (Primogen)	Primogener har en extra downtimehandling som endast kan användas till Aid Action till någon inom klanen.	f	t
21	Question (Primogen)	Primogener får ställa en personlig fråga till en valfri klanmedlem. Klanmedlemmen måste svara ärligt eller betala en ansenlig Gäld. Om information avslöjas beslutar spelarna hur den har framkommit.	t	f
22	Invest (Equipment)	Du börjar skaffa dig en ny Equipment enligt inlärningsreglerna.	t	f
23	Invest (Ghoul)	Du börjar skaffa dig en ny ghoul enligt inlärningsreglerna.	t	f
24	Invest (Haven)	Du börjar skaffa dig en ny haven enligt inlärningsreglerna.	t	f
25	Invest (Herd)	Du börjar skaffa dig en ny herd enligt inlärningsreglerna.	t	f
26	Invest (Weapon)	Du börjar skaffa dig ett nytt vapen enligt inlärningsreglerna.	t	f
27	Learn (Attribute)	Du börjar att lära dig ett nytt steg på ett Attribute enligt inlärningsreglerna.	t	f
28	Learn (Discipline)	Du börjar att lära dig ett nytt steg på en Discipline enligt inlärningsreglerna.	t	f
29	Learn (Specialization)	Du börjar att lära dig en ny specialization, men tappar samtidigt en gammal, enligt inlärningsreglerna.	t	f
30	Mentor (Attribute)	Du ger mentorbonusen till någon för ett Attribute du är kvalificerad att lära dem enligt inlärningsreglerna.	t	f
31	Mentor (Discipline)	Du ger mentorbonusen till någon för en Discipline du är kvalificerad att lära dem enligt inlärningsreglerna.	t	f
32	Mentor (Specialization)	Du ger mentorbonusen till någon för en Specialization du är kvalificerad att lära dem enligt inlärningsreglerna.	t	f
33	Aid Action (Ghoul)		f	t
34	Learn (Advantage)		t	f
35	Assign (XP)		t	f
\.


--
-- Name: players_actiontype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_actiontype_id_seq', 35, true);


--
-- Data for Name: players_activedisciplines; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_activedisciplines (id, character_id, session_id) FROM stdin;
\.


--
-- Data for Name: players_activedisciplines_disciplines; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_activedisciplines_disciplines (id, activedisciplines_id, discipline_id) FROM stdin;
\.


--
-- Name: players_activedisciplines_disciplines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_activedisciplines_disciplines_id_seq', 3, true);


--
-- Name: players_activedisciplines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_activedisciplines_id_seq', 1, false);


--
-- Data for Name: players_advantage; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_advantage (id, name, costs, humanity) FROM stdin;
1	Humanity	0,2,2,2,2,2,2,2,2,2,2	f
2	Willpower	0,2,2,3,3,4,4,5,5,6,6	f
\.


--
-- Name: players_advantage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_advantage_id_seq', 2, true);


--
-- Data for Name: players_advantagerating; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_advantagerating (id, learned, learning, mentor, value, exp, advantage_id, character_id) FROM stdin;
3	f	f	f	6	0	2	36
4	f	f	f	3	0	1	36
13	f	f	f	8	0	1	12
14	f	f	f	4	0	2	12
15	f	f	f	7	0	1	13
16	f	f	f	5	0	2	13
17	f	f	f	6	0	1	14
18	f	f	f	4	0	2	14
19	f	f	f	4	0	1	16
20	f	f	f	9	0	2	16
21	f	f	f	6	0	1	28
22	f	f	f	4	0	2	28
23	f	f	f	7	0	1	32
24	f	f	f	4	0	2	32
25	f	f	f	7	0	1	25
26	f	f	f	5	0	2	25
\.


--
-- Name: players_advantagerating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_advantagerating_id_seq', 26, true);


--
-- Data for Name: players_age; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_age (id, name, backgrounds, generation) FROM stdin;
1	Novis	0	0
2	Neonat	0	0
3	Ancilla	0	0
4	Äldste	0	0
\.


--
-- Data for Name: players_age_action_options; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_age_action_options (id, age_id, actionoption_id) FROM stdin;
37	1	1
38	1	2
39	1	5
40	2	1
41	2	2
42	2	5
43	3	1
44	3	2
45	3	4
46	4	1
47	4	2
48	4	3
\.


--
-- Name: players_age_action_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_age_action_options_id_seq', 48, true);


--
-- Name: players_age_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_age_id_seq', 4, true);


--
-- Data for Name: players_aidaction; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_aidaction (action_ptr_id, name, action_id, helpee_id) FROM stdin;
\.


--
-- Data for Name: players_aspect; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_aspect (id, name) FROM stdin;
1	Amoral
2	Cheap
3	Discrete
4	Efficient
5	Loyal
6	Ghoul
\.


--
-- Data for Name: players_assignxp; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_assignxp (action_ptr_id, target_id) FROM stdin;
\.


--
-- Data for Name: players_attribute; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_attribute (id, name) FROM stdin;
1	Social
2	Mental
3	Physical
\.


--
-- Name: players_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_attribute_id_seq', 3, true);


--
-- Data for Name: players_attributerating; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_attributerating (id, learned, elder_blood, mentor, value, exp, attribute_id, learning, character_id) FROM stdin;
26	f	f	f	1	0	1	f	12
27	f	f	f	4	0	3	f	12
28	f	f	f	3	0	2	f	12
29	t	f	t	5	0	1	f	13
30	f	f	f	1	0	3	f	13
31	f	f	f	1	0	2	f	13
32	f	f	f	2	0	1	f	14
33	f	f	f	5	0	3	f	14
34	f	f	f	5	0	2	f	14
38	f	f	f	2	0	1	f	16
39	f	f	f	6	0	3	f	16
40	f	f	f	3	0	2	f	16
53	t	f	f	3	0	1	f	28
54	f	f	f	3	0	3	f	28
55	f	f	f	5	0	2	f	28
65	f	f	f	1	0	1	f	17
66	f	f	f	1	0	3	f	17
67	f	f	f	5	0	2	f	17
104	f	f	f	4	0	1	f	36
105	f	f	f	2	0	3	f	36
106	f	f	f	3	0	2	f	36
119	f	f	f	2	0	1	f	25
120	f	f	f	5	0	3	f	25
121	f	f	f	5	0	2	f	25
123	f	f	f	0	0	3	f	32
124	f	f	f	0	0	2	f	32
122	f	f	f	3	0	1	f	32
\.


--
-- Name: players_attributerating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_attributerating_id_seq', 124, true);


--
-- Data for Name: players_boon; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_boon (id, size, number, signer_id) FROM stdin;
\.


--
-- Name: players_boon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_boon_id_seq', 1, false);


--
-- Data for Name: players_canonfact; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_canonfact (id, name, description) FROM stdin;
\.


--
-- Name: players_canonfact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_canonfact_id_seq', 1, false);


--
-- Data for Name: players_changegoal; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_changegoal (id, theme, belief, action, open_goal, character_id, goal_id, session_id) FROM stdin;
\.


--
-- Name: players_changegoal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_changegoal_id_seq', 3, true);


--
-- Data for Name: players_character; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_character (id, name, generation, blood, assets, concept, herd, haven, exp, humanity_exp, additional_notes, age_id, clan_id, nature_id, political_faction_id, sire_id, user_id, aggravated, superficial, willpower, firearms, melee, haven_description, haven_domain_id, herd_description, status, pronoun_id, defined) FROM stdin;
28	Pierre Steen	10	10	1	utredare	1	2	3	3		2	7	6	\N	\N	56	0	0	0	0	0		\N		0	3	t
33	Monster	13	10	0		0	0	0	0		2	\N	\N	\N	\N	47	0	0	0	0	0		\N		0	1	f
34	Liliana	11	10	0		0	0	0	0		2	1	1	1	\N	\N	0	0	0	0	0	på gatan	4		0	2	f
12	Erik	8	9	2		1	0	3	4		2	1	10	3	\N	42	2	0	4	0	0		\N		0	3	t
13	Hans Liljenkrantz	8	10	12		3	1	3	2		2	1	13	3	\N	63	0	0	5	0	0		\N		0	3	t
14	Dante	10	10	4	Informationssökare och gehenna profet	2	0	0	0	Har tillgång till mat genom domän tillhörande fursten	2	4	8	\N	\N	55	0	0	4	0	0		\N		0	3	t
16	Filch	7	9	0		0	0	1	4	Filch is investing in the weapon Sword.	2	1	11	\N	\N	57	3	0	9	0	0		\N		0	3	t
17	Robin	10	10	1	Golcondist	2	0	1	0	Derangement: Tror att alla runtomkring honom är fiktiva och bara en del av hans fantasi.	2	4	2	1	\N	52	0	0	0	0	0		\N		0	3	t
32	Faye Morgan	13	10	0	Occult Researcher/Investigator	2	2	6	0		2	7	2	1	\N	53	0	0	2	1	3	Ett föråd i en källare i ett bostadshus	4	Jag själ blodpåsar på sjukhuset	0	1	t
25	Zelda Mörck	10	10	7	Great great grandchilde till Harriet.	0	1	0	0	------------------\r\nKomplexa relationer:\r\nSimon Lilja\r\nFursten Pauli\r\nSire Hans\r\n\r\nIcke komplexa relationer:\r\nElysiemästare Primus\r\nHarpyan Thorden\r\nRobin \r\n------------------\r\n\r\nRobin Malkav och Lydia Pauli Tremere är skyldiga Zelda minor boones \r\n------------------\r\n"Tror att det är hela karaktären, hoppas jag inte missat något - Har ingen aning om ifall jag fyllt i den här rätt. Men i värsta fall får jag göra om den. //Matilda"	2	1	10	\N	\N	68	0	0	5	0	0		4		0	2	t
36	Jenny McCarty	13	5	0		0	0	0	0		1	1	1	1	\N	\N	0	0	0	0	0	lyxigt	4		0	1	t
37	Los Sharko	13	5	0	gfhfgnhfv	0	0	0	0		1	1	1	1	28	76	0	0	0	0	0		\N		0	1	t
\.


--
-- Name: players_character_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_character_id_seq', 37, true);


--
-- Data for Name: players_character_rituals; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_character_rituals (id, character_id, ritualrating_id) FROM stdin;
\.


--
-- Name: players_character_rituals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_character_rituals_id_seq', 1, false);


--
-- Data for Name: players_character_specializations; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_character_specializations (id, character_id, specialization_id) FROM stdin;
121	12	8
122	12	1
123	12	10
124	12	5
125	12	15
126	13	10
127	13	11
128	13	7
129	13	14
130	13	15
131	14	3
132	14	17
133	14	10
134	14	11
135	14	5
136	16	8
137	16	1
138	16	2
139	16	4
140	16	9
141	17	17
142	17	10
143	17	11
144	17	6
145	17	7
146	25	2
147	25	11
148	25	4
149	25	7
150	25	15
151	28	1
152	28	10
153	28	5
154	28	6
155	28	7
156	32	1
157	32	10
158	32	7
159	32	6
160	32	15
\.


--
-- Name: players_character_specializations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_character_specializations_id_seq', 160, true);


--
-- Data for Name: players_character_titles; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_character_titles (id, character_id, title_id) FROM stdin;
40	13	3
41	13	6
42	16	4
43	28	4
\.


--
-- Name: players_character_titles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_character_titles_id_seq', 52, true);


--
-- Data for Name: players_clan; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_clan (id, name, theme) FROM stdin;
1	Brujah	
2	Gangrel	
3	Nosferatu	
4	Malkavian	
5	Caitiff	
6	Toreador	
7	Tremere	Vad är du bered att göra för klanen.
8	Ventrue	
\.


--
-- Data for Name: players_clan_clan_disciplines; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_clan_clan_disciplines (id, clan_id, discipline_id) FROM stdin;
64	1	8
65	1	9
66	1	3
67	2	2
68	2	10
69	2	6
70	3	8
71	3	2
72	3	7
73	4	1
74	4	4
75	4	7
76	6	1
77	6	3
78	6	9
79	7	1
80	7	11
81	7	5
82	8	9
83	8	5
84	8	6
\.


--
-- Name: players_clan_clan_disciplines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_clan_clan_disciplines_id_seq', 84, true);


--
-- Name: players_clan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_clan_id_seq', 8, true);


--
-- Data for Name: players_conservedomain; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_conservedomain (action_ptr_id, domain_id) FROM stdin;
\.


--
-- Data for Name: players_conserveinfluence; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_conserveinfluence (action_ptr_id, influence_id) FROM stdin;
\.


--
-- Data for Name: players_discipline; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_discipline (id, name) FROM stdin;
1	Auspex
2	Animalism
3	Celerity
4	Demenation
5	Dominate
6	Fortitude
7	Obfuscate
8	Potence
9	Presence
10	Protean
11	Thaumaturgy
\.


--
-- Name: players_discipline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_discipline_id_seq', 11, true);


--
-- Data for Name: players_disciplinerating; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_disciplinerating (id, value, learned, elder_blood, in_clan, mentor, exp, discipline_id, learning, character_id) FROM stdin;
46	0	f	f	t	f	0	8	f	13
47	5	f	f	t	f	0	9	f	13
48	3	f	f	t	f	0	4	f	14
49	0	f	f	t	f	0	1	f	32
60	1	t	f	t	f	2	4	f	17
61	2	t	f	t	f	2	7	f	17
84	1	f	f	t	f	0	3	f	16
86	1	f	f	f	f	0	6	f	14
92	1	t	f	t	f	1	11	f	28
98	0	f	f	t	f	0	1	f	14
100	4	t	f	t	f	3	11	f	32
103	1	f	f	f	f	0	6	f	16
105	2	t	f	f	f	0	3	f	12
107	1	f	f	f	f	0	10	f	12
126	0	f	f	f	f	0	5	f	32
133	0	t	f	f	t	2	4	f	28
136	1	f	f	f	f	0	9	f	16
137	4	f	f	f	f	0	7	f	13
144	2	f	f	f	f	0	1	f	28
146	0	f	f	f	f	0	7	f	14
148	2	f	f	f	f	0	8	f	16
152	0	t	f	f	f	0	9	f	32
153	0	f	f	f	f	0	5	f	28
154	1	t	t	f	f	0	1	f	16
156	1	f	f	f	f	0	9	f	12
158	2	f	f	f	f	0	1	f	13
161	1	f	f	f	f	0	1	f	12
166	1	f	f	t	f	0	3	f	25
167	1	f	f	t	f	0	8	f	25
168	1	f	f	f	f	0	6	f	25
169	0	f	f	f	f	0	7	f	32
\.


--
-- Name: players_disciplinerating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_disciplinerating_id_seq', 169, true);


--
-- Data for Name: players_domain; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_domain (id, name, feeding_capacity, status, influence, masquerade, owner_id) FROM stdin;
4	Skavtång	10	3	-	Better	\N
9	Soptippen	5	0	-	Worse	13
10	Skogsområdet	0	0	-	Worse	32
\.


--
-- Data for Name: players_domain_allowed; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_domain_allowed (id, domain_id, character_id) FROM stdin;
28	4	16
29	4	17
30	4	28
31	4	25
32	4	12
33	4	13
34	4	14
35	9	13
36	10	32
\.


--
-- Name: players_domain_allowed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_domain_allowed_id_seq', 36, true);


--
-- Name: players_domain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_domain_id_seq', 10, true);


--
-- Data for Name: players_domain_place; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_domain_place (id, domain_id, place_id) FROM stdin;
\.


--
-- Name: players_domain_place_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_domain_place_id_seq', 1, false);


--
-- Data for Name: players_domain_population; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_domain_population (id, domain_id, population_id) FROM stdin;
\.


--
-- Name: players_domain_population_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_domain_population_id_seq', 1, false);


--
-- Data for Name: players_elderpower; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_elderpower (id, name, description, discipline_id) FROM stdin;
\.


--
-- Name: players_elderpower_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_elderpower_id_seq', 1, false);


--
-- Data for Name: players_equipment; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_equipment (id, name, specialization_id, owner_id) FROM stdin;
1	Axebody spray	3	32
2	Laptop	10	32
\.


--
-- Name: players_equipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_equipment_id_seq', 2, true);


--
-- Data for Name: players_eventreport; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_eventreport (id, open_goal1, open_goal2, hidden_goal, humanity, willpower, blood, superficial, aggravated, character_id, session_id, assets) FROM stdin;
\.


--
-- Name: players_eventreport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_eventreport_id_seq', 1, true);


--
-- Data for Name: players_expadvantagespending; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_expadvantagespending (id, exp, advantage_id, character_id, session_id) FROM stdin;
\.


--
-- Name: players_expadvantagespending_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_expadvantagespending_id_seq', 1, false);


--
-- Data for Name: players_expattributespending; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_expattributespending (id, exp, attribute_id, character_id, session_id) FROM stdin;
\.


--
-- Name: players_expattributespending_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_expattributespending_id_seq', 1, false);


--
-- Data for Name: players_expdisciplinespending; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_expdisciplinespending (id, exp, character_id, discipline_id, session_id) FROM stdin;
\.


--
-- Name: players_expdisciplinespending_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_expdisciplinespending_id_seq', 2, true);


--
-- Data for Name: players_feeding; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_feeding (id, feeding_points, description, resolved, character_id, discipline_id, domain_id, session_id, has_good_method, incident_roll, incidents) FROM stdin;
\.


--
-- Name: players_feeding_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_feeding_id_seq', 1, true);


--
-- Data for Name: players_ghoul; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_ghoul (id, name, level, hook_id, master_id) FROM stdin;
1	Eva Lord	3	\N	\N
2	Konstapel Karl	3	\N	\N
7	Niclas Pauli	3	\N	\N
8	Sydney Pope	2	\N	\N
10	Iris Horner	1	\N	\N
11	Daniel Engström	1	\N	\N
13	Varhajen Cecilia	3	\N	\N
12	Sven-Göran Gelin	1	11	\N
14	Tobias von Knorring	1	103	\N
9	Lilja Jr, Ephraim	3	\N	32
\.


--
-- Name: players_ghoul_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_ghoul_id_seq', 14, true);


--
-- Data for Name: players_ghoul_specializations; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_ghoul_specializations (id, ghoul_id, specialization_id) FROM stdin;
64	1	3
65	1	11
66	1	7
67	2	9
68	2	4
69	2	6
70	7	10
71	7	3
72	7	6
73	8	8
74	8	3
75	9	10
76	9	11
77	9	4
78	10	10
79	11	10
80	12	15
81	13	2
82	13	4
83	13	7
84	14	8
\.


--
-- Name: players_ghoul_specializations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_ghoul_specializations_id_seq', 84, true);


--
-- Data for Name: players_ghoulaidaction; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_ghoulaidaction (action_ptr_id, name, action_id, ghoul_id, helpee_id) FROM stdin;
\.


--
-- Data for Name: players_ghouldisciplinerating; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_ghouldisciplinerating (id, value, discipline_id, ghoul_id) FROM stdin;
1	1	2	12
2	3	6	13
\.


--
-- Name: players_ghouldisciplinerating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_ghouldisciplinerating_id_seq', 2, true);


--
-- Data for Name: players_goal; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_goal (id, theme, belief, action, character_id, open_goal) FROM stdin;
1	Humanity	Adrian påminer mig om hur jag var som människa	få Adrian att älska mig.	32	t
2	Season Theme	Kunskapen ska vara fri	avslöja klanens hemligheter	32	t
3	Faction	Lilith led för att få kunskap	se till att Jane får lida.	32	t
\.


--
-- Name: players_goal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_goal_id_seq', 3, true);


--
-- Data for Name: players_healingreport; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_healingreport (id, superficial, aggravated, character_id, session_id) FROM stdin;
\.


--
-- Name: players_healingreport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_healingreport_id_seq', 1, false);


--
-- Data for Name: players_hook; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_hook (id, name, influence_id, concept, master_id) FROM stdin;
9	Lillith	3	sångerska av Dark Pesach	25
10	Mephistofeles	5	edgy internet ockultist	\N
11	Sven-Göran Gelin	5	En man i närheten av pensionsåldern som hängett sig åt sin tidigare ockulta hobby i hopp om att hitta en metod till evigt liv. I och med maskeradens taskiga nivå i Helsingkrona och Varbyskogen så när	13
12	Inga Fjällström	5	När hennes idol, Madonna, blev kabbalit så blev hon det också. Men hon gick mycket mer in för det hela. Hon är väldigt glad när där finns folk som tar hennes intressen på allvar och dessutom betalar f	\N
13	Sverker Olofson	5	Hamnade i sataniska kretsar under det mörka och regniga 90-talet. Till skillnad från de flesta av sina gelikar så gick Sverker verkligen in för det hela. Han är numera i medelåldern och äger en butik	32
14	Nils Cronholm	2	En nyhetsredaktör (på tv) som är villig att skicka lite intressanta och bisarra stories vidare mot betalning, samt stänga ner dem också.	\N
15	Tilde Christersson	4	En ägare för en konspirationstidning, Konstiga Konspirationer, som rapporterar om allsköns konstigheter som pågår i Sverige och världen. Det är i hennes tidning som man kan läsa om ryktena om en haj s	\N
16	Erik Blom	6	En omoralisk vaktmästare vid universitet, skvallrar gärna om studenter och anställda. Samt säljer diverse droger till dem så att de kan peppa inför prov och liknande. Det går rykten om att han en gång	\N
29	Jenna Sykes	3	sångerska i Dark Souls, det hetaste black metal-bandet i stan	\N
30	Max Stenström	3	kulturkritiker på dagstidningen	25
31	Till Hansson	5	Medium	28
32	Mio Björk	1	partisekreterare för det ledande partiet i kommunen	\N
33	Kim Strand	2	webbredaktör för dagstidningen	\N
34	Sam Nordblom	6	ammanuens på universitetsbiblioteket	\N
36	Ivan Kallenberg	5		12
37	Kenneth Dar	2	Radio Producer	13
38	Greta Star	5	Librarian, collects occult books	28
39	Klaus Dow	6		13
40	Doug Underhill	5	Aquirer of Artifacts, works for a Museum	32
41	Greg Stone	3	Logistic Manager for a theatre	32
42	Louise Uppercut	6	Teaches Advanced english	13
44	Joanna Öhrn	4		14
45	Katarina Ågren	4		14
47	Mahmoud Nejem	2		13
52	Leif Palm	4		16
53	Sven Piper	5		16
56	Martin Oddshammar	2		17
57	Mattias Nesselqvist	5		17
58	Maria Mattisdotter	4		17
90	Cassandra Kahn	5		17
94	Xantro	4	Janitor	\N
99	Ester Andersson	2	Jobbar på TV station	\N
101	Sven-Olof Hieta	2		28
102	Susanna Karlsdotter	6		28
103	Tobias von Knorring	1		28
107	Leif Albrechtsson	1	En högst mutbar och omoralisk lokalpolitiker, dödade en gång en baltisk prostituerad som han tagit heroin med. En man utan skor i en gammal kostym hjälpte honom röja undan det och soppa igen alla spår	\N
108	Aikku Jokinen	6	doktor i datavetenskap; forskar om artificiell intelligens	\N
121	Lova Vinge	3	kink club owner	32
122	Ava Neros	1	political party spokes person	\N
123	Carl Af Croona	2	newspaper editor	\N
128	Katarina Hill	4	Finance Advisor	13
129	Gregg Stone	1	Works in Marketing	13
130	Elvira	6		32
132	Pierre Johansson	1	dirty cop	\N
133	Aron Pawson	6	failing student	\N
134	Mathias Gertson	6	Dekan Teolog Institutionen	\N
135	Zero Day	3	Snuff kanal	32
136	Lasse Lasseson	1	Kommunalråd, S	\N
137	Karl Lindström	1	Kommunpolitiker	\N
140	Natanael Augustsson	8	korrupt små polis som inte har några problem med att sälja information relaterad till utredningar	16
141	Felix VonPlenker	5	Hobbysatanist	\N
142	Esteban Svensson	8	Närpolis bland ungdomarna	\N
143	Svante Sturesson	2	Liten, sorglig typ som inte kan säga nej	\N
144	Johannes Nielsen	6	Allmänt trött på livet och söker mer spänning	36
145	Fred Gregori	5	Ordo Templi Orientis. Sexmagiker som samlar sociala personer från alla samhällsskick	36
146	Fader Johannes Graah	4	Moraliskt tvivelaktig katolsk präst som gärna syndar för kunna straffa sig själv	36
152	David Golitais	8		13
\.


--
-- Data for Name: players_hook_aspects; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_hook_aspects (id, hook_id, aspect_id) FROM stdin;
322	9	4
323	9	5
324	10	1
325	10	3
326	11	3
327	11	5
328	12	2
329	12	3
330	13	1
331	13	4
332	14	3
333	14	5
334	15	2
335	15	5
336	16	1
337	16	4
338	29	3
339	29	5
340	30	3
341	30	5
342	31	3
343	31	5
344	32	3
345	32	5
346	33	3
347	33	5
348	34	3
349	34	5
350	36	1
351	37	4
352	37	5
353	38	3
354	38	4
355	39	1
356	39	2
357	40	2
358	40	5
359	41	1
360	41	2
361	42	3
362	42	5
363	44	1
364	44	3
365	45	4
366	45	5
367	47	4
368	47	5
369	52	2
370	52	4
371	53	3
372	53	5
373	56	4
374	56	5
375	57	3
376	57	5
377	58	1
378	58	4
379	94	3
380	94	5
381	99	4
382	99	5
383	101	1
384	101	2
385	102	3
386	102	4
387	103	1
388	103	3
389	107	1
390	107	5
391	108	4
392	108	5
393	121	1
394	121	3
395	122	4
396	122	5
397	123	3
398	123	4
399	128	4
400	128	5
401	129	1
402	129	2
403	130	1
404	130	4
405	132	1
406	132	4
407	133	2
408	133	3
409	134	3
410	134	5
411	135	1
412	135	2
413	136	2
414	136	5
415	140	1
416	140	2
417	141	2
418	141	4
419	142	1
420	142	2
421	143	3
422	143	4
423	144	2
424	144	4
425	145	3
426	145	5
427	146	1
428	146	2
\.


--
-- Name: players_hook_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_hook_attributes_id_seq', 428, true);


--
-- Name: players_hook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_hook_id_seq', 152, true);


--
-- Name: players_hookattribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_hookattribute_id_seq', 6, true);


--
-- Data for Name: players_influence; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_influence (id, name) FROM stdin;
1	Politik
2	Media
3	Konst och Underhållning
4	Kyrkan
5	Ockult
6	Universitet
8	Polis
\.


--
-- Name: players_influence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_influence_id_seq', 8, true);


--
-- Data for Name: players_influencedestroy; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_influencedestroy (action_ptr_id, name, influence_id) FROM stdin;
\.


--
-- Data for Name: players_influencerating; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_influencerating (id, rating, character_id, influence_id) FROM stdin;
\.


--
-- Name: players_influencerating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_influencerating_id_seq', 1, false);


--
-- Data for Name: players_influencesteal; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_influencesteal (action_ptr_id, name, influence_id) FROM stdin;
\.


--
-- Data for Name: players_influencewant; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_influencewant (id, wanted, dislodged, final, character_id, influence_id, elder) FROM stdin;
1	3	0	t	33	1	f
2	3	0	t	13	4	f
3	2	1	t	17	4	f
4	0	0	t	17	2	f
5	2	0	t	13	6	f
6	3	0	t	32	8	t
\.


--
-- Name: players_influencewant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_influencewant_id_seq', 6, true);


--
-- Data for Name: players_investequipment; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_investequipment (action_ptr_id, name, specialization_id) FROM stdin;
\.


--
-- Data for Name: players_investghoul; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_investghoul (action_ptr_id, name, discipline_id, specialization_id) FROM stdin;
\.


--
-- Data for Name: players_investhaven; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_investhaven (action_ptr_id) FROM stdin;
\.


--
-- Data for Name: players_investherd; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_investherd (action_ptr_id) FROM stdin;
\.


--
-- Data for Name: players_investigatecharacterdowntimeactions; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_investigatecharacterdowntimeactions (action_ptr_id, target_id) FROM stdin;
\.


--
-- Data for Name: players_investigatecharacterinfluence; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_investigatecharacterinfluence (action_ptr_id, target_id) FROM stdin;
\.


--
-- Data for Name: players_investigatecharacterresources; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_investigatecharacterresources (action_ptr_id, target_id) FROM stdin;
\.


--
-- Data for Name: players_investigatecounterspionage; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_investigatecounterspionage (action_ptr_id) FROM stdin;
\.


--
-- Data for Name: players_investigateinfluence; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_investigateinfluence (action_ptr_id, influence_id) FROM stdin;
\.


--
-- Data for Name: players_investigatephenomenon; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_investigatephenomenon (action_ptr_id, phenonemon) FROM stdin;
\.


--
-- Data for Name: players_investweapon; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_investweapon (action_ptr_id, weapon) FROM stdin;
\.


--
-- Data for Name: players_keepersquestion; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_keepersquestion (action_ptr_id, question, target_id) FROM stdin;
\.


--
-- Data for Name: players_learnadvantage; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_learnadvantage (action_ptr_id, advantage_id) FROM stdin;
\.


--
-- Data for Name: players_learnattribute; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_learnattribute (action_ptr_id, attribute_id, trainer_id, blood) FROM stdin;
\.


--
-- Data for Name: players_learndiscipline; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_learndiscipline (action_ptr_id, discipline_id, trainer_id, blood) FROM stdin;
\.


--
-- Data for Name: players_learnspecialization; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_learnspecialization (action_ptr_id, new_specialization_id, old_specialization_id, trainer_id) FROM stdin;
\.


--
-- Data for Name: players_losthook; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_losthook (id, character_id, hook_id, session_id) FROM stdin;
\.


--
-- Name: players_losthook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_losthook_id_seq', 1, false);


--
-- Data for Name: players_mentorattribute; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_mentorattribute (action_ptr_id, attribute_id, student_id, blood) FROM stdin;
\.


--
-- Data for Name: players_mentordiscipline; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_mentordiscipline (action_ptr_id, discipline_id, student_id, blood) FROM stdin;
\.


--
-- Data for Name: players_mentorspecialization; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_mentorspecialization (action_ptr_id, specialization_id, student_id) FROM stdin;
\.


--
-- Data for Name: players_nature; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_nature (id, name) FROM stdin;
1	Autocrat
2	Bon Vivant
3	Competitor
4	Conniver
5	Follower
6	Judge
7	Guide
8	Monster
9	Narcissist
10	Penitent
11	Rogue
12	Traditionalist
13	Visionary
\.


--
-- Name: players_nature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_nature_id_seq', 13, true);


--
-- Data for Name: players_neglectdomain; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_neglectdomain (action_ptr_id, domain_id) FROM stdin;
\.


--
-- Data for Name: players_patroldomain; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_patroldomain (action_ptr_id, domain_id) FROM stdin;
\.


--
-- Data for Name: players_place; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_place (id, name) FROM stdin;
\.


--
-- Name: players_place_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_place_id_seq', 1, false);


--
-- Data for Name: players_politicalfaction; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_politicalfaction (id, name, description) FROM stdin;
1	Lilith Dyrkare	
2	Gehenna Kultist	
3	Human Apologist	
\.


--
-- Name: players_politicalfaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_politicalfaction_id_seq', 3, true);


--
-- Data for Name: players_population; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_population (id, name) FROM stdin;
\.


--
-- Name: players_population_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_population_id_seq', 1, false);


--
-- Data for Name: players_primogensaidaction; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_primogensaidaction (action_ptr_id, name, action_id, helpee_id) FROM stdin;
\.


--
-- Data for Name: players_primogensquestion; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_primogensquestion (action_ptr_id, question, target_id) FROM stdin;
\.


--
-- Data for Name: players_pronoun; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_pronoun (id, subjective, objective, possessive) FROM stdin;
1	hen	hen	hens
2	hon	henne	hennes
3	han	honom	hans
\.


--
-- Name: players_pronoun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_pronoun_id_seq', 3, true);


--
-- Data for Name: players_relationship; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_relationship (id, complicated, description, blood_bond, character_id, other_character_id) FROM stdin;
\.


--
-- Name: players_relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_relationship_id_seq', 1, false);


--
-- Data for Name: players_rest; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_rest (action_ptr_id) FROM stdin;
\.


--
-- Data for Name: players_ritual; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_ritual (id, name, level, description) FROM stdin;
\.


--
-- Name: players_ritual_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_ritual_id_seq', 1, false);


--
-- Data for Name: players_ritualrating; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_ritualrating (id, exp, invested, ritual_id) FROM stdin;
\.


--
-- Name: players_ritualrating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_ritualrating_id_seq', 1, false);


--
-- Data for Name: players_rumor; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_rumor (id, description, gm_note, rumor_type, "canonFact_id", influence_id, session_id) FROM stdin;
\.


--
-- Name: players_rumor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_rumor_id_seq', 181, true);


--
-- Data for Name: players_rumor_recipients; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_rumor_recipients (id, rumor_id, character_id) FROM stdin;
\.


--
-- Name: players_rumor_recipients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_rumor_recipients_id_seq', 140, true);


--
-- Data for Name: players_season; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_season (id, name, theme, is_open) FROM stdin;
1	Helsingkrona	Kunskap	t
\.


--
-- Name: players_season_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_season_id_seq', 1, true);


--
-- Data for Name: players_session; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_session (id, name, is_open, is_special, action_set_id, previous_id, season_id) FROM stdin;
\.


--
-- Data for Name: players_session_feeding_domains; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_session_feeding_domains (id, session_id, domain_id) FROM stdin;
\.


--
-- Name: players_session_feeding_domains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_session_feeding_domains_id_seq', 24, true);


--
-- Name: players_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_session_id_seq', 4, true);


--
-- Data for Name: players_specialization; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_specialization (id, name) FROM stdin;
1	Alertness
2	Athletics
3	Apperance
4	Combat
5	Interogation
6	Legwork
7	Lore
8	Stealth
9	Protection
10	Investigation
11	Subterfuge
12	Konst och Underhållning
13	Politik
14	Media
15	Ockult
16	Universitet
17	Kyrkan
18	Polis
\.


--
-- Name: players_specialization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_specialization_id_seq', 18, true);


--
-- Data for Name: players_statusassignment; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_statusassignment (id, status, assigner_id, session_id, target_id) FROM stdin;
\.


--
-- Name: players_statusassignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_statusassignment_id_seq', 12, true);


--
-- Data for Name: players_title; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_title (id, name) FROM stdin;
1	Furste
2	Seneskalk
3	Sheriff
4	Fiskal
5	Jägare
6	Harpya
7	Elysiemästare
8	Domänägare
9	Primogen
\.


--
-- Data for Name: players_title_action_options; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_title_action_options (id, title_id, actionoption_id) FROM stdin;
28	1	6
29	2	16
30	3	8
31	3	9
32	4	10
33	6	18
34	7	11
35	9	12
36	9	13
\.


--
-- Name: players_title_action_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_title_action_options_id_seq', 36, true);


--
-- Name: players_title_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_title_id_seq', 9, true);


--
-- Data for Name: players_weapon; Type: TABLE DATA; Schema: public; Owner: felicia
--

COPY players_weapon (id, name, mod, damage_type, assets, ranged) FROM stdin;
1	Baseball bat	5	bash	1	f
2	Knife	3	lethal	1	f
3	Sword	5	lethal	2	f
4	Lt Pistol	6	bash	1	t
5	Hv Pistol	7	bash	2	t
6	SMG	8	bash	2	t
7	Assault Rifle	10	bash	3	t
8	Explosives	0	aggrevated	2	f
\.


--
-- Name: players_weapon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: felicia
--

SELECT pg_catalog.setval('players_weapon_id_seq', 8, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags_user_id_537f77a7_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_537f77a7_uniq UNIQUE (user_id, comment_id, flag);


--
-- Name: django_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: players_action_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_action
    ADD CONSTRAINT players_action_pkey PRIMARY KEY (id);


--
-- Name: players_actionoption_action_types_actionoption_id_11676176_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_actionoption_action_types
    ADD CONSTRAINT players_actionoption_action_types_actionoption_id_11676176_uniq UNIQUE (actionoption_id, actiontype_id);


--
-- Name: players_actionoption_action_types_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_actionoption_action_types
    ADD CONSTRAINT players_actionoption_action_types_pkey PRIMARY KEY (id);


--
-- Name: players_actionoption_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_actionoption
    ADD CONSTRAINT players_actionoption_pkey PRIMARY KEY (id);


--
-- Name: players_actiontype_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_actiontype
    ADD CONSTRAINT players_actiontype_pkey PRIMARY KEY (id);


--
-- Name: players_activedisciplines_di_activedisciplines_id_e16d00bd_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_activedisciplines_disciplines
    ADD CONSTRAINT players_activedisciplines_di_activedisciplines_id_e16d00bd_uniq UNIQUE (activedisciplines_id, discipline_id);


--
-- Name: players_activedisciplines_disciplines_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_activedisciplines_disciplines
    ADD CONSTRAINT players_activedisciplines_disciplines_pkey PRIMARY KEY (id);


--
-- Name: players_activedisciplines_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_activedisciplines
    ADD CONSTRAINT players_activedisciplines_pkey PRIMARY KEY (id);


--
-- Name: players_advantage_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_advantage
    ADD CONSTRAINT players_advantage_pkey PRIMARY KEY (id);


--
-- Name: players_advantagerating_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_advantagerating
    ADD CONSTRAINT players_advantagerating_pkey PRIMARY KEY (id);


--
-- Name: players_age_action_options_age_id_45add013_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_age_action_options
    ADD CONSTRAINT players_age_action_options_age_id_45add013_uniq UNIQUE (age_id, actionoption_id);


--
-- Name: players_age_action_options_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_age_action_options
    ADD CONSTRAINT players_age_action_options_pkey PRIMARY KEY (id);


--
-- Name: players_age_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_age
    ADD CONSTRAINT players_age_pkey PRIMARY KEY (id);


--
-- Name: players_aidaction_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_aidaction
    ADD CONSTRAINT players_aidaction_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_assignxp_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_assignxp
    ADD CONSTRAINT players_assignxp_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_attribute
    ADD CONSTRAINT players_attribute_pkey PRIMARY KEY (id);


--
-- Name: players_attributerating_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_attributerating
    ADD CONSTRAINT players_attributerating_pkey PRIMARY KEY (id);


--
-- Name: players_boon_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_boon
    ADD CONSTRAINT players_boon_pkey PRIMARY KEY (id);


--
-- Name: players_canonfact_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_canonfact
    ADD CONSTRAINT players_canonfact_pkey PRIMARY KEY (id);


--
-- Name: players_changegoal_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_changegoal
    ADD CONSTRAINT players_changegoal_pkey PRIMARY KEY (id);


--
-- Name: players_character_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character
    ADD CONSTRAINT players_character_pkey PRIMARY KEY (id);


--
-- Name: players_character_rituals_character_id_c87305d6_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character_rituals
    ADD CONSTRAINT players_character_rituals_character_id_c87305d6_uniq UNIQUE (character_id, ritualrating_id);


--
-- Name: players_character_rituals_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character_rituals
    ADD CONSTRAINT players_character_rituals_pkey PRIMARY KEY (id);


--
-- Name: players_character_specializations_character_id_76884bea_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character_specializations
    ADD CONSTRAINT players_character_specializations_character_id_76884bea_uniq UNIQUE (character_id, specialization_id);


--
-- Name: players_character_specializations_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character_specializations
    ADD CONSTRAINT players_character_specializations_pkey PRIMARY KEY (id);


--
-- Name: players_character_titles_character_id_a52e165c_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character_titles
    ADD CONSTRAINT players_character_titles_character_id_a52e165c_uniq UNIQUE (character_id, title_id);


--
-- Name: players_character_titles_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character_titles
    ADD CONSTRAINT players_character_titles_pkey PRIMARY KEY (id);


--
-- Name: players_character_user_id_key; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character
    ADD CONSTRAINT players_character_user_id_key UNIQUE (user_id);


--
-- Name: players_clan_clan_disciplines_clan_id_f86ad4e4_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_clan_clan_disciplines
    ADD CONSTRAINT players_clan_clan_disciplines_clan_id_f86ad4e4_uniq UNIQUE (clan_id, discipline_id);


--
-- Name: players_clan_clan_disciplines_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_clan_clan_disciplines
    ADD CONSTRAINT players_clan_clan_disciplines_pkey PRIMARY KEY (id);


--
-- Name: players_clan_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_clan
    ADD CONSTRAINT players_clan_pkey PRIMARY KEY (id);


--
-- Name: players_conservedomain_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_conservedomain
    ADD CONSTRAINT players_conservedomain_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_conserveinfluence_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_conserveinfluence
    ADD CONSTRAINT players_conserveinfluence_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_discipline_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_discipline
    ADD CONSTRAINT players_discipline_pkey PRIMARY KEY (id);


--
-- Name: players_disciplinerating_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_disciplinerating
    ADD CONSTRAINT players_disciplinerating_pkey PRIMARY KEY (id);


--
-- Name: players_domain_allowed_domain_id_4d2dec81_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_domain_allowed
    ADD CONSTRAINT players_domain_allowed_domain_id_4d2dec81_uniq UNIQUE (domain_id, character_id);


--
-- Name: players_domain_allowed_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_domain_allowed
    ADD CONSTRAINT players_domain_allowed_pkey PRIMARY KEY (id);


--
-- Name: players_domain_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_domain
    ADD CONSTRAINT players_domain_pkey PRIMARY KEY (id);


--
-- Name: players_domain_place_domain_id_822ce586_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_domain_place
    ADD CONSTRAINT players_domain_place_domain_id_822ce586_uniq UNIQUE (domain_id, place_id);


--
-- Name: players_domain_place_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_domain_place
    ADD CONSTRAINT players_domain_place_pkey PRIMARY KEY (id);


--
-- Name: players_domain_population_domain_id_40cbb5f7_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_domain_population
    ADD CONSTRAINT players_domain_population_domain_id_40cbb5f7_uniq UNIQUE (domain_id, population_id);


--
-- Name: players_domain_population_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_domain_population
    ADD CONSTRAINT players_domain_population_pkey PRIMARY KEY (id);


--
-- Name: players_elderpower_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_elderpower
    ADD CONSTRAINT players_elderpower_pkey PRIMARY KEY (id);


--
-- Name: players_equipment_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_equipment
    ADD CONSTRAINT players_equipment_pkey PRIMARY KEY (id);


--
-- Name: players_eventreport_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_eventreport
    ADD CONSTRAINT players_eventreport_pkey PRIMARY KEY (id);


--
-- Name: players_expadvantagespending_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_expadvantagespending
    ADD CONSTRAINT players_expadvantagespending_pkey PRIMARY KEY (id);


--
-- Name: players_expattributespending_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_expattributespending
    ADD CONSTRAINT players_expattributespending_pkey PRIMARY KEY (id);


--
-- Name: players_expdisciplinespending_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_expdisciplinespending
    ADD CONSTRAINT players_expdisciplinespending_pkey PRIMARY KEY (id);


--
-- Name: players_feeding_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_feeding
    ADD CONSTRAINT players_feeding_pkey PRIMARY KEY (id);


--
-- Name: players_ghoul_hook_id_key; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ghoul
    ADD CONSTRAINT players_ghoul_hook_id_key UNIQUE (hook_id);


--
-- Name: players_ghoul_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ghoul
    ADD CONSTRAINT players_ghoul_pkey PRIMARY KEY (id);


--
-- Name: players_ghoul_specializations_ghoul_id_1b4bd0df_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ghoul_specializations
    ADD CONSTRAINT players_ghoul_specializations_ghoul_id_1b4bd0df_uniq UNIQUE (ghoul_id, specialization_id);


--
-- Name: players_ghoul_specializations_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ghoul_specializations
    ADD CONSTRAINT players_ghoul_specializations_pkey PRIMARY KEY (id);


--
-- Name: players_ghoulaidaction_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ghoulaidaction
    ADD CONSTRAINT players_ghoulaidaction_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_ghouldisciplinerating_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ghouldisciplinerating
    ADD CONSTRAINT players_ghouldisciplinerating_pkey PRIMARY KEY (id);


--
-- Name: players_goal_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_goal
    ADD CONSTRAINT players_goal_pkey PRIMARY KEY (id);


--
-- Name: players_healingreport_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_healingreport
    ADD CONSTRAINT players_healingreport_pkey PRIMARY KEY (id);


--
-- Name: players_hook_attributes_hook_id_74bbe752_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_hook_aspects
    ADD CONSTRAINT players_hook_attributes_hook_id_74bbe752_uniq UNIQUE (hook_id, aspect_id);


--
-- Name: players_hook_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_hook_aspects
    ADD CONSTRAINT players_hook_attributes_pkey PRIMARY KEY (id);


--
-- Name: players_hook_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_hook
    ADD CONSTRAINT players_hook_pkey PRIMARY KEY (id);


--
-- Name: players_hookattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_aspect
    ADD CONSTRAINT players_hookattribute_pkey PRIMARY KEY (id);


--
-- Name: players_influence_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_influence
    ADD CONSTRAINT players_influence_pkey PRIMARY KEY (id);


--
-- Name: players_influencedestroy_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_influencedestroy
    ADD CONSTRAINT players_influencedestroy_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_influencerating_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_influencerating
    ADD CONSTRAINT players_influencerating_pkey PRIMARY KEY (id);


--
-- Name: players_influencesteal_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_influencesteal
    ADD CONSTRAINT players_influencesteal_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_influencewant_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_influencewant
    ADD CONSTRAINT players_influencewant_pkey PRIMARY KEY (id);


--
-- Name: players_investequipment_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investequipment
    ADD CONSTRAINT players_investequipment_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_investghoul_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investghoul
    ADD CONSTRAINT players_investghoul_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_investhaven_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investhaven
    ADD CONSTRAINT players_investhaven_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_investherd_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investherd
    ADD CONSTRAINT players_investherd_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_investigatecharacterdowntimeactions_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investigatecharacterdowntimeactions
    ADD CONSTRAINT players_investigatecharacterdowntimeactions_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_investigatecharacterinfluence_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investigatecharacterinfluence
    ADD CONSTRAINT players_investigatecharacterinfluence_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_investigatecharacterresources_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investigatecharacterresources
    ADD CONSTRAINT players_investigatecharacterresources_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_investigatecounterspionage_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investigatecounterspionage
    ADD CONSTRAINT players_investigatecounterspionage_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_investigateinfluence_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investigateinfluence
    ADD CONSTRAINT players_investigateinfluence_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_investigatephenomenon_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investigatephenomenon
    ADD CONSTRAINT players_investigatephenomenon_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_investweapon_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investweapon
    ADD CONSTRAINT players_investweapon_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_keepersquestion_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_keepersquestion
    ADD CONSTRAINT players_keepersquestion_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_learnadvantage_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_learnadvantage
    ADD CONSTRAINT players_learnadvantage_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_learnattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_learnattribute
    ADD CONSTRAINT players_learnattribute_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_learndiscipline_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_learndiscipline
    ADD CONSTRAINT players_learndiscipline_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_learnspecialization_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_learnspecialization
    ADD CONSTRAINT players_learnspecialization_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_losthook_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_losthook
    ADD CONSTRAINT players_losthook_pkey PRIMARY KEY (id);


--
-- Name: players_mentorattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_mentorattribute
    ADD CONSTRAINT players_mentorattribute_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_mentordiscipline_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_mentordiscipline
    ADD CONSTRAINT players_mentordiscipline_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_mentorspecialization_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_mentorspecialization
    ADD CONSTRAINT players_mentorspecialization_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_nature_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_nature
    ADD CONSTRAINT players_nature_pkey PRIMARY KEY (id);


--
-- Name: players_neglectdomain_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_neglectdomain
    ADD CONSTRAINT players_neglectdomain_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_patroldomain_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_patroldomain
    ADD CONSTRAINT players_patroldomain_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_place_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_place
    ADD CONSTRAINT players_place_pkey PRIMARY KEY (id);


--
-- Name: players_politicalfaction_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_politicalfaction
    ADD CONSTRAINT players_politicalfaction_pkey PRIMARY KEY (id);


--
-- Name: players_population_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_population
    ADD CONSTRAINT players_population_pkey PRIMARY KEY (id);


--
-- Name: players_primogensaidaction_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_primogensaidaction
    ADD CONSTRAINT players_primogensaidaction_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_primogensquestion_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_primogensquestion
    ADD CONSTRAINT players_primogensquestion_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_pronoun_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_pronoun
    ADD CONSTRAINT players_pronoun_pkey PRIMARY KEY (id);


--
-- Name: players_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_relationship
    ADD CONSTRAINT players_relationship_pkey PRIMARY KEY (id);


--
-- Name: players_rest_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_rest
    ADD CONSTRAINT players_rest_pkey PRIMARY KEY (action_ptr_id);


--
-- Name: players_ritual_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ritual
    ADD CONSTRAINT players_ritual_pkey PRIMARY KEY (id);


--
-- Name: players_ritualrating_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ritualrating
    ADD CONSTRAINT players_ritualrating_pkey PRIMARY KEY (id);


--
-- Name: players_rumor_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_rumor
    ADD CONSTRAINT players_rumor_pkey PRIMARY KEY (id);


--
-- Name: players_rumor_recipients_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_rumor_recipients
    ADD CONSTRAINT players_rumor_recipients_pkey PRIMARY KEY (id);


--
-- Name: players_rumor_recipients_rumor_id_75502ec7_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_rumor_recipients
    ADD CONSTRAINT players_rumor_recipients_rumor_id_75502ec7_uniq UNIQUE (rumor_id, character_id);


--
-- Name: players_season_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_season
    ADD CONSTRAINT players_season_pkey PRIMARY KEY (id);


--
-- Name: players_session_feeding_domains_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_session_feeding_domains
    ADD CONSTRAINT players_session_feeding_domains_pkey PRIMARY KEY (id);


--
-- Name: players_session_feeding_domains_session_id_c88c02fd_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_session_feeding_domains
    ADD CONSTRAINT players_session_feeding_domains_session_id_c88c02fd_uniq UNIQUE (session_id, domain_id);


--
-- Name: players_session_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_session
    ADD CONSTRAINT players_session_pkey PRIMARY KEY (id);


--
-- Name: players_specialization_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_specialization
    ADD CONSTRAINT players_specialization_pkey PRIMARY KEY (id);


--
-- Name: players_statusassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_statusassignment
    ADD CONSTRAINT players_statusassignment_pkey PRIMARY KEY (id);


--
-- Name: players_title_action_options_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_title_action_options
    ADD CONSTRAINT players_title_action_options_pkey PRIMARY KEY (id);


--
-- Name: players_title_action_options_title_id_bed66b7f_uniq; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_title_action_options
    ADD CONSTRAINT players_title_action_options_title_id_bed66b7f_uniq UNIQUE (title_id, actionoption_id);


--
-- Name: players_title_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_title
    ADD CONSTRAINT players_title_pkey PRIMARY KEY (id);


--
-- Name: players_weapon_pkey; Type: CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_weapon
    ADD CONSTRAINT players_weapon_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_comment_flags_327a6c43; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX django_comment_flags_327a6c43 ON django_comment_flags USING btree (flag);


--
-- Name: django_comment_flags_69b97d17; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX django_comment_flags_69b97d17 ON django_comment_flags USING btree (comment_id);


--
-- Name: django_comment_flags_e8701ad4; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX django_comment_flags_e8701ad4 ON django_comment_flags USING btree (user_id);


--
-- Name: django_comment_flags_flag_8b141fcb_like; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX django_comment_flags_flag_8b141fcb_like ON django_comment_flags USING btree (flag varchar_pattern_ops);


--
-- Name: django_comments_417f1b1c; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX django_comments_417f1b1c ON django_comments USING btree (content_type_id);


--
-- Name: django_comments_9365d6e7; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX django_comments_9365d6e7 ON django_comments USING btree (site_id);


--
-- Name: django_comments_e8701ad4; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX django_comments_e8701ad4 ON django_comments USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX django_site_domain_a2e37b91_like ON django_site USING btree (domain varchar_pattern_ops);


--
-- Name: players_action_5e5abda3; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_action_5e5abda3 ON players_action USING btree (action_type_id);


--
-- Name: players_action_7fc8ef54; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_action_7fc8ef54 ON players_action USING btree (session_id);


--
-- Name: players_action_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_action_bf21153f ON players_action USING btree (character_id);


--
-- Name: players_actionoption_action_types_5f8543b0; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_actionoption_action_types_5f8543b0 ON players_actionoption_action_types USING btree (actiontype_id);


--
-- Name: players_actionoption_action_types_9d630b11; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_actionoption_action_types_9d630b11 ON players_actionoption_action_types USING btree (actionoption_id);


--
-- Name: players_activedisciplines_7fc8ef54; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_activedisciplines_7fc8ef54 ON players_activedisciplines USING btree (session_id);


--
-- Name: players_activedisciplines_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_activedisciplines_bf21153f ON players_activedisciplines USING btree (character_id);


--
-- Name: players_activedisciplines_disciplines_9c1457df; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_activedisciplines_disciplines_9c1457df ON players_activedisciplines_disciplines USING btree (discipline_id);


--
-- Name: players_activedisciplines_disciplines_b49c551a; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_activedisciplines_disciplines_b49c551a ON players_activedisciplines_disciplines USING btree (activedisciplines_id);


--
-- Name: players_advantagerating_2801bd5e; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_advantagerating_2801bd5e ON players_advantagerating USING btree (advantage_id);


--
-- Name: players_advantagerating_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_advantagerating_bf21153f ON players_advantagerating USING btree (character_id);


--
-- Name: players_age_action_options_9d630b11; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_age_action_options_9d630b11 ON players_age_action_options USING btree (actionoption_id);


--
-- Name: players_age_action_options_a3b35f2c; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_age_action_options_a3b35f2c ON players_age_action_options USING btree (age_id);


--
-- Name: players_aidaction_1113377a; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_aidaction_1113377a ON players_aidaction USING btree (helpee_id);


--
-- Name: players_aidaction_909acdf2; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_aidaction_909acdf2 ON players_aidaction USING btree (action_id);


--
-- Name: players_assignxp_55e2df16; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_assignxp_55e2df16 ON players_assignxp USING btree (target_id);


--
-- Name: players_attributerating_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_attributerating_bf21153f ON players_attributerating USING btree (character_id);


--
-- Name: players_attributerating_e582ed73; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_attributerating_e582ed73 ON players_attributerating USING btree (attribute_id);


--
-- Name: players_boon_942690db; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_boon_942690db ON players_boon USING btree (signer_id);


--
-- Name: players_changegoal_7fc8ef54; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_changegoal_7fc8ef54 ON players_changegoal USING btree (session_id);


--
-- Name: players_changegoal_b730706b; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_changegoal_b730706b ON players_changegoal USING btree (goal_id);


--
-- Name: players_changegoal_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_changegoal_bf21153f ON players_changegoal USING btree (character_id);


--
-- Name: players_character_0f378d91; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_character_0f378d91 ON players_character USING btree (clan_id);


--
-- Name: players_character_5c0ad424; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_character_5c0ad424 ON players_character USING btree (nature_id);


--
-- Name: players_character_a3b35f2c; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_character_a3b35f2c ON players_character USING btree (age_id);


--
-- Name: players_character_c6923410; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_character_c6923410 ON players_character USING btree (sire_id);


--
-- Name: players_character_cc4165e1; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_character_cc4165e1 ON players_character USING btree (haven_domain_id);


--
-- Name: players_character_d0137629; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_character_d0137629 ON players_character USING btree (political_faction_id);


--
-- Name: players_character_d954f9ce; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_character_d954f9ce ON players_character USING btree (pronoun_id);


--
-- Name: players_character_rituals_1d434e81; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_character_rituals_1d434e81 ON players_character_rituals USING btree (ritualrating_id);


--
-- Name: players_character_rituals_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_character_rituals_bf21153f ON players_character_rituals USING btree (character_id);


--
-- Name: players_character_specializations_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_character_specializations_bf21153f ON players_character_specializations USING btree (character_id);


--
-- Name: players_character_specializations_dbd0539b; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_character_specializations_dbd0539b ON players_character_specializations USING btree (specialization_id);


--
-- Name: players_character_titles_1f38f0e7; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_character_titles_1f38f0e7 ON players_character_titles USING btree (title_id);


--
-- Name: players_character_titles_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_character_titles_bf21153f ON players_character_titles USING btree (character_id);


--
-- Name: players_clan_clan_disciplines_0f378d91; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_clan_clan_disciplines_0f378d91 ON players_clan_clan_disciplines USING btree (clan_id);


--
-- Name: players_clan_clan_disciplines_2a73e9e7; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_clan_clan_disciplines_2a73e9e7 ON players_clan_clan_disciplines USING btree (discipline_id);


--
-- Name: players_conservedomain_662cbf12; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_conservedomain_662cbf12 ON players_conservedomain USING btree (domain_id);


--
-- Name: players_conserveinfluence_854e827a; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_conserveinfluence_854e827a ON players_conserveinfluence USING btree (influence_id);


--
-- Name: players_disciplinerating_2a73e9e7; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_disciplinerating_2a73e9e7 ON players_disciplinerating USING btree (discipline_id);


--
-- Name: players_disciplinerating_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_disciplinerating_bf21153f ON players_disciplinerating USING btree (character_id);


--
-- Name: players_domain_5e7b1936; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_domain_5e7b1936 ON players_domain USING btree (owner_id);


--
-- Name: players_domain_allowed_662cbf12; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_domain_allowed_662cbf12 ON players_domain_allowed USING btree (domain_id);


--
-- Name: players_domain_allowed_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_domain_allowed_bf21153f ON players_domain_allowed USING btree (character_id);


--
-- Name: players_domain_place_62becf4a; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_domain_place_62becf4a ON players_domain_place USING btree (place_id);


--
-- Name: players_domain_place_662cbf12; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_domain_place_662cbf12 ON players_domain_place USING btree (domain_id);


--
-- Name: players_domain_population_5cff33ca; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_domain_population_5cff33ca ON players_domain_population USING btree (population_id);


--
-- Name: players_domain_population_662cbf12; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_domain_population_662cbf12 ON players_domain_population USING btree (domain_id);


--
-- Name: players_elderpower_2a73e9e7; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_elderpower_2a73e9e7 ON players_elderpower USING btree (discipline_id);


--
-- Name: players_equipment_5e7b1936; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_equipment_5e7b1936 ON players_equipment USING btree (owner_id);


--
-- Name: players_equipment_dbd0539b; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_equipment_dbd0539b ON players_equipment USING btree (specialization_id);


--
-- Name: players_eventreport_7fc8ef54; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_eventreport_7fc8ef54 ON players_eventreport USING btree (session_id);


--
-- Name: players_eventreport_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_eventreport_bf21153f ON players_eventreport USING btree (character_id);


--
-- Name: players_expadvantagespending_2801bd5e; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_expadvantagespending_2801bd5e ON players_expadvantagespending USING btree (advantage_id);


--
-- Name: players_expadvantagespending_7fc8ef54; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_expadvantagespending_7fc8ef54 ON players_expadvantagespending USING btree (session_id);


--
-- Name: players_expadvantagespending_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_expadvantagespending_bf21153f ON players_expadvantagespending USING btree (character_id);


--
-- Name: players_expattributespending_7fc8ef54; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_expattributespending_7fc8ef54 ON players_expattributespending USING btree (session_id);


--
-- Name: players_expattributespending_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_expattributespending_bf21153f ON players_expattributespending USING btree (character_id);


--
-- Name: players_expattributespending_e582ed73; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_expattributespending_e582ed73 ON players_expattributespending USING btree (attribute_id);


--
-- Name: players_expdisciplinespending_2a73e9e7; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_expdisciplinespending_2a73e9e7 ON players_expdisciplinespending USING btree (discipline_id);


--
-- Name: players_expdisciplinespending_7fc8ef54; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_expdisciplinespending_7fc8ef54 ON players_expdisciplinespending USING btree (session_id);


--
-- Name: players_expdisciplinespending_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_expdisciplinespending_bf21153f ON players_expdisciplinespending USING btree (character_id);


--
-- Name: players_feeding_2a73e9e7; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_feeding_2a73e9e7 ON players_feeding USING btree (discipline_id);


--
-- Name: players_feeding_662cbf12; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_feeding_662cbf12 ON players_feeding USING btree (domain_id);


--
-- Name: players_feeding_7fc8ef54; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_feeding_7fc8ef54 ON players_feeding USING btree (session_id);


--
-- Name: players_feeding_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_feeding_bf21153f ON players_feeding USING btree (character_id);


--
-- Name: players_ghoul_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_ghoul_bf21153f ON players_ghoul USING btree (master_id);


--
-- Name: players_ghoul_specializations_1551bae4; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_ghoul_specializations_1551bae4 ON players_ghoul_specializations USING btree (ghoul_id);


--
-- Name: players_ghoul_specializations_dbd0539b; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_ghoul_specializations_dbd0539b ON players_ghoul_specializations USING btree (specialization_id);


--
-- Name: players_ghoulaidaction_1113377a; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_ghoulaidaction_1113377a ON players_ghoulaidaction USING btree (helpee_id);


--
-- Name: players_ghoulaidaction_1551bae4; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_ghoulaidaction_1551bae4 ON players_ghoulaidaction USING btree (ghoul_id);


--
-- Name: players_ghoulaidaction_909acdf2; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_ghoulaidaction_909acdf2 ON players_ghoulaidaction USING btree (action_id);


--
-- Name: players_ghouldisciplinerating_1551bae4; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_ghouldisciplinerating_1551bae4 ON players_ghouldisciplinerating USING btree (ghoul_id);


--
-- Name: players_ghouldisciplinerating_2a73e9e7; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_ghouldisciplinerating_2a73e9e7 ON players_ghouldisciplinerating USING btree (discipline_id);


--
-- Name: players_goal_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_goal_bf21153f ON players_goal USING btree (character_id);


--
-- Name: players_healingreport_7fc8ef54; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_healingreport_7fc8ef54 ON players_healingreport USING btree (session_id);


--
-- Name: players_healingreport_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_healingreport_bf21153f ON players_healingreport USING btree (character_id);


--
-- Name: players_hook_854e827a; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_hook_854e827a ON players_hook USING btree (influence_id);


--
-- Name: players_hook_90349b61; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_hook_90349b61 ON players_hook USING btree (master_id);


--
-- Name: players_hook_attributes_4c03ac52; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_hook_attributes_4c03ac52 ON players_hook_aspects USING btree (aspect_id);


--
-- Name: players_hook_attributes_c9f8287d; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_hook_attributes_c9f8287d ON players_hook_aspects USING btree (hook_id);


--
-- Name: players_influencedestroy_854e827a; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_influencedestroy_854e827a ON players_influencedestroy USING btree (influence_id);


--
-- Name: players_influencerating_854e827a; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_influencerating_854e827a ON players_influencerating USING btree (influence_id);


--
-- Name: players_influencerating_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_influencerating_bf21153f ON players_influencerating USING btree (character_id);


--
-- Name: players_influencesteal_854e827a; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_influencesteal_854e827a ON players_influencesteal USING btree (influence_id);


--
-- Name: players_influencewant_854e827a; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_influencewant_854e827a ON players_influencewant USING btree (influence_id);


--
-- Name: players_influencewant_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_influencewant_bf21153f ON players_influencewant USING btree (character_id);


--
-- Name: players_investequipment_dbd0539b; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_investequipment_dbd0539b ON players_investequipment USING btree (specialization_id);


--
-- Name: players_investghoul_2a73e9e7; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_investghoul_2a73e9e7 ON players_investghoul USING btree (discipline_id);


--
-- Name: players_investghoul_dbd0539b; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_investghoul_dbd0539b ON players_investghoul USING btree (specialization_id);


--
-- Name: players_investigatecharacterdowntimeactions_55e2df16; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_investigatecharacterdowntimeactions_55e2df16 ON players_investigatecharacterdowntimeactions USING btree (target_id);


--
-- Name: players_investigatecharacterinfluence_55e2df16; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_investigatecharacterinfluence_55e2df16 ON players_investigatecharacterinfluence USING btree (target_id);


--
-- Name: players_investigatecharacterresources_55e2df16; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_investigatecharacterresources_55e2df16 ON players_investigatecharacterresources USING btree (target_id);


--
-- Name: players_investigateinfluence_854e827a; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_investigateinfluence_854e827a ON players_investigateinfluence USING btree (influence_id);


--
-- Name: players_keepersquestion_55e2df16; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_keepersquestion_55e2df16 ON players_keepersquestion USING btree (target_id);


--
-- Name: players_learnadvantage_2801bd5e; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_learnadvantage_2801bd5e ON players_learnadvantage USING btree (advantage_id);


--
-- Name: players_learnattribute_68153311; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_learnattribute_68153311 ON players_learnattribute USING btree (trainer_id);


--
-- Name: players_learnattribute_e582ed73; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_learnattribute_e582ed73 ON players_learnattribute USING btree (attribute_id);


--
-- Name: players_learndiscipline_2a73e9e7; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_learndiscipline_2a73e9e7 ON players_learndiscipline USING btree (discipline_id);


--
-- Name: players_learndiscipline_68153311; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_learndiscipline_68153311 ON players_learndiscipline USING btree (trainer_id);


--
-- Name: players_learnspecialization_5ec98502; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_learnspecialization_5ec98502 ON players_learnspecialization USING btree (old_specialization_id);


--
-- Name: players_learnspecialization_66fb311d; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_learnspecialization_66fb311d ON players_learnspecialization USING btree (new_specialization_id);


--
-- Name: players_learnspecialization_68153311; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_learnspecialization_68153311 ON players_learnspecialization USING btree (trainer_id);


--
-- Name: players_losthook_7fc8ef54; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_losthook_7fc8ef54 ON players_losthook USING btree (session_id);


--
-- Name: players_losthook_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_losthook_bf21153f ON players_losthook USING btree (character_id);


--
-- Name: players_losthook_c9f8287d; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_losthook_c9f8287d ON players_losthook USING btree (hook_id);


--
-- Name: players_mentorattribute_30a811f6; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_mentorattribute_30a811f6 ON players_mentorattribute USING btree (student_id);


--
-- Name: players_mentorattribute_e582ed73; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_mentorattribute_e582ed73 ON players_mentorattribute USING btree (attribute_id);


--
-- Name: players_mentordiscipline_2a73e9e7; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_mentordiscipline_2a73e9e7 ON players_mentordiscipline USING btree (discipline_id);


--
-- Name: players_mentordiscipline_30a811f6; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_mentordiscipline_30a811f6 ON players_mentordiscipline USING btree (student_id);


--
-- Name: players_mentorspecialization_30a811f6; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_mentorspecialization_30a811f6 ON players_mentorspecialization USING btree (student_id);


--
-- Name: players_mentorspecialization_dbd0539b; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_mentorspecialization_dbd0539b ON players_mentorspecialization USING btree (specialization_id);


--
-- Name: players_neglectdomain_662cbf12; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_neglectdomain_662cbf12 ON players_neglectdomain USING btree (domain_id);


--
-- Name: players_patroldomain_662cbf12; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_patroldomain_662cbf12 ON players_patroldomain USING btree (domain_id);


--
-- Name: players_primogensaidaction_1113377a; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_primogensaidaction_1113377a ON players_primogensaidaction USING btree (helpee_id);


--
-- Name: players_primogensaidaction_909acdf2; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_primogensaidaction_909acdf2 ON players_primogensaidaction USING btree (action_id);


--
-- Name: players_primogensquestion_55e2df16; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_primogensquestion_55e2df16 ON players_primogensquestion USING btree (target_id);


--
-- Name: players_relationship_1f18b60b; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_relationship_1f18b60b ON players_relationship USING btree (other_character_id);


--
-- Name: players_relationship_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_relationship_bf21153f ON players_relationship USING btree (character_id);


--
-- Name: players_ritualrating_9c3d4e6b; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_ritualrating_9c3d4e6b ON players_ritualrating USING btree (ritual_id);


--
-- Name: players_rumor_7fc8ef54; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_rumor_7fc8ef54 ON players_rumor USING btree (session_id);


--
-- Name: players_rumor_854e827a; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_rumor_854e827a ON players_rumor USING btree (influence_id);


--
-- Name: players_rumor_e8fc87ca; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_rumor_e8fc87ca ON players_rumor USING btree ("canonFact_id");


--
-- Name: players_rumor_recipients_0de090c7; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_rumor_recipients_0de090c7 ON players_rumor_recipients USING btree (rumor_id);


--
-- Name: players_rumor_recipients_bf21153f; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_rumor_recipients_bf21153f ON players_rumor_recipients USING btree (character_id);


--
-- Name: players_session_b11701f0; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_session_b11701f0 ON players_session USING btree (season_id);


--
-- Name: players_session_dae28fe9; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_session_dae28fe9 ON players_session USING btree (action_set_id);


--
-- Name: players_session_f69c16f1; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_session_f69c16f1 ON players_session USING btree (previous_id);


--
-- Name: players_session_feeding_domains_662cbf12; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_session_feeding_domains_662cbf12 ON players_session_feeding_domains USING btree (domain_id);


--
-- Name: players_session_feeding_domains_7fc8ef54; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_session_feeding_domains_7fc8ef54 ON players_session_feeding_domains USING btree (session_id);


--
-- Name: players_statusassignment_55e2df16; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_statusassignment_55e2df16 ON players_statusassignment USING btree (target_id);


--
-- Name: players_statusassignment_7fc8ef54; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_statusassignment_7fc8ef54 ON players_statusassignment USING btree (session_id);


--
-- Name: players_statusassignment_a5910953; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_statusassignment_a5910953 ON players_statusassignment USING btree (assigner_id);


--
-- Name: players_title_action_options_1f38f0e7; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_title_action_options_1f38f0e7 ON players_title_action_options USING btree (title_id);


--
-- Name: players_title_action_options_9d630b11; Type: INDEX; Schema: public; Owner: felicia
--

CREATE INDEX players_title_action_options_9d630b11 ON players_title_action_options USING btree (actionoption_id);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comme_content_type_id_c4afe962_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comme_content_type_id_c4afe962_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_flags_comment_id_d8054933_fk_django_comments_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_comment_id_d8054933_fk_django_comments_id FOREIGN KEY (comment_id) REFERENCES django_comments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_flags_user_id_f3f81f0a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_f3f81f0a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments_site_id_9dcf666e_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_site_id_9dcf666e_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments_user_id_a0a440a1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_user_id_a0a440a1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: p_activedisciplines_id_b48ca3b7_fk_players_activedisciplines_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_activedisciplines_disciplines
    ADD CONSTRAINT p_activedisciplines_id_b48ca3b7_fk_players_activedisciplines_id FOREIGN KEY (activedisciplines_id) REFERENCES players_activedisciplines(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pl_political_faction_id_526718df_fk_players_politicalfaction_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character
    ADD CONSTRAINT pl_political_faction_id_526718df_fk_players_politicalfaction_id FOREIGN KEY (political_faction_id) REFERENCES players_politicalfaction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pla_new_specialization_id_b83b4ec9_fk_players_specialization_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_learnspecialization
    ADD CONSTRAINT pla_new_specialization_id_b83b4ec9_fk_players_specialization_id FOREIGN KEY (new_specialization_id) REFERENCES players_specialization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pla_old_specialization_id_17e1d703_fk_players_specialization_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_learnspecialization
    ADD CONSTRAINT pla_old_specialization_id_17e1d703_fk_players_specialization_id FOREIGN KEY (old_specialization_id) REFERENCES players_specialization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_act_actionoption_id_4200e103_fk_players_actionoption_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_actionoption_action_types
    ADD CONSTRAINT players_act_actionoption_id_4200e103_fk_players_actionoption_id FOREIGN KEY (actionoption_id) REFERENCES players_actionoption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_action_action_type_id_4090d73c_fk_players_actiontype_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_action
    ADD CONSTRAINT players_action_action_type_id_4090d73c_fk_players_actiontype_id FOREIGN KEY (action_type_id) REFERENCES players_actiontype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_action_character_id_cfc03c09_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_action
    ADD CONSTRAINT players_action_character_id_cfc03c09_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_action_session_id_e4aa788d_fk_players_session_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_action
    ADD CONSTRAINT players_action_session_id_e4aa788d_fk_players_session_id FOREIGN KEY (session_id) REFERENCES players_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_actiono_actiontype_id_57f52d06_fk_players_actiontype_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_actionoption_action_types
    ADD CONSTRAINT players_actiono_actiontype_id_57f52d06_fk_players_actiontype_id FOREIGN KEY (actiontype_id) REFERENCES players_actiontype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_actived_discipline_id_24dd7e90_fk_players_discipline_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_activedisciplines_disciplines
    ADD CONSTRAINT players_actived_discipline_id_24dd7e90_fk_players_discipline_id FOREIGN KEY (discipline_id) REFERENCES players_discipline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_activedis_character_id_4825ed5d_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_activedisciplines
    ADD CONSTRAINT players_activedis_character_id_4825ed5d_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_activediscipl_session_id_e1d70e70_fk_players_session_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_activedisciplines
    ADD CONSTRAINT players_activediscipl_session_id_e1d70e70_fk_players_session_id FOREIGN KEY (session_id) REFERENCES players_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_advantage_advantage_id_6359a4c1_fk_players_advantage_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_advantagerating
    ADD CONSTRAINT players_advantage_advantage_id_6359a4c1_fk_players_advantage_id FOREIGN KEY (advantage_id) REFERENCES players_advantage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_advantage_character_id_df0e2609_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_advantagerating
    ADD CONSTRAINT players_advantage_character_id_df0e2609_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_age_action_options_age_id_b3997ca3_fk_players_age_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_age_action_options
    ADD CONSTRAINT players_age_action_options_age_id_b3997ca3_fk_players_age_id FOREIGN KEY (age_id) REFERENCES players_age(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_age_actionoption_id_4af6b3b1_fk_players_actionoption_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_age_action_options
    ADD CONSTRAINT players_age_actionoption_id_4af6b3b1_fk_players_actionoption_id FOREIGN KEY (actionoption_id) REFERENCES players_actionoption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_aidaction_action_id_ca2ce2ef_fk_players_actiontype_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_aidaction
    ADD CONSTRAINT players_aidaction_action_id_ca2ce2ef_fk_players_actiontype_id FOREIGN KEY (action_id) REFERENCES players_actiontype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_aidaction_action_ptr_id_cdbcffde_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_aidaction
    ADD CONSTRAINT players_aidaction_action_ptr_id_cdbcffde_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_aidaction_helpee_id_2314a919_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_aidaction
    ADD CONSTRAINT players_aidaction_helpee_id_2314a919_fk_players_character_id FOREIGN KEY (helpee_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_assignxp_action_ptr_id_cd973d66_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_assignxp
    ADD CONSTRAINT players_assignxp_action_ptr_id_cd973d66_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_assignxp_target_id_892ef165_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_assignxp
    ADD CONSTRAINT players_assignxp_target_id_892ef165_fk_players_character_id FOREIGN KEY (target_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_attribute_attribute_id_8e82da12_fk_players_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_attributerating
    ADD CONSTRAINT players_attribute_attribute_id_8e82da12_fk_players_attribute_id FOREIGN KEY (attribute_id) REFERENCES players_attribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_attribute_character_id_e7b2a557_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_attributerating
    ADD CONSTRAINT players_attribute_character_id_e7b2a557_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_boon_signer_id_8a515905_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_boon
    ADD CONSTRAINT players_boon_signer_id_8a515905_fk_players_character_id FOREIGN KEY (signer_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_cha_ritualrating_id_2e0ace0f_fk_players_ritualrating_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character_rituals
    ADD CONSTRAINT players_cha_ritualrating_id_2e0ace0f_fk_players_ritualrating_id FOREIGN KEY (ritualrating_id) REFERENCES players_ritualrating(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_changegoa_character_id_0131a35f_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_changegoal
    ADD CONSTRAINT players_changegoa_character_id_0131a35f_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_changegoal_goal_id_3bca70a1_fk_players_goal_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_changegoal
    ADD CONSTRAINT players_changegoal_goal_id_3bca70a1_fk_players_goal_id FOREIGN KEY (goal_id) REFERENCES players_goal(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_changegoal_session_id_cf89eb26_fk_players_session_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_changegoal
    ADD CONSTRAINT players_changegoal_session_id_cf89eb26_fk_players_session_id FOREIGN KEY (session_id) REFERENCES players_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_character_age_id_7b951aa5_fk_players_age_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character
    ADD CONSTRAINT players_character_age_id_7b951aa5_fk_players_age_id FOREIGN KEY (age_id) REFERENCES players_age(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_character_character_id_a157558d_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character_titles
    ADD CONSTRAINT players_character_character_id_a157558d_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_character_character_id_a18bc85d_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character_specializations
    ADD CONSTRAINT players_character_character_id_a18bc85d_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_character_character_id_ee00e868_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character_rituals
    ADD CONSTRAINT players_character_character_id_ee00e868_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_character_clan_id_68f89c19_fk_players_clan_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character
    ADD CONSTRAINT players_character_clan_id_68f89c19_fk_players_clan_id FOREIGN KEY (clan_id) REFERENCES players_clan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_character_haven_domain_id_5e8f4bfe_fk_players_domain_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character
    ADD CONSTRAINT players_character_haven_domain_id_5e8f4bfe_fk_players_domain_id FOREIGN KEY (haven_domain_id) REFERENCES players_domain(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_character_nature_id_a76d49c8_fk_players_nature_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character
    ADD CONSTRAINT players_character_nature_id_a76d49c8_fk_players_nature_id FOREIGN KEY (nature_id) REFERENCES players_nature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_character_pronoun_id_000f5268_fk_players_pronoun_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character
    ADD CONSTRAINT players_character_pronoun_id_000f5268_fk_players_pronoun_id FOREIGN KEY (pronoun_id) REFERENCES players_pronoun(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_character_sire_id_75b4bad6_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character
    ADD CONSTRAINT players_character_sire_id_75b4bad6_fk_players_character_id FOREIGN KEY (sire_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_character_titles_title_id_4a57922c_fk_players_title_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character_titles
    ADD CONSTRAINT players_character_titles_title_id_4a57922c_fk_players_title_id FOREIGN KEY (title_id) REFERENCES players_title(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_character_user_id_928f7374_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character
    ADD CONSTRAINT players_character_user_id_928f7374_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_clan_cl_discipline_id_2a44ed0b_fk_players_discipline_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_clan_clan_disciplines
    ADD CONSTRAINT players_clan_cl_discipline_id_2a44ed0b_fk_players_discipline_id FOREIGN KEY (discipline_id) REFERENCES players_discipline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_clan_clan_disciplin_clan_id_7efe1519_fk_players_clan_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_clan_clan_disciplines
    ADD CONSTRAINT players_clan_clan_disciplin_clan_id_7efe1519_fk_players_clan_id FOREIGN KEY (clan_id) REFERENCES players_clan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_conservedom_action_ptr_id_88ada713_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_conservedomain
    ADD CONSTRAINT players_conservedom_action_ptr_id_88ada713_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_conservedomain_domain_id_79fe72ea_fk_players_domain_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_conservedomain
    ADD CONSTRAINT players_conservedomain_domain_id_79fe72ea_fk_players_domain_id FOREIGN KEY (domain_id) REFERENCES players_domain(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_conservei_influence_id_540d2abe_fk_players_influence_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_conserveinfluence
    ADD CONSTRAINT players_conservei_influence_id_540d2abe_fk_players_influence_id FOREIGN KEY (influence_id) REFERENCES players_influence(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_conserveinf_action_ptr_id_a8e20c8a_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_conserveinfluence
    ADD CONSTRAINT players_conserveinf_action_ptr_id_a8e20c8a_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_discipl_discipline_id_b0e96575_fk_players_discipline_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_disciplinerating
    ADD CONSTRAINT players_discipl_discipline_id_b0e96575_fk_players_discipline_id FOREIGN KEY (discipline_id) REFERENCES players_discipline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_disciplin_character_id_ea794837_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_disciplinerating
    ADD CONSTRAINT players_disciplin_character_id_ea794837_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_domain__population_id_afec57cf_fk_players_population_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_domain_population
    ADD CONSTRAINT players_domain__population_id_afec57cf_fk_players_population_id FOREIGN KEY (population_id) REFERENCES players_population(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_domain_al_character_id_a7b449f3_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_domain_allowed
    ADD CONSTRAINT players_domain_al_character_id_a7b449f3_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_domain_allowed_domain_id_21ac6a57_fk_players_domain_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_domain_allowed
    ADD CONSTRAINT players_domain_allowed_domain_id_21ac6a57_fk_players_domain_id FOREIGN KEY (domain_id) REFERENCES players_domain(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_domain_owner_id_a359418e_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_domain
    ADD CONSTRAINT players_domain_owner_id_a359418e_fk_players_character_id FOREIGN KEY (owner_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_domain_place_domain_id_95a16dcf_fk_players_domain_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_domain_place
    ADD CONSTRAINT players_domain_place_domain_id_95a16dcf_fk_players_domain_id FOREIGN KEY (domain_id) REFERENCES players_domain(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_domain_place_place_id_7c06ab75_fk_players_place_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_domain_place
    ADD CONSTRAINT players_domain_place_place_id_7c06ab75_fk_players_place_id FOREIGN KEY (place_id) REFERENCES players_place(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_domain_populati_domain_id_f154dc88_fk_players_domain_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_domain_population
    ADD CONSTRAINT players_domain_populati_domain_id_f154dc88_fk_players_domain_id FOREIGN KEY (domain_id) REFERENCES players_domain(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_e_discipline_id_99612ca5_fk_players_disciplinerating_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_expdisciplinespending
    ADD CONSTRAINT players_e_discipline_id_99612ca5_fk_players_disciplinerating_id FOREIGN KEY (discipline_id) REFERENCES players_disciplinerating(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_e_discipline_id_be600150_fk_players_disciplinerating_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_elderpower
    ADD CONSTRAINT players_e_discipline_id_be600150_fk_players_disciplinerating_id FOREIGN KEY (discipline_id) REFERENCES players_disciplinerating(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_equipment_owner_id_1f4119e2_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_equipment
    ADD CONSTRAINT players_equipment_owner_id_1f4119e2_fk_players_character_id FOREIGN KEY (owner_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_eventrepo_character_id_5fa10406_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_eventreport
    ADD CONSTRAINT players_eventrepo_character_id_5fa10406_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_eventreport_session_id_76afb951_fk_players_session_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_eventreport
    ADD CONSTRAINT players_eventreport_session_id_76afb951_fk_players_session_id FOREIGN KEY (session_id) REFERENCES players_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_exp_advantage_id_de7b4dac_fk_players_advantagerating_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_expadvantagespending
    ADD CONSTRAINT players_exp_advantage_id_de7b4dac_fk_players_advantagerating_id FOREIGN KEY (advantage_id) REFERENCES players_advantagerating(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_exp_attribute_id_f85998eb_fk_players_attributerating_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_expattributespending
    ADD CONSTRAINT players_exp_attribute_id_f85998eb_fk_players_attributerating_id FOREIGN KEY (attribute_id) REFERENCES players_attributerating(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_expadvant_character_id_b21ca5a6_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_expadvantagespending
    ADD CONSTRAINT players_expadvant_character_id_b21ca5a6_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_expadvantages_session_id_9c1b31d0_fk_players_session_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_expadvantagespending
    ADD CONSTRAINT players_expadvantages_session_id_9c1b31d0_fk_players_session_id FOREIGN KEY (session_id) REFERENCES players_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_expattrib_character_id_b3ec956d_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_expattributespending
    ADD CONSTRAINT players_expattrib_character_id_b3ec956d_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_expattributes_session_id_ad49a955_fk_players_session_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_expattributespending
    ADD CONSTRAINT players_expattributes_session_id_ad49a955_fk_players_session_id FOREIGN KEY (session_id) REFERENCES players_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_expdiscip_character_id_08680c53_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_expdisciplinespending
    ADD CONSTRAINT players_expdiscip_character_id_08680c53_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_expdiscipline_session_id_702da12a_fk_players_session_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_expdisciplinespending
    ADD CONSTRAINT players_expdiscipline_session_id_702da12a_fk_players_session_id FOREIGN KEY (session_id) REFERENCES players_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_feeding_character_id_67870deb_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_feeding
    ADD CONSTRAINT players_feeding_character_id_67870deb_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_feeding_discipline_id_58192c7d_fk_players_discipline_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_feeding
    ADD CONSTRAINT players_feeding_discipline_id_58192c7d_fk_players_discipline_id FOREIGN KEY (discipline_id) REFERENCES players_discipline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_feeding_domain_id_e9955e36_fk_players_domain_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_feeding
    ADD CONSTRAINT players_feeding_domain_id_e9955e36_fk_players_domain_id FOREIGN KEY (domain_id) REFERENCES players_domain(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_feeding_session_id_61c65ee0_fk_players_session_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_feeding
    ADD CONSTRAINT players_feeding_session_id_61c65ee0_fk_players_session_id FOREIGN KEY (session_id) REFERENCES players_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_ghoul_hook_id_7d1be405_fk_players_hook_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ghoul
    ADD CONSTRAINT players_ghoul_hook_id_7d1be405_fk_players_hook_id FOREIGN KEY (hook_id) REFERENCES players_hook(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_ghoul_master_id_c6b7bbba_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ghoul
    ADD CONSTRAINT players_ghoul_master_id_c6b7bbba_fk_players_character_id FOREIGN KEY (master_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_ghoul_specializat_ghoul_id_a44e9b25_fk_players_ghoul_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ghoul_specializations
    ADD CONSTRAINT players_ghoul_specializat_ghoul_id_a44e9b25_fk_players_ghoul_id FOREIGN KEY (ghoul_id) REFERENCES players_ghoul(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_ghoulaidact_action_id_718af2fe_fk_players_actiontype_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ghoulaidaction
    ADD CONSTRAINT players_ghoulaidact_action_id_718af2fe_fk_players_actiontype_id FOREIGN KEY (action_id) REFERENCES players_actiontype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_ghoulaidact_action_ptr_id_ef4f1b55_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ghoulaidaction
    ADD CONSTRAINT players_ghoulaidact_action_ptr_id_ef4f1b55_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_ghoulaidacti_helpee_id_fc27bec8_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ghoulaidaction
    ADD CONSTRAINT players_ghoulaidacti_helpee_id_fc27bec8_fk_players_character_id FOREIGN KEY (helpee_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_ghoulaidaction_ghoul_id_b39cf5dd_fk_players_ghoul_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ghoulaidaction
    ADD CONSTRAINT players_ghoulaidaction_ghoul_id_b39cf5dd_fk_players_ghoul_id FOREIGN KEY (ghoul_id) REFERENCES players_ghoul(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_ghouldi_discipline_id_cc689298_fk_players_discipline_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ghouldisciplinerating
    ADD CONSTRAINT players_ghouldi_discipline_id_cc689298_fk_players_discipline_id FOREIGN KEY (discipline_id) REFERENCES players_discipline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_ghouldisciplinera_ghoul_id_56f5e4f0_fk_players_ghoul_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ghouldisciplinerating
    ADD CONSTRAINT players_ghouldisciplinera_ghoul_id_56f5e4f0_fk_players_ghoul_id FOREIGN KEY (ghoul_id) REFERENCES players_ghoul(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_goal_character_id_5fa26a7a_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_goal
    ADD CONSTRAINT players_goal_character_id_5fa26a7a_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_healingre_character_id_c6462d00_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_healingreport
    ADD CONSTRAINT players_healingre_character_id_c6462d00_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_healingreport_session_id_b385f27c_fk_players_session_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_healingreport
    ADD CONSTRAINT players_healingreport_session_id_b385f27c_fk_players_session_id FOREIGN KEY (session_id) REFERENCES players_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_hook_aspects_aspect_id_046ab506_fk_players_aspect_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_hook_aspects
    ADD CONSTRAINT players_hook_aspects_aspect_id_046ab506_fk_players_aspect_id FOREIGN KEY (aspect_id) REFERENCES players_aspect(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_hook_aspects_hook_id_0f0bb1d7_fk_players_hook_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_hook_aspects
    ADD CONSTRAINT players_hook_aspects_hook_id_0f0bb1d7_fk_players_hook_id FOREIGN KEY (hook_id) REFERENCES players_hook(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_hook_influence_id_55e3970c_fk_players_influence_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_hook
    ADD CONSTRAINT players_hook_influence_id_55e3970c_fk_players_influence_id FOREIGN KEY (influence_id) REFERENCES players_influence(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_hook_master_id_901c63a9_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_hook
    ADD CONSTRAINT players_hook_master_id_901c63a9_fk_players_character_id FOREIGN KEY (master_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_influence_character_id_070a10c4_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_influencerating
    ADD CONSTRAINT players_influence_character_id_070a10c4_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_influence_character_id_43434b0b_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_influencewant
    ADD CONSTRAINT players_influence_character_id_43434b0b_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_influence_influence_id_05e586eb_fk_players_influence_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_influencerating
    ADD CONSTRAINT players_influence_influence_id_05e586eb_fk_players_influence_id FOREIGN KEY (influence_id) REFERENCES players_influence(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_influence_influence_id_2eac1a6f_fk_players_influence_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_influencesteal
    ADD CONSTRAINT players_influence_influence_id_2eac1a6f_fk_players_influence_id FOREIGN KEY (influence_id) REFERENCES players_influence(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_influence_influence_id_bef23214_fk_players_influence_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_influencedestroy
    ADD CONSTRAINT players_influence_influence_id_bef23214_fk_players_influence_id FOREIGN KEY (influence_id) REFERENCES players_influence(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_influence_influence_id_cb3241c6_fk_players_influence_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_influencewant
    ADD CONSTRAINT players_influence_influence_id_cb3241c6_fk_players_influence_id FOREIGN KEY (influence_id) REFERENCES players_influence(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_influencede_action_ptr_id_a62c5d4f_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_influencedestroy
    ADD CONSTRAINT players_influencede_action_ptr_id_a62c5d4f_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_influencest_action_ptr_id_65680759_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_influencesteal
    ADD CONSTRAINT players_influencest_action_ptr_id_65680759_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_investequip_action_ptr_id_bfaa238a_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investequipment
    ADD CONSTRAINT players_investequip_action_ptr_id_bfaa238a_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_investg_discipline_id_bdaf18ce_fk_players_discipline_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investghoul
    ADD CONSTRAINT players_investg_discipline_id_bdaf18ce_fk_players_discipline_id FOREIGN KEY (discipline_id) REFERENCES players_discipline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_investghoul_action_ptr_id_034e66d7_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investghoul
    ADD CONSTRAINT players_investghoul_action_ptr_id_034e66d7_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_investhaven_action_ptr_id_885c602a_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investhaven
    ADD CONSTRAINT players_investhaven_action_ptr_id_885c602a_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_investherd_action_ptr_id_25253c8b_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investherd
    ADD CONSTRAINT players_investherd_action_ptr_id_25253c8b_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_investiga_influence_id_174b482d_fk_players_influence_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investigateinfluence
    ADD CONSTRAINT players_investiga_influence_id_174b482d_fk_players_influence_id FOREIGN KEY (influence_id) REFERENCES players_influence(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_investigate_action_ptr_id_13114850_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investigatephenomenon
    ADD CONSTRAINT players_investigate_action_ptr_id_13114850_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_investigate_action_ptr_id_19f2415d_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investigatecounterspionage
    ADD CONSTRAINT players_investigate_action_ptr_id_19f2415d_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_investigate_action_ptr_id_1c98502e_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investigatecharacterresources
    ADD CONSTRAINT players_investigate_action_ptr_id_1c98502e_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_investigate_action_ptr_id_85061344_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investigateinfluence
    ADD CONSTRAINT players_investigate_action_ptr_id_85061344_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_investigate_action_ptr_id_ad0c75b8_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investigatecharacterdowntimeactions
    ADD CONSTRAINT players_investigate_action_ptr_id_ad0c75b8_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_investigate_action_ptr_id_dda9510a_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investigatecharacterinfluence
    ADD CONSTRAINT players_investigate_action_ptr_id_dda9510a_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_investigatec_target_id_0a1e2492_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investigatecharacterdowntimeactions
    ADD CONSTRAINT players_investigatec_target_id_0a1e2492_fk_players_character_id FOREIGN KEY (target_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_investigatec_target_id_2a45e873_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investigatecharacterinfluence
    ADD CONSTRAINT players_investigatec_target_id_2a45e873_fk_players_character_id FOREIGN KEY (target_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_investigatec_target_id_36b5d2b2_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investigatecharacterresources
    ADD CONSTRAINT players_investigatec_target_id_36b5d2b2_fk_players_character_id FOREIGN KEY (target_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_investweapo_action_ptr_id_1b8c978d_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investweapon
    ADD CONSTRAINT players_investweapo_action_ptr_id_1b8c978d_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_keepersques_action_ptr_id_637c70f1_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_keepersquestion
    ADD CONSTRAINT players_keepersques_action_ptr_id_637c70f1_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_keepersquest_target_id_84df881f_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_keepersquestion
    ADD CONSTRAINT players_keepersquest_target_id_84df881f_fk_players_character_id FOREIGN KEY (target_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_learnadva_advantage_id_ac953d2f_fk_players_advantage_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_learnadvantage
    ADD CONSTRAINT players_learnadva_advantage_id_ac953d2f_fk_players_advantage_id FOREIGN KEY (advantage_id) REFERENCES players_advantage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_learnadvant_action_ptr_id_33b06ede_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_learnadvantage
    ADD CONSTRAINT players_learnadvant_action_ptr_id_33b06ede_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_learnattr_attribute_id_70b7b4c6_fk_players_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_learnattribute
    ADD CONSTRAINT players_learnattr_attribute_id_70b7b4c6_fk_players_attribute_id FOREIGN KEY (attribute_id) REFERENCES players_attribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_learnattrib_action_ptr_id_bb96e279_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_learnattribute
    ADD CONSTRAINT players_learnattrib_action_ptr_id_bb96e279_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_learnattrib_trainer_id_224cdbd2_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_learnattribute
    ADD CONSTRAINT players_learnattrib_trainer_id_224cdbd2_fk_players_character_id FOREIGN KEY (trainer_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_learndi_discipline_id_47830bab_fk_players_discipline_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_learndiscipline
    ADD CONSTRAINT players_learndi_discipline_id_47830bab_fk_players_discipline_id FOREIGN KEY (discipline_id) REFERENCES players_discipline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_learndiscip_action_ptr_id_ed561911_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_learndiscipline
    ADD CONSTRAINT players_learndiscip_action_ptr_id_ed561911_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_learndiscip_trainer_id_ae5d33f1_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_learndiscipline
    ADD CONSTRAINT players_learndiscip_trainer_id_ae5d33f1_fk_players_character_id FOREIGN KEY (trainer_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_learnspecia_action_ptr_id_c1f68783_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_learnspecialization
    ADD CONSTRAINT players_learnspecia_action_ptr_id_c1f68783_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_learnspecia_trainer_id_00699fc0_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_learnspecialization
    ADD CONSTRAINT players_learnspecia_trainer_id_00699fc0_fk_players_character_id FOREIGN KEY (trainer_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_losthook_character_id_e84ffd2f_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_losthook
    ADD CONSTRAINT players_losthook_character_id_e84ffd2f_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_losthook_hook_id_44fee2b4_fk_players_hook_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_losthook
    ADD CONSTRAINT players_losthook_hook_id_44fee2b4_fk_players_hook_id FOREIGN KEY (hook_id) REFERENCES players_hook(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_losthook_session_id_5df44306_fk_players_session_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_losthook
    ADD CONSTRAINT players_losthook_session_id_5df44306_fk_players_session_id FOREIGN KEY (session_id) REFERENCES players_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_mentoratt_attribute_id_88c677f2_fk_players_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_mentorattribute
    ADD CONSTRAINT players_mentoratt_attribute_id_88c677f2_fk_players_attribute_id FOREIGN KEY (attribute_id) REFERENCES players_attribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_mentorattri_action_ptr_id_9dc3133f_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_mentorattribute
    ADD CONSTRAINT players_mentorattri_action_ptr_id_9dc3133f_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_mentorattri_student_id_8920a602_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_mentorattribute
    ADD CONSTRAINT players_mentorattri_student_id_8920a602_fk_players_character_id FOREIGN KEY (student_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_mentord_discipline_id_bbf1da9f_fk_players_discipline_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_mentordiscipline
    ADD CONSTRAINT players_mentord_discipline_id_bbf1da9f_fk_players_discipline_id FOREIGN KEY (discipline_id) REFERENCES players_discipline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_mentordisci_action_ptr_id_7228ea3c_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_mentordiscipline
    ADD CONSTRAINT players_mentordisci_action_ptr_id_7228ea3c_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_mentordisci_student_id_4b203a57_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_mentordiscipline
    ADD CONSTRAINT players_mentordisci_student_id_4b203a57_fk_players_character_id FOREIGN KEY (student_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_mentorspeci_action_ptr_id_a87be5c2_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_mentorspecialization
    ADD CONSTRAINT players_mentorspeci_action_ptr_id_a87be5c2_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_mentorspeci_student_id_1f547e89_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_mentorspecialization
    ADD CONSTRAINT players_mentorspeci_student_id_1f547e89_fk_players_character_id FOREIGN KEY (student_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_neglectdoma_action_ptr_id_5d786a1c_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_neglectdomain
    ADD CONSTRAINT players_neglectdoma_action_ptr_id_5d786a1c_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_neglectdomain_domain_id_076e0d60_fk_players_domain_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_neglectdomain
    ADD CONSTRAINT players_neglectdomain_domain_id_076e0d60_fk_players_domain_id FOREIGN KEY (domain_id) REFERENCES players_domain(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_patroldomai_action_ptr_id_bbe7b08c_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_patroldomain
    ADD CONSTRAINT players_patroldomai_action_ptr_id_bbe7b08c_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_patroldomain_domain_id_a6148123_fk_players_domain_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_patroldomain
    ADD CONSTRAINT players_patroldomain_domain_id_a6148123_fk_players_domain_id FOREIGN KEY (domain_id) REFERENCES players_domain(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_primogensai_action_id_33480f18_fk_players_actiontype_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_primogensaidaction
    ADD CONSTRAINT players_primogensai_action_id_33480f18_fk_players_actiontype_id FOREIGN KEY (action_id) REFERENCES players_actiontype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_primogensai_action_ptr_id_799566a7_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_primogensaidaction
    ADD CONSTRAINT players_primogensai_action_ptr_id_799566a7_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_primogensaid_helpee_id_43d34bba_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_primogensaidaction
    ADD CONSTRAINT players_primogensaid_helpee_id_43d34bba_fk_players_character_id FOREIGN KEY (helpee_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_primogensqu_action_ptr_id_1db7ff73_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_primogensquestion
    ADD CONSTRAINT players_primogensqu_action_ptr_id_1db7ff73_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_primogensque_target_id_79301564_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_primogensquestion
    ADD CONSTRAINT players_primogensque_target_id_79301564_fk_players_character_id FOREIGN KEY (target_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_rel_other_character_id_4dd53c00_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_relationship
    ADD CONSTRAINT players_rel_other_character_id_4dd53c00_fk_players_character_id FOREIGN KEY (other_character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_relations_character_id_d69c620b_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_relationship
    ADD CONSTRAINT players_relations_character_id_d69c620b_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_rest_action_ptr_id_2e74ffa3_fk_players_action_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_rest
    ADD CONSTRAINT players_rest_action_ptr_id_2e74ffa3_fk_players_action_id FOREIGN KEY (action_ptr_id) REFERENCES players_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_ritualrating_ritual_id_d0cc60a1_fk_players_ritual_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ritualrating
    ADD CONSTRAINT players_ritualrating_ritual_id_d0cc60a1_fk_players_ritual_id FOREIGN KEY (ritual_id) REFERENCES players_ritual(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_rumor_canonFact_id_b836109f_fk_players_canonfact_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_rumor
    ADD CONSTRAINT "players_rumor_canonFact_id_b836109f_fk_players_canonfact_id" FOREIGN KEY ("canonFact_id") REFERENCES players_canonfact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_rumor_influence_id_eb1d8cee_fk_players_influence_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_rumor
    ADD CONSTRAINT players_rumor_influence_id_eb1d8cee_fk_players_influence_id FOREIGN KEY (influence_id) REFERENCES players_influence(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_rumor_rec_character_id_e6100146_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_rumor_recipients
    ADD CONSTRAINT players_rumor_rec_character_id_e6100146_fk_players_character_id FOREIGN KEY (character_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_rumor_recipients_rumor_id_cf8d5f13_fk_players_rumor_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_rumor_recipients
    ADD CONSTRAINT players_rumor_recipients_rumor_id_cf8d5f13_fk_players_rumor_id FOREIGN KEY (rumor_id) REFERENCES players_rumor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_rumor_session_id_e6ec1d01_fk_players_session_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_rumor
    ADD CONSTRAINT players_rumor_session_id_e6ec1d01_fk_players_session_id FOREIGN KEY (session_id) REFERENCES players_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_sessi_action_set_id_aa3bed7b_fk_players_actionoption_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_session
    ADD CONSTRAINT players_sessi_action_set_id_aa3bed7b_fk_players_actionoption_id FOREIGN KEY (action_set_id) REFERENCES players_actionoption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_session_feedi_session_id_0772c4e6_fk_players_session_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_session_feeding_domains
    ADD CONSTRAINT players_session_feedi_session_id_0772c4e6_fk_players_session_id FOREIGN KEY (session_id) REFERENCES players_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_session_feeding_domain_id_839a22b1_fk_players_domain_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_session_feeding_domains
    ADD CONSTRAINT players_session_feeding_domain_id_839a22b1_fk_players_domain_id FOREIGN KEY (domain_id) REFERENCES players_domain(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_session_previous_id_900615b8_fk_players_session_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_session
    ADD CONSTRAINT players_session_previous_id_900615b8_fk_players_session_id FOREIGN KEY (previous_id) REFERENCES players_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_session_season_id_c18f8942_fk_players_season_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_session
    ADD CONSTRAINT players_session_season_id_c18f8942_fk_players_season_id FOREIGN KEY (season_id) REFERENCES players_season(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_specialization_id_2e3dc09f_fk_players_specialization_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_equipment
    ADD CONSTRAINT players_specialization_id_2e3dc09f_fk_players_specialization_id FOREIGN KEY (specialization_id) REFERENCES players_specialization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_specialization_id_2fc25713_fk_players_specialization_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investequipment
    ADD CONSTRAINT players_specialization_id_2fc25713_fk_players_specialization_id FOREIGN KEY (specialization_id) REFERENCES players_specialization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_specialization_id_9581c6ac_fk_players_specialization_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_investghoul
    ADD CONSTRAINT players_specialization_id_9581c6ac_fk_players_specialization_id FOREIGN KEY (specialization_id) REFERENCES players_specialization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_specialization_id_9bd9960c_fk_players_specialization_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_character_specializations
    ADD CONSTRAINT players_specialization_id_9bd9960c_fk_players_specialization_id FOREIGN KEY (specialization_id) REFERENCES players_specialization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_specialization_id_9eac92ac_fk_players_specialization_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_mentorspecialization
    ADD CONSTRAINT players_specialization_id_9eac92ac_fk_players_specialization_id FOREIGN KEY (specialization_id) REFERENCES players_specialization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_specialization_id_daba6fad_fk_players_specialization_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_ghoul_specializations
    ADD CONSTRAINT players_specialization_id_daba6fad_fk_players_specialization_id FOREIGN KEY (specialization_id) REFERENCES players_specialization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_statusassi_assigner_id_d769331b_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_statusassignment
    ADD CONSTRAINT players_statusassi_assigner_id_d769331b_fk_players_character_id FOREIGN KEY (assigner_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_statusassign_target_id_e126f96e_fk_players_character_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_statusassignment
    ADD CONSTRAINT players_statusassign_target_id_e126f96e_fk_players_character_id FOREIGN KEY (target_id) REFERENCES players_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_statusassignm_session_id_c42b9fe9_fk_players_session_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_statusassignment
    ADD CONSTRAINT players_statusassignm_session_id_c42b9fe9_fk_players_session_id FOREIGN KEY (session_id) REFERENCES players_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_tit_actionoption_id_6d6265b5_fk_players_actionoption_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_title_action_options
    ADD CONSTRAINT players_tit_actionoption_id_6d6265b5_fk_players_actionoption_id FOREIGN KEY (actionoption_id) REFERENCES players_actionoption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_title_action_opti_title_id_1d38e369_fk_players_title_id; Type: FK CONSTRAINT; Schema: public; Owner: felicia
--

ALTER TABLE ONLY players_title_action_options
    ADD CONSTRAINT players_title_action_opti_title_id_1d38e369_fk_players_title_id FOREIGN KEY (title_id) REFERENCES players_title(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

