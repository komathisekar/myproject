*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem

*** Variables ***
${SERVER}         http://xap.cl.obo.lgi.io/
${BROWSER}        Chrome
${LOGIN URL}      ${SERVER}
@{vpn}            check point endpoint security
${VPN_Password}    Prodapt@4321
${NL_STBID_1}     3C36E4-EOSSTB-003496045406
${CH_STBID_1}     3C36E4-EOSSTB-003392572404
${BE_STBID_1}     3C36E4-EOSSTB-003493624005
${UK_STBID_1}     3C36E4-EOSSTB-003473912503
${CL_STBID_1}     000378-EOSSTB-003436372704
${NL_PREPROD_STBID_1}    3C36E4-EOSSTB-003636113007
${LOGIN URL_PROD_BE}    http://xap.be.obo.lgi.io/    # Preprod URL
${SERVER_PreProd}    http://xap.cl.obo.lgi.io/    # pre prod
${LOGIN URL_PROD_CH}    http://xap.ch.obo.lgi.io/    # CH URL
${LOGIN URL_PROD_UK}    http://xap.uk.obo.lgi.io/    # UK XAP
${LOGIN URL_PROD_CL}    http://xap.cl.obo.lgi.io/    # PROD - CL - XAP
${LOGIN URL_PROD_NL}    http://xap.nl.obo.lgi.io/    # PROD - NL - XAP
${CH_PREPROD_STBID_1}    3C36E4-EOSSTB-003497000301
${LOGIN URL_PREPROD_NL}    http://xap.pre-nl.obo.lgi.io/
${LOGIN URL_PREPROD_CH}    http://xap.pre-ch.obo.lgi.io/
${BE_PREPROD_STBID_1}    3C36E4-EOSSTB-003471942601
${LOGIN URL_PREPROD_BE}    http://xap.pre-be.obo.lgi.io/

*** Test Cases ***
NL_PREPROD-003636113007
    [Tags]    NL-PREPROD
    [Setup]
    Connectivity_Check_PreProd    ${NL_PREPROD_STBID_1}    ${LOGIN URL_PREPROD_NL}
    Comment    Connectivity_Check_Prod    ${NL_STBID_1}    ${LOGIN URL_PREPROD_NL}
    Comment    Connectivity_Check_PreProd    ${NL_PREPROD_STBID_1}    ${LOGIN URL_PREPROD_NL}

BE-003493624005
    [Documentation]    Checking the connectivity of Prod - STB
    [Tags]    BE
    Connectivity_Check_Prod    ${BE_STBID_1}    ${LOGIN URL_PROD_BE}

CH-003392572404
    [Documentation]    Checking the connectivity of Prod - STB
    [Tags]    CH
    Connectivity_Check_Prod    ${CH_STBID_1}    ${LOGIN URL_PROD_CH}

UK-003473912503
    [Documentation]    Checking the connectivity of Prod - STB
    [Tags]    UK
    Connectivity_Check_Prod    ${UK_STBID_1}    ${LOGIN URL_PROD_UK}

CL-003436372704
    [Documentation]    Checking the connectivity of Prod - STB
    [Tags]    CL
    Connectivity_Check_Prod    ${CL_STBID_1}    ${LOGIN URL_PROD_CL}

NL-003496045406
    [Documentation]    Checking the connectivity of Prod - STB
    [Tags]    NL
    Connectivity_Check_Prod    ${NL_STBID_1}    ${LOGIN URL_PROD_NL}

CH-PREPROD-003497000301
    [Tags]    CH-PREPROD
    Connectivity_Check_PreProd    ${CH_PREPROD_STBID_1}    ${LOGIN URL_PREPROD_CH}

BE-PREPROD-003471942601
    [Tags]    BE-PREPROD
    Connectivity_Check_PreProd    ${BE_PREPROD_STBID_1}    ${LOGIN URL_PREPROD_BE}

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window

