{% macro load_data_from_stage(p_database, p_schema,p_table,p_fileFormat) %}
{{ log("Loading data from stage...", True) }}

{% set copy_sql %}
BEGIN;
USE DATABASE p_database


COPY INTO p_schema.p_table 
from @lst_csv_files
file_format = (format_name = p_fileFormat);
COMMIT;
{% endset %}

{% do run_query(copy_sql) %}
{{ log("Data load completed.", True) }}
{% endmacro %}