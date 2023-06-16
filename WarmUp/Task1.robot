*** Settings ***
Documentation  single test login
Library    SeleniumLibrary

*** Variables ***
${real_btn}    //*[@id="dropdown-display"]/span
${deposit_btn}    //*[text()="Deposit"]//parent::button
${dropdown_btn}    //*[@id="dropdown-display"]
${dropdown_display}    //*[@class="dc-dropdown__list dc-dropdown__list--enter-done"]
${demo_btn}    //*[@id="demo"]
${demo_txt}    //*[@id="traders-hub"]/div[2]/div[1]/div[1]/div[2]/div[1]/div/div[1]/span

*** Test Cases ***
login
    Open Browser    https://app.deriv.com   chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    *******
    Input Password    txtPass    *******
    Click Element    //button[@name="login"]
    Wait Until Page Contains Element    ${deposit_btn}    10
    Wait Until Page Contains Element    ${dropdown_btn}    10
    Click Element    ${dropdown_btn}
    Wait Until Page Contains Element    ${dropdown_display}    10
    Wait Until Page Contains Element    ${demo_btn}    10
    Click Element    ${demo_btn}
    Wait Until Page Contains Element    ${demo_txt}    10

