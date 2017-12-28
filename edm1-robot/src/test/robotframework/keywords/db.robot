*** Settings ***
Suite Setup       DB Begin
Suite Teardown    DB Rollback
Library           JSpringBotGlobal
Library           String
Library           BuiltIn

*** Keywords ***
Check Number of Records
    [Arguments]    ${schema}    ${tableName}    ${numberOfRecord}
    Create DB Query    select count(0) from ${schema}.${tableName}
    Execute DB Query
    DB Projected Count Should Be Equal    ${numberOfRecord}
    
Check Column Max Length
    [Arguments]    ${columnName}    ${maxLength}    ${schema}    ${tableName}    ${numberOfRecord}
    Create DB Query    select count(${columnName}) from ${schema}.${tableName} where length(${columnName}) > ${maxLength}
    Execute DB Query
    DB Projected Count Should Be Equal    ${numberOfRecord}