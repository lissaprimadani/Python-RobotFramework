*** Settings ***
Library    Collections
Library    String

#fitur tagging untuk exclude & include tagging berjalan
Default Tags    disable

#untuk memberikan tagging keseluruh  testcase meski tidak ada tagging
Force Tags    regression 

#Testcase-testcase yang dijalankan diawal (jadi menjalankan semua testcase yg masuk suit setup dlu, baru testcase lain)
Suite Setup

#Testcase-testcase yang dijalankan diakhir (jadi menjalankan testcase yang lain dulu, baru testcase yg masuk ke suite teardown)
Suite Teardown

#Dijalankan diawal di setiap testcase, seperti (pre-condition)
Test Setup

#Dijalankan diaakhir di setiap testcase, seperti kondisi akhir di setiap tetscase
Test Teardown


*** Variables ***
${name}    Lissa Prim
${age}    20

*** Test Cases ***
Tunjukkan nama
    [Tags]    that
    Log    Nama adalah ${name}    console=${True}

Tunjukkan umur
    [Tags]    that
    Log    Umur adalah ${age}    console=${True}

Buat Nama Baru
    [Tags]    that
    ${name}    Set Variable    Lia
    Log    Nama adalah ${name}    console=${True}

Pembuatan Huruf Besar
    [Tags]    This
    ${name}    Set Variable    jennie jesslyn
    Log    Huruf kecil adalah ${name}    console=${True}
    ${caps}    Jadikan huruf kapital    input=${name}
    Log    Hasil huruf besar adalah ${caps}    console=${True}



*** Keyword ***
Jadikan huruf kapital
    [Arguments]    ${input}
    ${result}    Convert To Upper Case    ${input}
    [Return]    ${result}