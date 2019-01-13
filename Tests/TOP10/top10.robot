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
${TOP10_LABEL_KONCERT_ZENE} =  Koncert, zene
${TOP10_LABEL_FESZTIVAL} =  Fesztivál
${TOP10_LABEL_MUSEUM} =  Múzeum, kiállítás
${TOP10_LABEL_OSSZES} =  Összes kategória

*** Test Cases ***
Top10 Szinhaz megnezese
    [Documentation]  Főoldalon a Top10 színházat nézzük meg.
    cookie.Accept cookie2
    top10.Scroll to top10 element
    top10.Select top10 list by label  ${TOP10_LABEL_SZINHAZ}
    top10.Check elements of Top10

Top10 koncert zene
    [Documentation]  Főoldalon a Top10 koncert, zene megnézése
    cookie.Accept cookie2
    top10.Scroll to top10 element
    top10.Select top10 list by label  ${TOP10_LABEL_SZINHAZ}
    top10.Check elements of Top10

Top10 fesztival
    [Documentation]  Főoldalon a Top10 fesztival megnézése
    [Tags]  smoke
    cookie.Accept cookie2
    top10.Scroll to top10 element
    top10.Select top10 list by label  ${TOP10_LABEL_FESZTIVAL}
    top10.Check elements of Top10

Top10 muzeum
    [Documentation]  Főoldalon a Top10 múzeum megnézése
    [Tags]  smoke
    cookie.Accept cookie2
    top10.Scroll to top10 element
    top10.Select top10 list by label  ${TOP10_LABEL_MUSEUM}
    top10.Check elements of Top10

Top10 osszes kategoria valtoztatasos
    [Documentation]  Főoldalon a Top10 összes kategória megnézése miután átváltunk egy másik
    [Tags]  smoke
    cookie.Accept cookie2
    top10.Scroll to top10 element
    top10.Select top10 list by label  ${TOP10_LABEL_MUSEUM}
    top10.Check elements of Top10
    top10.Select top10 list by label  ${TOP10_LABEL_OSSZES}
    top10.Check elements of Top10

*** Keywords ***
