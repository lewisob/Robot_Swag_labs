*** Settings ***
Documentation    Tests to verify that the user can successfully browse and purchase some items
Resource    ../Resources/CommonKeywords.robot
Resource    ../Resources/LoginKeywords.robot
Resource    ../Resources/ShoppingKeywords.robot

*** Test Cases ***
Purchase some products
    Open browser to sauce login page
    User is logged in
    Add products to cart    3
    Complete purchase    Lewis    Tester    2000