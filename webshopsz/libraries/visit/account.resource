*** Settings ***
Resource          ${EXECDIR}${/}global${/}resources${/}all.resource

*** Keywords ***
Open acount creation page
    Click Element    css:i.fa.fa-user
    Click Element    jquery:a:contains("Register")
    Wait Until Element Is Visible    jquery:h1:contains("Register")

Create a new account
    [Arguments]    ${user}
    Open acount creation page
    Fill in new user data    ${user}
    Click button: Continue

 Fill in new user data
    [Arguments]    ${user}
    Input Text    firstname    ${user.firstname}
    Input Text    lastname    ${user.lastname}
    Input Text    email    ${user.email}
    Input Text    telephone    ${user.telephone}
    Input Password    password    ${user.password}
    Input Password    confirm    ${user.password}
    Select Radio Button    newsletter    ${user.newsletter}
    Select Checkbox    agree

Submit
    Click Element    css:input[value="Continue"]
    Wait Until Element Is Visible    jquery:h1:contains("Your Account Has Been Created!")
    Click button: Continue

Open acount login page
    Click Element    css:i.fa.fa-user
    Click Element    jquery:a:contains("Login")
    Wait Until Element Is Visible    jquery:h2:contains("Returning Customer")

Login with user
    [Arguments]    ${user}
    Open acount login page
    Input Text    email    ${user.email}
    Input Password    password    ${user.password}
    Click button: Login

User is logged in
    [Arguments]    ${user}
    Wait Until Page Contains    Your Account Has Been Created!    10s
    ${options}    Get account options
    List Should Contain Value    ${options}    My Account

Get account options
    ${account_options}    Create List
    Click Element    jquery:li:has(.fa-user)
    ${list}    Get WebElements    jquery:li:has(.fa-user) ul a
    Sleep    1
    FOR    ${element}    IN    @{list}
        ${text}    Get Text    ${element}
        Append To List    ${account_options}    ${text}
    END
    Click Element    jquery:li:has(.fa-user)
    [Return]    ${account_options}

Create an account in the database if not already present
    [Arguments]    ${account}
    Connect to Shop DB
    ${result}=    Read unique user based on email    ${account.email}
    Disconnect From Database
    # TODO Vervangen door INSERT in db
    Run Keyword If    len(${result})==0    Run Keywords    Navigate to the webshop    AND    Create a new account    ${account}

Get column items
    ${column_items}    Create List
    ${list}    Get WebElements    css:#column-right a
    Sleep    1
    FOR    ${element}    IN    @{list}
        ${text}    Get Text    ${element}
        Append To List    ${column_items}    ${text}
    END
    [Return]    ${column_items}

Right column has option
    [Arguments]    ${option}
    ${column_items}    Get column items
    List Should Contain Value    ${column_items}    ${option}
