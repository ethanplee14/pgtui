CREATE TABLE public.pgmigrations (
    id int NOT NULL,
    name varchar(255) NOT NULL,
    run_on timestamp NOT NULL
);


ALTER TABLE public.pgmigrations OWNER TO postgres;

ALTER TABLE ONLY public.pgmigrations
    ALTER COLUMN id SET DEFAULT nextval('public.pgmigrations_id_seq'::regclass);

ALTER TABLE ONLY public.pgmigrations
    ADD CONSTRAINT pgmigrations_pkey PRIMARY KEY (id);
