*** Settings ***
Library           String
Resource          ${EXECDIR}/global/resources/all.resource

*** Keywords ***
Log in to the admin account
    [Documentation]    Logs onto the admin website (only admin)
    Input Text    input-username    admin
    Input Password    input-password    webshopsz
    Click Element    jquery:button:contains("Login")

Select from navigation
    [Documentation]    Select an option from the left menu
    [Arguments]    ${parent}    ${child}=${EMPTY}
    Click Element    jquery:li:contains("${parent}")
    Wait Until Element Is Visible    jquery:li:contains("${parent}") ul a:contains("${child}")
    Click Element    jquery:li:contains("${parent}") ul a:contains("${child}")
    Wait Until Element Is Visible    jquery:h1:contains("${child}")
