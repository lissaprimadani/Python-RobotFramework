#before run, install library or running on cmd "pip install robotframework-seleniumlibrary"
#Berikut contoh automation basic dengan framework

*** Settings ***
Library    Collections
Library    String
Library    SeleniumLibrary

Default Tags    disable
Force Tags    regression 

*** Variables ***
${username}    testqalissa@gmail.com


*** Test cases ***

Tokopedia Open website
    Open Browser    https://www.tokopedia.com   chrome
    Maximize Browser Window
    Page Should Contain Element    xpath=//*[@data-testid='btnHeaderAbout']    Tentang Tokopedia
    Page Should Contain Element    xpath=//*[@class='css-7k41it']    Download Tokopedia App

Tokopedia Input Wrong Email
    [Tags]    TokoPedia
    Click Button    xpath=//*[@data-testid='btnHeaderLogin']
    Sleep    2s
    Input Text    xpath=//*[@data-testid='email-phone-input']    ${username}
    Sleep    2s
    Click Button    id=email-phone-submit
    Sleep    2s
    #Page Should Contain Element    xpath=(//*[@class='css-xvn0u1-unf-heading e1qvo2ff5'])    Email belum terdaftar
    Page Should Contain    Email belum terdaftar
    Sleep    3s

Tokopedia click ubah
    [Tags]    Tokopedia
    Click Button    xpath=//*[@class='css-1npux80-unf-btn eg8apji0']
    Sleep    3s
    Page Should Contain    Masuk
    Close Browser

Youtube open browser
    [Tags]    Youtube
    Open Browser    https://www.youtube.com   chrome
    Maximize Browser Window
    Sleep    5s
    Title Should Be    YouTube

Youtube search
    [Tags]    Youtube
    Input Text    name=search_query    yoasobi racing into the night
    Click Button    id=search-icon-legacy
    Sleep    3s
    Page Should Contain Element    id=inline-title-icon   YOASOBI - Racing Into The Night Lyrics (JPN_ROM_ENG)

Youtube playmusic
    [Tags]    Youtube
    Click Element    xpath=//*[contains(text(),'YOASOBI - Racing Into The Night Lyrics (JPN_ROM_ENG)')]
    Sleep    15
    Reload Page
    Sleep    15
    Close Browser
    


    