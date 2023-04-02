#Trying write with gherkin skenario
*** Settings ***
Library    Collections
Library    String
Library    SeleniumLibrary
Resource   Resource/KeywordTest3.robot

Default Tags    disable
Force Tags    regression 

Test Teardown    close browser

*** Test cases ***
Case email not registered
    [Tags]    Login
    GIVEN User Go To Login Page
    WHEN User input email not registered
    THEN View notif email not registered

Case email correct but password wrong
    [Tags]    Login
    GIVEN User Go To Login Page
    WHEN User input correct email
    AND User input wrong password
    THEN View notif invalid login

# Case email correct and password correct
#     [Tags]    Login
#     GIVEN User Go To Login Page
#     WHEN User input correct email
#     AND User input correct password
#     THEN View notif success login 