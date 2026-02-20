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