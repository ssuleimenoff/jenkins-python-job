*** Settings ***
Library    SeleniumLibrary
Library    browserstack_config.py

*** Variables ***
${URL}      https://www.saucedemo.com/
${BROWSER}  Chrome

*** Test Cases ***
Successful Login Test
    [Documentation]  Test successful login with valid credentials
    Open Browser To Login Page
    Input Username    standard_user
    Input Password    secret_sauce
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser

Failed Login Test
    [Documentation]  Test login with invalid credentials
    Open Browser To Login Page
    Input Username    locked_out_user
    Input Password    secret_sauce
    Submit Credentials
    Error Message Should Be Visible
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    ${remote_url}=    Get Browserstack Url
    ${options}=    Get Browser Options    ${BROWSER}
    Open Browser    ${URL}    browser=${BROWSER.lower()}    
    ...    remote_url=${remote_url}    
    ...    options=${options}
    Title Should Be    Swag Labs

Input Username
    [Arguments]    ${username}
    Input Text    user-name    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    login-button

Welcome Page Should Be Open
    Wait Until Element Is Visible    inventory_container
    Page Should Contain    Products

Error Message Should Be Visible
    Wait Until Element Is Visible    //*[@data-test="error"]
    Element Should Contain    //*[@data-test="error"]    Epic sadface: Sorry, this user has been locked out.