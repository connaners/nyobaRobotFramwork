*** Settings ***
Resource    ../resources/login_keywords.robot  # Import file keyword

*** Test Cases ***

Scenario: User login with invalid credentils
    Given Open Browser To Login Page
    When Login With Invalid Creds    ${INVALID_USERNAME}    ${VALID_PASSWORD}
    When Login With Invalid Creds    ${VALID_USERNAME}    ${INVALID_PASSWORD}
    When Login With Invalid Creds    ${INVALID_USERNAME}    ${INVALID_PASSWORD}

Scenario: User logs in and logs out
    Given Login To Jamtangan    ${VALID_USERNAME}    ${VALID_PASSWORD}
    # Then Logout From Jamtangan

Scenario: User Scroll into Bottom Page
    Given Scroll To Bottom
    Then Scroll To Up

Scenario: User Hover into some kategori
    Given Hover Kategori
    Then Hover Couple
    Then Hover Pria

Scenario: Search Items
    Given Search Invalid Item 
    Then Search Valid Item    ${VALID_ITEMS}[1]
    Then Search Invalid Item
    Then Search Valid Item    ${VALID_ITEMS}[2]
    Then Select Item

Scenario: Add and Decrease Item Amount
    Given Jumlah Items Awal Harus 1
    When Add Item Sebanyak    4
    Then Decrease Item Sebanyak    2

Scenario: Add cart
    Given Decrease Item Sebanyak    2
    Then Add to Cart
    When Hover Cart

