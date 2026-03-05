{{
    config(
        materialized='incremental'
    )
}}

SELECT
    '{{ invocation_id }}' AS invocation_id,
    '{{ run_started_at }}'::timestamp AS run_started_at,
    CURRENT_TIMESTAMP AS run_ended_at,
    '{{ run_status }}' AS status