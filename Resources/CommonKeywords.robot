*** Settings ***
Library    Browser

*** Variables ***
${URL}    https://www.saucedemo.com/

*** Keywords ***
Open browser to sauce login page
    Open Browser    ${URL}