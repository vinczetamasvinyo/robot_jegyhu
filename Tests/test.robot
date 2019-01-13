*** Settings ***
Library  SeleniumLibrary
Library  ../ExternalResources/mylibrary.py
Resource  ../Resources/cookie.robot
Library  ../ExternalResources/alap.py
Resource  ../Resources/Common.robot
Resource  ../Resources/registracio.robot
Resource  ../Resources/log.robot

*** Variables ***
${jegyhu} =  Jegy.hu | Színház, Koncert, Fesztivál, Jegyvásárlás
${masik} =  Temp Mail - Disposable Temporary Email


*** Test Cases ***
Test 1
    open browser  https://www.jegy.hu/  chrome
    ${title} =  get tittle via python
    sleep  2s
    Log  ${title}
    click hirlevel via python
    close all browsers

Test 2
    open browser  https://www.jegy.hu/  chrome
    accept cookie2
    Scroll to element  id=toplist_type_select  100
    sleep  3s
    select from list by index  id=toplist_type_select  1
    # select from list by value  id=toplist_type_select  Színház
    sleep  3s

Test 3
    [Tags]  Most
    open browser  https://www.jegy.hu  chrome
    maximize browser window
    ${title} =  get location
    execute javascript  window.open('https://temp-mail.org/');
    sleep  3s
    @{tilt} =  get window titles
    select window  @{tilt}[1]
    ${email} =  get element attribute  id=mail  value
    log  ${email}
    select window  @{tilt}[0]
    cookie.Accept cookie2
    Main page click login
    Go to registration
    give reg data and click  ${email}  Vinyo123456
    close window
    sleep  2s
    select window  @{tilt}[1]
    wait until element is visible  link=Regisztráció  30
    click link  Regisztráció
    sleep  3s
    click link  partial link=registration
    sleep  5s
    close all browsers

Test 4
    [Tags]  most2
    # open browser  https://www.jegy.hu  chrome
    ${chrome_options} =  Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    #Call Method    ${chrome_options}    add_argument  --ignore-certificate-errors-spki-list
    Call Method    ${chrome_options}    add_argument  --ignore-certificate-errors
    Call Method    ${chrome_options}    add_argument  --ignore-ssl-errors
    Create Webdriver  Chrome  chrome_options=${chrome_options}
    maximize browser window
    go to  https://temp-mail.org/
    ${title} =  get location
    wait until page contains element  id=click-to-copy
    sleep  1s
    ${email} =  get element attribute  id=mail  value
    log  ${email}
    go to  https://www.jegy.hu/
    ${title2} =  get location
    cookie.Accept cookie2
    Main page click login
    Go to registration
    give reg data and click  ${email}  Vinyo123456
    go to  https://temp-mail.org/
    wait until element is visible  link=Regisztráció  30
    click link  Regisztráció
    sleep  3s
    click link  partial link=registration
    sleep  5s
    log  get location
    WAIT UNTIL PAGE CONTAINS  Jegy.hu  10
    @{tilt} =  get window titles
    #Log  @{tilt}
    # select window  @{tilt}[1]
    # select window  ${title2}
    close window
    select window  @{tilt}[1]
    login into jegyhu   ${email}    Vinyo123456
    WAIT UNTIL PAGE CONTAINS  ${email}
    close browser

Test 5
    [Tags]  Most3
    open browser  https://www.jegy.hu  chrome
    maximize browser window
    cookie.Accept cookie2
    Main page click login
    Go to registration
    @{lista}  ${email} =  Get reg email from temp-mail page
    Continue the registration  @{lista}[0]  ${email}
    Comfirm the registration via reg email  @{lista}[1]
    login into jegyhu   ${email}    Vinyo123456
    Check the login is succes or not  ${email}
    close browser

Test 6
    open browser  http://www.jegy.hu  chrome
    element should not be visible  link=Bejelentkezés

*** Keywords ***
Get reg email from temp-mail page
    execute javascript  window.open('https://temp-mail.org/');
    @{lista} =  get window handles
    log  @{lista}[0]
    log  @{lista}[1]
    @{tilt} =  get window titles
    select window  @{lista}[1]
    # select window  @{tilt}[1]
    ${email} =  get element attribute  id=mail  value
    log  ${email}
    [Return]  @{lista}  ${email}

Continue the registration
    [Arguments]  ${list}  ${emal}
    select window  ${list}
    give reg data and click  ${emal}  Vinyo123456
    close window
    #sleep  2s

Comfirm the registration via reg email
    [Arguments]  ${ablak}
    select window  ${ablak}
    wait until element is visible  link=Regisztráció  60
    click link  Regisztráció
    wait until element is visible  partial link=jegy.hu/registration
    scroll to element  partial link=jegy.hu/registration  100
    click link  partial link=registration
    sleep  5s
    WAIT UNTIL PAGE CONTAINS  Jegy.hu  10
    close window
    select window  MAIN

Check the login is succes or not
    [Arguments]  ${e_mail}
    WAIT UNTIL PAGE CONTAINS  ${e_mail}