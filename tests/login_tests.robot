*** Settings ***
Resource    ../resources/login_keywords.robot  # Import file keyword

*** Test Cases ***

Scenario: User login with invalid credentils
    Given Open Browser To Login Page
    When Login With Invalid Creds    ${INVALID_USERNAME}    ${VALID_PASSWORD}
    When Login With Invalid Creds    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    When Login With Invalid Creds    ${VALID_USERNAME}    ${INVALID_PASSWORD}

Scenario: User logs in and logs out
    Given Login To Jamtangan    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Then Logout From Jamtangan
