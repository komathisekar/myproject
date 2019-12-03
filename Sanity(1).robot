*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           SikuliLibrary

*** Variables ***
${SERVER}         http://xap.be.obo.lgi.io/
${BROWSER}        Chrome
${LOGIN URL}      ${SERVER}
${VPN_Password}    Prodapt@321
${Nedherland}     3C36E4-EOSSTB-003639017304
${Switzerland}    3C36E4-EOSSTB-003639017304
${Belgium}        3C36E4-EOSSTB-003639017304
${UK}             3C36E4-EOSSTB-003639017304
${Austria}        3C36E4-EOSSTB-003639017304

*** Test Cases ***
Nederland
    [Tags]    Nedherland
    [Setup]
    Open Browser To Login Page
    Connectivity_Check    ${Nedherland}

Belgium
    [Tags]    Belgium
    Open Browser To Login Page
    Connectivity_Check    ${Belgium}

Switzerland
    [Tags]    Switzerland
    Open Browser To Login Page
    Connectivity_Check    ${Switzerland}

UK
    [Tags]    UK
    Open Browser To Login Page
    Connectivity_Check    ${UK}

Austria
    [Tags]    Austria
    Open Browser To Login Page
    Connectivity_Check    ${Austria}

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window

Connectivity_Check
    [Arguments]    ${country}
    Wait Until Element Is Visible    //input[@id = 'cpe-id-input']
    SeleniumLibrary.Input Text    //input[@id = 'cpe-id-input']    ${country}
    Wait Until Element Is Visible    //button[@class = 'btn btn-secondary' and @id = 'btn-set-cpe-id' and @type = 'button']
    Click Element    //button[@class = 'btn btn-secondary' and @id = 'btn-set-cpe-id' and @type = 'button']
    Wait Until Element Is Visible    //button[@type = 'button' and @id = 'stb-statuses-refresh' and (text() = '↻' or . = '↻')]
    Click Element    //button[@type = 'button' and @id = 'stb-statuses-refresh' and (text() = '↻' or . = '↻')]
    Sleep    5s
    Capture Page Screenshot
    Element Text Should Be    //*[@id="stb-statuses-container"]/tr/td[2]    connected
    Close Browser

VPN_Connectivity
    Click    D:/Xagget/VPN_Images/vpn_taskbar.png
    Sleep    20s
    SikuliLibrary.Input Text    D:/Xagget/VPN_Images/Password_box.png    ${VPN_Password}
    Click    D:/Xagget/VPN_Images/Connect.png
    Sleep    10s

VPN_disconnect
    Double Click    D:/Xagget/VPN_Images/disconnect_trigger.png
    Sleep    3s
    Click    D:/Xagget/VPN_Images/Disconnect_button.png
    Sleep    5s
