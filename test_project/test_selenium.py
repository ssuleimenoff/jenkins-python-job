from selenium import webdriver

# Selenium Manager сам скачает нужный ChromeDriver
driver = webdriver.Chrome()
driver.get("https://www.demoblaze.com")
print(driver.title)
driver.quit()
