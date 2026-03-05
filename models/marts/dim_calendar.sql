{% set start_time = modules.datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") %}

SELECT 
    CAL_DATE
    , CAL_ANNEE
    , CAL_MOIS
    , CAL_JOUR
    , CAL_QUARTER
    , __KEY_DATE
    , CAL_TRIMESTRE
    , CAL_TRIMESTRE_NUM
    , CAL_JOUR_SEMAINE_NUM
    , CAL_JOUR_SEMAINE 
    , CAL_JOUR_SEMAINE_ABR
FROM {{ ref('stg_csv_calendar') }}


{% set end_time = modules.datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") %}
{% do log_run(this.name, this.status, start_time,end_time) %}