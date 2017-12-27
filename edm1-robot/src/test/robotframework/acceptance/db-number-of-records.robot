*** Settings ***
Library           JSpringBotGlobal
Library           String
Library           BuiltIn

*** Test Cases ***
Check Number of Records for TLP.CustomerInfo
    DB Begin
    Create DB Query    select count(0) from tlp.customerinfo
    Execute DB Query
    DB Projected Count Should Be Equal    208766
    DB Rollback
    
Check Number of Records for TLP.CustomerSA
    DB Begin
    Create DB Query    select count(0) from tlp.customersa
    Execute DB Query
    DB Projected Count Should Be Equal    209051
    DB Rollback
    
Check Number of Records for TLP.Payment
    DB Begin
    Create DB Query    select count(0) from tlp.payment
    Execute DB Query
    DB Projected Count Should Be Equal    209508
    DB Rollback
    
Check Number of Records for TLP.SplitPremiumAmount
    DB Begin
    Create DB Query    select count(0) from tlp.splitpremiumamount
    Execute DB Query
    DB Projected Count Should Be Equal    208205
    DB Rollback
    
Check Number of Records for TLP.CustomerBalloon
    DB Begin
    Create DB Query    select count(0) from tlp.customerballoon
    Execute DB Query
    DB Projected Count Should Be Equal    13289
    DB Rollback