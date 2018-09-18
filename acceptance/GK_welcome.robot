*** Settings ***
Library         SeleniumLibrary  timeout=10  implicit_wait=0
Resource        ./functions/PageWelcome.robot
Test Teardown   Close Browser
Force Tags      Welcome

*** Test Cases ***

Welcome: (EN)
  [Documentation]    Default english welcome page
  [Tags]             EN
  !Go To GeoKrety
  Welcome WaitForPage
  Welcome ShouldShow Geokrety
  Welcome ShouldShow News
  Welcome ShouldShow RecentLogs
  Welcome ShouldShow RecentImages
  Welcome ShouldShow RecentGK

Welcome: (FR)
  [Documentation]    Welcome page in french
  [Tags]             FR
  !Go To GeoKrety
  !Click On FR Flag
  Welcome WaitForPage
  Welcome ShouldShow GeokretyFR
  Welcome ShouldShow NewsFR
  Welcome ShouldShow RecentLogsFR
  Welcome ShouldShow RecentGKFR

Welcome: input geokret code
  [Documentation]    Tracking code should redirect to ruchy
  [Tags]             RUCHY
  !Go To GeoKrety
  Capture Page Screenshot
  !Enter TrackingCode  ${TEST_GEOKRET_CODE}
  Capture Page Screenshot
  !Click On FoundGeokretGo
  Location Should Be   ${GK_URL_RUCHY}?nr=${TEST_GEOKRET_CODE}


