*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${real_btn}    //*[@id="dropdown-display"]/span
${deposit_btn}    //*[text()="Deposit"]//parent::button
${settings}    //*[@class="trading-hub-header__setting"]
${closing_page}    //*[@id="/account/closing-account"]
${closemyaccount_btn}    //*[text()="Close my account"]//parent::button
${cancel_btn}    //*[text()="Cancel"]//parent::button
${cont_btn}    //*[text()="Continue"]//parent::button
${graph}    //*[@class="stx-subholder"]
${policy_link}    //*[@class="closing-account__steps"]/p/a

${reason1}    //*[@class="closing-account-reasons"]/form/label[1]
${reason2}    //*[@class="closing-account-reasons"]/form/label[2]
${reason3}    //*[@class="closing-account-reasons"]/form/label[3]
${reason4}    //*[@class="closing-account-reasons"]/form/label[4]


*** Keywords ***
Go To Website
    Open Browser    https://app.deriv.com   chrome
    Set Window Size    1280    1024

Log in
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    *******
    Input Password    txtPass    *******
    Click Element    //button[@name="login"]
    Wait Until Page Contains Element    ${deposit_btn}    50

Navigate to Account Closing Page
    Wait Until Page Contains Element    ${settings}    10
    Click Element    ${settings}
    Wait Until Page Contains Element    ${closing_page}    10
    Click Element    ${closing_page}


*** Test Cases ***
Login
    Go To Website
    Log in

Navigating to Account Closing Page
    Go To Website
    Log in
    Navigate to Account Closing Page
    Wait Until Page Contains Element    ${closemyaccount_btn}    10

Cancel Account Closing
    Go To Website
    Log in
    Navigate to Account Closing Page
    Wait Until Page Contains Element    ${closemyaccount_btn}    10
    Click Element    ${cancel_btn}
    Wait Until Element Is Visible    ${graph}

Checking Security and Privacy Policy
    Go To Website
    Log in
    Navigate to Account Closing Page
    Wait Until Page Contains Element    ${closemyaccount_btn}    10
    Click Element    ${policy_link}
    Switch Window    url=https://deriv.com/tnc/security-and-privacy.pdf

Closing an Account with One Reason
    Go To Website
    Log in
    Navigate to Account Closing Page
    Wait Until Page Contains Element    ${closemyaccount_btn}    10
    Click Element    ${closemyaccount_btn}
    Wait Until Page Contains Element    ${reason1}
    Click Element    ${reason1}
    Wait Until Page Contains Element    ${cont_btn}    10