*** Settings ***
Variables         Random.py

*** Variables ***
&{already registered account}    firstname=Sebastiaan    lastname=Molenaar    email=smolenaar@gmail.com    telephone=123456789    password=Welkom01    newsletter=1
&{new user}       firstname=Sebastiaan    lastname=Molenaar    email=smolenaar@${random}.com    telephone=123456789    password=Welkom01    newsletter=1
