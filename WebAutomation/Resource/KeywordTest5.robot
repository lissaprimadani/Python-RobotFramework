*** Settings ***
Library    SeleniumLibrary

*** Keyword ***
User go to login page LinkedIn
    Open Browser    https://www.linkedin.com/   chrome
    Maximize Browser Window

User input username
    [Arguments]    ${username}
    Input Text    xpath=//*[@autocomplete="username"]   ${username}

User input password
    [Arguments]    ${password}
    Input Text    xpath=//*[@autocomplete="current-password"]   ${password}

User click button login
    Click Button    xpath=//*[@data-id="sign-in-form__submit-btn"]

View notif email not registered
    [Arguments]    ${result}
    Page Should Contain Element    xpath=//*[@data-unify="Dialog"]/h5    ${result}

View notif invalid login
    [Arguments]    ${result}
    Page Should Contain    ${result}

View notid valid login    
    [Arguments]    ${user}
    Sleep    3s
    Page Should Contain Element    xpath=//*[@class="feed-identity-module__actor-meta break-words"]/a/div[2]    ${user}






    
