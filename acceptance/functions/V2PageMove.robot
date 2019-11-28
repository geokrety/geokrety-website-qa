*** Settings ***
Resource        FunctionsGlobal.robot

*** Keywords ***
!Open browser onto Move
    !Go To GeoKrety
    !Click On EN Lang
    Page WaitForFooterHome
    Page WithoutWarningOrFailure
    !Click On NavBar Move
    Location Should Be             ${GK_URL}en/move

!Go To Move
    Go To                          ${GK_URL}en/move

Move ShouldShow IdentifyGeokret
  Page Should Contain  Identify GeoKret
  Page Should Contain  Tracking Code
  Page Should Contain  6 characters from GeoKret label
  Page Should Contain  Next

