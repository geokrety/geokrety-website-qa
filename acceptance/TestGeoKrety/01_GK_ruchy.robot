*** Settings ***
Library         SeleniumLibrary  timeout=10  implicit_wait=0
Resource        ../functions/PageRuchy.robot
Test Teardown   Close Browser
Force Tags      Ruchy
Test Timeout    2 minutes

*** Test Cases ***

Ruchy: (EN)
  [Documentation]    default page
  [Tags]             EN
  !Go To Ruchy
  Page WaitForPage
  Ruchy ShouldShow LogType
  Ruchy ShouldShow IdentifyGeokret
  Ruchy ShouldShow NewLocation
  Ruchy ShouldShow AdditionalData
  Ruchy ShouldShow GoSubmit
  Page ShouldShow Footer

Ruchy: search waypoint by GC code
  [Tags]             EN  search  waypoint
  !Go To Ruchy
  Page WaitForPage
  Ruchy 3Waypoint Enter     GC1AQ2N
  Ruchy 3Waypoint ShouldBe  GC1AQ2N
  Ruchy 3Context WaitResult
  Ruchy 3Context OKChecked
  Ruchy 3Context ShouldInclude  waypoint GC1AQ2N
  Ruchy 3Name Disabled
  Ruchy 3Coordinates ShouldBe   52.1534 21.0539


Ruchy: search waypoint by name with more than 1 result
  [Tags]             EN  search  waypoint
  !Go To Ruchy
  Page WaitForPage
  Ruchy 3Name Enter             voyage
  Ruchy ClickOn Check

  Ruchy 3Name ShouldBe          voyage
  Ruchy 3Context WaitResult
  Ruchy 3Context ShouldInclude  caches match (the first 4)
  Ruchy 3Context ShouldInclude  Bon Voyage Swampy!!
  Ruchy 3Context ShouldInclude  Voyages extraordinaires
  Ruchy 3Context ClickOnFirstResult

  Ruchy 3Waypoint ShouldBe  GA1781
  Ruchy 3Name ShouldBe      voyage
  Ruchy 3Name Disabled
  Ruchy 3Context OKChecked
  Ruchy 3Context ShouldInclude  Bon Voyage Swampy!!

Ruchy: search waypoint by name with exactly 1 result
  [Tags]             EN  search  waypoint
  !Go To Ruchy
  Page WaitForPage
  Ruchy 3Name Enter         Bon Voyage Swampy
  Ruchy ClickOn Check

  Ruchy 3Name ShouldBe      Bon Voyage Swampy
  Ruchy 3Waypoint ShouldBe  GA1781
  Ruchy 3Waypoint Disabled
  Ruchy 3Context WaitResult
  Ruchy 3Context OKChecked
  Ruchy 3Context ShouldInclude  Bon Voyage Swampy!!

Ruchy: search waypoint by name with no result
  [Tags]             EN  search  waypoint
  !Go To Ruchy
  Page WaitForPage
  Ruchy 3Name Enter         glogloglo
  Ruchy ClickOn Check

  Ruchy 3Name ShouldBe      glogloglo
  Ruchy 3Context WaitResult
  Ruchy 3Context KOChecked
  Ruchy 3Context ShouldInclude  No cache found

Ruchy: search waypoint by code with invalid prefix
  [Tags]             EN  search  waypoint
  !Go To Ruchy
  Page WaitForPage
  Ruchy 3Waypoint Enter         XX_C100N_AHV
  Ruchy 3Waypoint ShouldBe      XX_C100N_AHV
  Ruchy 3Context WaitResult
  Ruchy 3Context KOChecked
  Ruchy 3Context ShouldInclude  Missing or invalid coordinates
  Ruchy 3Name Disabled

Ruchy: search waypoint by code with unknown GC
  [Tags]             EN  search  waypoint
  !Go To Ruchy
  Page WaitForPage
  Ruchy 3Waypoint Enter         GC120999
  Ruchy 3Waypoint ShouldBe      GC120999
  Ruchy 3Context WaitResult
  Ruchy 3Context KOChecked
  Ruchy 3Context ShouldInclude  Missing or invalid coordinates
  Ruchy 3Name Disabled

