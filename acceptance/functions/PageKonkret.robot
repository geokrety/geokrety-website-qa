*** Settings ***
Resource        FunctionsGlobal.robot

*** Keywords ***
!Go To Konkret
    !Go To GeoKrety
    !Click On EN Flag
    Go To             ${GK_URL}/konkret.php?id=60442

Konkret ShouldShow GeokretInfo
  Page Should Contain  Reference Number:
  Page Should Contain  Total distance:
  Page Should Contain  Places visited:
  Page Should Contain  Forum links:
  Page Should Contain  Country track:
  Page Should Contain  Rating:
  Page Should Contain  Share on:
