*** Settings ***
Library  SeleniumLibrary
Resource  ../Common.robot

*** Variables ***
${REGISTER_PAGE_SHORT_PASSWORD_Error_ID} =  class=validation_errors
${REGISTER_PAGE_SHORT_PASSWORD_Error_TEXT} =  Kérjük írjon legalább 8 karaktert!
${REGISTER_PAGE_INPUT_EMAIL_ID} =  Id=email
${REGISTER_PAGE__INPUT_Password_ID} =  id=password1
${REGISTER_PAGE_CHECKBOX_ID} =  class=checkbox-custom-label
${REGISTER_PAGE_BUTTON_ID} =  Regisztráció
${REGISTER_PAGE__REG_LINK} =  Regisztráció
${REGISTER_PAGE_URL_SIKERTELEN} =  registration/doRegistration
${REGISTER_PAGE_SIKERTELEN_ID} =  css=body > div.jegyhu_main.container > div.row > div > h1
${REGISTER_PAGE_SIKERTELEN_TEXT} =  Sikertelen regisztráció
${REGISTER_PAGE_MAIN_ERROR_TEXT_ID} =  xpath=/html/body/div[1]/div[4]/div/div/div/div/p
${REGISTER_PAGE_ERROR_TEXT_HOSZU_PASSWORD} =  A jelszó formátuma(jelszó erőssége) nem megfelelő! A Jelszónak legalább nyolc karakter hosszúságúnak kell lenni és kis-, nagybetűket, valamint számjegyet kell tartalmazni. Kérjük, adjon meg új, megfelelő jelszót! Köszönjük!

*** Keywords ***
Check error text short password
    element text should be  ${REGISTER_PAGE_SHORT_PASSWORD_Error_ID}  ${REGISTER_PAGE_SHORT_PASSWORD_Error_TEXT}

Give reg data
    [Arguments]  ${email}  ${password}
    input text  ${REGISTER_PAGE_INPUT_EMAIL_ID}  ${email}
    input text  ${REGISTER_PAGE__INPUT_Password_ID}  ${password}

Click reg checkbox
    click element  ${REGISTER_PAGE_CHECKBOX_ID}

Click reg button
    click button  ${REGISTER_PAGE_BUTTON_ID}

Click registration
    click link  ${REGISTER_PAGE__REG_LINK}

Check wrong password page
    [Documentation]  Ellenőrzi a page url-jét
    [Arguments]  ${oldal}
    Check Page Url  ${oldal}  ${REGISTER_PAGE_URL_SIKERTELEN}

Check "Sikertelen" Text
    element text should be  ${REGISTER_PAGE_SIKERTELEN_ID}  ${REGISTER_PAGE_SIKERTELEN_TEXT}

Check Main Error Text
    ${szoveg} =  get text  ${REGISTER_PAGE_MAIN_ERROR_TEXT_ID}
    should be equal as strings  ${szoveg}  ${REGISTER_PAGE_ERROR_TEXT_HOSZU_PASSWORD}
    log  ${szoveg}