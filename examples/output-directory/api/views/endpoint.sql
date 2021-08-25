SELECT
    endpoint.endpoint_id,
    endpoint.endpoint_name,
    endpoint.endpoint_key,
    endpoint.endpoint_options,
    endpoint.endpoint_url,
    endpoint.official,
    endpoint.owner_account_id,
    endpoint.public,
    endpoint.created_at
FROM
    public.endpoint;


ALTER TABLE api.endpoint OWNER TO api_user;

