select 
    TYPECOM::varchar(4)     as COMMUNE_TYPE
    , COM::varchar(5)       as COMMUNE_CODE_INSEE
    , REG::number(2)        as REGION_CODE
    , DEP::varchar(3)       as DEPT_CODE
    , CTCD::varchar(4)      as COMMUNE_CODE_COLLECTIVITE
    , ARR::varchar(4)       as COMMUNE_ARRONDISSEMENT
    , TNCC::number(1)      as COMMUNE_TYPE_INDICATEUR
    , NCC::varchar(200)     as COMMUNE_NOM_MAJUSCULE
    , NCCENR::varchar(200)  as COMMUNE_NOM
    , LIBELLE::varchar(200) as COMMUNE_NOM_WITH_ARTICLE
    , CAN::varchar(5)       as COMMUNE_CANTON
    , COMPARENT::varchar(5)  as COMMUNE_PARENTE
FROM {{ source('csv', 'commune_2022') }}


