{% macro log_run(model_name, status, started_at,finished_at) %}

    {% set sql %}
        insert into bronze.dbt_run_logs  (run_invocation_id, model_name, run_started_at, run_finished_at, status, execution_time_s)
        values (
            '{{ invocation_id }}',    
            '{{ model_name }}',
            '{{ started_at }}',
            '{{ finished_at }}',
            '{{ status }}',
            0
        ); 
    {% endset %}
    {% do run_query(sql) %}
{% endmacro %}

{% macro create_run_end_results_table() %}

  {{ log('Creating `dbt_meta__run_end_results` table if not exists.', info=True) }}

  create table if not exists {{ target.database }}.{{ target.schema }}.dbt_meta__run_end_results (
      run_invocation_id text not null,
      model_identifier text not null,
      model_status text not null,
      model_message text not null,
      updated_at timestamp not null
  );
{% endmacro %}

{% macro log_results(results) %}

  {% if execute %}
  {{ log("========== Begin Summary ==========", info=True) }}
  {% for res in results -%}
    {% set line -%}
        node: {{ res.node.unique_id }}; status: {{ res.status }} (message: {{ res.message }})
    {%- endset %}

    {{ log(line, info=True) }}
  {% endfor %}
  {{ log("========== End Summary ==========", info=True) }}
  {% endif %}

{% endmacro %}

{% macro log_run_end_results(results) %}

    {% if execute %}
    
        {{ log('Recording model run results in `dbt_meta__run_end_results`.', info=True) }}

        {% for res in results %}
        
            {# 
            /*
              Because results messages can contain single quotes in the error message, we
              replace them with double quotes to avoid errors during the insert.
            */ 
            #}
            {% if res.message is undefined %}
                {% set tidy_message = '' %}
            {% else %}
                 {% set tidy_message = res.message.replace("'", '"') %}
            {% endif %}
        

            {% set query -%}
        
                insert into {{ target.database }}.{{ target.schema }}.dbt_meta__run_end_results values (
                    '{{ invocation_id }}',
                    '{{ res.node.unique_id }}',
                    '{{ res.status }}', 
                    '{{ tidy_message }}',
                    current_timestamp()
                );
            {%- endset %}
            {% do run_query(query) %}
            
        {% endfor %}
        
    {% endif %}

{% endmacro %}