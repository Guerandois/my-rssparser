SELECT 
    CAL_DATE::date                      as CAL_DATE
    ,CAL_ANNEE::number(4)               as CAL_ANNEE
    ,CAL_MOIS::number(2)                as CAL_MOIS
    ,CAL_JOUR::number(2)                as CAL_JOUR
    ,CAL_QUARTER::number(2)             as CAL_QUARTER
    ,__KEY_DATE::number(8)              as __KEY_DATE
    ,CAL_TRIMESTRE::varchar(10)         as CAL_TRIMESTRE
    ,CAL_TRIMESTRE_NUM::varchar(2)      as CAL_TRIMESTRE_NUM
    ,CAL_JOUR_SEMAINE_NUM::number(2)     as CAL_JOUR_SEMAINE_NUM
    ,CAL_JOUR_SEMAINE::varchar(20)      as CAL_JOUR_SEMAINE 
    ,CAL_JOUR_SEMAINE_ABR::varchar(2)   as CAL_JOUR_SEMAINE_ABR
FROM {{ source('csv', 'calendrier_a_plat') }}