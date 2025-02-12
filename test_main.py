from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
import pytest


@pytest.fixture()
def driver():
    options = Options()
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    browser = webdriver.Chrome(options=options)
    return browser


def test_sale(driver):
    driver.get('https://magento.softwaretestingboard.com/sale.html')
    title = driver.find_element(By.TAG_NAME, 'h1')
    assert title.text == 'Sale'


def test_whats_new(driver):
    driver.get('https://magento.softwaretestingboard.com/what-is-new.html')
    title = driver.find_element(By.TAG_NAME, 'h1')
    assert title.text == "What's New"