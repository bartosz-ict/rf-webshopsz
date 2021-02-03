*** Settings ***
Library           String
Resource          ${EXECDIR}/global/resources/all.resource
Test Teardown     Close Browser

*** Test Cases ***
As a customer I can create a new account when it has not been registered
    [Setup]    Delete unique account if email is registered    ${new_account}[email]
    Navigate to the webshop
    Create a new account    ${new_account}
    User is logged in    ${new_account}

As a customer I recieve an error when email has been registered for an accounthow
    [Setup]    Create an account in the database if not already present    ${registered_account}
    Navigate to the webshop
    Create a new account    ${registered_account}
    Warning message is shown    Warning: E-Mail Address is already registered!

As a customer I want to see my previous orders
    [Setup]    Create an account in the database if not already present    ${registered_account}
    Navigate to the webshop
    Login with user    ${registered_account}
    Right column has option    Order History
    Click Element    jquery:a.list-group-item:contains("Order History")
