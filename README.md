# rf-webshopsz
 This is a trial project where a baseline for testautomation has been established. 
 
## Contents
An overview of directory structure used in the rf baseline often used in projects. 
Below is a proposed structure, not all of which is required to be used, but could be when needed. 


## Project
```
rf
│   README.md
│   red.xml
│
└─── global
│    │
│    └─── environments
│    │    │──── test1.resource
│    │    └─── test2.resource     
│    │
│    └─── files 
│    │    └─── keepass - 
│    │          └── keepass_db.kdbx
│    │              
│    └─── resources
│    │    │─── all.resource
│    │    │─── variables.resource
│    │    └─── libraries.resource
│    │        ...
│    │
│    └─── libraries
│         │─── functions
│         │     │─── database_kw.resource
│         │
│         └─── components
│               │───    item.execute.resource
│               │───    item.input.resource
│               │───    item.validate.resource
│                       ...
└─── webshopsz
│    │─── [testdata]
│    │    │────   customers.resource
│    │    └────   ...
│    │
│    │─── admin
│    │    │──── dashboard
│    │    │──── catalog
│    │    │──── customers
│    │    │──── design
│    │    │──── extensions
│    │    │──── sales
│    │    │──── marketing
│    │    │──── system
│    │    └──── reports
│    │ 
│    └─── visit
│         │────  account
│         │────  cart
│         │────  filtering
│         │────  navigation
│         │────  payment
│         │────  reviews
│         └────  social
│
│─── nextprojectz
...
```