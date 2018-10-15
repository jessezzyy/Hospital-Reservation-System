*** Settings ***
Documentation     A resource file with keywords and variables.
Library           Selenium2Library

*** Variables ***
${SERVER}         app.codeship.com
${BROWSER}        PhantomJS
${DELAY}          0
${USER}           436080025
${VALID USER}     436080025@qq.com
${VALID PASSWORD}    Zl13317005159
${LOGIN URL}      https://app.codeship.com/sessions/new
${PROJECTS URL}    https://app.codeship.com/projects

*** Keywords ***
Open Browser To Login Page
    Open Browser    https://app.codeship.com/sessions/new    browser=chrome
    Maximize Browser Window
    Set Selenium Speed    4
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Hosted Continuous Delivery for free | The Codeship.

Go To Login Page
    Go To    https://app.codeship.com/sessions/new
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    436080025@qq.com    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    Zl13317005159    ${password}

Submit Credentials
    Click Button    signin

Projects Page Should Be Open
    Location Should Be    ${PROJECTS URL}
    Title Should Be    Dashboard - ${USER}
