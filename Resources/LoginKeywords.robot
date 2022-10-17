*** Settings ***
Library    Browser
Variables    ../Locators/Locators.py

*** Keywords ***
Submit log in details
    [Arguments]    ${username}    ${password}
    Log    "Logging in as user ${username}"
    Type Text    ${txt_username}    ${username}
    Type Secret    ${txt_password}    ${password}
    Click    ${btn_login}

User should be successfully logged in
    Log    "User should be successfully logged in"
    Get Url    ==    https://www.saucedemo.com/inventory.html
    Get Text    ${lbl_title}    ==    PRODUCTS
    Get Element States    ${lnk_shopping_cart}    contains    visible