*** Settings ***
Documentation     Global variables for shop02

*** Variables ***
${SHOP_URL}       http://webshopsz02.westeurope.cloudapp.azure.com/
${ADMIN_URL}      ${SHOP_URL}/admin
${BROWSER}        chrome
&{db_shop}        db_host=webshopsz02.westeurope.cloudapp.azure.com    db_port=3306    db_name=webshopsz
