from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.webdriver.firefox.options import Options as FirefoxOptions
from selenium.webdriver.safari.options import Options as SafariOptions

USERNAME = 'ayansuleimenov_Thtb7r'
ACCESS_KEY = 'nV8MjUidar8LUanFKuym'

def get_browserstack_url():
    return f"https://{USERNAME}:{ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub"

def get_browser_options(browser_name):
    browser_name = browser_name.lower()
    
    if browser_name == 'chrome':
        options = ChromeOptions()
        options.set_capability('browserName', 'Chrome')
        options.set_capability('browserVersion', 'latest')
    elif browser_name == 'firefox':
        options = FirefoxOptions()
        options.set_capability('browserName', 'Firefox')
        options.set_capability('browserVersion', 'latest')
    elif browser_name == 'safari':
        options = SafariOptions()
        options.set_capability('browserName', 'Safari')
        options.set_capability('browserVersion', '16')
    
    options.set_capability('bstack:options', {
        "os": "OS X",
        "osVersion": "Ventura",
        "projectName": "Homework2",
        "buildName": "RF Tests",
        "sessionName": "RF test",
        "local": "false",
        "debug": "true",
        "networkLogs": "true",
        "userName": USERNAME,
        "accessKey": ACCESS_KEY
    })
    
    return options