*** Settings ***
Resource   ${EXECDIR}${/}global${/}resources${/}all.resource

*** Variables ***
&{kp}             kdbx=${EXECDIR}${/}global${/}files${/}keepass${/}keepass_db.kdbx    key=keepass_db.key
# &{kp}           kdbx=${EXECDIR}${/}global${/}files${/}keepass${/}keepass_db.kdbx    key=${EXECDIR}${/}global${/}files${/}keepass${/}keepass_db.key
&{db}             host=webshopsz.westeurope.cloudapp.azure.com    port=3306    name=webshopsz

*** Keywords ***
Connect to Shop DB
    ${home} =    Get Environment Variable    USERPROFILE
    Open Keepass Database    ${kp.kdbx}    keyfile=${home}${/}.keepass${/}${kp.key}
    ${entry}=    Get Entries By Title    db_user    first=True
    ${user}=    Get Entry Username    ${entry}
    ${pass}=    Get Entry Password    ${entry}
    Connect To Database    pymysql    ${db.name}    ${user}    ${pass}    ${db.host}    ${db.port}

Delete unique account if email is registered
    [Arguments]    ${email}
    log    Verify if a user is present in database with given email `${email}`
    Connect to Shop DB
    ${result}=    Read unique user based on email    ${email}
    ${amount}=    Get length    ${result}
    log    If email adress has been registered, remove it
    Run keyword if    ${amount} != 0    Delete unique user based on email    ${email}
    Disconnect From Database

Read unique user based on email
    [Arguments]    ${email}
    # ${select_query}=    Set Variable    SELECT `oc_customer`.`customer_id`, `oc_customer`.`customer_group_id`, `oc_customer`.`store_id`, `oc_customer`.`language_id`, `oc_customer`.`firstname`, `oc_customer`.`lastname`, `oc_customer`.`email`, `oc_customer`.`telephone`,`oc_customer`.`fax`, `oc_customer`.`password`, `oc_customer`.`salt`, `oc_customer`.`cart`, `oc_customer`.`wishlist`, `oc_customer`.`newsletter`, `oc_customer`.`address_id`, `oc_customer`.`custom_field`, `oc_customer`.`ip`, `oc_customer`.`status`, `oc_customer`.`safe`, `oc_customer`.`token`, `oc_customer`.`code`, `oc_customer`.`date_added` FROM `webshopsz`.`oc_customer` WHERE `oc_customer`.`email` = '${email}';
    ${select_query}=    Set Variable    SELECT `oc_customer`.* FROM `webshopsz`.`oc_customer` WHERE `oc_customer`.`email` = '${email}';
    ${result}=    Query    ${select_query}
    [Return]    ${result}

Delete unique user based on email
    [Arguments]    ${email}
    ${delete_query}=    Set Variable    DELETE FROM `webshopsz`.`oc_customer` WHERE `oc_customer`.`email` = '${email}';
    ${status}=    Run Keyword and Return Status    Query    ${delete_query}
    Run Keyword Unless    ${status}    Fail    ${delete_query}
