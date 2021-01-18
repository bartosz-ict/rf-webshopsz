*** Settings ***
Library           String
Resource          ../../global/resources/all.resource
Resource          ../testdata/customers.resource
Suite Teardown    Close All Browsers

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
    Navigate to the webshop
    Login with user    ${registered_account}
    Right column has option    Order History
    Click Element    jquery:a.list-group-item:contains("Order History")

As a customer I want to add wanted items to my shopping cart
    Navigate to the webshop
    Login with user    ${registered_account}
    Shopping cart is empty

*** Keywords ***
Get Shopping cart
    ${cart}    Get Text    cart-total
    ${cart_split}    Split String    ${cart}
    ${shopping_cart}    Create Dictionary    items=${cart_split}[0]    amount=${cart_split}[3]
    [Return]    ${shopping_cart}

Shopping cart is empty
    ${shopping_cart}    Get Shopping cart
    Log Dictionary    ${shopping_cart}
    Return From Keyword If    ${shopping_cart}[items]==0
    Fail    Shopping cart is not empty!
