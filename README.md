# financial_analytics
The project aims to download stock price history and financial data from the bse website and yahoo finance API , store it in SQL Server on RDS and analyze is on Snowflake Datawarehouse.
 1.) run bse_downloader.py
 2.) follow instructions in the rds-deployment folder to deploy SQL server on RDS
 3.) create S3 bucket in AWS and integrate with SQL Server
 4.) upload csv files to S3 bucket
 5.) run load scripts to load data from S3 to SQL Server
