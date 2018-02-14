*** Settings ***
Resource          ../keywords/db.robot
Library           BuiltIn
Library           String
Library           JSpringBotGlobal
Library           Selenium2Library

*** Test Cases ***
Check Max Length for tlitext.cerlinker
    #Count amount of records
    Check Number of Records    tlitext    certlinker    1914

Check Max Length for tlitext.certmapping
    #Count amount of records
    Check Number of Records    tlitext    certmapping    25570

Check Max Length for tlitext.mgclaim
    #Count amount of records
    Check Number of Records    tlitext    mgclaim    198
