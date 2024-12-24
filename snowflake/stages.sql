use role sysadmin;
use database analytics;

CREATE OR REPLACE STAGE analytics.my_azure_stage
  URL='azure://faiitjgroup5.blob.core.windows.net/staging'
  CREDENTIALS=(AZURE_SAS_TOKEN='');

CREATE OR REPLACE STAGE staging.my_azure_stage
  URL='azure://faiitjgroup5.blob.core.windows.net/staging'
  CREDENTIALS=(AZURE_SAS_TOKEN='');
