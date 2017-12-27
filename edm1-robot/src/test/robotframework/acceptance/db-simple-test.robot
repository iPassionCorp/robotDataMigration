*** Settings ***
Library           JSpringBotGlobal
Library           String
Library           BuiltIn

*** Test Cases ***
Check Number of TLP.CustomerInfo
    DB Begin
    Create DB Query    select count(0) from tlp.customerinfo
    Execute DB Query
    DB Projected Count Should Be Equal    208766
    DB Rollback
    
Check Number of TLP.CustomerSA
    DB Begin
    Create DB Query    select count(0) from tlp.customersa
    Execute DB Query
    DB Projected Count Should Be Equal    209051
    DB Rollback