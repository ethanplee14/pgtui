-- Generated by pgtui

CREATE TABLE public.tree (
    tree_id uuid DEFAULT (gen_random_uuid ()) NOT NULL,
    tree_num int NOT NULL,
    tree_name text,
    tree_key text,
    owner_id uuid NOT NULL,
    tree_def jsonb NOT NULL,
    public boolean DEFAULT (FALSE) NOT NULL,
    last_modified_at pg_catalog.timestamptz DEFAULT (CURRENT_TIMESTAMP) NOT NULL,
    created_at pg_catalog.timestamptz DEFAULT (CURRENT_TIMESTAMP) NOT NULL
);


ALTER TABLE public.tree OWNER TO postgres;

ALTER TABLE ONLY public.tree
    ALTER COLUMN tree_num SET DEFAULT nextval('public.tree_tree_num_seq'::regclass);

ALTER TABLE ONLY public.tree
    ADD CONSTRAINT tree_owner_id_tree_key_key UNIQUE (owner_id, tree_key);

ALTER TABLE ONLY public.tree
    ADD CONSTRAINT tree_pkey PRIMARY KEY (tree_id);

ALTER TABLE ONLY public.tree
    ADD CONSTRAINT tree_tree_num_key UNIQUE (tree_num);

ALTER TABLE ONLY public.tree
    ADD CONSTRAINT tree_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.account (account_id);

ALTER TABLE public.tree ENABLE ROW LEVEL SECURITY;

