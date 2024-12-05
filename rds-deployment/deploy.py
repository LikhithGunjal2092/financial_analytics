import boto3
import pyodbc
import os
import json
from dotenv import load_dotenv

# Load Configuration from JSON
CONFIG_FILE_PATH = "config/rds_config.json"  # Update with the actual path to your config file
with open(CONFIG_FILE_PATH, "r") as config_file:
    config = json.load(config_file)

# Load environment variables
load_dotenv()

SQL_FILES_CONFIG = config["sql_server"]["sql_files_config"]
ODBC_DRIVER = config["sql_server"]["odbc_driver"]

RDS_IDENTIFIER = os.getenv("RDS_IDENTIFIER")
AWS_ACCESS_KEY_ID = os.getenv("AWS_ACCESS_KEY_ID")
AWS_SECRET_ACCESS_KEY = os.getenv("AWS_SECRET_ACCESS_KEY")
DB_USERNAME = os.getenv("DB_USERNAME")
DB_PASSWORD = os.getenv("DB_PASSWORD")

# AWS Configuration
AWS_REGION = config["aws"]["region"]
RDS_ENGINE = config["rds"]["engine"]
DB_INSTANCE_CLASS = config["rds"]["db_instance_class"]
DB_PORT = config["rds"]["port"]
DB_STORAGE = config["rds"]["allocated_storage"]
MAIN_DB = config["rds"]["main_db"]

# Function to create RDS instance
def create_rds_instance():
    rds_client = boto3.client("rds", region_name=AWS_REGION)
    print("Creating RDS instance...")
    try:
        rds_client.create_db_instance(
            DBInstanceIdentifier=RDS_IDENTIFIER,
            AllocatedStorage=DB_STORAGE,
            DBInstanceClass=DB_INSTANCE_CLASS,
            Engine=RDS_ENGINE,
            MasterUsername=DB_USERNAME,
            MasterUserPassword=DB_PASSWORD,
            Port=DB_PORT,
            PubliclyAccessible=True,
            BackupRetentionPeriod=7,
            LicenseModel="license-included"
        )
        print("RDS instance is being created. This may take a few minutes...")
        waiter = rds_client.get_waiter("db_instance_available")
        waiter.wait(DBInstanceIdentifier=RDS_IDENTIFIER)
        print("RDS instance is now available!")
    except Exception as e:
        print(f"Error creating RDS instance: {e}")


# Function to get RDS endpoint
def get_rds_endpoint():
    rds_client = boto3.client("rds", region_name=AWS_REGION)
    try:
        response = rds_client.describe_db_instances(DBInstanceIdentifier=RDS_IDENTIFIER)
        endpoint = response["DBInstances"][0]["Endpoint"]["Address"]
        print(f"RDS Endpoint: {endpoint}")
        return endpoint
    except Exception as e:
        print(f"Error fetching RDS endpoint: {e}")
        return None


# Function to execute SQL files
def execute_sql_files(endpoint):
    print("Connecting to the RDS instance for SQL execution...")
    for file_config in SQL_FILES_CONFIG:
        sql_file = file_config["file"]
        db_name = file_config["database"]
        user = file_config["user"]
        password = file_config["password"]
        connection_str = (
            f"DRIVER={{{ODBC_DRIVER}}};"
            f"SERVER={endpoint},{DB_PORT};"
            f"UID={user};PWD={password};"
            f"DATABASE={db_name};"
        )
        try:
            with pyodbc.connect(connection_str, autocommit=True) as conn:
                cursor = conn.cursor()
                print(f"Executing {os.path.basename(sql_file)} on database {db_name} as user {user}...")
                with open(sql_file, "r") as file:
                    sql_script = file.read()
                    cursor.execute(sql_script)
                    print(f"Execution Result: {cursor.rowcount}")
                print(f"Successfully executed {os.path.basename(sql_file)}.")
        except Exception as e:
            print(f"Error executing {os.path.basename(sql_file)}: {e}")


# Main Deployment Script
def main():
    create_rds_instance()
    endpoint = get_rds_endpoint()
    if endpoint:
        execute_sql_files(endpoint)


if __name__ == "__main__":
    main()

