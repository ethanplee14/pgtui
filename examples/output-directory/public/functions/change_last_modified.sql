CREATE FUNCTION public.change_last_modified ()
    RETURNS trigger
    LANGUAGE plpgsql
    AS $EOFCODE$
BEGIN
    NEW.last_modified_at := current_timestamp;
    RETURN NEW;
END
$EOFCODE$;
