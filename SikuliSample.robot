*** Settings ***
Library           SikuliLibrary

*** Variables ***
@{notepad}        notepad

*** Test Cases ***
Sikuli1
    click browser

demo1
    click notepad

demo2
    click browser1

*** Keywords ***
click browser
    SikuliLibrary.Input Text    D:/Xagget/VPN_Images/start1.png    @{notepad}
    Sleep    5s

click notepad
    Click    D:/Xagget/VPN_Images/notepad.png

click browser1
    Click    D:/Xagget/VPN_Images/chrome123.png
