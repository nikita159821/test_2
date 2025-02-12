# import all required frameworks
import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By  # Импортируем By
from selenium.webdriver.firefox.options import Options  # Импортируем Options


# inherit TestCase Class and create a new test class
class PythonOrgSearch(unittest.TestCase):

    # initialization of webdriver
    def setUp(self):
        options = Options()
        options.add_argument("--headless")  # Включаем headless режим
        options.add_argument("--no-sandbox")
        self.driver = webdriver.Chrome(options=options)  # Передаем options драйверу

    # Test case method. It should always start with test_
    def test_search_in_python_org(self):
        # get driver
        driver = self.driver
        # get python.org using selenium
        driver.get("http://www.python.org")

        # assertion to confirm if title has python keyword in it
        self.assertIn("Python", driver.title)

        # locate element using name
        elem = driver.find_element(By.NAME, "q")  # Используем By.NAME

        # send data
        elem.send_keys("pycon")

        # receive data
        elem.send_keys(Keys.RETURN)
        assert "No results found." not in driver.page_source

    # cleanup method called after every test performed
    def tearDown(self):
        self.driver.quit()  # Используем quit() вместо close()

# execute the script
if __name__ == "__main__":
    unittest.main()