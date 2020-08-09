*** Settings ***
Library         SeleniumLibrary  timeout=10  implicit_wait=0
Resource        ../functions/PageWelcome.robot
Force Tags      Welcome
Test Timeout    2 minutes
Suite Setup         !Open GeoKrety Browser     ${browser}    # which browser? the one that's the value of the variable
Suite Teardown      Close Browser   # and closed when the suite finishes

*** Test Cases ***
Welcome: (EN)
  [Documentation]    Default english welcome page
  [Tags]             EN
  !Go To GeoKrety
  !Click On EN Lang
  Page WaitForFooterHome
  Page WithoutWarningOrFailure
  Welcome ShouldShow WelcomeToGeokrety
  Welcome ShouldShow SomeStatistics
  Welcome ShouldShow LatestMoves
  Welcome ShouldShow RecentPictures
  Welcome ShouldShow RecentlyCreatedGK
  Page ShouldShow FooterElements

Welcome: (FR)
  [Documentation]    Welcome page in french
  [Tags]             FR
  !Go To GeoKrety
  !Click On FR Lang
  Page WaitForFooterHome
  Page WithoutWarningOrFailure
  Welcome ShouldShow WelcomeToGeokretyFR
  Welcome ShouldShow SomeStatisticsFR
  Welcome ShouldShow LatestMovesFR
  Welcome ShouldShow RecentPicturesFR
  Welcome ShouldShow RecentlyCreatedGKFR
  Page ShouldShow FooterElements

Welcome: (EN) input geokret code
  [Documentation]    Tracking code should redirect to ruchy
  [Tags]             RUCHY
  !Go To GeoKrety
  !Click On EN Lang
  Page WaitForFooterHome
  Page WithoutWarningOrFailure
  !V2 Enter TrackingCode            ${TEST_GEOKRET_CODE}
  !V2 Click On FoundGeokretLogIt
  Location Should Be                ${GK_URL}en/moves?tracking_code=${TEST_GEOKRET_CODE}
