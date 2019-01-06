*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${LOG_LOG_PAGE_CHECK} =  xpath=/html/body/div[1]/div[4]/div/h1
${LOG_LOG_PAGE_CHECK_TEXT} =  Bejelentkezés
${LOG_LOG_PAGE_IN_EMAIL} =  id=email
${LOG_LOG_PAGE_IN_PASSWORD} =  id=password1
${LOG_LOG_PAGE_BUTTON} =  id=submitReg
${LOGIN_MAIN_PAGE_LOGIN_LINK} =  link=Bejelentkezés

*** Keywords ***
Login into jegyhu
    [Arguments]  ${user}  ${pass}
    element text should be  ${LOG_LOG_PAGE_CHECK}  ${LOG_LOG_PAGE_CHECK_TEXT}
    input text  ${LOG_LOG_PAGE_IN_EMAIL}  ${user}
    input text  ${LOG_LOG_PAGE_IN_PASSWORD}  ${pass}
    click button  ${LOG_LOG_PAGE_BUTTON}

Main page click login
    click link  ${LOGIN_MAIN_PAGE_LOGIN_LINK}