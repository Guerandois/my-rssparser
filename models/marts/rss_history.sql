{% set start_time = modules.datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") %}

SELECT  
    KEY           
    , POSTID 
    , TYPERSS 
    , TITLE 
    , LINK 
    , CONTENT 
    , LITECONTENT 
    , PUBLISHED 
FROM {{ source('csv', 'rss_articles') }}


{% set end_time = modules.datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") %}
{% do log_run(this.name, this.run_status, start_time,end_time) %}