#Write pre-condition using ***keyword***

*** Settings ***
Library    Collections
Library    String
Library    SeleniumLibrary

Default Tags    disable
Force Tags    regression 
Suite Teardown    close browser

*** Variables ***
${dropdown-search}    xpath=//*[@id="jZ2SBf"]/div[1]/span
${logo-google}    xpath=//*[@class='logo']
${tokopedia-link}    xpath=//*[contains(text(),'https://www.tokopedia.com')]
${tokopedia-assert}    xpath=//*[@data-testid='btnHeaderAbout']
${facebook-link}    xpath=//*[contains(text(),'https://www.facebook.com')]
${facebook-assert}    xpath=//*[@class="pvl _52lp"]/div[1]

*** Keywords ***
Open Google
    Open Browser    https://www.google.com   chrome
    Maximize Browser Window
    
Back Google
    go back
    sleep    2s
    click element    ${logo-google}


*** Test cases ***

View Tokopedia website
    [Tags]    Running
    Open Google
    sleep    2s
    input text    name=q    Tokopedia
    sleep    2s
    click element    ${dropdown-search}
    sleep    2s
    click element    ${tokopedia-link}
    sleep    3s
    page should contain element    ${tokopedia-assert}    Tentang Tokopedia
    Back Google

View Facebook website
    [Tags]    Running
    sleep    2s
    input text    name=q    Facebook
    sleep    2s
    click element    ${dropdown-search}
    sleep    2s
    click element    ${facebook-link}
    sleep    3s
    page should contain element    ${facebook-assert}    Create a new account
    Back Google
