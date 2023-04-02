*** Settings ***
Library    AppiumLibrary
Resource   Resource/Login.robot

*** Variables ***

${empty}
${valid_usn}    company
${valid_pass}    company
${invalid_usn}    commpany
${invalid_pass}    cmpnyk

*** Test cases ***
Test Login Invalid
    Open Application EriBank
    Skip pop-up warning on login page
    Invalid Login    ${empty}    ${empty}
    Invalid Login    ${empty}    ${valid_pass}
    Invalid Login    ${valid_usn}    ${empty}
    Invalid Login    ${valid_usn}   ${invalid_usn}
    Invalid Login    ${invalid_usn}    ${valid_pass}
    Invalid Login    ${invalid_usn}    ${invalid_pass}
    
Test Login Success
    Input username    ${valid_usn}
    Input password    ${valid_pass}
    Click button login
    View Page Login Success

*** Keyword ***
Invalid Login
    [Arguments]    ${username}    ${password}
    Input username    ${username}
    Input password    ${password}
    Click button login
    View Login Page EriBank

