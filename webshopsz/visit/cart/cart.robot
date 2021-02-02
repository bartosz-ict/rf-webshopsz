*** Settings ***
Library           String
Resource          ${EXECDIR}/global/resources/all.resource
Resource          ${EXECDIR}/webshopsz/_testdata/customers.resource
Suite Teardown    Close All Browsers

*** Test Cases ***
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
