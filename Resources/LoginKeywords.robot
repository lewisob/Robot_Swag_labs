*** Settings ***
Library    Browser
Variables    ../Locators/Locators.py

*** Keywords ***
Submit log in details
    [Arguments]    ${username}    ${password}
    Log    Logging in as user ${username}
    Type Text    ${txt_username}    ${username}
    Type Secret    ${txt_password}    ${password}
    Click    ${btn_login}

User should be successfully logged in
    Log    User should be successfully logged in
    Get Url    ==    https://www.saucedemo.com/inventory.html
    Get Text    ${lbl_title}    ==    PRODUCTS
    Get Element States    ${lnk_shopping_cart}    contains    visible

User should should be locked out
    Log    User should should be locked out
    Get Url    ==    https://www.saucedemo.com/
    Get Text    ${lbl_error}    ==    Epic sadface: Sorry, this user has been locked out.
    Get Element Count    ${lnk_shopping_cart}    ==    0

User is logged in
    Log    User is logged in
    Submit log in details    standard_user    secret_sauce