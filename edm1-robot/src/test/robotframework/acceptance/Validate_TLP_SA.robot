*** Settings ***
Resource                 ../keywords/db.robot
Library                  BuiltIn
Library                  String
Library                  JSpringBotGlobal
Library                  Selenium2Library

*** Test Cases ***
Validate Life Benefit
    Check Zero Value with SQL    select count (0) from tlp.customerinfo info join tlp.customersa a on a.policyno = info.policyno and a.customercode = info.customercode inner join (select * from lookup.smi where coverage = 'LIFE') b on trim (a.policyno) = trim (b.tlpplancode) and trim(a.policyno) = trim(info.policyno) where info.customerstatus in (select customerstatus from lookup.tlppolicystatus) and to_number(a.sa_life, '99999999999.99') <> ceiling (to_number(info.sa, '99999999999.99') * (b.benefit/100))

Validate Rider TPD
    Check Zero Value with SQL    select count (0) from tlp.customerinfo info join tlp.customersa a on a.policyno = info.policyno and a.customercode = info.customercode inner join (select * from lookup.smi where coverage = 'TPD') b on trim (a.policyno) = trim (b.tlpplancode) and trim(info.policyno) = trim(b.tlpplancode) where info.customerstatus in (select customerstatus from lookup.tlppolicystatus) and to_number(a.sa_life, '99999999999.99') <> ceiling (to_number(info.sa, '99999999999.99') * (b.benefit/100))
    
Validate Rider TD-LE36
    Check Zero Value with SQL    select count (0) from tlp.customerinfo info join tlp.customersa a on a.policyno = info.policyno and a.customercode = info.customercode inner join (select * from lookup.smi where coverage = 'TD' and tlipolicy = 'LE36') b on trim (a.policyno) = trim (b.tlpplancode) and trim(info.policyno) = trim(b.tlpplancode) where info.customerstatus in (select customerstatus from lookup.tlppolicystatus) and to_number(a.sa_td, '99999999999.99') <> ceiling (to_number(info.sa, '99999999999.99') * (b.benefit/100))
    
Validate Rider TD not LE36
    Check Zero Value with SQL    select count (0) from tlp.customerinfo info join tlp.customersa a on a.policyno = info.policyno and a.customercode = info.customercode inner join (select * from lookup.smi where coverage = 'TD' and tlipolicy <> 'LE36') b on trim (a.policyno) = trim (b.tlpplancode) and trim (info.policyno) = trim (b.tlpplancode) where info.customerstatus in (select customerstatus from lookup.tlppolicystatus) and to_number(a.sa_td, '99999999999.99') <> ceiling ((to_number(info.sa, '99999999999.99') * (b.benefit/100)) / (to_number(info.durationinsurance, '99') * 12 ))

Validate Rider ADD-ML46
    Check Zero Value with SQL    select count (0) from tlp.customerinfo info join tlp.customersa a on a.policyno = info.policyno and a.customercode = info.customercode inner join (select * from lookup.smi where coverage = 'ADD' and tlipolicy = 'ML46') b on trim (a.policyno) = trim (b.tlpplancode) and trim(info.policyno) = trim(b.tlpplancode) where info.customerstatus in (select customerstatus from lookup.tlppolicystatus) and to_number(a.sa_add, '99999999999.99') <> b.benefit

Validate Rider ADD-LE31
    Check Zero Value with SQL    select count (0) from tlp.customerinfo info join tlp.customersa a on a.policyno = info.policyno and a.customercode = info.customercode inner join (select * from lookup.smi where coverage = 'ADD' and tlipolicy = 'LE31') b on trim (a.policyno) = trim (b.tlpplancode) and trim(info.policyno) = trim(b.tlpplancode) where info.customerstatus in (select customerstatus from lookup.tlppolicystatus) and to_number(a.sa_add, '99999999999.99') <> b.benefit

Validate Rider ADD not ML46, LE31
    Check Zero Value with SQL    select count (0) from tlp.customerinfo info join tlp.customersa a on a.policyno = info.policyno and a.customercode = info.customercode inner join (select * from lookup.smi where coverage = 'ADD' and tlipolicy not in ('ML46', 'LE31') ) b on trim (a.policyno) = trim (b.tlpplancode) and trim(info.policyno) = trim(b.tlpplancode) where info.customerstatus in (select customerstatus from lookup.tlppolicystatus) and to_number(a.sa_add, '99999999999.99') <> ceiling (to_number(info.sa, '99999999999.99') * (b.benefit/100))

Validate Rider AME
    Check Zero Value with SQL    select count (0) from tlp.customerinfo info join tlp.customersa a on a.policyno = info.policyno and a.customercode = info.customercode inner join (select * from lookup.smi where coverage = 'AME') b on trim (a.policyno) = trim (b.tlpplancode) and trim(info.policyno) = trim(b.tlpplancode) where info.customerstatus in (select customerstatus from lookup.tlppolicystatus) and to_number(a.sa_me, '99999999999.99') <> b.benefit