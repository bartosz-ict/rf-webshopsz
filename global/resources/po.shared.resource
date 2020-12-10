*** Settings ***
Library           SeleniumLibrary
Resource          ../Environment/webshopsz.test1.resource

*** Keywords ***
Navigate to the webshop
    Open Browser    ${SHOP_URL}    ${BROWSER}
    Maximize Browser Window

Click button: ${name}
    Click Element    css:input[value="${name}"]

Select from menu
    [Arguments]    ${navbar}    ${item}
    # Wait Until Element Is Visible    jquery:a.dropdown-toggle:contains("${navbar}")
    # Click Element    jquery:a.dropdown-toggle:contains("${navbar}")
    Wait Until Element Is Visible    jquery:a:contains("${item}")
    Click Element    jquery:a:contains("${item}")

Navigate to page
    [Arguments]    ${page}
    Select from menu    Components    ${page}
    Page title should be    ${page}

Page title should be
    [Arguments]    ${title}
    Element Text Should Be    css:h2    ${title}

Warning message is shown
    [Arguments]    ${warning}
    Wait Until Element Is Visible    css:.alert-danger
    ${text}    Get Text    css:.alert-danger
    Should Be Equal As Strings    ${warning}    ${text}    Warning message was "${text}" where we expected: "${warning}"    values=False
