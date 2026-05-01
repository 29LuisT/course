--this overwrites the default materialization for this model, which is set to 'table' in dbt_project.yml. 
--This is because we want to materialize this model as a view instead of a table.
{{
  config(
    materialized = 'view'
    )
}}
WITH src_hosts AS (
  SELECT
    *
  FROM
    {{ ref('src_hosts') }}
)
SELECT
  host_id,
  NVL(host_name, 'Anonymous') AS host_name,
  is_superhost, --IFF(is_superhost = 't', TRUE, FALSE) AS is_superhost,
  created_at,
  updated_at
FROM
  src_hosts