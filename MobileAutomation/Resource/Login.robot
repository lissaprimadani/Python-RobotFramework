*** Variables ***
${host}    http://127.0.0.1:4723/wd/hub
${platform}    Android
${device}    vivo vivo 1919
${udid}    597e74ec
${appPackage}    com.experitest.ExperiBank
${appActivity}    LoginActivity t12455 d0



*** Keyword ***
Open Application EriBank
    Open Application  ${host} 
  ...  platformName=${platform} 
  ...  deviceName=${device}
  ...  udid=${udid}
  ...  appPackage=${appPackage}
  ...  appActivity=${appActivity}


Input username
    [Arguments]     ${username}
    Input Text    id=com.experitest.ExperiBank:id/usernameTextField    ${username}
  
Input password
    [Arguments]    ${password}
    Input Text    id=com.experitest.ExperiBank:id/passwordTextField    ${password}

Click button login
    Click Element    id=loginButton

Skip pop-up warning on login page
    Click Element    id=android:id/button1

View Login Page EriBank
    Sleep    2s
    Page Should Contain Element    id=com.experitest.ExperiBank:id/loginButton    Login

View Page Login Success
    Sleep    2s
    Page Should Contain Element    id=com.experitest.ExperiBank:id/makePaymentButton    Make Payment


