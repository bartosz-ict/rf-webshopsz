*** Settings ***
Documentation     Dictionaries for the accounts of the (to be) registered visitors.
...               N.B. the key "id" is only necessary when the account is created by inserting it directly into the db.

*** Variables ***
&{registered_account}    firstname=Rein    lastname=Hochstenbach    email=rein.hochstenbach@bartosz.nl
...               telephone=123456789    password=Welkom01    newsletter=1
&{new_account}    firstname=Johnny    lastname=Fabulous    email=johnny@fab.fr
...               telephone=123456789    password=Wachtwrd1    newsletter=1
&{insert_account}    id=1    firstname=Franky    lastname=Insert    email=insert@bartosz.nl
...               telephone=123456789    password=Wachtwrd1    newsletter=1
