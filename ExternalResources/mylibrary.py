from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver

def get_current_browser():
    browser = BuiltIn().get_library_instance('SeleniumLibrary')._current_browser()
    return browser

def get_tittle_via_python():
    driver = get_current_browser()
    title = driver.title
    return title

def click_hirlevel_via_python():
    driver = get_current_browser()
    driver.find_element_by_id('newsletterLink').click()

"""
driver = webdriver.Chrome('chromedriver.exe')
driver.get('https://www.jegy.hu')
driver.find_element_by_id('newsletterLink').click()
"""
