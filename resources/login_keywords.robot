*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/locators.robot   # Import locator file
Resource    ../resources/test_data.robot

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
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
    Wait Until Element Is Visible    ${TOAST_LOCATOR}    timeout=15s
    ${toast_text}    Get Text    ${TOAST_LOCATOR}

    ${is_valid_toast}    Evaluate    '${toast_text}' == '${TOAST_MESSAGE1}' or '${toast_text}' == '${TOAST_MESSAGE2}'
    
    IF    ${is_valid_toast}
        Log    "Pesan error sesuai: ${toast_text}"
    ELSE    
        Fail    "Pesan Error tidak ssesuai"
    END
    

Login To Jamtangan
    [Arguments]    ${username}    ${password}
    
    # Cek apakah login form sudah muncul
    ${is_form_visible}    Run Keyword And Return Status    Element Should Be Visible    ${LOGIN_FORM}
    
    IF    ${is_form_visible} == False
        Click Element    ${BTN_LOGIN}
    END
    
    Input Text      ${INPUT_USERNAME}    ${username}
    Input Password  ${INPUT_PASSWORD}    ${password}
    Click Element   ${BTN_LOGIN_SUBMIT}
    Wait Until Element Is Visible    ${USER_AVATAR}    timeout=15s


Logout From Jamtangan
    ${is_form_visible}    Run Keyword And Return Status    Element Should Be Visible    ${USER_AVATAR}
    Mouse Over    ${USER_AVATAR}
    Click Element    ${BTN_LOGOUT}
    Click Element    ${BTN_CONFIRM_LOGOUT}
    Element Should Be Visible    ${LOGIN_FORM}   # Assertion berhasil logout
