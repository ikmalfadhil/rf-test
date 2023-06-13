*** Settings ***
Documentation  single test login
Library    SeleniumLibrary

*** Variables ***
${real_btn}    //*[@id="dropdown-display"]/span
${deposit_btn}    //*[text()="Deposit"]//parent::button
${dropdown_btn}    //*[@id="dropdown-display"]
${dropdown_display}    //*[@class="dc-dropdown__list dc-dropdown__list--enter-done"]
${demo_btn}    //*[@id="demo"]
${demo_txt}    //*[@class="dc-text demo-account-card__title"]
${trader_btn}    //*[@class="dc-btn dc-btn--primary"]
${graph}    //*[@class="stx-subholder"]
${symbols_btn}    //*[@class="cq-menu-btn"]
${volatility_btn}    //*[@class="sc-mcd__item sc-mcd__item--1HZ10V "] 
${volatility_txt}    //*[@class="cq-symbol"]
${sidebar}    //*[@class="sidebar__items"]
${purchase_btn}    //*[@class="dt_purchase_call_button"]
${contract}    //*[@class="dc-result__caption-wrapper"]

*** Test Cases ***
login
    Open Browser    https://app.deriv.com   chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    ikmal@besquare.com.my
    Input Password    txtPass    Ael5661!
    Click Element    //button[@name="login"]
    # Wait Until Page Contains Element    ${deposit_btn}    10
    Wait Until Page Contains Element    ${dropdown_btn}    10
    Click Element    ${dropdown_btn}
    Wait Until Page Contains Element    ${dropdown_display}    10
    Wait Until Page Contains Element    ${demo_btn}    10
    Click Element    ${demo_btn}
    Wait Until Page Contains Element    ${demo_txt}    10
    Wait Until Page Contains Element    ${trader_btn}    10
    Click Element    ${trader_btn}
    Wait Until Page Contains Element    ${graph}    10
    Wait Until Element Is Visible    ${symbols_btn}    50
    Click Element    ${symbols_btn}
    Wait Until Element Is Visible    ${volatility_btn}    10
    Click Element    ${volatility_btn}
    Wait Until Element Is Visible    ${volatility_txt}    10
    Wait Until Page Contains Element    ${sidebar}    10
    Wait Until Element Is Visible    ${purchase_btn}    50
    Click Button    ${purchase_btn}
    Wait Until Element Is Visible    ${contract}    10