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
  Page should contain  Bienvenue sur GeoKrety!
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


!Click On FoundGeokretGo
    Wait Until Element Is Visible  ${BTN_WELCOME_GO}
    Click Button                   ${BTN_WELCOME_GO}
    Sleep    2s

!Enter TrackingCode
    [Arguments]    ${code}
    Wait Until Element Is Visible  ${TXT_WELCOME_CODE}
    Input Text                     ${TXT_WELCOME_CODE}  ${code}
    Sleep    1s