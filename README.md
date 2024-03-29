# rf-webshopsz
 This is a trial project where a baseline for testautomation has been established. 
 
## Contents
An overview of directory structure used in the rf baseline often used in projects. 
Below is a proposed structure, not all of which is required to be used, but could be when needed. 


## Project Design
```
rf
│   README.md
│   red.xml
│
└─── global
│    │
│    └─── env
│    │    │─── test1.resource
│    │    └─── test2.resource     
│    │
│    └─── bin 
│    │    └─── keepass 
│    │          └── keepass_db.kdbx
│    │              
│    └─── resources
│          └─── all.resource
│          │─── database.resource
│          └─── selenium.resource
│
└─── webshopsz
     │─── resources
     │    │────   visit.resource
     │    └────   admin.resource
     │
     │─── testdata
     │    │────   customers.resource
     │    └────   ...
     │
     └─── testsuites
          │──── admin
          │      │──── dashboard
          │      │──── catalog
          │      │──── customers
          │      │──── design
          │      │──── extensions
          │      │──── sales
          │      │──── marketing
          │      │──── system
          │      └──── reports
          │
          └─── visit
                 │────  account
                 │────  cart
                 │────  filtering
                 │────  navigation
                 │────  payment
                 │────  reviews
                 └────  social
 
...
```