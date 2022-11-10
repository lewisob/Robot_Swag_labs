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

Remove products from cart
    [Arguments]    ${num_products}
    Log    Remove ${num_products} products from cart
    FOR    ${i}    IN RANGE    0    ${num_products}
        Click    ${btn_remove} >> nth=${i}
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
    Wait For Elements State    ${img_pony_express}    visible

Only ${num_products} products should remain in cart
    Log    Only ${num_products} products should remain in cart
    Get Text    ${lnk_shopping_cart}    ==    ${num_products}
    Complete purchase    Lewis    Tester    2000    ${num_products}