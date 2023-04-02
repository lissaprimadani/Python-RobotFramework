*** Settings ***
Library    Collections
Library    String
Default Tags    disable
Force Tags    regression 


*** Variables ***
#list
@{mobil}    terios    rush    ayla

*** Test Cases    ***
Loop with range
    [Tags]    disable
    #contoh loop paling sederhana
    FOR    ${i}    IN RANGE    3
        Log    i adalah ${i}    console=${TRUE}
        #3 kali looping dengan menampilkan angka 0,1,2
    END

    #contoh loop berhenti ketika ada kriteria yang ditemukan
    FOR    ${i}    IN RANGE    10
        Log    i adalah ${i}    console=${TRUE}
        Exit For Loop If    ${i}==5
        #menampilkan looping angka 0 sampai 5
    END

    FOR    ${i}    IN RANGE    10
        Exit For Loop If    ${i}==5
        Log    i adalah ${i}    console=${TRUE}
        #menampilkan looping angka 0 sampai 4
    END

Loop di dalam list
    [Tags]    This

    #contoh looping semua list
    FOR    ${element}    IN    @{mobil}
        Log    element adalah ${element}    console=${TRUE}
    END

    FOR    ${element}    IN    @{mobil}
        Log    element adalah ${element}    console=${TRUE}
    END




