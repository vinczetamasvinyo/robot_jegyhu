*** Settings ***
Resource  PO/register_page.robot
Library  ../ExternalResources/alap.py

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

