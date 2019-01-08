*** Settings ***
Resource  ../Common.robot

*** Variables ***
${JEGYMAIN_TOP10_VALASZTO} =  id=toplist_type_select
${JEGYMAIN_BOX} =  class=toplistBox
${JEGYMAIN_TOP10_LINE_ID} =  class=noChange
${JEGYMAIN_TOP10_UP_ID} =  class=up
${JEGYMAIN_TOP10_DOWN_ID} =  class=down

*** Keywords ***
Scroll top10
    [Arguments]  ${kivonszam}
    scroll to element  ${JEGYMAIN_TOP10_VALASZTO}  ${kivonszam}

Select list by label
    [Arguments]  ${label}
    select from list by label  ${JEGYMAIN_TOP10_VALASZTO}  ${label}

Count top10
    ${db} =  get element count  ${JEGYMAIN_BOX}
    [Return]  ${db}

Count line
    ${db} =  get element count  ${JEGYMAIN_TOP10_LINE_ID}
    [Return]  ${db}

Count up
    ${db} =  get element count  ${JEGYMAIN_TOP10_UP_ID}
    [Return]  ${db}

Count down
    ${db} =  get element count  ${JEGYMAIN_TOP10_DOWN_ID}
    [Return]  ${db}