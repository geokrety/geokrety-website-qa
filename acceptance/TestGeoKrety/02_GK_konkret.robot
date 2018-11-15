*** Settings ***
Library         SeleniumLibrary  timeout=10  implicit_wait=0
Resource        ../functions/PageKonkret.robot
Test Teardown   Close All Browsers
Force Tags      Konkret
Test Timeout    2 minutes

*** Test Cases ***

Konkret: (EN)
  [Documentation]    default page
  [Tags]             EN
  !Go To Konkret
  Page WaitForPage
  Page WithoutWarningOrFailure
  Konkret ShouldShow GeokretInfo
  Page ShouldShow Footer