Connectivity_Check_Prod
    [Arguments]    ${country}    ${LOGIN URL_Prod}
    Comment    VPN_Connectivity
    Open Browser    ${LOGIN URL_Prod}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    //input[@id = 'cpe-id-input']
    SeleniumLibrary.Input Text    //input[@id = 'cpe-id-input']    ${country}
    Wait Until Element Is Visible    //button[@class = 'btn btn-secondary' and @id = 'btn-set-cpe-id' and @type = 'button']
    Click Element    //button[@class = 'btn btn-secondary' and @id = 'btn-set-cpe-id' and @type = 'button']
    Wait Until Element Is Visible    //button[@type = 'button' and @id = 'stb-statuses-refresh' and (text() = '↻' or . = '↻')]
    Click Element    //button[@type = 'button' and @id = 'stb-statuses-refresh' and (text() = '↻' or . = '↻')]
    Sleep    5s
    Capture Page Screenshot
    Element Text Should Be    //*[@id="stb-statuses-container"]/tr/td[2]    connected
    Sleep    5s
    Click Element    xpath=/html/body/div[2]/div[1]/ul/li[6]/a
    Sleep    3s
    Click Element    xpath=//*[@id="keyboard"]/div[2]/div[2]/button[1]
    Click Element    xpath=/html/body/div[2]/div[1]/ul/li[5]/a
    Click Element    xpath=//*[@id="screenshot-form"]/button
    Sleep    5s
    Close Browser
    Sleep    10s
    Comment    VPN_disconnect

VPN_Connectivity
    Click    D:/Xagget/VPN_Images/start.png
    SikuliLibrary.Input Text    D:/Xagget/VPN_Images/search1.png    @{vpn}
    Click    D:/Xagget/VPN_Images/VPN.png
    Sleep    5s
    Click    D:/Xagget/VPN_Images/pass.png
    SikuliLibrary.Input Text    D:/Xagget/VPN_Images/pass.png    ${VPN_Password}
    Click    D:/Xagget/VPN_Images/Connect.png
    Sleep    20s

VPN_disconnect
    Click    D:/Xagget/VPN_Images/hidden_icon.png
    Double Click    D:/Xagget/VPN_Images/disconnect_trigger2.png
    Sleep    5s
    Click    D:/Xagget/VPN_Images/Disconnect1_button.png
    Click    D:/Xagget/VPN_Images/yes.png
    Click    D:/Xagget/VPN_Images/close.png

Connectivity_Check_PreProd
    [Arguments]    ${country}    ${LOGIN URL_PreProd}
    Open Browser    ${LOGIN URL_PreProd}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    //input[@id = 'cpe-id-input']
    SeleniumLibrary.Input Text    //input[@id = 'cpe-id-input']    ${country}
    Wait Until Element Is Visible    //button[@class = 'btn btn-secondary' and @id = 'btn-set-cpe-id' and @type = 'button']
    Click Element    //button[@class = 'btn btn-secondary' and @id = 'btn-set-cpe-id' and @type = 'button']
    Wait Until Element Is Visible    //button[@type = 'button' and @id = 'stb-statuses-refresh' and (text() = '↻' or . = '↻')]
    Click Element    //button[@type = 'button' and @id = 'stb-statuses-refresh' and (text() = '↻' or . = '↻')]
    Sleep    5s
    Capture Page Screenshot
    Element Text Should Be    //*[@id="stb-statuses-container"]/tr/td[2]    connected
    Sleep    5s
    Click Element    xpath=/html/body/div[2]/div[1]/ul/li[6]/a
    Sleep    3s
    Click Element    xpath=//*[@id="keyboard"]/div[2]/div[2]/button[1]
    Click Element    xpath=/html/body/div[2]/div[1]/ul/li[5]/a
    Click Element    xpath=//*[@id="screenshot-form"]/button
    Sleep    5s
    Close Browser
