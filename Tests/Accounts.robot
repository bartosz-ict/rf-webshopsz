*** Settings ***
Resource          ../Resources/Account.po.resource
Resource          ../Resources/database.resource

Suite Teardown    Close All Browsers


*** Variables ***
&{registered_account}    firstname=Sebastiaan    lastname=Molenaar    email=smolenaar@gmail.com
                  ...    telephone=123456789     password=Welkom01    newsletter=1

&{new_account}           firstname=Johnny        lastname=Fabulous    email=johnny@fab.fr
                  ...    telephone=123456789     password=Wachtwrd1    newsletter=1

*** Test Cases ***
As a customer I can create a new account when it has not been registered
    [Setup]    Delete unique account if email is registered    ${new_account}[email]
    Navigate to the webshop
    Create a new account    ${new_account}
    User is logged in       ${new_account}
    
As a customer I recieve an error when email has been registered for an accounthow
    Navigate to the webshop
    Create a new account    ${registered_account}
    Warning message is shown    Warning: E-Mail Address is already registered!