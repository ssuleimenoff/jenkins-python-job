*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem  # for reading doc

*** Variables ***
${URL}          https://www.demoblaze.com
${BROWSER}      chrome
${PASSWORD}     newpass123
${FILENAME}     user.txt

*** Test Cases ***
Log In Test
    Open Browser    ${URL}    ${BROWSER}

    # Getting username from file
    ${USERNAME}    Get File    ${FILENAME}
    
    Click Element    id=login2
    Wait Until Element Is Visible    id=loginusername
    Input Text    id=loginusername    ${USERNAME}
    Input Text    id=loginpassword    ${PASSWORD}
    Click Button    xpath=//button[text()='Log in']

    # Checking
    Wait Until Element Is Visible    id=logout2
    Log    "Логин выполнен успешно с именем: ${USERNAME}"

    Close Browser
