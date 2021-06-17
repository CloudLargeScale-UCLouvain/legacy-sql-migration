--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7 (Debian 11.7-1.pgdg90+1)
-- Dumped by pg_dump version 11.7 (Ubuntu 11.7-1.pgdg18.04+1)

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

SET default_with_oids = false;

--
-- Name: act_ge_bytearray; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_ge_bytearray (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    name_ character varying(255),
    deployment_id_ character varying(64),
    bytes_ bytea,
    generated_ boolean,
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_ge_bytearray OWNER TO camunda;

--
-- Name: act_ge_property; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_ge_property (
    name_ character varying(64) NOT NULL,
    value_ character varying(300),
    rev_ integer
);


ALTER TABLE public.act_ge_property OWNER TO camunda;

--
-- Name: act_hi_actinst; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_hi_actinst (
    id_ character varying(64) NOT NULL,
    parent_act_inst_id_ character varying(64),
    proc_def_key_ character varying(255),
    proc_def_id_ character varying(64) NOT NULL,
    proc_inst_id_ character varying(64) NOT NULL,
    execution_id_ character varying(64) NOT NULL,
    act_id_ character varying(255) NOT NULL,
    task_id_ character varying(64),
    call_proc_inst_id_ character varying(64),
    call_case_inst_id_ character varying(64),
    act_name_ character varying(255),
    act_type_ character varying(255) NOT NULL,
    assignee_ character varying(64),
    start_time_ timestamp without time zone NOT NULL,
    end_time_ timestamp without time zone,
    duration_ bigint,
    act_inst_state_ integer,
    sequence_counter_ bigint,
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_hi_actinst OWNER TO camunda;

--
-- Name: act_hi_attachment; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_hi_attachment (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    user_id_ character varying(255),
    name_ character varying(255),
    description_ character varying(4000),
    type_ character varying(255),
    task_id_ character varying(64),
    proc_inst_id_ character varying(64),
    url_ character varying(4000),
    content_id_ character varying(64),
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_hi_attachment OWNER TO camunda;

--
-- Name: act_hi_batch; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_hi_batch (
    id_ character varying(64) NOT NULL,
    type_ character varying(255),
    total_jobs_ integer,
    jobs_per_seed_ integer,
    invocations_per_job_ integer,
    seed_job_def_id_ character varying(64),
    monitor_job_def_id_ character varying(64),
    batch_job_def_id_ character varying(64),
    tenant_id_ character varying(64),
    start_time_ timestamp without time zone NOT NULL,
    end_time_ timestamp without time zone
);


ALTER TABLE public.act_hi_batch OWNER TO camunda;

--
-- Name: act_hi_caseactinst; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_hi_caseactinst (
    id_ character varying(64) NOT NULL,
    parent_act_inst_id_ character varying(64),
    case_def_id_ character varying(64) NOT NULL,
    case_inst_id_ character varying(64) NOT NULL,
    case_act_id_ character varying(255) NOT NULL,
    task_id_ character varying(64),
    call_proc_inst_id_ character varying(64),
    call_case_inst_id_ character varying(64),
    case_act_name_ character varying(255),
    case_act_type_ character varying(255),
    create_time_ timestamp without time zone NOT NULL,
    end_time_ timestamp without time zone,
    duration_ bigint,
    state_ integer,
    required_ boolean,
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_hi_caseactinst OWNER TO camunda;

--
-- Name: act_hi_caseinst; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_hi_caseinst (
    id_ character varying(64) NOT NULL,
    case_inst_id_ character varying(64) NOT NULL,
    business_key_ character varying(255),
    case_def_id_ character varying(64) NOT NULL,
    create_time_ timestamp without time zone NOT NULL,
    close_time_ timestamp without time zone,
    duration_ bigint,
    state_ integer,
    create_user_id_ character varying(255),
    super_case_instance_id_ character varying(64),
    super_process_instance_id_ character varying(64),
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_hi_caseinst OWNER TO camunda;

--
-- Name: act_hi_comment; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_hi_comment (
    id_ character varying(64) NOT NULL,
    type_ character varying(255),
    time_ timestamp without time zone NOT NULL,
    user_id_ character varying(255),
    task_id_ character varying(64),
    proc_inst_id_ character varying(64),
    action_ character varying(255),
    message_ character varying(4000),
    full_msg_ bytea,
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_hi_comment OWNER TO camunda;

--
-- Name: act_hi_dec_in; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_hi_dec_in (
    id_ character varying(64) NOT NULL,
    dec_inst_id_ character varying(64) NOT NULL,
    clause_id_ character varying(64),
    clause_name_ character varying(255),
    var_type_ character varying(100),
    bytearray_id_ character varying(64),
    double_ double precision,
    long_ bigint,
    text_ character varying(4000),
    text2_ character varying(4000),
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_hi_dec_in OWNER TO camunda;

--
-- Name: act_hi_dec_out; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_hi_dec_out (
    id_ character varying(64) NOT NULL,
    dec_inst_id_ character varying(64) NOT NULL,
    clause_id_ character varying(64),
    clause_name_ character varying(255),
    rule_id_ character varying(64),
    rule_order_ integer,
    var_name_ character varying(255),
    var_type_ character varying(100),
    bytearray_id_ character varying(64),
    double_ double precision,
    long_ bigint,
    text_ character varying(4000),
    text2_ character varying(4000),
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_hi_dec_out OWNER TO camunda;

--
-- Name: act_hi_decinst; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_hi_decinst (
    id_ character varying(64) NOT NULL,
    dec_def_id_ character varying(64) NOT NULL,
    dec_def_key_ character varying(255) NOT NULL,
    dec_def_name_ character varying(255),
    proc_def_key_ character varying(255),
    proc_def_id_ character varying(64),
    proc_inst_id_ character varying(64),
    case_def_key_ character varying(255),
    case_def_id_ character varying(64),
    case_inst_id_ character varying(64),
    act_inst_id_ character varying(64),
    act_id_ character varying(255),
    eval_time_ timestamp without time zone NOT NULL,
    collect_value_ double precision,
    user_id_ character varying(255),
    root_dec_inst_id_ character varying(64),
    dec_req_id_ character varying(64),
    dec_req_key_ character varying(255),
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_hi_decinst OWNER TO camunda;

--
-- Name: act_hi_detail; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_hi_detail (
    id_ character varying(64) NOT NULL,
    type_ character varying(255) NOT NULL,
    proc_def_key_ character varying(255),
    proc_def_id_ character varying(64),
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    case_def_key_ character varying(255),
    case_def_id_ character varying(64),
    case_inst_id_ character varying(64),
    case_execution_id_ character varying(64),
    task_id_ character varying(64),
    act_inst_id_ character varying(64),
    var_inst_id_ character varying(64),
    name_ character varying(255) NOT NULL,
    var_type_ character varying(64),
    rev_ integer,
    time_ timestamp without time zone NOT NULL,
    bytearray_id_ character varying(64),
    double_ double precision,
    long_ bigint,
    text_ character varying(4000),
    text2_ character varying(4000),
    sequence_counter_ bigint,
    tenant_id_ character varying(64),
    operation_id_ character varying(64)
);


ALTER TABLE public.act_hi_detail OWNER TO camunda;

--
-- Name: act_hi_ext_task_log; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_hi_ext_task_log (
    id_ character varying(64) NOT NULL,
    timestamp_ timestamp without time zone NOT NULL,
    ext_task_id_ character varying(64) NOT NULL,
    retries_ integer,
    topic_name_ character varying(255),
    worker_id_ character varying(255),
    priority_ bigint DEFAULT 0 NOT NULL,
    error_msg_ character varying(4000),
    error_details_id_ character varying(64),
    act_id_ character varying(255),
    act_inst_id_ character varying(64),
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    proc_def_id_ character varying(64),
    proc_def_key_ character varying(255),
    tenant_id_ character varying(64),
    state_ integer
);


ALTER TABLE public.act_hi_ext_task_log OWNER TO camunda;

--
-- Name: act_hi_identitylink; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_hi_identitylink (
    id_ character varying(64) NOT NULL,
    timestamp_ timestamp without time zone NOT NULL,
    type_ character varying(255),
    user_id_ character varying(255),
    group_id_ character varying(255),
    task_id_ character varying(64),
    proc_def_id_ character varying(64),
    operation_type_ character varying(64),
    assigner_id_ character varying(64),
    proc_def_key_ character varying(255),
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_hi_identitylink OWNER TO camunda;

--
-- Name: act_hi_incident; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_hi_incident (
    id_ character varying(64) NOT NULL,
    proc_def_key_ character varying(255),
    proc_def_id_ character varying(64),
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    create_time_ timestamp without time zone NOT NULL,
    end_time_ timestamp without time zone,
    incident_msg_ character varying(4000),
    incident_type_ character varying(255) NOT NULL,
    activity_id_ character varying(255),
    cause_incident_id_ character varying(64),
    root_cause_incident_id_ character varying(64),
    configuration_ character varying(255),
    incident_state_ integer,
    tenant_id_ character varying(64),
    job_def_id_ character varying(64)
);


ALTER TABLE public.act_hi_incident OWNER TO camunda;

--
-- Name: act_hi_job_log; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_hi_job_log (
    id_ character varying(64) NOT NULL,
    timestamp_ timestamp without time zone NOT NULL,
    job_id_ character varying(64) NOT NULL,
    job_duedate_ timestamp without time zone,
    job_retries_ integer,
    job_priority_ bigint DEFAULT 0 NOT NULL,
    job_exception_msg_ character varying(4000),
    job_exception_stack_id_ character varying(64),
    job_state_ integer,
    job_def_id_ character varying(64),
    job_def_type_ character varying(255),
    job_def_configuration_ character varying(255),
    act_id_ character varying(255),
    execution_id_ character varying(64),
    process_instance_id_ character varying(64),
    process_def_id_ character varying(64),
    process_def_key_ character varying(255),
    deployment_id_ character varying(64),
    sequence_counter_ bigint,
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_hi_job_log OWNER TO camunda;

--
-- Name: act_hi_op_log; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_hi_op_log (
    id_ character varying(64) NOT NULL,
    deployment_id_ character varying(64),
    proc_def_id_ character varying(64),
    proc_def_key_ character varying(255),
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    case_def_id_ character varying(64),
    case_inst_id_ character varying(64),
    case_execution_id_ character varying(64),
    task_id_ character varying(64),
    job_id_ character varying(64),
    job_def_id_ character varying(64),
    batch_id_ character varying(64),
    user_id_ character varying(255),
    timestamp_ timestamp without time zone NOT NULL,
    operation_type_ character varying(64),
    operation_id_ character varying(64),
    entity_type_ character varying(30),
    property_ character varying(64),
    org_value_ character varying(4000),
    new_value_ character varying(4000),
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_hi_op_log OWNER TO camunda;

--
-- Name: act_hi_procinst; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_hi_procinst (
    id_ character varying(64) NOT NULL,
    proc_inst_id_ character varying(64) NOT NULL,
    business_key_ character varying(255),
    proc_def_key_ character varying(255),
    proc_def_id_ character varying(64) NOT NULL,
    start_time_ timestamp without time zone NOT NULL,
    end_time_ timestamp without time zone,
    duration_ bigint,
    start_user_id_ character varying(255),
    start_act_id_ character varying(255),
    end_act_id_ character varying(255),
    super_process_instance_id_ character varying(64),
    super_case_instance_id_ character varying(64),
    case_inst_id_ character varying(64),
    delete_reason_ character varying(4000),
    tenant_id_ character varying(64),
    state_ character varying(255)
);


ALTER TABLE public.act_hi_procinst OWNER TO camunda;

--
-- Name: act_hi_taskinst; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_hi_taskinst (
    id_ character varying(64) NOT NULL,
    task_def_key_ character varying(255),
    proc_def_key_ character varying(255),
    proc_def_id_ character varying(64),
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    case_def_key_ character varying(255),
    case_def_id_ character varying(64),
    case_inst_id_ character varying(64),
    case_execution_id_ character varying(64),
    act_inst_id_ character varying(64),
    name_ character varying(255),
    parent_task_id_ character varying(64),
    description_ character varying(4000),
    owner_ character varying(255),
    assignee_ character varying(255),
    start_time_ timestamp without time zone NOT NULL,
    end_time_ timestamp without time zone,
    duration_ bigint,
    delete_reason_ character varying(4000),
    priority_ integer,
    due_date_ timestamp without time zone,
    follow_up_date_ timestamp without time zone,
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_hi_taskinst OWNER TO camunda;

--
-- Name: act_hi_varinst; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_hi_varinst (
    id_ character varying(64) NOT NULL,
    proc_def_key_ character varying(255),
    proc_def_id_ character varying(64),
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    act_inst_id_ character varying(64),
    case_def_key_ character varying(255),
    case_def_id_ character varying(64),
    case_inst_id_ character varying(64),
    case_execution_id_ character varying(64),
    task_id_ character varying(64),
    name_ character varying(255) NOT NULL,
    var_type_ character varying(100),
    rev_ integer,
    bytearray_id_ character varying(64),
    double_ double precision,
    long_ bigint,
    text_ character varying(4000),
    text2_ character varying(4000),
    tenant_id_ character varying(64),
    state_ character varying(20)
);


ALTER TABLE public.act_hi_varinst OWNER TO camunda;

--
-- Name: act_id_group; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_id_group (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    name_ character varying(255),
    type_ character varying(255)
);


ALTER TABLE public.act_id_group OWNER TO camunda;

--
-- Name: act_id_info; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_id_info (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    user_id_ character varying(64),
    type_ character varying(64),
    key_ character varying(255),
    value_ character varying(255),
    password_ bytea,
    parent_id_ character varying(255)
);


ALTER TABLE public.act_id_info OWNER TO camunda;

--
-- Name: act_id_membership; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_id_membership (
    user_id_ character varying(64) NOT NULL,
    group_id_ character varying(64) NOT NULL
);


ALTER TABLE public.act_id_membership OWNER TO camunda;

--
-- Name: act_id_tenant; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_id_tenant (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    name_ character varying(255)
);


ALTER TABLE public.act_id_tenant OWNER TO camunda;

--
-- Name: act_id_tenant_member; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_id_tenant_member (
    id_ character varying(64) NOT NULL,
    tenant_id_ character varying(64) NOT NULL,
    user_id_ character varying(64),
    group_id_ character varying(64)
);


ALTER TABLE public.act_id_tenant_member OWNER TO camunda;

--
-- Name: act_id_user; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_id_user (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    first_ character varying(255),
    last_ character varying(255),
    email_ character varying(255),
    pwd_ character varying(255),
    salt_ character varying(255),
    picture_id_ character varying(64)
);


ALTER TABLE public.act_id_user OWNER TO camunda;

--
-- Name: act_re_case_def; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_re_case_def (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    name_ character varying(255),
    key_ character varying(255) NOT NULL,
    version_ integer NOT NULL,
    deployment_id_ character varying(64),
    resource_name_ character varying(4000),
    dgrm_resource_name_ character varying(4000),
    tenant_id_ character varying(64),
    history_ttl_ integer
);


ALTER TABLE public.act_re_case_def OWNER TO camunda;

--
-- Name: act_re_decision_def; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_re_decision_def (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    name_ character varying(255),
    key_ character varying(255) NOT NULL,
    version_ integer NOT NULL,
    deployment_id_ character varying(64),
    resource_name_ character varying(4000),
    dgrm_resource_name_ character varying(4000),
    dec_req_id_ character varying(64),
    dec_req_key_ character varying(255),
    tenant_id_ character varying(64),
    history_ttl_ integer,
    version_tag_ character varying(64)
);


ALTER TABLE public.act_re_decision_def OWNER TO camunda;

--
-- Name: act_re_decision_req_def; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_re_decision_req_def (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    name_ character varying(255),
    key_ character varying(255) NOT NULL,
    version_ integer NOT NULL,
    deployment_id_ character varying(64),
    resource_name_ character varying(4000),
    dgrm_resource_name_ character varying(4000),
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_re_decision_req_def OWNER TO camunda;

--
-- Name: act_re_deployment; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_re_deployment (
    id_ character varying(64) NOT NULL,
    name_ character varying(255),
    deploy_time_ timestamp without time zone,
    source_ character varying(255),
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_re_deployment OWNER TO camunda;

--
-- Name: act_re_procdef; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_re_procdef (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    name_ character varying(255),
    key_ character varying(255) NOT NULL,
    version_ integer NOT NULL,
    deployment_id_ character varying(64),
    resource_name_ character varying(4000),
    dgrm_resource_name_ character varying(4000),
    has_start_form_key_ boolean,
    suspension_state_ integer,
    tenant_id_ character varying(64),
    version_tag_ character varying(64),
    history_ttl_ integer
);


ALTER TABLE public.act_re_procdef OWNER TO camunda;

--
-- Name: act_ru_authorization; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_ru_authorization (
    id_ character varying(64) NOT NULL,
    rev_ integer NOT NULL,
    type_ integer NOT NULL,
    group_id_ character varying(255),
    user_id_ character varying(255),
    resource_type_ integer NOT NULL,
    resource_id_ character varying(255),
    perms_ integer
);


ALTER TABLE public.act_ru_authorization OWNER TO camunda;

--
-- Name: act_ru_batch; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_ru_batch (
    id_ character varying(64) NOT NULL,
    rev_ integer NOT NULL,
    type_ character varying(255),
    total_jobs_ integer,
    jobs_created_ integer,
    jobs_per_seed_ integer,
    invocations_per_job_ integer,
    seed_job_def_id_ character varying(64),
    batch_job_def_id_ character varying(64),
    monitor_job_def_id_ character varying(64),
    suspension_state_ integer,
    configuration_ character varying(255),
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_ru_batch OWNER TO camunda;

--
-- Name: act_ru_case_execution; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_ru_case_execution (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    case_inst_id_ character varying(64),
    super_case_exec_ character varying(64),
    super_exec_ character varying(64),
    business_key_ character varying(255),
    parent_id_ character varying(64),
    case_def_id_ character varying(64),
    act_id_ character varying(255),
    prev_state_ integer,
    current_state_ integer,
    required_ boolean,
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_ru_case_execution OWNER TO camunda;

--
-- Name: act_ru_case_sentry_part; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_ru_case_sentry_part (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    case_inst_id_ character varying(64),
    case_exec_id_ character varying(64),
    sentry_id_ character varying(255),
    type_ character varying(255),
    source_case_exec_id_ character varying(64),
    standard_event_ character varying(255),
    source_ character varying(255),
    variable_event_ character varying(255),
    variable_name_ character varying(255),
    satisfied_ boolean,
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_ru_case_sentry_part OWNER TO camunda;

--
-- Name: act_ru_event_subscr; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_ru_event_subscr (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    event_type_ character varying(255) NOT NULL,
    event_name_ character varying(255),
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    activity_id_ character varying(255),
    configuration_ character varying(255),
    created_ timestamp without time zone NOT NULL,
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_ru_event_subscr OWNER TO camunda;

--
-- Name: act_ru_execution; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_ru_execution (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    proc_inst_id_ character varying(64),
    business_key_ character varying(255),
    parent_id_ character varying(64),
    proc_def_id_ character varying(64),
    super_exec_ character varying(64),
    super_case_exec_ character varying(64),
    case_inst_id_ character varying(64),
    act_id_ character varying(255),
    act_inst_id_ character varying(64),
    is_active_ boolean,
    is_concurrent_ boolean,
    is_scope_ boolean,
    is_event_scope_ boolean,
    suspension_state_ integer,
    cached_ent_state_ integer,
    sequence_counter_ bigint,
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_ru_execution OWNER TO camunda;

--
-- Name: act_ru_ext_task; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_ru_ext_task (
    id_ character varying(64) NOT NULL,
    rev_ integer NOT NULL,
    worker_id_ character varying(255),
    topic_name_ character varying(255),
    retries_ integer,
    error_msg_ character varying(4000),
    error_details_id_ character varying(64),
    lock_exp_time_ timestamp without time zone,
    suspension_state_ integer,
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    proc_def_id_ character varying(64),
    proc_def_key_ character varying(255),
    act_id_ character varying(255),
    act_inst_id_ character varying(64),
    tenant_id_ character varying(64),
    priority_ bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.act_ru_ext_task OWNER TO camunda;

--
-- Name: act_ru_filter; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_ru_filter (
    id_ character varying(64) NOT NULL,
    rev_ integer NOT NULL,
    resource_type_ character varying(255) NOT NULL,
    name_ character varying(255) NOT NULL,
    owner_ character varying(255),
    query_ text NOT NULL,
    properties_ text
);


ALTER TABLE public.act_ru_filter OWNER TO camunda;

--
-- Name: act_ru_identitylink; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_ru_identitylink (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    group_id_ character varying(255),
    type_ character varying(255),
    user_id_ character varying(255),
    task_id_ character varying(64),
    proc_def_id_ character varying(64),
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_ru_identitylink OWNER TO camunda;

--
-- Name: act_ru_incident; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_ru_incident (
    id_ character varying(64) NOT NULL,
    rev_ integer NOT NULL,
    incident_timestamp_ timestamp without time zone NOT NULL,
    incident_msg_ character varying(4000),
    incident_type_ character varying(255) NOT NULL,
    execution_id_ character varying(64),
    activity_id_ character varying(255),
    proc_inst_id_ character varying(64),
    proc_def_id_ character varying(64),
    cause_incident_id_ character varying(64),
    root_cause_incident_id_ character varying(64),
    configuration_ character varying(255),
    tenant_id_ character varying(64),
    job_def_id_ character varying(64)
);


ALTER TABLE public.act_ru_incident OWNER TO camunda;

--
-- Name: act_ru_job; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_ru_job (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    type_ character varying(255) NOT NULL,
    lock_exp_time_ timestamp without time zone,
    lock_owner_ character varying(255),
    exclusive_ boolean,
    execution_id_ character varying(64),
    process_instance_id_ character varying(64),
    process_def_id_ character varying(64),
    process_def_key_ character varying(255),
    retries_ integer,
    exception_stack_id_ character varying(64),
    exception_msg_ character varying(4000),
    duedate_ timestamp without time zone,
    repeat_ character varying(255),
    handler_type_ character varying(255),
    handler_cfg_ character varying(4000),
    deployment_id_ character varying(64),
    suspension_state_ integer DEFAULT 1 NOT NULL,
    job_def_id_ character varying(64),
    priority_ bigint DEFAULT 0 NOT NULL,
    sequence_counter_ bigint,
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_ru_job OWNER TO camunda;

--
-- Name: act_ru_jobdef; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_ru_jobdef (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    proc_def_id_ character varying(64),
    proc_def_key_ character varying(255),
    act_id_ character varying(255),
    job_type_ character varying(255) NOT NULL,
    job_configuration_ character varying(255),
    suspension_state_ integer,
    job_priority_ bigint,
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_ru_jobdef OWNER TO camunda;

--
-- Name: act_ru_meter_log; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_ru_meter_log (
    id_ character varying(64) NOT NULL,
    name_ character varying(64) NOT NULL,
    reporter_ character varying(255),
    value_ bigint,
    timestamp_ timestamp without time zone,
    milliseconds_ bigint DEFAULT 0
);


ALTER TABLE public.act_ru_meter_log OWNER TO camunda;

--
-- Name: act_ru_task; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_ru_task (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    proc_def_id_ character varying(64),
    case_execution_id_ character varying(64),
    case_inst_id_ character varying(64),
    case_def_id_ character varying(64),
    name_ character varying(255),
    parent_task_id_ character varying(64),
    description_ character varying(4000),
    task_def_key_ character varying(255),
    owner_ character varying(255),
    assignee_ character varying(255),
    delegation_ character varying(64),
    priority_ integer,
    create_time_ timestamp without time zone,
    due_date_ timestamp without time zone,
    follow_up_date_ timestamp without time zone,
    suspension_state_ integer,
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_ru_task OWNER TO camunda;

--
-- Name: act_ru_variable; Type: TABLE; Schema: public; Owner: camunda
--

CREATE TABLE public.act_ru_variable (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    type_ character varying(255) NOT NULL,
    name_ character varying(255) NOT NULL,
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    case_execution_id_ character varying(64),
    case_inst_id_ character varying(64),
    task_id_ character varying(64),
    bytearray_id_ character varying(64),
    double_ double precision,
    long_ bigint,
    text_ character varying(4000),
    text2_ character varying(4000),
    var_scope_ character varying(64),
    sequence_counter_ bigint,
    is_concurrent_local_ boolean,
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_ru_variable OWNER TO camunda;

--
-- Data for Name: act_ge_bytearray; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_ge_bytearray (id_, rev_, name_, deployment_id_, bytes_, generated_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_ge_property; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_ge_property (name_, value_, rev_) FROM stdin;
schema.version	fox	1
schema.history	create(fox)	1
next.dbid	1	1
deployment.lock	0	1
history.cleanup.job.lock	0	1
startup.lock	0	1
historyLevel	3	1
\.


--
-- Data for Name: act_hi_actinst; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_hi_actinst (id_, parent_act_inst_id_, proc_def_key_, proc_def_id_, proc_inst_id_, execution_id_, act_id_, task_id_, call_proc_inst_id_, call_case_inst_id_, act_name_, act_type_, assignee_, start_time_, end_time_, duration_, act_inst_state_, sequence_counter_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_hi_attachment; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_hi_attachment (id_, rev_, user_id_, name_, description_, type_, task_id_, proc_inst_id_, url_, content_id_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_hi_batch; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_hi_batch (id_, type_, total_jobs_, jobs_per_seed_, invocations_per_job_, seed_job_def_id_, monitor_job_def_id_, batch_job_def_id_, tenant_id_, start_time_, end_time_) FROM stdin;
\.


--
-- Data for Name: act_hi_caseactinst; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_hi_caseactinst (id_, parent_act_inst_id_, case_def_id_, case_inst_id_, case_act_id_, task_id_, call_proc_inst_id_, call_case_inst_id_, case_act_name_, case_act_type_, create_time_, end_time_, duration_, state_, required_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_hi_caseinst; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_hi_caseinst (id_, case_inst_id_, business_key_, case_def_id_, create_time_, close_time_, duration_, state_, create_user_id_, super_case_instance_id_, super_process_instance_id_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_hi_comment; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_hi_comment (id_, type_, time_, user_id_, task_id_, proc_inst_id_, action_, message_, full_msg_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_hi_dec_in; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_hi_dec_in (id_, dec_inst_id_, clause_id_, clause_name_, var_type_, bytearray_id_, double_, long_, text_, text2_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_hi_dec_out; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_hi_dec_out (id_, dec_inst_id_, clause_id_, clause_name_, rule_id_, rule_order_, var_name_, var_type_, bytearray_id_, double_, long_, text_, text2_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_hi_decinst; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_hi_decinst (id_, dec_def_id_, dec_def_key_, dec_def_name_, proc_def_key_, proc_def_id_, proc_inst_id_, case_def_key_, case_def_id_, case_inst_id_, act_inst_id_, act_id_, eval_time_, collect_value_, user_id_, root_dec_inst_id_, dec_req_id_, dec_req_key_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_hi_detail; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_hi_detail (id_, type_, proc_def_key_, proc_def_id_, proc_inst_id_, execution_id_, case_def_key_, case_def_id_, case_inst_id_, case_execution_id_, task_id_, act_inst_id_, var_inst_id_, name_, var_type_, rev_, time_, bytearray_id_, double_, long_, text_, text2_, sequence_counter_, tenant_id_, operation_id_) FROM stdin;
\.


--
-- Data for Name: act_hi_ext_task_log; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_hi_ext_task_log (id_, timestamp_, ext_task_id_, retries_, topic_name_, worker_id_, priority_, error_msg_, error_details_id_, act_id_, act_inst_id_, execution_id_, proc_inst_id_, proc_def_id_, proc_def_key_, tenant_id_, state_) FROM stdin;
\.


--
-- Data for Name: act_hi_identitylink; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_hi_identitylink (id_, timestamp_, type_, user_id_, group_id_, task_id_, proc_def_id_, operation_type_, assigner_id_, proc_def_key_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_hi_incident; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_hi_incident (id_, proc_def_key_, proc_def_id_, proc_inst_id_, execution_id_, create_time_, end_time_, incident_msg_, incident_type_, activity_id_, cause_incident_id_, root_cause_incident_id_, configuration_, incident_state_, tenant_id_, job_def_id_) FROM stdin;
\.


--
-- Data for Name: act_hi_job_log; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_hi_job_log (id_, timestamp_, job_id_, job_duedate_, job_retries_, job_priority_, job_exception_msg_, job_exception_stack_id_, job_state_, job_def_id_, job_def_type_, job_def_configuration_, act_id_, execution_id_, process_instance_id_, process_def_id_, process_def_key_, deployment_id_, sequence_counter_, tenant_id_) FROM stdin;
7de5f1a1-5652-11ea-a804-0242ac190002	2020-02-23 15:38:08.775	7de52e50-5652-11ea-a804-0242ac190002	2020-02-23 00:01:00	3	0	\N	\N	0	\N	history-cleanup	\N	\N	\N	\N	\N	\N	\N	1	\N
7e3682a2-5652-11ea-a804-0242ac190002	2020-02-23 15:38:09.303	7de52e50-5652-11ea-a804-0242ac190002	2020-02-23 15:38:19.302	3	0	\N	\N	2	\N	history-cleanup	\N	\N	\N	\N	\N	\N	\N	2	\N
877f5f33-5652-11ea-a804-0242ac190002	2020-02-23 15:38:24.88	7de52e50-5652-11ea-a804-0242ac190002	2020-02-23 15:38:44.879	3	0	\N	\N	2	\N	history-cleanup	\N	\N	\N	\N	\N	\N	\N	3	\N
\.


--
-- Data for Name: act_hi_op_log; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_hi_op_log (id_, deployment_id_, proc_def_id_, proc_def_key_, proc_inst_id_, execution_id_, case_def_id_, case_inst_id_, case_execution_id_, task_id_, job_id_, job_def_id_, batch_id_, user_id_, timestamp_, operation_type_, operation_id_, entity_type_, property_, org_value_, new_value_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_hi_procinst; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_hi_procinst (id_, proc_inst_id_, business_key_, proc_def_key_, proc_def_id_, start_time_, end_time_, duration_, start_user_id_, start_act_id_, end_act_id_, super_process_instance_id_, super_case_instance_id_, case_inst_id_, delete_reason_, tenant_id_, state_) FROM stdin;
\.


--
-- Data for Name: act_hi_taskinst; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_hi_taskinst (id_, task_def_key_, proc_def_key_, proc_def_id_, proc_inst_id_, execution_id_, case_def_key_, case_def_id_, case_inst_id_, case_execution_id_, act_inst_id_, name_, parent_task_id_, description_, owner_, assignee_, start_time_, end_time_, duration_, delete_reason_, priority_, due_date_, follow_up_date_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_hi_varinst; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_hi_varinst (id_, proc_def_key_, proc_def_id_, proc_inst_id_, execution_id_, act_inst_id_, case_def_key_, case_def_id_, case_inst_id_, case_execution_id_, task_id_, name_, var_type_, rev_, bytearray_id_, double_, long_, text_, text2_, tenant_id_, state_) FROM stdin;
\.


--
-- Data for Name: act_id_group; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_id_group (id_, rev_, name_, type_) FROM stdin;
\.


--
-- Data for Name: act_id_info; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_id_info (id_, rev_, user_id_, type_, key_, value_, password_, parent_id_) FROM stdin;
\.


--
-- Data for Name: act_id_membership; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_id_membership (user_id_, group_id_) FROM stdin;
\.


--
-- Data for Name: act_id_tenant; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_id_tenant (id_, rev_, name_) FROM stdin;
\.


--
-- Data for Name: act_id_tenant_member; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_id_tenant_member (id_, tenant_id_, user_id_, group_id_) FROM stdin;
\.


--
-- Data for Name: act_id_user; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_id_user (id_, rev_, first_, last_, email_, pwd_, salt_, picture_id_) FROM stdin;
\.


--
-- Data for Name: act_re_case_def; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_re_case_def (id_, rev_, category_, name_, key_, version_, deployment_id_, resource_name_, dgrm_resource_name_, tenant_id_, history_ttl_) FROM stdin;
\.


--
-- Data for Name: act_re_decision_def; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_re_decision_def (id_, rev_, category_, name_, key_, version_, deployment_id_, resource_name_, dgrm_resource_name_, dec_req_id_, dec_req_key_, tenant_id_, history_ttl_, version_tag_) FROM stdin;
\.


--
-- Data for Name: act_re_decision_req_def; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_re_decision_req_def (id_, rev_, category_, name_, key_, version_, deployment_id_, resource_name_, dgrm_resource_name_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_re_deployment; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_re_deployment (id_, name_, deploy_time_, source_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_re_procdef; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_re_procdef (id_, rev_, category_, name_, key_, version_, deployment_id_, resource_name_, dgrm_resource_name_, has_start_form_key_, suspension_state_, tenant_id_, version_tag_, history_ttl_) FROM stdin;
\.


--
-- Data for Name: act_ru_authorization; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_ru_authorization (id_, rev_, type_, group_id_, user_id_, resource_type_, resource_id_, perms_) FROM stdin;
\.


--
-- Data for Name: act_ru_batch; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_ru_batch (id_, rev_, type_, total_jobs_, jobs_created_, jobs_per_seed_, invocations_per_job_, seed_job_def_id_, batch_job_def_id_, monitor_job_def_id_, suspension_state_, configuration_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_case_execution; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_ru_case_execution (id_, rev_, case_inst_id_, super_case_exec_, super_exec_, business_key_, parent_id_, case_def_id_, act_id_, prev_state_, current_state_, required_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_case_sentry_part; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_ru_case_sentry_part (id_, rev_, case_inst_id_, case_exec_id_, sentry_id_, type_, source_case_exec_id_, standard_event_, source_, variable_event_, variable_name_, satisfied_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_event_subscr; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_ru_event_subscr (id_, rev_, event_type_, event_name_, execution_id_, proc_inst_id_, activity_id_, configuration_, created_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_execution; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_ru_execution (id_, rev_, proc_inst_id_, business_key_, parent_id_, proc_def_id_, super_exec_, super_case_exec_, case_inst_id_, act_id_, act_inst_id_, is_active_, is_concurrent_, is_scope_, is_event_scope_, suspension_state_, cached_ent_state_, sequence_counter_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_ext_task; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_ru_ext_task (id_, rev_, worker_id_, topic_name_, retries_, error_msg_, error_details_id_, lock_exp_time_, suspension_state_, execution_id_, proc_inst_id_, proc_def_id_, proc_def_key_, act_id_, act_inst_id_, tenant_id_, priority_) FROM stdin;
\.


--
-- Data for Name: act_ru_filter; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_ru_filter (id_, rev_, resource_type_, name_, owner_, query_, properties_) FROM stdin;
\.


--
-- Data for Name: act_ru_identitylink; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_ru_identitylink (id_, rev_, group_id_, type_, user_id_, task_id_, proc_def_id_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_incident; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_ru_incident (id_, rev_, incident_timestamp_, incident_msg_, incident_type_, execution_id_, activity_id_, proc_inst_id_, proc_def_id_, cause_incident_id_, root_cause_incident_id_, configuration_, tenant_id_, job_def_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_job; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_ru_job (id_, rev_, type_, lock_exp_time_, lock_owner_, exclusive_, execution_id_, process_instance_id_, process_def_id_, process_def_key_, retries_, exception_stack_id_, exception_msg_, duedate_, repeat_, handler_type_, handler_cfg_, deployment_id_, suspension_state_, job_def_id_, priority_, sequence_counter_, tenant_id_) FROM stdin;
7de52e50-5652-11ea-a804-0242ac190002	5	ever-living	\N	\N	t	\N	\N	\N	\N	3	\N	\N	2020-02-23 15:38:44.879	\N	history-cleanup	{"countEmptyRuns":2,"immediatelyDue":false}	\N	1	\N	0	3	\N
\.


--
-- Data for Name: act_ru_jobdef; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_ru_jobdef (id_, rev_, proc_def_id_, proc_def_key_, act_id_, job_type_, job_configuration_, suspension_state_, job_priority_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_meter_log; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_ru_meter_log (id_, name_, reporter_, value_, timestamp_, milliseconds_) FROM stdin;
\.


--
-- Data for Name: act_ru_task; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_ru_task (id_, rev_, execution_id_, proc_inst_id_, proc_def_id_, case_execution_id_, case_inst_id_, case_def_id_, name_, parent_task_id_, description_, task_def_key_, owner_, assignee_, delegation_, priority_, create_time_, due_date_, follow_up_date_, suspension_state_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_variable; Type: TABLE DATA; Schema: public; Owner: camunda
--

COPY public.act_ru_variable (id_, rev_, type_, name_, execution_id_, proc_inst_id_, case_execution_id_, case_inst_id_, task_id_, bytearray_id_, double_, long_, text_, text2_, var_scope_, sequence_counter_, is_concurrent_local_, tenant_id_) FROM stdin;
\.


--
-- Name: act_ge_bytearray act_ge_bytearray_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ge_bytearray
    ADD CONSTRAINT act_ge_bytearray_pkey PRIMARY KEY (id_);


--
-- Name: act_ge_property act_ge_property_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ge_property
    ADD CONSTRAINT act_ge_property_pkey PRIMARY KEY (name_);


--
-- Name: act_hi_actinst act_hi_actinst_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_hi_actinst
    ADD CONSTRAINT act_hi_actinst_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_attachment act_hi_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_hi_attachment
    ADD CONSTRAINT act_hi_attachment_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_batch act_hi_batch_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_hi_batch
    ADD CONSTRAINT act_hi_batch_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_caseactinst act_hi_caseactinst_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_hi_caseactinst
    ADD CONSTRAINT act_hi_caseactinst_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_caseinst act_hi_caseinst_case_inst_id__key; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_hi_caseinst
    ADD CONSTRAINT act_hi_caseinst_case_inst_id__key UNIQUE (case_inst_id_);


--
-- Name: act_hi_caseinst act_hi_caseinst_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_hi_caseinst
    ADD CONSTRAINT act_hi_caseinst_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_comment act_hi_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_hi_comment
    ADD CONSTRAINT act_hi_comment_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_dec_in act_hi_dec_in_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_hi_dec_in
    ADD CONSTRAINT act_hi_dec_in_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_dec_out act_hi_dec_out_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_hi_dec_out
    ADD CONSTRAINT act_hi_dec_out_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_decinst act_hi_decinst_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_hi_decinst
    ADD CONSTRAINT act_hi_decinst_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_detail act_hi_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_hi_detail
    ADD CONSTRAINT act_hi_detail_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_ext_task_log act_hi_ext_task_log_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_hi_ext_task_log
    ADD CONSTRAINT act_hi_ext_task_log_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_identitylink act_hi_identitylink_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_hi_identitylink
    ADD CONSTRAINT act_hi_identitylink_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_incident act_hi_incident_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_hi_incident
    ADD CONSTRAINT act_hi_incident_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_job_log act_hi_job_log_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_hi_job_log
    ADD CONSTRAINT act_hi_job_log_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_op_log act_hi_op_log_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_hi_op_log
    ADD CONSTRAINT act_hi_op_log_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_procinst act_hi_procinst_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_hi_procinst
    ADD CONSTRAINT act_hi_procinst_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_procinst act_hi_procinst_proc_inst_id__key; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_hi_procinst
    ADD CONSTRAINT act_hi_procinst_proc_inst_id__key UNIQUE (proc_inst_id_);


--
-- Name: act_hi_taskinst act_hi_taskinst_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_hi_taskinst
    ADD CONSTRAINT act_hi_taskinst_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_varinst act_hi_varinst_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_hi_varinst
    ADD CONSTRAINT act_hi_varinst_pkey PRIMARY KEY (id_);


--
-- Name: act_id_group act_id_group_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_id_group
    ADD CONSTRAINT act_id_group_pkey PRIMARY KEY (id_);


--
-- Name: act_id_info act_id_info_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_id_info
    ADD CONSTRAINT act_id_info_pkey PRIMARY KEY (id_);


--
-- Name: act_id_membership act_id_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_id_membership
    ADD CONSTRAINT act_id_membership_pkey PRIMARY KEY (user_id_, group_id_);


--
-- Name: act_id_tenant_member act_id_tenant_member_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_id_tenant_member
    ADD CONSTRAINT act_id_tenant_member_pkey PRIMARY KEY (id_);


--
-- Name: act_id_tenant act_id_tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_id_tenant
    ADD CONSTRAINT act_id_tenant_pkey PRIMARY KEY (id_);


--
-- Name: act_id_user act_id_user_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_id_user
    ADD CONSTRAINT act_id_user_pkey PRIMARY KEY (id_);


--
-- Name: act_re_case_def act_re_case_def_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_re_case_def
    ADD CONSTRAINT act_re_case_def_pkey PRIMARY KEY (id_);


--
-- Name: act_re_decision_def act_re_decision_def_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_re_decision_def
    ADD CONSTRAINT act_re_decision_def_pkey PRIMARY KEY (id_);


--
-- Name: act_re_decision_req_def act_re_decision_req_def_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_re_decision_req_def
    ADD CONSTRAINT act_re_decision_req_def_pkey PRIMARY KEY (id_);


--
-- Name: act_re_deployment act_re_deployment_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_re_deployment
    ADD CONSTRAINT act_re_deployment_pkey PRIMARY KEY (id_);


--
-- Name: act_re_procdef act_re_procdef_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_re_procdef
    ADD CONSTRAINT act_re_procdef_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_authorization act_ru_authorization_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_authorization
    ADD CONSTRAINT act_ru_authorization_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_batch act_ru_batch_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_batch
    ADD CONSTRAINT act_ru_batch_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_case_execution act_ru_case_execution_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_case_execution
    ADD CONSTRAINT act_ru_case_execution_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_case_sentry_part act_ru_case_sentry_part_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_case_sentry_part
    ADD CONSTRAINT act_ru_case_sentry_part_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_event_subscr act_ru_event_subscr_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_event_subscr
    ADD CONSTRAINT act_ru_event_subscr_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_execution act_ru_execution_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_execution
    ADD CONSTRAINT act_ru_execution_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_ext_task act_ru_ext_task_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_ext_task
    ADD CONSTRAINT act_ru_ext_task_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_filter act_ru_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_filter
    ADD CONSTRAINT act_ru_filter_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_identitylink act_ru_identitylink_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_identitylink
    ADD CONSTRAINT act_ru_identitylink_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_incident act_ru_incident_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_incident
    ADD CONSTRAINT act_ru_incident_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_job act_ru_job_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_job
    ADD CONSTRAINT act_ru_job_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_jobdef act_ru_jobdef_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_jobdef
    ADD CONSTRAINT act_ru_jobdef_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_meter_log act_ru_meter_log_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_meter_log
    ADD CONSTRAINT act_ru_meter_log_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_task act_ru_task_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_task
    ADD CONSTRAINT act_ru_task_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_variable act_ru_variable_pkey; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_ru_variable_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_authorization act_uniq_auth_group; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_authorization
    ADD CONSTRAINT act_uniq_auth_group UNIQUE (type_, group_id_, resource_type_, resource_id_);


--
-- Name: act_ru_authorization act_uniq_auth_user; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_authorization
    ADD CONSTRAINT act_uniq_auth_user UNIQUE (type_, user_id_, resource_type_, resource_id_);


--
-- Name: act_id_tenant_member act_uniq_tenant_memb_group; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_id_tenant_member
    ADD CONSTRAINT act_uniq_tenant_memb_group UNIQUE (tenant_id_, group_id_);


--
-- Name: act_id_tenant_member act_uniq_tenant_memb_user; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_id_tenant_member
    ADD CONSTRAINT act_uniq_tenant_memb_user UNIQUE (tenant_id_, user_id_);


--
-- Name: act_ru_variable act_uniq_variable; Type: CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_uniq_variable UNIQUE (var_scope_, name_);


--
-- Name: act_hi_ext_task_log_proc_def_key; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_hi_ext_task_log_proc_def_key ON public.act_hi_ext_task_log USING btree (proc_def_key_);


--
-- Name: act_hi_ext_task_log_procdef; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_hi_ext_task_log_procdef ON public.act_hi_ext_task_log USING btree (proc_def_id_);


--
-- Name: act_hi_ext_task_log_procinst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_hi_ext_task_log_procinst ON public.act_hi_ext_task_log USING btree (proc_inst_id_);


--
-- Name: act_hi_ext_task_log_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_hi_ext_task_log_tenant_id ON public.act_hi_ext_task_log USING btree (tenant_id_);


--
-- Name: act_idx_athrz_procedef; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_athrz_procedef ON public.act_ru_identitylink USING btree (proc_def_id_);


--
-- Name: act_idx_auth_group_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_auth_group_id ON public.act_ru_authorization USING btree (group_id_);


--
-- Name: act_idx_auth_resource_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_auth_resource_id ON public.act_ru_authorization USING btree (resource_id_);


--
-- Name: act_idx_batch_job_def; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_batch_job_def ON public.act_ru_batch USING btree (batch_job_def_id_);


--
-- Name: act_idx_batch_monitor_job_def; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_batch_monitor_job_def ON public.act_ru_batch USING btree (monitor_job_def_id_);


--
-- Name: act_idx_batch_seed_job_def; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_batch_seed_job_def ON public.act_ru_batch USING btree (seed_job_def_id_);


--
-- Name: act_idx_bytear_depl; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_bytear_depl ON public.act_ge_bytearray USING btree (deployment_id_);


--
-- Name: act_idx_bytearray_name; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_bytearray_name ON public.act_ge_bytearray USING btree (name_);


--
-- Name: act_idx_case_def_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_case_def_tenant_id ON public.act_re_case_def USING btree (tenant_id_);


--
-- Name: act_idx_case_exe_case_def; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_case_exe_case_def ON public.act_ru_case_execution USING btree (case_def_id_);


--
-- Name: act_idx_case_exe_case_inst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_case_exe_case_inst ON public.act_ru_case_execution USING btree (case_inst_id_);


--
-- Name: act_idx_case_exe_parent; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_case_exe_parent ON public.act_ru_case_execution USING btree (parent_id_);


--
-- Name: act_idx_case_exec_buskey; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_case_exec_buskey ON public.act_ru_case_execution USING btree (business_key_);


--
-- Name: act_idx_case_exec_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_case_exec_tenant_id ON public.act_ru_case_execution USING btree (tenant_id_);


--
-- Name: act_idx_case_sentry_case_exec; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_case_sentry_case_exec ON public.act_ru_case_sentry_part USING btree (case_exec_id_);


--
-- Name: act_idx_case_sentry_case_inst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_case_sentry_case_inst ON public.act_ru_case_sentry_part USING btree (case_inst_id_);


--
-- Name: act_idx_dec_def_req_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_dec_def_req_id ON public.act_re_decision_def USING btree (dec_req_id_);


--
-- Name: act_idx_dec_def_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_dec_def_tenant_id ON public.act_re_decision_def USING btree (tenant_id_);


--
-- Name: act_idx_dec_req_def_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_dec_req_def_tenant_id ON public.act_re_decision_req_def USING btree (tenant_id_);


--
-- Name: act_idx_deployment_name; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_deployment_name ON public.act_re_deployment USING btree (name_);


--
-- Name: act_idx_deployment_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_deployment_tenant_id ON public.act_re_deployment USING btree (tenant_id_);


--
-- Name: act_idx_event_subscr; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_event_subscr ON public.act_ru_event_subscr USING btree (execution_id_);


--
-- Name: act_idx_event_subscr_config_; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_event_subscr_config_ ON public.act_ru_event_subscr USING btree (configuration_);


--
-- Name: act_idx_event_subscr_evt_name; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_event_subscr_evt_name ON public.act_ru_event_subscr USING btree (event_name_);


--
-- Name: act_idx_event_subscr_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_event_subscr_tenant_id ON public.act_ru_event_subscr USING btree (tenant_id_);


--
-- Name: act_idx_exe_parent; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_exe_parent ON public.act_ru_execution USING btree (parent_id_);


--
-- Name: act_idx_exe_procdef; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_exe_procdef ON public.act_ru_execution USING btree (proc_def_id_);


--
-- Name: act_idx_exe_procinst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_exe_procinst ON public.act_ru_execution USING btree (proc_inst_id_);


--
-- Name: act_idx_exe_super; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_exe_super ON public.act_ru_execution USING btree (super_exec_);


--
-- Name: act_idx_exec_buskey; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_exec_buskey ON public.act_ru_execution USING btree (business_key_);


--
-- Name: act_idx_exec_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_exec_tenant_id ON public.act_ru_execution USING btree (tenant_id_);


--
-- Name: act_idx_ext_task_err_details; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_ext_task_err_details ON public.act_ru_ext_task USING btree (error_details_id_);


--
-- Name: act_idx_ext_task_exec; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_ext_task_exec ON public.act_ru_ext_task USING btree (execution_id_);


--
-- Name: act_idx_ext_task_priority; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_ext_task_priority ON public.act_ru_ext_task USING btree (priority_);


--
-- Name: act_idx_ext_task_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_ext_task_tenant_id ON public.act_ru_ext_task USING btree (tenant_id_);


--
-- Name: act_idx_ext_task_topic; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_ext_task_topic ON public.act_ru_ext_task USING btree (topic_name_);


--
-- Name: act_idx_hi_act_inst_comp; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_act_inst_comp ON public.act_hi_actinst USING btree (execution_id_, act_id_, end_time_, id_);


--
-- Name: act_idx_hi_act_inst_end; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_act_inst_end ON public.act_hi_actinst USING btree (end_time_);


--
-- Name: act_idx_hi_act_inst_proc_def_key; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_act_inst_proc_def_key ON public.act_hi_actinst USING btree (proc_def_key_);


--
-- Name: act_idx_hi_act_inst_procinst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_act_inst_procinst ON public.act_hi_actinst USING btree (proc_inst_id_, act_id_);


--
-- Name: act_idx_hi_act_inst_start; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_act_inst_start ON public.act_hi_actinst USING btree (start_time_);


--
-- Name: act_idx_hi_act_inst_stats; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_act_inst_stats ON public.act_hi_actinst USING btree (proc_def_id_, act_id_, end_time_, act_inst_state_);


--
-- Name: act_idx_hi_act_inst_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_act_inst_tenant_id ON public.act_hi_actinst USING btree (tenant_id_);


--
-- Name: act_idx_hi_attachment_content; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_attachment_content ON public.act_hi_attachment USING btree (content_id_);


--
-- Name: act_idx_hi_attachment_procinst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_attachment_procinst ON public.act_hi_attachment USING btree (proc_inst_id_);


--
-- Name: act_idx_hi_attachment_task; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_attachment_task ON public.act_hi_attachment USING btree (task_id_);


--
-- Name: act_idx_hi_cas_a_i_comp; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_cas_a_i_comp ON public.act_hi_caseactinst USING btree (case_act_id_, end_time_, id_);


--
-- Name: act_idx_hi_cas_a_i_create; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_cas_a_i_create ON public.act_hi_caseactinst USING btree (create_time_);


--
-- Name: act_idx_hi_cas_a_i_end; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_cas_a_i_end ON public.act_hi_caseactinst USING btree (end_time_);


--
-- Name: act_idx_hi_cas_a_i_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_cas_a_i_tenant_id ON public.act_hi_caseactinst USING btree (tenant_id_);


--
-- Name: act_idx_hi_cas_i_buskey; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_cas_i_buskey ON public.act_hi_caseinst USING btree (business_key_);


--
-- Name: act_idx_hi_cas_i_close; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_cas_i_close ON public.act_hi_caseinst USING btree (close_time_);


--
-- Name: act_idx_hi_cas_i_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_cas_i_tenant_id ON public.act_hi_caseinst USING btree (tenant_id_);


--
-- Name: act_idx_hi_casevar_case_inst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_casevar_case_inst ON public.act_hi_varinst USING btree (case_inst_id_);


--
-- Name: act_idx_hi_comment_procinst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_comment_procinst ON public.act_hi_comment USING btree (proc_inst_id_);


--
-- Name: act_idx_hi_comment_task; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_comment_task ON public.act_hi_comment USING btree (task_id_);


--
-- Name: act_idx_hi_dec_in_clause; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_dec_in_clause ON public.act_hi_dec_in USING btree (dec_inst_id_, clause_id_);


--
-- Name: act_idx_hi_dec_in_inst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_dec_in_inst ON public.act_hi_dec_in USING btree (dec_inst_id_);


--
-- Name: act_idx_hi_dec_inst_act; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_dec_inst_act ON public.act_hi_decinst USING btree (act_id_);


--
-- Name: act_idx_hi_dec_inst_act_inst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_dec_inst_act_inst ON public.act_hi_decinst USING btree (act_inst_id_);


--
-- Name: act_idx_hi_dec_inst_ci; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_dec_inst_ci ON public.act_hi_decinst USING btree (case_inst_id_);


--
-- Name: act_idx_hi_dec_inst_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_dec_inst_id ON public.act_hi_decinst USING btree (dec_def_id_);


--
-- Name: act_idx_hi_dec_inst_key; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_dec_inst_key ON public.act_hi_decinst USING btree (dec_def_key_);


--
-- Name: act_idx_hi_dec_inst_pi; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_dec_inst_pi ON public.act_hi_decinst USING btree (proc_inst_id_);


--
-- Name: act_idx_hi_dec_inst_req_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_dec_inst_req_id ON public.act_hi_decinst USING btree (dec_req_id_);


--
-- Name: act_idx_hi_dec_inst_req_key; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_dec_inst_req_key ON public.act_hi_decinst USING btree (dec_req_key_);


--
-- Name: act_idx_hi_dec_inst_root_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_dec_inst_root_id ON public.act_hi_decinst USING btree (root_dec_inst_id_);


--
-- Name: act_idx_hi_dec_inst_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_dec_inst_tenant_id ON public.act_hi_decinst USING btree (tenant_id_);


--
-- Name: act_idx_hi_dec_inst_time; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_dec_inst_time ON public.act_hi_decinst USING btree (eval_time_);


--
-- Name: act_idx_hi_dec_out_inst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_dec_out_inst ON public.act_hi_dec_out USING btree (dec_inst_id_);


--
-- Name: act_idx_hi_dec_out_rule; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_dec_out_rule ON public.act_hi_dec_out USING btree (rule_order_, clause_id_);


--
-- Name: act_idx_hi_detail_act_inst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_detail_act_inst ON public.act_hi_detail USING btree (act_inst_id_);


--
-- Name: act_idx_hi_detail_bytear; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_detail_bytear ON public.act_hi_detail USING btree (bytearray_id_);


--
-- Name: act_idx_hi_detail_case_exec; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_detail_case_exec ON public.act_hi_detail USING btree (case_execution_id_);


--
-- Name: act_idx_hi_detail_case_inst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_detail_case_inst ON public.act_hi_detail USING btree (case_inst_id_);


--
-- Name: act_idx_hi_detail_name; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_detail_name ON public.act_hi_detail USING btree (name_);


--
-- Name: act_idx_hi_detail_proc_def_key; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_detail_proc_def_key ON public.act_hi_detail USING btree (proc_def_key_);


--
-- Name: act_idx_hi_detail_proc_inst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_detail_proc_inst ON public.act_hi_detail USING btree (proc_inst_id_);


--
-- Name: act_idx_hi_detail_task_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_detail_task_id ON public.act_hi_detail USING btree (task_id_);


--
-- Name: act_idx_hi_detail_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_detail_tenant_id ON public.act_hi_detail USING btree (tenant_id_);


--
-- Name: act_idx_hi_detail_time; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_detail_time ON public.act_hi_detail USING btree (time_);


--
-- Name: act_idx_hi_exttasklog_errordet; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_exttasklog_errordet ON public.act_hi_ext_task_log USING btree (error_details_id_);


--
-- Name: act_idx_hi_ident_link_task; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_ident_link_task ON public.act_hi_identitylink USING btree (task_id_);


--
-- Name: act_idx_hi_ident_lnk_group; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_ident_lnk_group ON public.act_hi_identitylink USING btree (group_id_);


--
-- Name: act_idx_hi_ident_lnk_proc_def_key; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_ident_lnk_proc_def_key ON public.act_hi_identitylink USING btree (proc_def_key_);


--
-- Name: act_idx_hi_ident_lnk_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_ident_lnk_tenant_id ON public.act_hi_identitylink USING btree (tenant_id_);


--
-- Name: act_idx_hi_ident_lnk_user; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_ident_lnk_user ON public.act_hi_identitylink USING btree (user_id_);


--
-- Name: act_idx_hi_incident_proc_def_key; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_incident_proc_def_key ON public.act_hi_incident USING btree (proc_def_key_);


--
-- Name: act_idx_hi_incident_procinst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_incident_procinst ON public.act_hi_incident USING btree (proc_inst_id_);


--
-- Name: act_idx_hi_incident_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_incident_tenant_id ON public.act_hi_incident USING btree (tenant_id_);


--
-- Name: act_idx_hi_job_log_ex_stack; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_job_log_ex_stack ON public.act_hi_job_log USING btree (job_exception_stack_id_);


--
-- Name: act_idx_hi_job_log_job_def_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_job_log_job_def_id ON public.act_hi_job_log USING btree (job_def_id_);


--
-- Name: act_idx_hi_job_log_proc_def_key; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_job_log_proc_def_key ON public.act_hi_job_log USING btree (process_def_key_);


--
-- Name: act_idx_hi_job_log_procdef; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_job_log_procdef ON public.act_hi_job_log USING btree (process_def_id_);


--
-- Name: act_idx_hi_job_log_procinst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_job_log_procinst ON public.act_hi_job_log USING btree (process_instance_id_);


--
-- Name: act_idx_hi_job_log_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_job_log_tenant_id ON public.act_hi_job_log USING btree (tenant_id_);


--
-- Name: act_idx_hi_op_log_procdef; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_op_log_procdef ON public.act_hi_op_log USING btree (proc_def_id_);


--
-- Name: act_idx_hi_op_log_procinst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_op_log_procinst ON public.act_hi_op_log USING btree (proc_inst_id_);


--
-- Name: act_idx_hi_pro_i_buskey; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_pro_i_buskey ON public.act_hi_procinst USING btree (business_key_);


--
-- Name: act_idx_hi_pro_inst_end; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_pro_inst_end ON public.act_hi_procinst USING btree (end_time_);


--
-- Name: act_idx_hi_pro_inst_proc_def_key; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_pro_inst_proc_def_key ON public.act_hi_procinst USING btree (proc_def_key_);


--
-- Name: act_idx_hi_pro_inst_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_pro_inst_tenant_id ON public.act_hi_procinst USING btree (tenant_id_);


--
-- Name: act_idx_hi_procvar_name_type; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_procvar_name_type ON public.act_hi_varinst USING btree (name_, var_type_);


--
-- Name: act_idx_hi_procvar_proc_inst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_procvar_proc_inst ON public.act_hi_varinst USING btree (proc_inst_id_);


--
-- Name: act_idx_hi_task_inst_proc_def_key; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_task_inst_proc_def_key ON public.act_hi_taskinst USING btree (proc_def_key_);


--
-- Name: act_idx_hi_task_inst_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_task_inst_tenant_id ON public.act_hi_taskinst USING btree (tenant_id_);


--
-- Name: act_idx_hi_taskinst_procinst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_taskinst_procinst ON public.act_hi_taskinst USING btree (proc_inst_id_);


--
-- Name: act_idx_hi_taskinstid_procinst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_taskinstid_procinst ON public.act_hi_taskinst USING btree (id_, proc_inst_id_);


--
-- Name: act_idx_hi_var_inst_proc_def_key; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_var_inst_proc_def_key ON public.act_hi_varinst USING btree (proc_def_key_);


--
-- Name: act_idx_hi_var_inst_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_var_inst_tenant_id ON public.act_hi_varinst USING btree (tenant_id_);


--
-- Name: act_idx_hi_varinst_bytear; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_hi_varinst_bytear ON public.act_hi_varinst USING btree (bytearray_id_);


--
-- Name: act_idx_ident_lnk_group; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_ident_lnk_group ON public.act_ru_identitylink USING btree (group_id_);


--
-- Name: act_idx_ident_lnk_user; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_ident_lnk_user ON public.act_ru_identitylink USING btree (user_id_);


--
-- Name: act_idx_inc_causeincid; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_inc_causeincid ON public.act_ru_incident USING btree (cause_incident_id_);


--
-- Name: act_idx_inc_configuration; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_inc_configuration ON public.act_ru_incident USING btree (configuration_);


--
-- Name: act_idx_inc_exid; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_inc_exid ON public.act_ru_incident USING btree (execution_id_);


--
-- Name: act_idx_inc_job_def; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_inc_job_def ON public.act_ru_incident USING btree (job_def_id_);


--
-- Name: act_idx_inc_procdefid; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_inc_procdefid ON public.act_ru_incident USING btree (proc_def_id_);


--
-- Name: act_idx_inc_procinstid; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_inc_procinstid ON public.act_ru_incident USING btree (proc_inst_id_);


--
-- Name: act_idx_inc_rootcauseincid; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_inc_rootcauseincid ON public.act_ru_incident USING btree (root_cause_incident_id_);


--
-- Name: act_idx_inc_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_inc_tenant_id ON public.act_ru_incident USING btree (tenant_id_);


--
-- Name: act_idx_job_exception; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_job_exception ON public.act_ru_job USING btree (exception_stack_id_);


--
-- Name: act_idx_job_execution_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_job_execution_id ON public.act_ru_job USING btree (execution_id_);


--
-- Name: act_idx_job_handler; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_job_handler ON public.act_ru_job USING btree (handler_type_, handler_cfg_);


--
-- Name: act_idx_job_handler_type; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_job_handler_type ON public.act_ru_job USING btree (handler_type_);


--
-- Name: act_idx_job_job_def_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_job_job_def_id ON public.act_ru_job USING btree (job_def_id_);


--
-- Name: act_idx_job_procinst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_job_procinst ON public.act_ru_job USING btree (process_instance_id_);


--
-- Name: act_idx_job_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_job_tenant_id ON public.act_ru_job USING btree (tenant_id_);


--
-- Name: act_idx_jobdef_proc_def_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_jobdef_proc_def_id ON public.act_ru_jobdef USING btree (proc_def_id_);


--
-- Name: act_idx_jobdef_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_jobdef_tenant_id ON public.act_ru_jobdef USING btree (tenant_id_);


--
-- Name: act_idx_memb_group; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_memb_group ON public.act_id_membership USING btree (group_id_);


--
-- Name: act_idx_memb_user; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_memb_user ON public.act_id_membership USING btree (user_id_);


--
-- Name: act_idx_meter_log; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_meter_log ON public.act_ru_meter_log USING btree (name_, timestamp_);


--
-- Name: act_idx_meter_log_ms; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_meter_log_ms ON public.act_ru_meter_log USING btree (milliseconds_);


--
-- Name: act_idx_meter_log_name_ms; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_meter_log_name_ms ON public.act_ru_meter_log USING btree (name_, milliseconds_);


--
-- Name: act_idx_meter_log_report; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_meter_log_report ON public.act_ru_meter_log USING btree (name_, reporter_, milliseconds_);


--
-- Name: act_idx_meter_log_time; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_meter_log_time ON public.act_ru_meter_log USING btree (timestamp_);


--
-- Name: act_idx_procdef_deployment_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_procdef_deployment_id ON public.act_re_procdef USING btree (deployment_id_);


--
-- Name: act_idx_procdef_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_procdef_tenant_id ON public.act_re_procdef USING btree (tenant_id_);


--
-- Name: act_idx_procdef_ver_tag; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_procdef_ver_tag ON public.act_re_procdef USING btree (version_tag_);


--
-- Name: act_idx_task_assignee; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_task_assignee ON public.act_ru_task USING btree (assignee_);


--
-- Name: act_idx_task_case_def_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_task_case_def_id ON public.act_ru_task USING btree (case_def_id_);


--
-- Name: act_idx_task_case_exec; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_task_case_exec ON public.act_ru_task USING btree (case_execution_id_);


--
-- Name: act_idx_task_create; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_task_create ON public.act_ru_task USING btree (create_time_);


--
-- Name: act_idx_task_exec; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_task_exec ON public.act_ru_task USING btree (execution_id_);


--
-- Name: act_idx_task_procdef; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_task_procdef ON public.act_ru_task USING btree (proc_def_id_);


--
-- Name: act_idx_task_procinst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_task_procinst ON public.act_ru_task USING btree (proc_inst_id_);


--
-- Name: act_idx_task_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_task_tenant_id ON public.act_ru_task USING btree (tenant_id_);


--
-- Name: act_idx_tenant_memb; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_tenant_memb ON public.act_id_tenant_member USING btree (tenant_id_);


--
-- Name: act_idx_tenant_memb_group; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_tenant_memb_group ON public.act_id_tenant_member USING btree (group_id_);


--
-- Name: act_idx_tenant_memb_user; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_tenant_memb_user ON public.act_id_tenant_member USING btree (user_id_);


--
-- Name: act_idx_tskass_task; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_tskass_task ON public.act_ru_identitylink USING btree (task_id_);


--
-- Name: act_idx_var_bytearray; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_var_bytearray ON public.act_ru_variable USING btree (bytearray_id_);


--
-- Name: act_idx_var_case_exe; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_var_case_exe ON public.act_ru_variable USING btree (case_execution_id_);


--
-- Name: act_idx_var_case_inst_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_var_case_inst_id ON public.act_ru_variable USING btree (case_inst_id_);


--
-- Name: act_idx_var_exe; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_var_exe ON public.act_ru_variable USING btree (execution_id_);


--
-- Name: act_idx_var_procinst; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_var_procinst ON public.act_ru_variable USING btree (proc_inst_id_);


--
-- Name: act_idx_variable_task_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_variable_task_id ON public.act_ru_variable USING btree (task_id_);


--
-- Name: act_idx_variable_tenant_id; Type: INDEX; Schema: public; Owner: camunda
--

CREATE INDEX act_idx_variable_tenant_id ON public.act_ru_variable USING btree (tenant_id_);


--
-- Name: act_ru_identitylink act_fk_athrz_procedef; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_identitylink
    ADD CONSTRAINT act_fk_athrz_procedef FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);


--
-- Name: act_ru_batch act_fk_batch_job_def; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_batch
    ADD CONSTRAINT act_fk_batch_job_def FOREIGN KEY (batch_job_def_id_) REFERENCES public.act_ru_jobdef(id_);


--
-- Name: act_ru_batch act_fk_batch_monitor_job_def; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_batch
    ADD CONSTRAINT act_fk_batch_monitor_job_def FOREIGN KEY (monitor_job_def_id_) REFERENCES public.act_ru_jobdef(id_);


--
-- Name: act_ru_batch act_fk_batch_seed_job_def; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_batch
    ADD CONSTRAINT act_fk_batch_seed_job_def FOREIGN KEY (seed_job_def_id_) REFERENCES public.act_ru_jobdef(id_);


--
-- Name: act_ge_bytearray act_fk_bytearr_depl; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ge_bytearray
    ADD CONSTRAINT act_fk_bytearr_depl FOREIGN KEY (deployment_id_) REFERENCES public.act_re_deployment(id_);


--
-- Name: act_ru_case_execution act_fk_case_exe_case_def; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_case_execution
    ADD CONSTRAINT act_fk_case_exe_case_def FOREIGN KEY (case_def_id_) REFERENCES public.act_re_case_def(id_);


--
-- Name: act_ru_case_execution act_fk_case_exe_case_inst; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_case_execution
    ADD CONSTRAINT act_fk_case_exe_case_inst FOREIGN KEY (case_inst_id_) REFERENCES public.act_ru_case_execution(id_);


--
-- Name: act_ru_case_execution act_fk_case_exe_parent; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_case_execution
    ADD CONSTRAINT act_fk_case_exe_parent FOREIGN KEY (parent_id_) REFERENCES public.act_ru_case_execution(id_);


--
-- Name: act_ru_case_sentry_part act_fk_case_sentry_case_exec; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_case_sentry_part
    ADD CONSTRAINT act_fk_case_sentry_case_exec FOREIGN KEY (case_exec_id_) REFERENCES public.act_ru_case_execution(id_);


--
-- Name: act_ru_case_sentry_part act_fk_case_sentry_case_inst; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_case_sentry_part
    ADD CONSTRAINT act_fk_case_sentry_case_inst FOREIGN KEY (case_inst_id_) REFERENCES public.act_ru_case_execution(id_);


--
-- Name: act_re_decision_def act_fk_dec_req; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_re_decision_def
    ADD CONSTRAINT act_fk_dec_req FOREIGN KEY (dec_req_id_) REFERENCES public.act_re_decision_req_def(id_);


--
-- Name: act_ru_event_subscr act_fk_event_exec; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_event_subscr
    ADD CONSTRAINT act_fk_event_exec FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_execution act_fk_exe_parent; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_execution
    ADD CONSTRAINT act_fk_exe_parent FOREIGN KEY (parent_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_execution act_fk_exe_procdef; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_execution
    ADD CONSTRAINT act_fk_exe_procdef FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);


--
-- Name: act_ru_execution act_fk_exe_procinst; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_execution
    ADD CONSTRAINT act_fk_exe_procinst FOREIGN KEY (proc_inst_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_execution act_fk_exe_super; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_execution
    ADD CONSTRAINT act_fk_exe_super FOREIGN KEY (super_exec_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_ext_task act_fk_ext_task_error_details; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_ext_task
    ADD CONSTRAINT act_fk_ext_task_error_details FOREIGN KEY (error_details_id_) REFERENCES public.act_ge_bytearray(id_);


--
-- Name: act_ru_ext_task act_fk_ext_task_exe; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_ext_task
    ADD CONSTRAINT act_fk_ext_task_exe FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_incident act_fk_inc_cause; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_incident
    ADD CONSTRAINT act_fk_inc_cause FOREIGN KEY (cause_incident_id_) REFERENCES public.act_ru_incident(id_);


--
-- Name: act_ru_incident act_fk_inc_exe; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_incident
    ADD CONSTRAINT act_fk_inc_exe FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_incident act_fk_inc_job_def; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_incident
    ADD CONSTRAINT act_fk_inc_job_def FOREIGN KEY (job_def_id_) REFERENCES public.act_ru_jobdef(id_);


--
-- Name: act_ru_incident act_fk_inc_procdef; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_incident
    ADD CONSTRAINT act_fk_inc_procdef FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);


--
-- Name: act_ru_incident act_fk_inc_procinst; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_incident
    ADD CONSTRAINT act_fk_inc_procinst FOREIGN KEY (proc_inst_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_incident act_fk_inc_rcause; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_incident
    ADD CONSTRAINT act_fk_inc_rcause FOREIGN KEY (root_cause_incident_id_) REFERENCES public.act_ru_incident(id_);


--
-- Name: act_ru_job act_fk_job_exception; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_job
    ADD CONSTRAINT act_fk_job_exception FOREIGN KEY (exception_stack_id_) REFERENCES public.act_ge_bytearray(id_);


--
-- Name: act_id_membership act_fk_memb_group; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_id_membership
    ADD CONSTRAINT act_fk_memb_group FOREIGN KEY (group_id_) REFERENCES public.act_id_group(id_);


--
-- Name: act_id_membership act_fk_memb_user; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_id_membership
    ADD CONSTRAINT act_fk_memb_user FOREIGN KEY (user_id_) REFERENCES public.act_id_user(id_);


--
-- Name: act_ru_task act_fk_task_case_def; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_task
    ADD CONSTRAINT act_fk_task_case_def FOREIGN KEY (case_def_id_) REFERENCES public.act_re_case_def(id_);


--
-- Name: act_ru_task act_fk_task_case_exe; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_task
    ADD CONSTRAINT act_fk_task_case_exe FOREIGN KEY (case_execution_id_) REFERENCES public.act_ru_case_execution(id_);


--
-- Name: act_ru_task act_fk_task_exe; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_task
    ADD CONSTRAINT act_fk_task_exe FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_task act_fk_task_procdef; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_task
    ADD CONSTRAINT act_fk_task_procdef FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);


--
-- Name: act_ru_task act_fk_task_procinst; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_task
    ADD CONSTRAINT act_fk_task_procinst FOREIGN KEY (proc_inst_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_id_tenant_member act_fk_tenant_memb; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_id_tenant_member
    ADD CONSTRAINT act_fk_tenant_memb FOREIGN KEY (tenant_id_) REFERENCES public.act_id_tenant(id_);


--
-- Name: act_id_tenant_member act_fk_tenant_memb_group; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_id_tenant_member
    ADD CONSTRAINT act_fk_tenant_memb_group FOREIGN KEY (group_id_) REFERENCES public.act_id_group(id_);


--
-- Name: act_id_tenant_member act_fk_tenant_memb_user; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_id_tenant_member
    ADD CONSTRAINT act_fk_tenant_memb_user FOREIGN KEY (user_id_) REFERENCES public.act_id_user(id_);


--
-- Name: act_ru_identitylink act_fk_tskass_task; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_identitylink
    ADD CONSTRAINT act_fk_tskass_task FOREIGN KEY (task_id_) REFERENCES public.act_ru_task(id_);


--
-- Name: act_ru_variable act_fk_var_bytearray; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_fk_var_bytearray FOREIGN KEY (bytearray_id_) REFERENCES public.act_ge_bytearray(id_);


--
-- Name: act_ru_variable act_fk_var_case_exe; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_fk_var_case_exe FOREIGN KEY (case_execution_id_) REFERENCES public.act_ru_case_execution(id_);


--
-- Name: act_ru_variable act_fk_var_case_inst; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_fk_var_case_inst FOREIGN KEY (case_inst_id_) REFERENCES public.act_ru_case_execution(id_);


--
-- Name: act_ru_variable act_fk_var_exe; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_fk_var_exe FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_variable act_fk_var_procinst; Type: FK CONSTRAINT; Schema: public; Owner: camunda
--

ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_fk_var_procinst FOREIGN KEY (proc_inst_id_) REFERENCES public.act_ru_execution(id_);


--
-- PostgreSQL database dump complete
--

