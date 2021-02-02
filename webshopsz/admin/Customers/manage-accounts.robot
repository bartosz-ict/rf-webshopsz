*** Settings ***
Library           String
Resource          ${EXECDIR}/global/resources/all.resource
Resource          ../../testdata/customers.resource
Test Teardown     Close Browser

*** Variables ***
&{insert_account}    id=1    firstname=Franky    lastname=Insert    email=insert@bartosz.nl
...               telephone=123456789    password=Wachtwrd1    newsletter=1

*** Test Cases ***
Test1
    [Setup]    Insert specific user    ${insert_account}
    Navigate to the webshop admin page
    Log in to the admin account
    Select from navigation    Customers    Customers
    Delete customer with name    ${insert_account}

*** Keywords ***
Log in to the admin account
    Input Text    input-username    admin
    Input Password    input-password    webshopsz
    Click Element    jquery:button:contains("Login")

Select customer from customer list by name
    [Arguments]    ${customer}
    Page Should Contain Element    jquery:tr:contains("${customer.lastname}") input    message=Customer niet gevonden!
    Select Checkbox    jquery:tr:contains("${customer.lastname}") input

Delete selected customers
    Click Element    css:button.btn-danger

Delete customer with name
    [Arguments]    ${customer}
    Select customer from customer list by name    ${customer}
    Delete selected customers
    Handle Alert
    Page Should Contain Element    jquery:div.alert-success:contains("Success: You have modified customers!")

Select from navigation
    [Arguments]    ${parent}    ${child}=${EMPTY}
    Click Element    jquery:li:contains("${parent}")
    Wait Until Element Is Visible    jquery:li:contains("${parent}") ul a:contains("${child}")
    Click Element    jquery:li:contains("${parent}") ul a:contains("${child}")
    Wait Until Element Is Visible    jquery:h1:contains("${child}")
