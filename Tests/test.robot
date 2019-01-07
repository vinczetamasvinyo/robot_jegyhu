*** Settings ***
Library  SeleniumLibrary
Library  ../ExternalResources/mylibrary.py
Resource  ../Resources/cookie.robot
Library  ../ExternalResources/alap.py
Resource  ../Resources/Common.robot

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

*** Keywords ***
