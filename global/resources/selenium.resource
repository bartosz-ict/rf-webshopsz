*** Settings ***
Resource          ${EXECDIR}${/}global${/}resources${/}all.resource

*** Keywords ***
Navigate to the webshop
    [Documentation]    Opens a browser to the shop url
    Open Browser    ${SHOP_URL}    ${BROWSER}
    Maximize Browser Window

Navigate to the webshop admin page
    [Documentation]    Opens a browser to the admin url
    Open Browser    ${ADMIN_URL}    ${BROWSER}
    Maximize Browser Window
