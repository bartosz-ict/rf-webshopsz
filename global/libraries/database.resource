*** Settings ***
Resource          ${EXECDIR}${/}global${/}resources${/}all.resource

*** Variables ***
&{kp}             kdbx=${EXECDIR}${/}global${/}files${/}keepass${/}keepass_db.kdbx    key=keepass_db.key

*** Keywords ***
Connect to Shop DB
    [Documentation]    Connects to the shop database, needed when you want to create, read, update or delete accounts
    ${home}=    Get Environment Variable    USERPROFILE
    ${key_location}=    Set Variable    ${home}${/}.keepass${/}${kp.key}
    File Should Exist    ${key_location}    You're keyfile is not found at (${key_location}), download this file and place it there.
    Open Keepass Database    ${kp.kdbx}    keyfile=${home}${/}.keepass${/}${kp.key}
    ${entry}=    Get Entries By Title    db_user    first=True
    ${user}=    Get Entry Username    ${entry}
    ${pass}=    Get Entry Password    ${entry}
    Connect To Database    pymysql    ${db_shop.db_name}    ${user}    ${pass}    ${db_shop.db_host}    ${db_shop.db_port}

Delete unique account if email is registered
    [Documentation]    Deletes an account with specific e-mail
    [Arguments]    ${email}
    log    Verify if a user is present in database with given email `${email}`
    Connect to Shop DB
    ${result}=    Read unique user based on email    ${email}
    ${amount}=    Get length    ${result}
    log    If email adress has been registered, remove it
    Run keyword if    ${amount} != 0    Delete unique user based on email    ${email}
    Disconnect From Database

Read unique user based on email
    [Documentation]    Selects accounts with given e-mail account
    [Arguments]    ${email}
    # ${select_query}=    Set Variable    SELECT `oc_customer`.`customer_id`, `oc_customer`.`customer_group_id`, `oc_customer`.`store_id`, `oc_customer`.`language_id`, `oc_customer`.`firstname`, `oc_customer`.`lastname`, `oc_customer`.`email`, `oc_customer`.`telephone`,`oc_customer`.`fax`, `oc_customer`.`password`, `oc_customer`.`salt`, `oc_customer`.`cart`, `oc_customer`.`wishlist`, `oc_customer`.`newsletter`, `oc_customer`.`address_id`, `oc_customer`.`custom_field`, `oc_customer`.`ip`, `oc_customer`.`status`, `oc_customer`.`safe`, `oc_customer`.`token`, `oc_customer`.`code`, `oc_customer`.`date_added` FROM `webshopsz`.`oc_customer` WHERE `oc_customer`.`email` = '${email}';
    ${select_query}=    Set Variable    SELECT `oc_customer`.* FROM `webshopsz`.`oc_customer` WHERE `oc_customer`.`email` = '${email}';
    ${result}=    Query    ${select_query}
    [Return]    ${result}

Insert specific user
    [Documentation]    Inserts a new account with specific id. Beware: Account created via front end are assigned an id, so make it unique
    # TODO Hashing password is difficult, so we didn't build it yet
    [Arguments]    ${customer}
    Connect to Shop DB
    ${insert_query}=    Set Variable    INSERT INTO `webshopsz`.`oc_customer` (`oc_customer`.`customer_id`,`oc_customer`.`customer_group_id`,`oc_customer`.`store_id`,`oc_customer`.`language_id`,`oc_customer`.`firstname`,`oc_customer`.`lastname`,`oc_customer`.`email`,`oc_customer`.`telephone`,`oc_customer`.`fax`,`oc_customer`.`password`,`oc_customer`.`salt`,`oc_customer`.`cart`,`oc_customer`.`wishlist`,`oc_customer`.`newsletter`,`oc_customer`.`address_id`,`oc_customer`.`custom_field`,`oc_customer`.`ip`,`oc_customer`.`status`,`oc_customer`.`safe`,`oc_customer`.`token`,`oc_customer`.`code`,`oc_customer`.`date_added`) VALUES (${customer.id}, 1, 0, 1, '${customer.firstname}', '${customer.lastname}', '${customer.email}', ${customer.telephone}, '', 'wacht123woord', 'salt01', null, null, 1, 0, '', '123.123.123.123', 1, 0, '', '', '2021-01-24 20:00:00');
    ${result}=    Query    ${insert_query}
    Disconnect From Database
    [Return]    ${result}

Delete unique user based on email
    [Documentation]    Deletes an account with specific e-mail (account is present)
    [Arguments]    ${email}
    ${delete_query}=    Set Variable    DELETE FROM `webshopsz`.`oc_customer` WHERE `oc_customer`.`email` = '${email}';
    ${status}=    Run Keyword and Return Status    Query    ${delete_query}
    Run Keyword Unless    ${status}    Fail    ${delete_query}
