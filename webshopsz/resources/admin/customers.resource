*** Settings ***
Library           String
Resource          ${EXECDIR}/global/resources/all.resource

*** Keywords ***
Select customer from customer list by name
    [Documentation]    Puts a check mark to the desired customer. Input: dictionary
    [Arguments]    ${customer}
    Page Should Contain Element    jquery:tr:contains("${customer.lastname}") input    message=Customer niet gevonden!
    Select Checkbox    jquery:tr:contains("${customer.lastname}") input

Delete selected customers
    [Documentation]    Clicks the delete button
    Click Element    css:button.btn-danger

Delete customer with name
    [Documentation]    Removes the account from the database. Input: dictionary
    [Arguments]    ${customer}
    Select customer from customer list by name    ${customer}
    Delete selected customers
    Handle Alert
    Page Should Contain Element    jquery:div.alert-success:contains("Success: You have modified customers!")
