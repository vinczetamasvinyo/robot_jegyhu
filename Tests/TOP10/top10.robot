*** Settings ***

Resource  ../../Resources/Common.robot
Resource  ../../Resources/cookie.robot
Resource  ../../Resources/top10.robot

Test Setup  Common.Begin web test  ${OLDAL}  ${BROWSER}
Test Teardown  Common.End web test

*** Variables ***
${OLDAL} =  https://www.jegy.hu/
${BROWSER} =  chrome
${TOP10_LABEL_SZINHAZ} =  Színház

*** Test Cases ***
Top10 Szinhaz megnezese
    [Documentation]  Főoldalon a Top10 színházat nézzük meg.
    cookie.Accept cookie2
    top10.Scroll to top10 element
    top10.Select top10 list by label  ${TOP10_LABEL_SZINHAZ}
    top10.Check elements of Top10

*** Keywords ***
