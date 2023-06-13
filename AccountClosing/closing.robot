*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Variables ***
${DERIV_URL}    https://app.deriv.com
${EMAIL}    ikmal@besquare.com.my
${PASSWORD}    Ael5661!
${real_btn}    //*[@id="dropdown-display"]/span
${deposit_btn}    //*[text()="Deposit"]//parent::button
${closemyaccount_btn}    //*[text()="Close my account"]//parent::button
${cancel_btn}    //*[text()="Cancel"]//parent::button
${cont_btn}    //*[text()="Continue"]//parent::button
${close_btn}    //*[text()="Close account"]//parent::button

${settings}    //*[@class="trading-hub-header__setting"]
${closing_page}    //*[@id="/account/closing-account"]
${graph}    //*[@class="stx-subholder"]
${policy_link}    //*[@class="closing-account__steps"]/p/a
${suggestion_box}    //*[@class="closing-account-reasons"]/form/div[2]/div

${reason1}    //*[@class="closing-account-reasons"]/form/label[1]
${reason2}    //*[@class="closing-account-reasons"]/form/label[2]/span
${reason3}    //*[@class="closing-account-reasons"]/form/label[3]/span
${reason4}    //*[@class="closing-account-reasons"]/form/label[4]/span
${reason5}    //*[@class="closing-account-reasons"]/form/label[5]/input


*** Keywords ***
Go To Website
    Open Browser    ${DERIV_URL}    chrome
    Set Window Size    1280    1024

Log in
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    ${EMAIL}
    Input Password    txtPass    ${PASSWORD}
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
    Wait Until Element Is Visible    ${reason2}    10
    Click Element    ${reason2}
    Wait Until Page Contains Element    ${cont_btn}    10
    Click Element    ${cont_btn}
    Wait Until Page Contains Element    ${close_btn}    10
    # Click Element    ${close_btn}
    # Sleep    20s
    # Page Should Contain    Login

Closing an Account with Two Reasons
    Go To Website
    Log in
    Navigate to Account Closing Page
    Wait Until Page Contains Element    ${closemyaccount_btn}    10
    Click Element    ${closemyaccount_btn}
    Wait Until Element Is Visible    ${reason2}    10
    Click Element    ${reason2}
    Click Element    ${reason3}
    Wait Until Page Contains Element    ${cont_btn}    10
    Click Element    ${cont_btn}
    Wait Until Page Contains Element    ${close_btn}    10
    # Click Element    ${close_btn}
    # Sleep    20s
    # Page Should Contain    Login

Closing an Account with Three Reasons
    Go To Website
    Log in
    Navigate to Account Closing Page
    Wait Until Page Contains Element    ${closemyaccount_btn}    10
    Click Element    ${closemyaccount_btn}
    Wait Until Element Is Visible    ${reason2}    10
    Click Element    ${reason2}
    Click Element    ${reason3}
    Click Element    ${reason4}
    Wait Until Page Contains Element    ${cont_btn}    10
    Click Element    ${cont_btn}
    Wait Until Page Contains Element    ${close_btn}    10
    # Click Element    ${close_btn}
    # Sleep    20s
    # Page Should Contain    Login

Closing an Account with More Than Three Reasons
    Go To Website
    Log in
    Navigate to Account Closing Page
    Wait Until Page Contains Element    ${closemyaccount_btn}    10
    Click Element    ${closemyaccount_btn}
    Wait Until Element Is Enabled    ${reason2}    10
    Click Element    ${reason2}
    Click Element    ${reason3}
    Click Element    ${reason4}
    Element Should Be Disabled    ${reason5}
    # Click Element    ${close_btn}
    # Sleep    20s
    # Page Should Contain    Login

Closing an Account With a Suggestion
    Go To Website
    Log in
    Navigate to Account Closing Page
    Wait Until Page Contains Element    ${closemyaccount_btn}    10
    Click Element    ${closemyaccount_btn}
    Wait Until Element Is Visible    ${reason2}    10
    Click Element    ${reason2}
    Press Keys    ${suggestion_box}    ABC123
    Wait Until Page Contains Element    ${cont_btn}    10
    Click Element    ${cont_btn}
    Wait Until Page Contains Element    ${close_btn}    10
    # Click Element    ${close_btn}
    # Sleep    20s
    # Page Should Contain    Log in

Closing an Account Without a Reason
    Go To Website
    Log in
    Navigate to Account Closing Page
    Wait Until Page Contains Element    ${closemyaccount_btn}    10
    Click Element    ${closemyaccount_btn}
    Wait Until Page Contains Element    ${cont_btn}    10
    Element Should Be Disabled    ${cont_btn}