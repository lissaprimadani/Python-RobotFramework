*** Settings ***
Library    SeleniumLibrary

*** Keyword ***
#Given Keyword
User Go To Login Page
    Open Browser    https://www.tokopedia.com   chrome
    Maximize Browser Window
    Click Button    xpath=//*[@data-testid="btnHeaderLogin"]
    Sleep    2s
    Page Should Contain Element    xpath=//*[@data-testid="loginform"]/h3    Masuk

User back to input email
    Sleep    2s
    Reload Page

User is login in chrome 
    Open Browser    https://www.tokopedia.com   chrome
    Maximize Browser Window
    Click Button    xpath=//*[@data-testid='btnHeaderLogin']
    Input Text    id=email-phone    rendiardinata2@gmail.com
    Click Button    id=email-phone-submit
    Sleep    3s
    Input Text    id=password-input    rendi123
    Click Button    xpath=//*[@aria-label="aria-label"]
    Sleep    3s
    Page Should Contain Element    xpath=//*[@id="my-profile-header"]/div/div    Rendi

User clear wrong email
    Click Button    xpath=//*[contains(text(),'Ubah')]
    Reload Page
    Sleep    2s

#When/AND keyword
User input email not registered
    Input Text    id=email-phone    renrenrend@gmail.com
    Click Button    id=email-phone-submit

User input correct password
    Input Text    id=password-input    rendi@123
    Click Element    xpath=//*[@aria-label="login-button"]
    Sleep    3s

User input wrong password
    Sleep    2s
    Input Text    id=password-input    rend222
    Click Element    xpath=//*[@aria-label="login-button"]
    Sleep    3s

User input correct email
    Input Text    id=email-phone    rendiardinata2@gmail.com
    Click Button    id=email-phone-submit
    Sleep    3s

#Then Keyword

View notif email not registered
    Sleep    2s
    Page Should Contain Element    xpath=//*[@data-unify="Dialog"]/h5    Email belum terdaftar


View notif success login
    Sleep    2s
    Page Should Contain Element    xpath=//*[@id="my-profile-header"]/div/div    Rendi

View notif invalid login
    Sleep    2s
    Page Should Contain Element    xpath=//*[@data-unify="Dialog"]/h5    Ada kendala pada akun atau HP-mu. Coba lagi atau hubungi Tokopedia Care.



    
