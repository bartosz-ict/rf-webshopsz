*** Settings ***
Documentation     Global variables for shop01

*** Variables ***
${SHOP_URL}       http://webshopsz01.westeurope.cloudapp.azure.com/
${ADMIN_URL}      ${SHOP_URL}/admin
${BROWSER}        chrome
&{db_shop}        db_host=webshopsz01.westeurope.cloudapp.azure.com    db_port=3306    db_name=webshopsz
