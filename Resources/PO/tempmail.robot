*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${TEMPMAIL_URL} =  https://temp-mail.org/
${TEMPMAIL_EMAIL_ID} =  id=mail
${TEMPMAIL_EMAIL_ATTRIB} =  value

*** Keywords ***
Open temp mail
    execute javascript  window.open('${TEMPMAIL_URL}');

Take email from tempmail
    ${email} =  get element attribute  ${TEMPMAIL_EMAIL_ID}  ${TEMPMAIL_EMAIL_ATTRIB}
    log  ${email}
    [Return]  ${email}