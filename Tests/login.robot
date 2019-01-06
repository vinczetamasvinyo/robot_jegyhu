*** Settings ***
Documentation   Login bejelentkezés
# Library  SeleniumLibrary
Resource  ../Resources/log.robot
Resource  ../Resources/cookie.robot

Test Teardown  Test Teardown KW

*** Variables ***
${Login_USER_OK} =  vincze.tamas.vinyo@gmail.com
${OLDAL} =  https://www.jegy.hu/
${Browser} =  chrome
${LOGIN_MAIN_PAGE_LOGIN_TEXT} =  Bejelentkezés
# ${LOGIN_MAIN_PAGE_LOGIN_LINK} =  link=Bejelentkezés
${LOGIN_LOG_PAGE_PASSWORD} =  Vinyo123456
${LOGIN_LOG_PAGE_BUTTON} =  id=submitReg
${LOGIN_LOG_NAME} =  Vincze Tamás

*** Test Cases ***
Felhasznalo Sikeres bejelentkezes
    [Documentation]  Felhasználó sikeres bejelentkezése
    [Tags]  Smoke  Kozep
    Open browser  ${OLDAL}  ${Browser}
    maximize browser window
    cookie.Accept cookie2
    wait until page contains  ${LOGIN_MAIN_PAGE_LOGIN_TEXT}
    log.Main page click login
    log.Login into jegyhu  ${Login_USER_OK}  ${LOGIN_LOG_PAGE_PASSWORD}
    wait until page contains  ${LOGIN_LOG_NAME}
    close browser

Felhasznalo Sikerestelen bejelentkezes rossz jelszo
    [Documentation]  Felhasználó sikertelen bejelentkezése rossz jelszóval
    [Tags]  Middle  Kozep
    Open browser  ${OLDAL}  ${Browser}
    maximize browser window
    Accept cookie2
    wait until page contains  ${LOGIN_MAIN_PAGE_LOGIN_TEXT}
    Main page click login
    Login into jegyhu  scvinyo2@gmail.com  Vinyo1234567
    close browser

Felhasznalo Sikerestelen bejelentkezes rossz login
    [Documentation]  Felhasználó sikertelen bejelentkezése nem létező jelszóval
    [Tags]  Middle  Most
    Open browser  ${OLDAL}  ${Browser}
    maximize browser window
    Accept cookie2
    wait until page contains  ${LOGIN_MAIN_PAGE_LOGIN_TEXT}
    Main page click login
    Login into jegyhu  scvinyo2b@gmail.com  Vinyo123456
    close browser


*** Keywords ***
Test Teardown KW
    close all browsers
