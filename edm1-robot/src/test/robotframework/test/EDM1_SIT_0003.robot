*** Settings ***
Library           JSpringBotGlobal
Library           String
Library           BuiltIn
Resource           ../keywords/db.robot

*** Test Cases ***
Check Max Length for tlitext.name.nameid
    Check Column Max Length    nameid    13    tlitext    name    0
    
Check Max Length for tlitext.name.personid
    Check Column Max Length    personid    13    tlitext    name    0
    
Check Max Length for tlitext.name.prename
    Check Column Max Length    prename    30    tlitext    name    0
    
Check Max Length for tlitext.name.firstname
    Check Column Max Length    firstname    30    tlitext    name    0
    
Check Max Length for tlitext.name.lastname
    Check Column Max Length    lastname    30    tlitext    name    0
    
Check Max Length for tlitext.name.startdate
    Check Column Max Length    startdate    8    tlitext    name    0