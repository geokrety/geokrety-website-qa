*** Settings ***
Library         SeleniumLibrary  timeout=10  implicit_wait=0
Resource        ../functions/PageWelcome.robot
Test Teardown   Close All Browsers
Force Tags      Welcome
Test Timeout    2 minutes

*** Test Cases ***
Welcome: (EN)
  [Documentation]    Default english welcome page
  [Tags]             EN
  !Go To GeoKrety
  !Click On EN Lang

Welcome: (FR)
  [Documentation]    Welcome page in french
  [Tags]             FR
  !Go To GeoKrety
  !Click On FR Lang