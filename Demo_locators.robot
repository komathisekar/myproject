*** Settings ***
Library           SikuliLibrary

*** Variables ***
@{notepad}        notepad

*** Test Cases ***
demo
    click image

demo1
    click notepad

*** Keywords ***
click image
    SikuliLibrary.Input Text    D:/Xagget/VPN_Images/start1.png    @{notepad}

click notepad
    click    D:/Xagget/VPN_Images/notepad.png
