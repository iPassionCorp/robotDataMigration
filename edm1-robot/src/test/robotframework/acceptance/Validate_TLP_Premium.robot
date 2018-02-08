*** Settings ***
Resource                 ../keywords/db.robot
Library                  BuiltIn
Library                  String
Library                  JSpringBotGlobal
Library                  Selenium2Library

*** Test Cases ***
Validate Total Premium
    Check Zero Value with SQL    SELECT count(0) FROM tlp.splitpremiumamount prem join tlp.customerinfo info on prem.grouppolicyno = info.policyno and prem.customercode = info.customercode and prem.productid = info.productcode where prem.totpremium = '0.00' and customerstatus in (select customerstatus from lookup.tlppolicystatus) 

Validate Life Premium
    Check Zero Value with SQL    SELECT count(0) FROM tlp.splitpremiumamount prem join tlp.customerinfo info on prem.grouppolicyno = info.policyno and prem.customercode = info.customercode and prem.productid = info.productcode where prem.totpremium = '0.00' and customerstatus in (select customerstatus from lookup.tlppolicystatus)

Validate Rider TPD Premium
    Check Zero Value with SQL    SELECT count(0) FROM tlp.splitpremiumamount prem join tlp.customerinfo info on prem.grouppolicyno = info.policyno and prem.customercode = info.customercode and prem.productid = info.productcode join (select * from lookup.smi where coverage = 'TPD') b on trim (prem.grouppolicyno) = trim (b.tlpplancode) and trim (info.policyno) = trim (b.tlpplancode) where prem.tpdpremium = '0.00' and customerstatus in (select customerstatus from lookup.tlppolicystatus)

Validate Rider TD Premium
    Check Zero Value with SQL    SELECT count(0) FROM tlp.splitpremiumamount prem join tlp.customerinfo info on prem.grouppolicyno = info.policyno and prem.customercode = info.customercode and prem.productid = info.productcode join (select * from lookup.smi where coverage = 'TD') b on trim (prem.grouppolicyno) = trim (b.tlpplancode) and trim (info.policyno) = trim (b.tlpplancode) where prem.tdpremium = '0.00' and customerstatus in (select customerstatus from lookup.tlppolicystatus) 

Validate Rider ADD Premium
    Check Zero Value with SQL    SELECT count(0) FROM tlp.splitpremiumamount prem join tlp.customerinfo info on prem.grouppolicyno = info.policyno and prem.customercode = info.customercode and prem.productid = info.productcode join (select * from lookup.smi where coverage = 'ADD') b on trim (prem.grouppolicyno) = trim (b.tlpplancode) and trim (info.policyno) = trim (b.tlpplancode) where prem.addpremium = '0.00' and customerstatus in (select customerstatus from lookup.tlppolicystatus)

Validate Rider AME Premium
    Check Zero Value with SQL    SELECT count(0) FROM tlp.splitpremiumamount prem join tlp.customerinfo info on prem.grouppolicyno = info.policyno and prem.customercode = info.customercode and prem.productid = info.productcode join (select * from lookup.smi where coverage = 'AME') b on trim (prem.grouppolicyno) = trim (b.tlpplancode) and trim (info.policyno) = trim (b.tlpplancode) where prem.mepremium = '0.00' and customerstatus in (select customerstatus from lookup.tlppolicystatus)