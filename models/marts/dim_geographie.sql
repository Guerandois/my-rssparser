{% set start_time = modules.datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") %}

SELECT 1 as CODE_GEOGRAPHIE


{% set end_time = modules.datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") %}
{% do log_run(this.name, this.status, start_time,end_time) %}