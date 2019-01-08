*** Settings ***
Library  SeleniumLibrary
#Resource  Common.robot
Resource  PO/jegymain.robot

*** Variables ***
${TOP10_SCROLL_MINUS} =  100

*** Keywords ***
Scroll to top10 element
    Scroll top10  ${TOP10_SCROLL_MINUS}


Select top10 list by label
    [Arguments]  ${label}
    Select list by label  ${label}

Check elements of Top10
    ${top10} =  Count top10
    log  ${top10}
    ${vonal} =  Count line
    ${nyil_fel} =  Count up
    ${nyil_le} =  count down
    ${osszeg} =  evaluate  ${vonal}+${nyil_fel}+${nyil_le}
    log  ${vonal}
    log  ${nyil_fel}
    log  ${nyil_le}
    Log  ${osszeg}
    should be true   ${osszeg} == ${top10}
    should be true  ${top10} > 0