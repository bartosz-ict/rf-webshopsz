*** Settings ***
#Overview of all libraries
Library           Collections
Library           DatabaseLibrary
Library           KeePassLibrary
Library           OperatingSystem
Library           SeleniumLibrary
#Determine which environment file loads with runtime configuration
Resource          ${EXECDIR}${/}global${/}environment${/}webshopsz.${env}.resource
#Shared keywords
Resource          database.resource
Resource          po.account.resource
Resource          po.shared.resource

*** Variables ***
#Global variables
&{KEEPASS}        kdbx=${EXECDIR}${/}global${/}files${/}keepass${/}keepass_db.kdbx    key=${EXECDIR}${/}global${/}files${/}keepass${/}keepass_db.key
