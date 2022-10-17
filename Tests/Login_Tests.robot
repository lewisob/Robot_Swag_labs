*** Settings ***
Documentation    Tests to verify that the user can log in only when correct credentials are used
Resource    ../Resources/CommonKeywords.robot
Resource    ../Resources/LoginKeywords.robot

*** Variables ***
${VALID_USERNAME}    standard_user
${LOCKED_USERNAME}    locked_out_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Log in as valid user
    Open browser to sauce login page
    Submit log in details    ${VALID_USERNAME}    ${PASSWORD}
    User should be successfully logged in

Attempt to log in as a locked out user
    Open browser to sauce login page
    Submit log in details    ${LOCKED_USERNAME}    ${PASSWORD}
    User should should be locked out