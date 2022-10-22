*** Settings ***
Documentation    Tests to verify that the user can log in only when correct credentials are used
Resource    ../Resources/CommonKeywords.robot
Resource    ../Resources/LoginKeywords.robot
Test Setup    Open browser to sauce login page
Test Teardown    Close browser

*** Variables ***
${VALID_USERNAME}    standard_user
${INVALID_USERNAME}    user_xyz
${LOCKED_USERNAME}    locked_out_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Log in as valid user
    Submit log in details    ${VALID_USERNAME}    ${PASSWORD}
    User should be successfully logged in

Attempt to log in using invalid credentials
    Submit log in details    ${INVALID_USERNAME}    ${PASSWORD}
    Username and password should not match

Attempt to log in as a locked out user
    Submit log in details    ${LOCKED_USERNAME}    ${PASSWORD}
    User should should be locked out