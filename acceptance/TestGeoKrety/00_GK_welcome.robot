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
  !Click On EN Flag
  Page WaitForPage
  Page WithoutWarningOrFailure
  Welcome ShouldShow Geokrety
  Welcome ShouldShow News
  Welcome ShouldShow RecentLogs
  Welcome ShouldShow RecentImages
  Welcome ShouldShow RecentGK
  Page ShouldShow Footer

Welcome: (FR)
  [Documentation]    Welcome page in french
  [Tags]             FR
  !Go To GeoKrety
  !Click On FR Flag
  Page WaitForPage
  Page WithoutWarningOrFailure
  Welcome ShouldShow GeokretyFR
  Welcome ShouldShow NewsFR
  Welcome ShouldShow RecentLogsFR
  Welcome ShouldShow RecentGKFR

Welcome: input geokret code
  [Documentation]    Tracking code should redirect to ruchy
  [Tags]             RUCHY
  !Go To GeoKrety
  !Click On EN Flag
  Page WaitForPage
  Page WithoutWarningOrFailure
  !Enter TrackingCode  ${TEST_GEOKRET_CODE}
  !Click On FoundGeokretGo
  Location Should Be   ${GK_URL_RUCHY}?nr=${TEST_GEOKRET_CODE}


