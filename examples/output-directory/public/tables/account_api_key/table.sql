CREATE TABLE public.account_api_key (
    account_api_key_id uuid DEFAULT (gen_random_uuid ()) NOT NULL,
    account_id uuid NOT NULL,
    key_string text DEFAULT (md5(random()::text)) NOT NULL,
    purpose text,
    last_used_at pg_catalog.timestamptz DEFAULT (CURRENT_TIMESTAMP) NOT NULL,
    created_at pg_catalog.timestamptz DEFAULT (CURRENT_TIMESTAMP) NOT NULL
);


ALTER TABLE public.account_api_key OWNER TO postgres;

ALTER TABLE ONLY public.account_api_key
    ADD CONSTRAINT account_api_key_pkey PRIMARY KEY (account_api_key_id);

ALTER TABLE ONLY public.account_api_key
    ADD CONSTRAINT account_api_key_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account (account_id);

ALTER TABLE public.account_api_key ENABLE ROW LEVEL SECURITY;
