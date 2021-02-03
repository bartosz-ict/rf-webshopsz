*** Settings ***
Library           String
Resource          ${EXECDIR}/global/resources/all.resource
Test Teardown     Close Browser

*** Test Cases ***
As an admin I want to be able to remove customers
    [Setup]    Insert specific user    ${insert_account}
    Navigate to the webshop admin page
    Log in to the admin account
    Select from navigation    Customers    Customers
    Delete customer with name    ${insert_account}
