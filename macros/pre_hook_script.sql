{% macro snowflake_create_database_schema() %}
    {% set sql %}
   
    CREATE DATABASE IF NOT EXISTS my_rssdb_{{target.name}};
    CREATE SCHEMA IF NOT EXISTS BRONZE;
    CREATE SCHEMA IF NOT EXISTS RAW_DATA;
    CREATE SCHEMA IF NOT EXISTS CURATED;
    {% endset %}
    {% do run_query(sql) %}
    {{ log("✅ Snowflake database created or already exists", info=True) }}
{% endmacro %}



{% macro snowflake_create_file_format() %}
    {% set sql %}
    create or replace file format my_rssdb_{{target.name}}.public.ff_rss_csv_format
    type = 'CSV'
    field_delimiter = ';'
    skip_header = 1
    field_optionally_enclosed_by = '"'
    empty_field_as_null = true;


    CREATE OR REPLACE STAGE my_rssdb_{{target.name}}.public.lst_csv_files
    FILE_FORMAT = ff_rss_csv_format;
    {% endset %}
    {% do run_query(sql) %}
    {{ log("✅ Snowflake file format created or already exists", info=True) }}
{% endmacro %}


{% macro snowflake_create_tables() %}
    {% set sql %}

    create or replace TABLE bronze.rss_articles (
        KEY VARCHAR,
        POSTID VARCHAR,
        TYPERSS VARCHAR,
        TITLE VARCHAR,
        LINK VARCHAR,
        CONTENT VARCHAR,
        LITECONTENT VARCHAR,
        PUBLISHED DATE
    );
    {% endset %}
    {% do run_query(sql) %}
    {{ log("✅ Snowflake tables created (or already exists)", info=True) }}
{% endmacro %}
