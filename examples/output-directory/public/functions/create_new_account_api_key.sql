CREATE FUNCTION public.create_new_account_api_key ()
    RETURNS trigger
    LANGUAGE plpgsql
    AS $EOFCODE$
BEGIN
    INSERT INTO account_api_key (account_id, purpose)
        VALUES (NEW.account_id, 'Default');
    RETURN NULL;
END
$EOFCODE$;
