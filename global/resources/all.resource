*** Settings ***
Documentation     Overview of all libraries and resources. Link to this resource from a test suite to have all keywords available.
...               Please add new libraries or resources to this file!
Library           Collections
Library           DatabaseLibrary
Library           KeePassLibrary
Library           OperatingSystem
Library           SeleniumLibrary
Library           String
# Determine which environment file loads with runtime configuration
Resource          ${EXECDIR}${/}global${/}environment${/}webshopsz.${ENV}.resource
# Shared keywords
Resource          ${EXECDIR}${/}global${/}resources${/}database.resource
Resource          ${EXECDIR}${/}global${/}resources${/}selenium.resource
# Admin keywords
Resource          ${EXECDIR}${/}webshopsz${/}resources${/}admin${/}customers.resource
Resource          ${EXECDIR}${/}webshopsz${/}resources${/}admin${/}shared.resource
# Visit keywords
Resource          ${EXECDIR}${/}webshopsz${/}resources${/}visit${/}account.resource
Resource          ${EXECDIR}${/}webshopsz${/}resources${/}visit${/}cart.resource
Resource          ${EXECDIR}${/}webshopsz${/}resources${/}visit${/}shared.resource
# Testdata
Resource          ${EXECDIR}${/}webshopsz${/}testdata${/}customers.resource
