*** Settings ***
Library           String
Resource          ${EXECDIR}/global/resources/all.resource

*** Keywords ***
Log in to the admin account
    Input Text    input-username    admin
    Input Password    input-password    webshopsz
    Click Element    jquery:button:contains("Login")

Select from navigation
    [Arguments]    ${parent}    ${child}=${EMPTY}
    Click Element    jquery:li:contains("${parent}")
    Wait Until Element Is Visible    jquery:li:contains("${parent}") ul a:contains("${child}")
    Click Element    jquery:li:contains("${parent}") ul a:contains("${child}")
    Wait Until Element Is Visible    jquery:h1:contains("${child}")
