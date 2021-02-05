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
Resource          ${EXECDIR}${/}global${/}libraries${/}database.resource
Resource          ${EXECDIR}${/}global${/}libraries${/}selenium.resource
# Admin keywords
Resource          ${EXECDIR}${/}webshopsz${/}libraries${/}admin${/}customers.resource
Resource          ${EXECDIR}${/}webshopsz${/}libraries${/}admin${/}shared.resource
# Visit keywords
Resource          ${EXECDIR}${/}webshopsz${/}libraries${/}visit${/}account.resource
Resource          ${EXECDIR}${/}webshopsz${/}libraries${/}visit${/}cart.resource
Resource          ${EXECDIR}${/}webshopsz${/}libraries${/}visit${/}shared.resource
# Testdata
Resource          ${EXECDIR}${/}webshopsz${/}testdata${/}customers.resource
