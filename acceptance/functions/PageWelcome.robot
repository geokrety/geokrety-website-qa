*** Settings ***
Resource        FunctionsGlobal.robot

*** Keywords ***
Welcome ShouldShow Geokrety
  Page Should Contain  Welcome to GeoKrety.org!
Welcome ShouldShow News
  Page should contain  News
  Page should contain  Comments
Welcome ShouldShow RecentLogs
  Page should contain  Recent logs
  Page should contain  Recent logs on the map
Welcome ShouldShow RecentImages
  Page should contain  Recently uploaded images
  Page should contain  Photo gallery >>>
Welcome ShouldShow RecentGK
  Page should contain  Recently registered GeoKrets

Welcome ShouldShow GeokretyFR
  Page should contain  Bienvenue sur GeoKrety !
Welcome ShouldShow NewsFR
  Page should contain  Actualités
  Page should contain  Commentaires
Welcome ShouldShow RecentLogsFR
  Page should contain  Signalements récents
  Page should contain  Derniers signalements sur la carte
Welcome ShouldShow RecentImagesFR
  Page should contain  Photos récentes
  Page should contain  Galerie de photos >>>
Welcome ShouldShow RecentGKFR
  Page should contain  GeoKrety signalés récemment

!Enter TrackingCode
    [Arguments]    ${code}
    Wait Until Element Is Visible  ${TXT_WELCOME_CODE}
    Input Text                     ${TXT_WELCOME_CODE}  ${code}
    Simulate Event                 ${TXT_WELCOME_CODE}  blur
    Sleep    1s

!Click On FoundGeokretGo
    Wait Until Element Is Visible  ${BTN_WELCOME_GO}
    Click Button                   ${BTN_WELCOME_GO}
    Sleep    2s

## V2
Welcome ShouldShow WelcomeToGeokrety
  Page Should Contain  Welcome to GeoKrety.org!
Welcome ShouldShow SomeStatistics
  Page should contain  Some statistics
Welcome ShouldShow LatestMoves
  Page should contain  Latest moves
Welcome ShouldShow RecentPictures
  Page should contain  Recent pictures
Welcome ShouldShow RecentlyCreatedGK
  Page should contain  Recently created GeoKrety

Welcome ShouldShow WelcomeToGeokretyFR
  Page Should Contain  Bienvenue sur GeoKrety.org !
Welcome ShouldShow SomeStatisticsFR
  Page should contain  Quelques statistiques
Welcome ShouldShow LatestMovesFR
  Page should contain  Derniers mouvements
Welcome ShouldShow RecentPicturesFR
  Page should contain  Photos récentes
Welcome ShouldShow RecentlyCreatedGKFR
  Page should contain  GeoKrety créés récemment

!V2 Enter TrackingCode
    [Arguments]    ${code}
    Wait Until Element Is Visible  ${V2_TXT_WELCOME_CODE}
    Input Text                     ${V2_TXT_WELCOME_CODE}  ${code}
    Simulate Event                 ${V2_TXT_WELCOME_CODE}  blur
    Sleep    1s

!V2 Click On FoundGeokretLogIt
    Wait Until Element Is Visible  ${V2_BTN_WELCOME_GO}
    Click Button                   ${V2_BTN_WELCOME_GO}
    Sleep    2s