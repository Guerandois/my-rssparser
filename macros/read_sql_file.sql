{% macro read_sql_file(path) %}
    {% set full_path = project_root ~ '/' ~ path %}
    {% set content = open(full_path).read() %}
    {{ return(content) }}
{% endmacro %}