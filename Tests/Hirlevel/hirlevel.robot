*** Settings ***
Documentation  Firs test case
Library  SeleniumLibrary
Library  ../../ExternalResources/alap.py
Resource  ../../Resources/cookie.robot
Resource  ../../Resources/valtozok.robot

Test Teardown  Test Teardown KW

*** Variables ***
${USER} =  vincze.tamas.vinyo@gmail.com
# ${OLDAL} =  https://www.jegy.hu/
${Browser} =  chrome
${Cbszoveg} =  Tudomásul veszem, hogy az InterTicket számomra releváns, személyre szabott ajánlatokat igyekszik összeállítani, amelyhez számos személyes adatot használ fel. Az adatkezelés szabályait az Adatkezelési Tájékoztatóban megismertem, azokat elfogadom.
${EMAIL} =  scvinyo@gmail.com
${IRSZAM} =  1144
${VEZNEV} =  Vincze
${KERNEV} =  Tamas
@{Hirlevel_feliratkozas} =  scvinyo@gmail.com  scvinyo@gmail.com  1144  Vincze  Tamas

*** Test Cases ***
Hirlevel feliratkozas checkbox szoveg ellenorzes
    [Documentation]  Azt nézzük, hogy a hírlevél mellett lévő checkbox megfelelő-e.
    [Tags]  Smoke  most2
    ${sajat_valozo} =  set test variable  ${Browser}
    log  ${sajat_valozo}
    Open browser  ${OLDAL}  ${Browser}
    maximize browser window
    Accept cookie2
    click element  id=newsletterLink
    ${szoveg}  get text  class=checkbox-custom-label
    log  ${szoveg}
    element text should be  class=checkbox-custom-label  ${Cbszoveg}
    close browser

Hirlevel feliratkozas checkbox nincs bekapcsolva
    [Documentation]  Azt nézzük, hogy a hírlevél feliratkozásnál a checkbox nincs bekapcsolva
    [Tags]  Smoke
    Open browser  ${OLDAL}  ${Browser}
    maximize browser window
    Accept cookie2
    click element  id=newsletterLink
    checkbox should not be selected  id=consent

Hirlevel feliratkozas
    [Documentation]  Azt nézzük, hogy hirlevél feliratkozás működik-e.
    [Tags]  Smoke
    open browser  ${OLDAL}  ${Browser}
    maximize browser window
    Accept cookie2
    click element  id=newsletterLink
    feliratkozas  ${email}  ${email}  ${irszam}  ${veznev}  ${KERNEV}

Hirlevel feliratkozas foglalt email
    [Documentation]  Hírlevél feliratkozás foglalt email címmel
    [Tags]  Smoke
    open browser  ${OLDAL}  ${Browser}
    maximize browser window
    Accept cookie2
    click element  id=newsletterLink
    Feliratkozas  @{Hirlevel_feliratkozas}[0]  @{Hirlevel_feliratkozas}[1]  @{Hirlevel_feliratkozas}[2]  @{Hirlevel_feliratkozas}[3]  @{Hirlevel_feliratkozas}[4]
    ${szoveg3} =  set variable  Már feliratkozott\nEz az email cím már szerepel a levelezőlistán: @{Hirlevel_feliratkozas}[0]\n×
    ${szoveg2}  get text  css=#formCustomerData > div > article > div:nth-child(9) > div > div
    Should Be Equal As Strings  ${szoveg3}  ${szoveg2}
    # ${szoveg2}  get text  css=div.alert-box.alert
    # should be true  '''${szoveg3}''' == '''${szoveg2}'''
    #${szoveg2}  get text  css=div.alert-box.alert[data-alert='']
    #${szoveg2}  get text  xpath=//*[@id="formCustomerData"]/div/article/div[9]/div/div
    #${szoveg2}  get text  class=alert-box
    log  ${szoveg2}
    log  ${szoveg3}

Proba teszt
    @{lista} =  create list  valami1  valami2  valami3
    log  @{lista}[0]
    ${sz} =  set variable  valami
    ${sz2} =  set variable  valami2
    ${szoveg3} =  set variable  Már feliratkozott\nEz az email cím már szerepel a levelezőlistán: scvinyo@gmail.com\nx
    ${szoveg4} =  set variable  Már feliratkozott\nEz az email cím már szerepel a levelezőlistán: scvinyo@gmail.com\nx
    Should Be Equal As Strings  ${szoveg3}  ${szoveg4}
    should be true  "valami2" == "valami2"

Proba teszt2
    ${va}  Ujegyenlo  5  5
    # ${va}  rstring
    should be true  ${va}
    # ${valami} =  set variable  Egyenloek
    # log  ${valami}

*** Keywords ***
Feliratkozas
    [Arguments]  ${em}  ${em2}  ${irszam}  ${first}  ${last}
    input text  id=email    ${em}
    input text  id=emailconfirm  ${em2}
    input text  id=zip  ${irszam}
    input text  id=lastname  ${first}
    input text  id=firstname  ${last}
    click element  class=checkbox-custom-label
    click button  feliratkozás

Egyenloek
    ${resultvalu} =  egyenlo
    [Return]  ${resultvalu}
Rstring
    ${eredmeny}=  egyenlo
    [Return]  ${eredmeny}
    # log  ${eredmeny}
Ujegyenlo
    [Arguments]  ${a}  ${b}
    ${er} =  egyenlo2  ${a}  ${b}
    [Return]  ${er}

Test Teardown KW
    close browser