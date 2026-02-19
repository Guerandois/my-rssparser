{% macro snowflake_create_database_schema() %}
    {% set sql %}
   
    CREATE DATABASE IF NOT EXISTS my_rssdb_{{target.name}};
    CREATE SCHEMA IF NOT EXISTS RAW_DATA;
    CREATE SCHEMA IF NOT EXISTS CURATED;
    {% endset %}
    {% do run_query(sql) %}
    {{ log("✅ Snowflake database created or already exists", info=True) }}
{% endmacro %}



{% macro snowflake_create_file_format() %}
    {% set sql %}
    create or replace file format public.ff_rss_csv_format
    type = 'CSV'
    field_delimiter = ';'
    skip_header = 1
    field_optionally_enclosed_by = '"'
    empty_field_as_null = true;
    {% endset %}
    {% do run_query(sql) %}
    {{ log("✅ Snowflake file format created or already exists", info=True) }}
{% endmacro %}


{% macro snowflake_create_tables() %}
    {% set sql %}
    CREATE TABLE IF NOT EXISTS raw_data.calendrier  (
        CAL_DATE        varchar	
        ,CAL_ANNEE	    varchar
        ,CAL_MOIS       varchar	
        ,CAL_JOUR	    varchar
        ,CAL_QUARTER    varchar	
        ,__KEY_DATE     number	
        ,CAL_TRIMESTRE  varchar	
        ,CAL_TRIMESTRE_NUM  varchar	
        ,CAL_JOUR_SEMAINE_NUM   varchar	
        ,CAL_JOUR_SEMAINE       varchar	
        ,CAL_JOUR_SEMAINE_ABR   varchar);
    {% endset %}
    {% do run_query(sql) %}
    {{ log("✅ Snowflake table created or already exists", info=True) }}
{% endmacro %}
