*** Settings ***
Library  SeleniumLibrary
Library  ../ExternalResources/alap.py

*** Variables ***
${BROWSER}  chrome
${OLDAL} =  https://www.jegy.hu/

*** Keywords ***
Begin web test
    [Documentation]  Megnyit egy adott weboldalt a browserrel
    [Arguments]  ${oldal}  ${browser}
    open browser  ${oldal}   ${browser}
    maximize browser window

End web test
    close all browsers

add two string
    [Arguments]  ${string1}  ${string2}
    ${b} =  osszead string  ${string1}  ${string2}
    [Return]  ${b}

Check Page Url
    [Documentation]  Ellenőrzi egy adott oldal url-jét.
    [Arguments]  ${oldal}  ${part_oldal}
    ${d} =  osszead string  ${oldal}   ${part_oldal}
    ${c} =  get location
    Log  ${c}
    should be equal as strings  ${c}  ${d}