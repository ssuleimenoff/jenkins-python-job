*** Settings ***
Library    SeleniumLibrary
Library    String  
Library    Collections  
Library    OperatingSystem  # for reading doc

*** Variables ***
${URL}          https://www.demoblaze.com
${BROWSER}      chrome
${PASSWORD}     newpass123
${FILENAME}     user.txt  # file for user-names

*** Test Cases ***
Sign Up Test
    Open Browser    ${URL}    ${BROWSER}

    # random name
    ${RANDOM}    Generate Random String    5    [LETTERS]
    ${USERNAME}    Set Variable    user${RANDOM}

    Click Element    id=signin2
    Wait Until Element Is Visible    id=sign-username
    Input Text    id=sign-username    ${USERNAME}
    Input Text    id=sign-password    ${PASSWORD}
    Click Button    xpath=//button[text()='Sign up']

    # waiting for Alert and receive 
    Wait Until Keyword Succeeds    3x    2s    Handle Alert    ACCEPT
    Log    "Регистрация выполнена успешно с именем: ${USERNAME}"

    # saving username 
    Create File    ${FILENAME}    ${USERNAME}

    Close Browser
