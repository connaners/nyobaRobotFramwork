*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/locators.robot   # Import locator file
Resource    ../resources/test_data.robot

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Scroll Element Into View    ${BTN_LOGIN}
    Wait Until Element Is Visible    ${closePopUpNotif}
    Run Keyword And Ignore Error    Click Element    ${closePopUpNotif}
    Wait Until Element Is Visible    ${BTN_UTAMA}
    Click Element    ${BTN_UTAMA}

Login With Invalid Creds
    [Arguments]    ${username}    ${password}

    # Cek apakah login form sudah muncul
    ${is_form_visible}    Run Keyword And Return Status    Element Should Be Visible    ${LOGIN_FORM}

    # Run Keyword If    '${is_form_visible}' == 'False'    Click Element    ${BTN_LOGIN}
    
    IF    ${is_form_visible} == False
        Click Element    ${BTN_LOGIN}
    END
    

    # Input kredensial dan submit login
    Input Text      ${INPUT_USERNAME}    ${username}
    Input Password  ${INPUT_PASSWORD}    ${password}
    Click Element   ${BTN_LOGIN_SUBMIT}

    # Tunggu toast muncul & validasi pesan error
    Wait Until Element Is Visible    ${TOAST_LOCATOR}    timeout=30s
    ${toast_text}    Get Text    ${TOAST_LOCATOR}

    ${is_valid_toast}    Evaluate    '${toast_text}' == '${TOAST_MESSAGE1}' or '${toast_text}' == '${TOAST_MESSAGE2}' or '${TOAST_MESSAGE3}'
    
    IF    ${is_valid_toast}
        Log    "Pesan error sesuai: ${toast_text}"
    ELSE    
        Fail    "Pesan Error tidak sesuai: ${toast_text}"
    END
    

Login To Jamtangan
    [Arguments]    ${username}    ${password}
    
    # Cek apakah login form sudah muncul
    ${is_form_visible}    Run Keyword And Return Status    Element Should Be Visible    ${LOGIN_FORM}
    
    IF    ${is_form_visible} == False
        Click Element    ${BTN_LOGIN}
    END
    Clear Element Text    ${INPUT_USERNAME}
    Input Text      ${INPUT_USERNAME}    ${username}
    Input Password  ${INPUT_PASSWORD}    ${password}
    Click Element   ${BTN_LOGIN_SUBMIT}
    # Wait Until Page Contains Element    ${USER_AVATAR}    timeout=30s
    Sleep    3s
    Wait Until Element Is Not Visible    ${BTN_REGISTER}    timeout=30s


Logout From Jamtangan
    ${is_form_visible}    Run Keyword And Return Status    Element Should Be Visible    ${USER_AVATAR}
    Mouse Over    ${USER_AVATAR}
    Click Element    ${BTN_LOGOUT}
    Click Element    ${BTN_CONFIRM_LOGOUT}
    Element Should Be Visible    ${LOGIN_FORM}   # Assertion berhasil logout
