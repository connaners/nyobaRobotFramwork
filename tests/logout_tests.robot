*** Settings ***
Resource    ../resources/login_keywords.robot  # Import file keyword

*** Test Cases ***
Scenario: User logs out successfully
    [Setup]    Setup Browser And Login
    Logout From Jamtangan
    [Teardown]    Close Browser   # Tutup browser setelah test selesaistart

*** Keywords ***
Setup Browser And Login
    Open Browser To Login Page
    Login To Jamtangan    ${VALID_USERNAME}    ${VALID_PASSWORD}