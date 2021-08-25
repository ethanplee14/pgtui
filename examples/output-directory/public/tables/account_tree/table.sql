-- Generated by pgtui

CREATE TABLE public.account_tree (
    account_tree_id uuid DEFAULT (gen_random_uuid ()) NOT NULL,
    account_id uuid NOT NULL,
    tree_id uuid NOT NULL,
    state jsonb DEFAULT ('{}'::jsonb) NOT NULL,
    complete boolean DEFAULT (FALSE) NOT NULL,
    last_modified_at pg_catalog.timestamptz DEFAULT (CURRENT_TIMESTAMP) NOT NULL,
    created_at pg_catalog.timestamptz DEFAULT (CURRENT_TIMESTAMP) NOT NULL
);


ALTER TABLE public.account_tree OWNER TO postgres;

ALTER TABLE ONLY public.account_tree
    ADD CONSTRAINT account_tree_pkey PRIMARY KEY (account_tree_id);

ALTER TABLE ONLY public.account_tree
    ADD CONSTRAINT account_tree_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account (account_id);

ALTER TABLE ONLY public.account_tree
    ADD CONSTRAINT account_tree_tree_id_fkey FOREIGN KEY (tree_id) REFERENCES public.tree (tree_id);

ALTER TABLE public.account_tree ENABLE ROW LEVEL SECURITY;

