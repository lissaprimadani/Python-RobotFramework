*** Settings ***
Library    Collections
Library    String
Default Tags    disable
Force Tags    regression 


*** Variables ***
${name}    Kadek
#dictonary
&{planes}    bali=batik    bandung=garuda
#list
@{mobil}    terios    rush    ayla

*** Test Cases    ***
Case panggil variables
    [Tags]    this

    #contoh panggil nama
    Log    Nama adalah ${name}    console=${TRUE}

    #contoh panggil semua dictionary
    Log    List Pesawat adalah ${planes}    console=${TRUE}

    #contoh panggil satu dictionary
    Log    Pesawat ke bali adalah ${planes.bali}    console=${TRUE}

    #contoh panggil dictionary cara lain dengan variables bantuan
    ${show}    Get Dictionary Items    ${planes}
    Log    ${show}    console=${TRUE}

    #cara panggil satu dictionary dengan variable bantuan
    ${showone}    Get From Dictionary    ${planes}    bali
    Log    ${showone}    console=${TRUE}

    #tambah dictionary baru
    Log   List pesawat lama adalah ${planes}    console=${TRUE}
    Set To Dictionary    ${planes}    jakarta=JetAirline
    Log    List pesawat baru adalah ${planes}    console=${TRUE}

    #Menghapus dictionary
    Log   List pesawat lama adalah ${planes}    console=${TRUE}
    Remove From Dictionary    ${planes}    bandung
    Log   List pesawat lama adalah ${planes}    console=${TRUE}

Case mendeklarasikan variable di dalam testcase
    [Tags]    This
    #Set variable dictionary
    ${binatang}    Set Variable    kelinci
    Log    Binatang adalah ${binatang}    console=${TRUE}

    #membuat dictionary dan langsung mengisi data
    ${cars}    Create Dictionary     toyota=rush    honda=brio
    Log    List mobil adalah ${cars}    console=${TRUE}

    #membuat dictionary dan diset datanya
    ${motor}    Create Dictionary
    Set To Dictionary    ${motor}    yamaha=mio    honda=vario
    Log    List motor adalah ${motor}    console=${TRUe}

Latihan list dengan append
    [tags]    This

    #menambah list mobil terakhir dengan append
    Log    list mobil lama adalah ${mobil}    console=${TRUE}
    Append To List    ${mobil}    brio
    Log    list mobil baru adalah ${mobil}    console=${TRUE}

Latihan insert list dengan index
    [Tags]    This
    Log    list mobil lama adalah ${mobil}    console=${TRUE}
    Insert Into List    ${mobil}    ${1}    BMW
    Log    list mobil baru adalah ${mobil}    console=${TRUE}

Latihan membuat dictionary di dalam list
    [Tags]    This
    ${negara}    Create List    Indonesia
    Log    Isi dari list ${negara}    console=${TRUE}

    #menambahkan dictionary baru ke list dengan append
    ${provinsi lain}    Create Dictionary    bali=denpasar    dki=jakarta    kalimantan=samarinda
    Append To List    ${negara}    ${provinsi lain}

    #menambahkan dictionary baru ke list dengan insert
    ${provinsi jawa}    Create Dictionary    jatim=surabaya    jateng=jogja    jabar=bandung
    Insert Into List    ${negara}    ${1}    ${provinsi jawa}

    #memunculkan semua list provinsi
    Log    Isi dari list ${negara}    console=${TRUE}

    #memanggil satu dictionary dari list dengan index
    Log    Kota dari provinsi jawa adalah ${negara[1]}    console=${TRUE}
    
    #memanggil dictionary dari list pertama
    Log    Ibu kota jawa barat adalah ${negara[1].jabar}    console=${TRUE}