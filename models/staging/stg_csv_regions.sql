select 
    REG::number(2)              as REGION_CODE
    , CHEFLIEU::varchar(5)      as REGION_COMMUNE_CODE
    , TNCC::number(1)           as REGION_TYPE_INDICATEUR
    , NCC::varchar(200)         as REGION_NOM_MAJUSCULE
    , NCCENR::varchar(200)      as REGION_NOM
    , LIBELLE::varchar(200)     as REGION_NOM_WITH_ARTICLE
FROM {{ source('csv', 'region_2022') }}


