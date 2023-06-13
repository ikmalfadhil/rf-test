*** Settings ***
Documentation  single test login
Library    SeleniumLibrary

*** Variables ***
${real_btn}    //*[@id="dropdown-display"]/span
${deposit_btn}    //*[text()="Deposit"]//parent::button
${dropdown_btn}    //*[@id="dropdown-display"]
${dropdown_display}    //*[@class="dc-dropdown__list dc-dropdown__list--enter-done"]
${demo_btn}    //*[@id="demo"]
${trader_btn}    //*[@class="dc-btn dc-btn--primary"]
${menu_btn}    //*[@class="cq-menu-btn"]
${markets}    //*[@class="sc-mcd__filter"]/div[4]
${AUDUSD}    //*[@class="sc-mcd__item sc-mcd__item--frxAUDUSD "]
${trade_container}    //*[@id="dt_contract_dropdown"]/div[1]
${vertical_tab}    //*[@class="dc-vertical-tab"]
${highlow}    //*[@id="dt_contract_high_low_item"]
${days_container}    //*[@class="dc-input__field"]
${payout_btn}    //*[text()="Payout"]//parent::button
${amount_txt}    //*[@id="dt_amount_input"]
${lower_btn}    //*[@class="btn-purchase__shadow-wrapper"]
${card}    //*[@class="dc-contract-card__wrapper"]

#  //*[@id="dt_contract_dropdown"]/div
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
    Wait Until Page Contains Element    ${dropdown_btn}    10
    Click Element    ${dropdown_btn}
    Wait Until Element Is Visible    ${dropdown_display}    10
    Wait Until Page Contains Element    ${demo_btn}    10
    Click Element    ${demo_btn}
    Wait Until Page Contains Element    ${trader_btn}    10
    Click Element    ${trader_btn}
    Wait Until Element Is Visible   ${menu_btn}    50
    Click Element    ${menu_btn}
    Wait Until Element Is Visible    ${markets}    10
    Click Element    ${markets}
    Wait Until Page Contains Element    ${AUDUSD}    10
    Click Element    ${AUDUSD}
    Wait Until Element Is Visible    ${menu_btn}    10
    Wait Until Page Contains Element    ${trade_container}    10
    Click Element    ${trade_container}
    Wait Until Element Is Visible    ${vertical_tab}    10
    Wait Until Element Is Visible    ${highlow}    10
    Click Element    ${highlow}
    Wait Until Page Contains Element    ${days_container}    10
    Double Click Element    ${days_container}
    Clear Element Text    ${days_container}
    Input Text    ${days_container}    2
    Click Element    ${payout_btn}
    Double Click Element    ${amount_txt}
    Press Keys    ${amount_txt}    CTRL+A+BACKSPACE
    Input Text    ${amount_txt}    15.50
    Wait Until Element Is Enabled    ${lower_btn}
    Click Element    ${lower_btn}
    Wait Until Element Is Visible    ${card}