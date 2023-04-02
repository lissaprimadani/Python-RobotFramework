*** Keyword ***

User Open Tokopedia Page
    Open Browser    https://www.tokopedia.com   chrome
    Maximize Browser Window

User Input keyword ${keyword}
    Input Text    xpath=//*[@data-unify="Search"]    ${keyword}
    Press Keys    xpath=//*[@data-unify="Search"]    ENTER

View result search ${result}
    Sleep    5s
    Page Should Contain Element    xpath=//*[@class="css-8j9pkz"]/strong    ${result}


User Input keyword {${keyword}} and view result {${result}}
    Input Text    xpath=//*[@data-unify="Search"]    ${keyword}
    Press Keys    xpath=//*[@data-unify="Search"]    ENTER
    Sleep    3s
    Page Should Contain Element    xpath=//*[@class="css-8j9pkz"]/strong    ${result}


Write keyword
    [Arguments]    ${keyword}
    Input Text    xpath=//*[@data-unify="Search"]    ${keyword}

Press enter on search
    Press Keys    xpath=//*[@data-unify="Search"]    ENTER

Verify result
    [Arguments]    ${result}
    Page Should Contain Element    xpath=//*[@class="css-8j9pkz"]/strong    ${result}

