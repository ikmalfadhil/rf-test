*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${real_btn}    //*[@id="dropdown-display"]/span
${deposit_btn}    //*[text()="Deposit"]//parent::button
${settings}    //*[@class="trading-hub-header__setting"]
${token_page}    //*[@id="/account/api-token"]
${token_name}    //*[@class="dc-input__field"]
${create_btn}    //*[text()="Create"]//parent::button
${token_list}    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr[1]/td[1]/span
${delete_icon}    //*[@data-testid="dt_token_delete_icon"]
${confirm_btn}    //*[text()="Yes, delete"]//parent::button
${token}    //*[@class="da-api-token__pass-dot-container"]
${token_row}    //*[@class="da-api-token__table-cell-row"]
${copy_icon}    //*[@data-testid="dt_copy_token_icon"]
${show_icon}    //*[@data-testid="dt_toggle_visibility_icon"]

${read_box}    //*[@class="da-api-token__checkbox-wrapper"]/div[1]
${trade_box}    //*[@class="da-api-token__checkbox-wrapper"]/div[2]
${payments_box}    //*[@class="da-api-token__checkbox-wrapper"]/div[3]
${tradinginfo_box}    //*[@class="da-api-token__checkbox-wrapper"]/div[4]
${admin_box}    //*[@class="da-api-token__checkbox-wrapper"]/div[5]


*** Keywords ***
Go To Website
    Open Browser    https://app.deriv.com   chrome
    Set Window Size    1280    1024

Log in
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    ikmal@besquare.com.my
    Input Password    txtPass    Ael5661!
    Click Element    //button[@name="login"]
    Wait Until Page Contains Element    ${deposit_btn}    50

Navigate to API token page
    Wait Until Page Contains Element    ${settings}    10
    Click Element    ${settings}
    Wait Until Page Contains Element    ${token_page}    10
    Click Element    ${token_page}
    Wait Until Element Is Visible    ${read_box}    10


*** Test Cases ***
Login
    Go To Website
    Log in

Navigating to API token page
    Go To Website
    Log in
    Navigate to API token page

Creating Read Token
    Go To Website
    Log in
    Navigate to API token page
    Click Element    ${read_box}
    Click Element    ${token_name}
    Input Text    ${token_name}    test1
    Click Element    ${create_btn}
    Wait Until Page Contains Element    ${token_list}    10
    Element Should Contain    ${token_list}    test1


Creating Trade Token
    Go To Website
    Log in
    Navigate to API token page
    Click Element    ${trade_box}
    Click Element    ${token_name}
    Input Text    ${token_name}    test1
    Click Element    ${create_btn}
    Wait Until Page Contains Element    ${token_list}    10
    Element Should Contain    ${token_list}    test1

Creating Payments Token
    Go To Website
    Log in
    Navigate to API token page
    Click Element    ${payments_box}
    Click Element    ${token_name}
    Input Text    ${token_name}    test1
    Click Element    ${create_btn}
    Wait Until Page Contains Element    ${token_list}    10
    Element Should Contain    ${token_list}    test1

Creating Trading information Token
    Go To Website
    Log in
    Navigate to API token page
    Click Element    ${tradinginfo_box}
    Click Element    ${token_name}
    Input Text    ${token_name}    test1
    Click Element    ${create_btn}
    Wait Until Page Contains Element    ${token_list}    10
    Element Should Contain    ${token_list}    test1

Creating Admin Token
    Go To Website
    Log in
    Navigate to API token page
    Click Element    ${admin_box}
    Click Element    ${token_name}
    Input Text    ${token_name}    test1
    Click Element    ${create_btn}
    Wait Until Page Contains Element    ${token_list}    10
    Element Should Contain    ${token_list}    test1

Display Token List and information
    Go To Website
    Log in
    Navigate to API token page
    Wait Until Page Contains Element    ${token_row}    10
    Wait Until Page Contains Element    ${token}    10

Copy a Token
    Go To Website
    Log in
    Navigate to API token page
    Wait Until Page Contains Element    ${copy_icon}    10
    Click Element    ${copy_icon}
    Press Keys    ${token_name}    CTRL+V
    
Show a Token Key
    Go To Website
    Log in
    Navigate to API token page
    Wait Until Page Contains Element    ${show_icon}    10
    Click Element    ${show_icon}  

Hide a Token Key
    Go To Website
    Log in
    Navigate to API token page
    Wait Until Page Contains Element    ${show_icon}    10
    Click Element    ${show_icon}
    Click Element    ${show_icon}     

Delete a Token
    Go To Website
    Log in
    Navigate to API token page
    Wait Until Page Contains Element    ${delete_icon}    10
    Scroll Element Into View    ${delete_icon}    
    Click Element    ${delete_icon}
    Wait Until Page Contains Element    ${confirm_btn}    30
    Click Element    ${confirm_btn}
    Page Should Not Contain    ${delete_icon}

