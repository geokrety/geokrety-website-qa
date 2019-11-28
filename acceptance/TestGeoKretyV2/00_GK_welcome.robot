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
  Page WaitForFooterHome
  Page WithoutWarningOrFailure
  Welcome ShouldShow WelcomeToGeokrety
  Welcome ShouldShow News
  Welcome ShouldShow SomeStatistics
  Welcome ShouldShow LatestMoves
  Welcome ShouldShow RecentPictures
  Welcome ShouldShow RecentlyCreatedGK
  Page ShouldShow V2Footer

Welcome: (FR)
  [Documentation]    Welcome page in french
  [Tags]             FR
  !Go To GeoKrety
  !Click On FR Lang
  Page WaitForFooterHome
  Page WithoutWarningOrFailure
  Welcome ShouldShow WelcomeToGeokretyFR
  Welcome ShouldShow NewsFR
  Welcome ShouldShow SomeStatisticsFR
  Welcome ShouldShow LatestMovesFR
  Welcome ShouldShow RecentPicturesFR
  Welcome ShouldShow RecentlyCreatedGKFR
  Page ShouldShow V2Footer

Welcome: (EN) input geokret code
  [Documentation]    Tracking code should redirect to ruchy
  [Tags]             RUCHY
  !Go To GeoKrety
  !Click On EN Lang
  Page WaitForFooterHome
  Page WithoutWarningOrFailure
  !V2 Enter TrackingCode            ${TEST_GEOKRET_CODE}
  !V2 Click On FoundGeokretLogIt
  Location Should Be                ${GK_URL}en/move?tracking_code=${TEST_GEOKRET_CODE}