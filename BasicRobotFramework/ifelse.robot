*** Settings ***
Library    Collections
Library    String
Default Tags    disable
Force Tags    regression 


*** Variables ***
#list
@{mobil}    terios    rush    ayla

*** Test Cases    ***
Basic if
    [Tags]    disable
    ${i}    Set Variable    a
    
    IF    "${i}"=="a"
      Log    i adalah a    console=${TRUE}  
    END

    IF    "${i}"=="b"
      Log    i adalah b    console=${TRUE}  
    END

    #yang ditampilkan adalah "i adalah a"

Basic If Else
    [Tags]    disable
    ${i}    Set Variable    b
    
    IF    "${i}"=="a"
      Log    i adalah a    console=${TRUE}  
    ELSE    
      Log    i adalah b    console=${TRUE}  
    END
    #yang ditampilkan adalah "i adalah b"

Decide on Keyword jika tidak ada action
    [Tags]   disable
    #pakai ini jika tidak ada action lain
    ${i}    Set Variable    a
    Run Keyword If    "${i}"=="a"    Log    OK    console=${TRUE}

Decide on Keyword jika ada action lain
    [Tags]   this
    #pakai ini jika ada action lain
    ${i}    Set Variable    z
    Run Keyword If    "${i}"=="a"    Log    i adalah a    console=${TRUE}
    ...    ELSE IF    "${i}"=="b"    Log    i adalah b    console=${TRUE}
    ...    ELSE    LOG    Tidak ada lagi    console=${TRUE}

    

    