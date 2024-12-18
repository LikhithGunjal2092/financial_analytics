import os
import time
import shutil
import logging
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.keys import Keys

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
    handlers=[
        logging.FileHandler("historical_stock_data_downloader.log"),
        logging.StreamHandler()
    ]
)

def download_historical_by_company_and_date(
    download_folder: str,
    driver_path: str,
    stock_search_key: str,
    from_date: str,
    to_date: str,
    stock_name: str
):
    """
    Download historical stock data from BSE India and save it with a custom filename.

    Args:
        download_folder (str): Path to the folder where the file should be downloaded.
        driver_path (str): Path to the ChromeDriver executable.
        stock_search_key (str): The search key for the stock (e.g., stock name or symbol).
        from_date (str): Start date for the historical data in "dd/mm/yyyy" format.
        to_date (str): End date for the historical data in "dd/mm/yyyy" format.
        stock_name (str): Custom name to save the downloaded file.
    """
    # Ensure download folder exists
    if not os.path.exists(download_folder):
        os.makedirs(download_folder)
        logging.info(f"Created download folder: {download_folder}")

    # Configure Chrome options
    options = webdriver.ChromeOptions()
    prefs = {
        "download.default_directory": download_folder,
        "download.prompt_for_download": False,
        "download.directory_upgrade": True,
        "safebrowsing.enabled": True
    }
    options.add_experimental_option("prefs", prefs)
    options.add_argument("--headless")  # Run in headless mode for automation
    options.add_argument("--disable-gpu")  # Avoid GPU-related issues
    options.add_argument("--window-size=1920,1080")  # Default window size

    # Initialize WebDriver
    service = Service(driver_path)
    driver = webdriver.Chrome(service=service, options=options)
    logging.info("Initialized Chrome WebDriver.")

    try:
        # Load the BSE India historical data page
        driver.get("https://www.bseindia.com/markets/equity/EQReports/StockPrcHistori.html?flag=0")
        logging.info("Accessed BSE India historical data page.")

        wait = WebDriverWait(driver, 20)

        # Enter stock search key
        security_input = wait.until(EC.presence_of_element_located((By.ID, "scripsearchtxtbx")))
        security_input.send_keys(stock_search_key)
        time.sleep(2)
        security_input.send_keys(Keys.RETURN)
        logging.info(f"Entered stock search key: {stock_search_key}")

        # Select "Daily" radio button
        time.sleep(3)
        daily_radio_button = wait.until(EC.presence_of_element_located((By.ID, "rdbDaily")))
        driver.execute_script("arguments[0].scrollIntoView(true);", daily_radio_button)
        daily_radio_button.click()
        logging.info("Selected 'Daily' radio button.")

        # Set the "From Date"
        from_date_input = wait.until(EC.element_to_be_clickable((By.ID, "txtFromDate")))
        driver.execute_script("arguments[0].scrollIntoView(true);", from_date_input)
        driver.execute_script("arguments[0].value = '{}';".format(from_date), from_date_input)
        logging.info(f"Set 'From Date' to: {from_date}")

        # Set the "To Date"
        to_date_input = wait.until(EC.element_to_be_clickable((By.ID, "txtToDate")))
        driver.execute_script("arguments[0].scrollIntoView(true);", to_date_input)
        driver.execute_script("arguments[0].value = '{}';".format(to_date), to_date_input)
        logging.info(f"Set 'To Date' to: {to_date}")

        # Click the download link
        download_link = wait.until(EC.element_to_be_clickable((By.ID, "lnkDownload")))
        driver.execute_script("arguments[0].scrollIntoView(true);", download_link)
        download_link.click()
        logging.info("Download link clicked. Download initiated.")

        # Wait for the file to download
        time.sleep(10)

        # Rename the downloaded file
        downloaded_file = max(
            [os.path.join(download_folder, f) for f in os.listdir(download_folder)],
            key=os.path.getctime
        )
        new_file_name = os.path.join(download_folder, f"{stock_name}_{from_date.replace('/', '_')}_{to_date.replace('/', '_')}.csv")
        shutil.move(downloaded_file, new_file_name)
        logging.info(f"File downloaded and renamed to: {new_file_name}")

    except Exception as e:
        logging.error(f"An error occurred: {e}")
    finally:
        driver.quit()
        logging.info("WebDriver session ended.")

if __name__ == "__main__":
    # Example usage
    DOWNLOAD_FOLDER = str(input('please input download folder :' ))
    DRIVER_PATH = str(input('please input chromedriver path :' ))
    STOCK_SEARCH_KEY = str(input('please input security id :'))
    FROM_DATE = str(input('please input start date :'))
    TO_DATE = str(input('please input end date :'))
    STOCK_NAME = str(input('please input security name:'))

    download_historical_by_company_and_date(DOWNLOAD_FOLDER, DRIVER_PATH, STOCK_SEARCH_KEY, FROM_DATE, TO_DATE, STOCK_NAME)
