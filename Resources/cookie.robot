*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${COOKIE_BUTTON_ID} =  class=accept_cookie

*** Keywords ***
Accept cookie2
    click element  ${COOKIE_BUTTON_ID}