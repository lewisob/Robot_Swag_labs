*** Settings ***
Documentation    Tests to verify that the user can successfully browse and purchase some items
Resource    ../Resources/CommonKeywords.robot
Resource    ../Resources/LoginKeywords.robot
Resource    ../Resources/ShoppingKeywords.robot
Suite Setup    Open browser to sauce login page
Test Teardown    Close browser

*** Test Cases ***
Purchase X number of products
    [Tags]  Purchase  Products
    [Template]    Purchase some products
    3
    2
    1

Remove a product from cart
    [Tags]  Products
    Open browser to sauce login page
    User is logged in
    Add products to cart    3
    Remove products from cart    1
    Only 2 products should remain in cart

*** Keywords ***
Purchase some products
    [Arguments]    ${NUM_PRODUCTS}
    Open browser to sauce login page
    User is logged in
    Add products to cart    ${NUM_PRODUCTS}
    Complete purchase    Lewis    Tester    2000    ${NUM_PRODUCTS}