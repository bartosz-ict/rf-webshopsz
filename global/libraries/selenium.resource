*** Settings ***
Resource          ${EXECDIR}${/}global${/}resources${/}all.resource

*** Keywords ***
Navigate to the webshop
    Open Browser    ${SHOP_URL}    ${BROWSER}
    Maximize Browser Window

Navigate to the webshop admin page
    Open Browser    ${ADMIN_URL}    ${BROWSER}
    Maximize Browser Window
