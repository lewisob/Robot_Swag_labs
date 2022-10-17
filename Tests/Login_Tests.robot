*** Settings ***
Documentation    Tests to verify that the user can log in only when correct credentials are used
Resource    ../Resources/CommonKeywords.robot
Resource    ../Resources/LoginKeywords.robot

*** Variables ***
${VALID_USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Log in as valid user
    Open browser to sauce login page
    Submit log in details    ${VALID_USERNAME}    ${PASSWORD}
    User should be successfully logged in