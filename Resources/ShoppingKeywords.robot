*** Settings ***
Library    Browser
Variables    ../Locators/Locators.py

*** Keywords ***
Add products to cart
    [Arguments]    ${num_products}
    Log    Add ${num_products} products to cart
    FOR    ${i}    IN RANGE    0    ${num_products}
        Click    ${btn_add_to_cart} >> nth=${i}
    END
    Click    ${lnk_shopping_cart}

Complete purchase
    [Arguments]    ${first_name}    ${last_name}    ${post_code}    ${num_products}
    Click    ${btn_checkout}
    Type Text    ${txt_first_name}    ${first_name}
    Type Text    ${txt_last_name}    ${last_name}
    Type Text    ${txt_zip_code_name}    ${post_code}
    Click    ${btn_continue}
    Get Element Count    ${lnk_product_name}    ==    ${num_products}
    Click    ${btn_finish}
    Get Element States    ${img_pony_express}    contains    visible