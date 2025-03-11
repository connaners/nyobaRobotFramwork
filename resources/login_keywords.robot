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
    Clear Element Text    ${INPUT_USERNAME}
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

Scroll To Bottom
    ${highlightFooter}    Get WebElement    ${FOOTER}
    # Scroll Element Into View    ${FOOTER}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)    #scroll page paling bawah
    Element Should Be Visible    ${FOOTER}
    Execute JavaScript    arguments[0].style.backgroundColor = 'yellow'    ARGUMENTS    ${highlightFooter}    #assertion untuk memberikan highlight pada text element
    Sleep    1.5s
    

Scroll To Up
    Execute Javascript    window.scrollTo(0, 0)    #scroll page to the up
    Sleep    1.5s

Hover Kategori
    Mouse Over    ${KATEGORI}
    Sleep    1.5s
    

Hover Couple
    Mouse Over    ${KCOUPLE}

    # POP UP ADS yang berada dalam iFrame
    Wait Until Element Is Visible    ${POPUPADS}    timeout=10s    # tunggu iframe sampe muncul
    Select Frame    ${POPUPADS}    # masuk ke iframe agra bisa interaksi dengan element yg ada dalm iframe
    Wait Until Element Is Visible    ${CLOSEIFRAME}    timeout=5s    # tunggu element yg ada dalam iframe
    Click Element    ${CLOSEIFRAME}
    Unselect Frame
    Mouse Over    ${KATEGORI}


Hover Pria
    Mouse Over    ${KPRIA}
    # Sleep    1.5s
    Click Element    ${SMARTWATCH}

Search Valid Item
    [Arguments]    ${listItems}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Clear Element Text    ${SEARCHBAR}
    Sleep    1s
    Input Text    ${SEARCHBAR}    ${listItems}
    Click Element    ${BUTTONSEARCH}
    Wait Until Element Is Visible    ${RESULTITEMS}

Search Invalid Item
    Clear Element Text    ${SEARCHBAR}
    # Sleep    1s
    Input Text    ${SEARCHBAR}    ${INVALID_ITEMS}
    Click Element    ${BUTTONSEARCH}
    Wait Until Element Is Visible    ${INVALIDRESULTITEMS}

Select Item
    Wait Until Element Is Visible    ${RESULTITEMS}
    Click Element    ${ITEMS.cards1}
    Wait Until Element Is Visible    ${DETAILITEMS}
    Go Back
    Click Element    ${ITEMS.cards2}
    Wait Until Element Is Visible    ${DETAILITEMS}
    Go Back
    Click Element    ${ITEMS.cards2}
    Wait Until Element Is Visible    ${DETAILITEMS}

#item amounts
Jumlah Items Awal Harus 1
    Wait Until Element Is Visible    ${ITEMAMOUNTS}
    ${count}    Get Text    ${ITEMAMOUNTS}
    Should Be Equal As Integers    ${count}    1
    Set Global Variable    ${count}    ${count}

Add Item Sebanyak
    [Arguments]    ${jumlah}
    Wait Until Element Is Visible    ${ITEMAMOUNTS}
    FOR    ${i}    IN RANGE    ${jumlah}
        Click Button    ${BUTTONADD}
        ${newCount}    Get Text    ${ITEMAMOUNTS}
        Log    Previous: ${count}, Updated: ${newCount}
        Should Not Be Equal    ${count}    ${newCount}
        Set Global Variable    ${count}    ${newCount}
    END

Decrease Item Sebanyak
    [Arguments]    ${jumlah}
    Wait Until Element Is Visible    ${ITEMAMOUNTS}
    FOR    ${i}    IN RANGE    ${jumlah}
        Click Button    ${BUTTONMINUS}
        ${newCount}    Get Text    ${ITEMAMOUNTS}
        Log    Previous: ${count}, Updated: ${newCount}
        Should Not Be Equal    ${count}    ${newCount}
        Set Global Variable    ${count}    ${newCount}
    END


Add to Cart
    Wait Until Element Is Visible    ${DETAILITEMS}
    Click Element    ${ADDCART}
    Wait Until Element Is Visible    ${MODALADDTOCART}
    Click Button    ${BUTTONSUBMIT}
    # Wait Until Element Is Visible    ${SNACKBARMESSAGE}
    Wait Until Element Is Visible    ${POPUPADS}
    Select Frame    ${POPUPADS}    # masuk ke iframe agra bisa interaksi dengan element yg ada dalm iframe
    Wait Until Element Is Visible    ${CLOSEIFRAME}    timeout=5s    # tunggu element yg ada dalam iframe
    Click Element    ${CLOSEIFRAME}
    Unselect Frame

Hover Cart
    Click Element    ${CLICKCART}

Logout From Jamtangan
    ${is_form_visible}    Run Keyword And Return Status    Element Should Be Visible    ${USER_AVATAR}
    Mouse Over    ${USER_AVATAR}
    Click Element    ${BTN_LOGOUT}
    Click Element    ${BTN_CONFIRM_LOGOUT}
    Element Should Be Visible    ${LOGIN_FORM}   # Assertion berhasil logout
