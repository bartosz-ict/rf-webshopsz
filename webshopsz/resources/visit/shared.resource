*** Settings ***
Resource          ${EXECDIR}${/}global${/}resources${/}all.resource

*** Keywords ***
Click button: ${name}
    [Documentation]    Clicks the button with name ${name}
    Click Element    css:input[value="${name}"]

Select from menu
    [Documentation]    Clicks on an item on the blue bar and selects one of the items in the dropdown
    [Arguments]    ${navbar}    ${item}
    Element Attribute Value Should Be    jquery:a:contains("${navbar}")    class    dropdown-toggle
    Wait Until Element Is Visible    jquery:a.dropdown-toggle:contains("${navbar}")
    Click Element    jquery:a.dropdown-toggle:contains("${navbar}")
    Wait Until Element Is Visible    jquery:a:contains("${item}")    error=${navbar} heeft geen item ${item}!
    Click Element    jquery:a:contains("${item}")
    Page title should be    ${item}

Page title should be
    [Documentation]    Checks the title of the page
    [Arguments]    ${title}
    Element Text Should Be    css:h2    ${title}

Warning message is shown
    [Documentation]    Checks de text of the warning message
    [Arguments]    ${warning}
    Wait Until Element Is Visible    css:.alert-danger
    ${text}    Get Text    css:.alert-danger
    Should Be Equal As Strings    ${warning}    ${text}    Warning message was "${text}" where we expected: "${warning}"    values=False
