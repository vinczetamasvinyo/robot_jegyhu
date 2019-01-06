*** Settings ***
Documentation  A regisztrációhoz kapcsolódó tesztesetek
Library  ../../ExternalResources/alap.py
Resource  ../../Resources/cookie.robot
Resource  ../../Resources/log.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/registracio.robot

Test Setup  Common.Begin web test  ${OLDAL}  ${BROWSER}
Test Teardown  Common.End web test


*** Variables ***
${BROWSER}  chrome
${OLDAL} =  https://www.jegy.hu/

${REGISTRACIO_REG_LINK} =  Regisztráció
${REGISTRACIO_EMAIL} =  valami@telenor.hu
${REGISTRACIO_ROV_JELSZO} =  aaa
${REGISTRACIO_JELSZO_CSAK_SZAM} =  12345678
${REGISTRACIO_JELSZO_CSAK_KISBETU} =  asdfghjkl
${REGISTRACIO_JELSZO_CSAK_NAGYBETU} =  ASDFGHJKL
${REGISTRACIO_JELSZO_CSAK_NAGYKISBETU} =  ASDFGHJKL1
*** Test Cases ***
Regisztracio rovid jelszo
    [Documentation]  Regisztráció olyan jelszóval ami rövidebb mind 8 hosszú
    [Tags]  Smoke  Jelszo  MO
    Accept cookie2
    log.Main page click login
    registracio.Go to registration
    registracio.Give reg data and click  ${REGISTRACIO_EMAIL}  ${REGISTRACIO_ROV_JELSZO}
    registracio.Check things when give short password


Regisztracio rossz jelszo - csak szam
    [Documentation]  Regisztráció olyan jelszóval ami minimum 8 karakter, de csak számot tartalmaz
    [Tags]  Smoke  Jelszo
    cookie.Accept cookie2
    Main page click login
    Go to registration
    Give reg data and click  ${REGISTRACIO_EMAIL}  ${REGISTRACIO_JELSZO_CSAK_SZAM}
    Check thinks after give wrong password

Regisztracio rossz jelszo - csak Nagybetu
    [Documentation]  Regisztráció olyan jelszóval ami minimum 8 karakter, de csak magybetűt tartalmaz.
    [Tags]  Smoke  Jelszo
    cookie.Accept cookie2
    Main page click login
    Go to registration
    Give reg data and click  ${REGISTRACIO_EMAIL}  ${REGISTRACIO_JELSZO_CSAK_NAGYBETU}
    Check thinks after give wrong password

Regisztracio rossz jelszo - csak kisbetu
    [Documentation]  Regisztráció olyan jelszóval ami minimum 8 karakter, de csak kisbetűt tartalmaz.
    [Tags]  Smoke  Jelszo
    cookie.Accept cookie2
    Main page click login
    Go to registration
    Give reg data and click  ${REGISTRACIO_EMAIL}  ${REGISTRACIO_JELSZO_CSAK_KISBETU}
    Check thinks after give wrong password

Regisztracio rossz jelszo - csak kis es nagybetu
    [Documentation]  Regisztráció olyan jelszóval ami minimum 8 karakter, de csak kis és nagybetűt tartalmaz.
    [Tags]  Smoke  Jelszo
    cookie.Accept cookie2
    Main page click login
    Go to registration
    Give reg data and click  ${REGISTRACIO_EMAIL}  ${REGISTRACIO_JELSZO_CSAK_NAGYKISBETU}
    Check thinks after give wrong password

Test1
    [Tags]  Most2
    ${a} =  add two string  Vincze  Tamás
    Log  ${a}

*** Keywords ***



