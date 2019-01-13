*** Settings ***
Resource  PO/register_page.robot
Library  ../ExternalResources/alap.py
Resource  PO/tempmail.robot

*** Keywords ***
Check things when give short password
    register_page.Check error text short password

Give reg data and click
    [Arguments]  ${email}  ${password}
    register_page.Give reg data  ${email}  ${password}
    register_page.Click reg checkbox
    register_page.Click reg button

Go to registration
    register_page.Click registration

Check thinks after give wrong password
    Check wrong password page  ${OLDAL}
    Check "Sikertelen" Text
    Check Main Error Text

Take reg email from temp-mail page
    tempmail.Open temp mail
    @{lista} =  get window handles
    log  @{lista}[0]
    log  @{lista}[1]
    @{tilt} =  get window titles
    select window  @{lista}[1]
    ${email} =  take email from tempmail
    log  ${email}
    [Return]  @{lista}  ${email}

Continue the registration
    [Arguments]  ${list}  ${emal}  ${password}
    select window  ${list}
    give reg data and click  ${emal}  ${password}
    close window

Comfirm the registration via reg email
    [Arguments]  ${ablak}
    select window  ${ablak}
    register_page.Waiting for the jegyhu reg email in tempmail
    register_page.Click the reg email subject in tempmail
    register_page.Waiting reg email body is visiable in tempmail
    register_page.Scroll to reg link in tempmail
    register_page.Click the registration link in the email
    register_page.Waiting after confirm the registration
    register_page.Close and select the window

Check the login is succes or not
    [Arguments]  ${e_mail}
    Check the email is visiable after the login  ${e_mail}
    Check the bejelentkezes login is not visible