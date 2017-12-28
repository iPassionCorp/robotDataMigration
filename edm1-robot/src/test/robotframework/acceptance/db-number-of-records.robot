*** Settings ***
Library           JSpringBotGlobal
Library           String
Library           BuiltIn
Resource           ../keywords/db.robot

*** Test Cases ***
Check Number of Records for TLP.CustomerInfo
    Check Number of Records    tlp    customerinfo    208766
    
Check Number of Records for TLP.CustomerSA
    Check Number of Records    tlp    customersa    209051
    
Check Number of Records for TLP.Payment
    Check Number of Records    tlp    payment    209508
    
Check Number of Records for TLP.SplitPremiumAmount
    Check Number of Records    tlp    splitpremiumamount    208205
    
Check Number of Records for TLP.CustomerBalloon
    Check Number of Records    tlp    customerballoon    13289
    
Check Number of Records for TLP.ClaimRegisterHeader
    Check Number of Records    tlp    claimregisterheader    745

Check Number of Records for TLP.ClaimRegisterDetail
    Check Number of Records    tlp    claimregisterdetail    955
        
Check Number of Records for TLP.ClaimPayment
    Check Number of Records    tlp    claimpayment    760

Check Number of Records for TLP.ClaimPaymentDetail
    Check Number of Records    tlp    claimpaymentdetail    1001

Check Number of Records for TLP.MasProduct
    Check Number of Records    tlp    masproduct    49