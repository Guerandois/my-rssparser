USE ROLE accountadmin;

-- ================================================
--
-- ================================================
CREATE OR REPLACE WAREHOUSE rss_parser_wh
    WAREHOUSE_SIZE = 'xsmall'
    WAREHOUSE_TYPE = 'standard'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT = 'warehouse for rss parser dbt demo';

USE WAREHOUSE rss_parser_wh;

-- ================================================
--	
-- ================================================
CREATE DATABASE db_git_repo;
USE SCHEMA public;

-- Create credentials
CREATE OR REPLACE SECRET db_git_repo.public.github_pat
  TYPE = password
  USERNAME = 'guerandois'
  PASSWORD = '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';

-- Create the API integration
CREATE OR REPLACE API INTEGRATION git_api_integration
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/Guerandois') -- URL to your GitHub profile
  ALLOWED_AUTHENTICATION_SECRETS = (github_pat)
  ENABLED = TRUE;

-- Create the git repository object
CREATE OR REPLACE GIT REPOSITORY db_git_repo.public.my_rssparser
  API_INTEGRATION =  git_api_integration-- Name of the API integration defined above
  ORIGIN = 'https://github.com/Guerandois/my-rssparser.git' -- Insert URL of forked repo
  GIT_CREDENTIALS = db_git_repo.public.github_pat;

-- List the git repositories
-- SHOW GIT REPOSITORIES;


COPY INTO raw_data.calendrier
FROM @lst_csv_files
FILE_FORMAT = (FORMAT_NAME = 'ff_rss_csv_format')
ON_ERROR = 'CONTINUE';