CREATE OR REPLACE DATABASE my_rssdb_{{target.name}};

use database  my_rssdb_{{target.name}};
create OR ALTER SCHEMA raw_data;

create OR ALTER SCHEMA curated;
