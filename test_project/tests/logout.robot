*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem  # for reading doc

*** Variables ***
${URL}          https://www.demoblaze.com
${BROWSER}      chrome
${PASSWORD}     newpass123
${FILENAME}     user.txt

*** Test Cases ***
Log Out Test
    Open Browser    ${URL}    ${BROWSER}
    
    # getting username from file
    ${USERNAME}    Get File    ${FILENAME}

    # login before logout
    Click Element    id=login2
    Wait Until Element Is Visible    id=loginusername
    Input Text    id=loginusername    ${USERNAME}
    Input Text    id=loginpassword    ${PASSWORD}
    Click Button    xpath=//button[text()='Log in']
    Wait Until Element Is Visible    id=logout2
    Log    "Успешный вход: ${USERNAME}"

    # logout
    Click Element    id=logout2
    Wait Until Element Is Visible    id=login2
    Log    "Выход выполнен успешно"

    Close Browser
