*** Settings ***
Resource          ${EXECDIR}/global/resources/all.resource
Test Teardown     Close Browser

*** Test Cases ***
As a customer I want to add wanted items to my shopping cart
    Navigate to the webshop
    Login with user    ${registered_account}
    Shopping cart is empty
