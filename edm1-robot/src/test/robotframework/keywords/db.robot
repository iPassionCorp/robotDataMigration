*** Settings ***
Suite Setup       DB Begin
Suite Teardown    DB Rollback
Library           JSpringBotGlobal
Library           String
Library           BuiltIn

*** Keywords ***
Check Number of Records
    [Arguments]    ${schema}    ${tablename}    ${numberOfRecord}
    Create DB Query    select count(0) from ${schema}.${tablename}
    Execute DB Query
    DB Projected Count Should Be Equal    ${numberOfRecord}