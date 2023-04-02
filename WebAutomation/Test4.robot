#Scenario using argument

*** Settings ***
Library    Collections
Library    String
Library    SeleniumLibrary
Resource   Resource/KeywordTest4.robot
Resource   Resource/KeywordTest5.robot

Default Tags    disable
Force Tags    regression
Test Teardown    close browser

*** Variables ***
${user}    Selamat datang, Rendi!
${empty}     
${invalid_usn}    rendiard
${usn_not_registered}    hatmagandhi99@gmail.com
${valid_usn}    rendiardinata2@gmail.com
${invalid_pass}    rendi12344
${valid_pass}    Phi2023!
${pass_not_6character}    123
${notif_usn_empty}    Please enter an email address or phone number
${notif_pas_empty}    Please enter a password
${notif_wrong_pass}    That's not the right password. Try again or
${notif_pass_not_6character}    The password you provided must have at least 6 characters

*** Test cases ***
# Case Search keyword 1
#     [Tags]    Search
#     GIVEN User Open Tokopedia Page
#     WHEN User Input keyword Baju Batik
#     THEN View result search Baju Batik

# Case Search keyword 2
#     [Tags]    Search
#     GIVEN User Open Tokopedia Page
#     THEN User Input keyword {Baju Kebaya} and view result {Baju Kebaya}

Case Search keyworrd with argument
    [Tags]    Search
    GIVEN User Open Tokopedia Page
    THEN user doing search    Baju Batik    Baju Batik
    THEN user doing search    Baju Kebaya    Baju Kebaya


Case Login Invalid on linkein
    [Tags]    Login
    GIVEN User go to login page LinkedIn
    THEN Invalid Login   ${empty}    ${empty}   ${notif_usn_empty}
    THEN Invalid Login   ${valid_usn}    ${empty}  ${notif_pas_empty}
    THEN Invalid Login   ${valid_usn}    ${pass_not_6character}  ${notif_pass_not_6character}  
    THEN Invalid Login   ${valid_usn}    ${invalid_pass}   ${notif_wrong_pass}

Case Login Success
    [Tags]    Login
    GIVEN User go to login page LinkedIn
    WHEN User input username    ${valid_usn}
    AND User input password    ${valid_pass}
    AND User click button login
    THEN View notid valid login    ${user}

    

*** Keyword ***
Invalid Login
    [Arguments]    ${username}    ${password}    ${result}
    User input username    ${username}
    User input password    ${password}
    User click button login
    Sleep    3s
    View notif invalid login    ${result}

user doing search
    [Arguments]    ${keyword}    ${result}
    Write keyword    ${keyword}
    Press enter on search
    Sleep    3s
    Verify result    ${result}
