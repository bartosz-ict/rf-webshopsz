*** Settings ***
Resource          ../Resources/Account.po.resource
Resource          ../Data/Users.resource
Suite Teardown    Close Browser

*** Test Cases ***
New account can be created when email is not yet registered
    [Teardown]    Remove created user    ${new user}
    Navigate to the webshop
    Create a new account    ${already registered account}
    Warning message is shown    Warning: E-Mail Address is already registered!
    Create a new account    ${new user}
    User is logged in    ${new user}

*** Keywords ***
Remove created user
    [Arguments]    ${user}
    #TODO: Hier moet een database actie plaatsvinden die de aangemaakte user weer verwijdert.
    Log    Iets met database
