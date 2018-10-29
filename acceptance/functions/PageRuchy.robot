*** Settings ***
Resource        FunctionsGlobal.robot

*** Keywords ***
!Go To Ruchy
    !Go To GeoKrety
    Wait Until Element Is Visible  ${LINK_LOG_A_GK}
    Wait Until Page Contains       Log a GeoKret
    Click Link                     ${LINK_LOG_A_GK}
    Location Should Be             ${GK_URL}ruchy.php

Ruchy ShouldShow LogType
  Page Should Contain  Choose log type
  Page Should Contain  Log type
  Page Should Contain  I've dropped GeoKret
  Page Should Contain  I've grabbed GeoKret
  Page Should Contain  I've met GeoKret
  Page Should Contain  I've dipped a GeoKret
  Page Should Contain  Comment

Ruchy ShouldShow IdentifyGeokret
  Page Should Contain  Identify GeoKret
  Page Should Contain  Tracking Code
  Page Should Contain Textfield  ${TXT_RUCHY_TRACKING_CODE}
  Page Should Contain  6 characters from GeoKret label, eg. XF3ACS

Ruchy ShouldShow NewLocation
  Page Should Contain  New location
  Page Should Contain  Waypoint
  Page Should Contain Textfield  ${TXT_RUCHY_WAYPOINT}
  Page Should Contain  or name of cache
  Page Should Contain Textfield  ${TXT_RUCHY_CACHENAME}
  Page Should Contain Button     ${BTN_RUCHY_CHECK}
  Page Should Contain  Coordinates
  Page Should Contain Textfield  ${TXT_RUCHY_LATLON}
  Page Should Contain  Acceptable geographic coordinate formats
# ONLY IF LOGGED # Page Should Contain Button     ${BTN_RUCHY_LOGATHOME}
  Page Should Contain Button     ${BTN_RUCHY_GETGEOLOC}

Ruchy ShouldShow AdditionalData
  Page Should Contain  Additional data
# ONLY IF LOGGED # Page Should Contain  Username
  Page Should Contain  Name
  Page Should Contain Textfield  ${TXT_RUCHY_USERNAME}
  Page Should Contain  Date
  Page Should Contain Textfield  ${TXT_RUCHY_DATEPICKER}
  Page Should Contain Button     ${BTN_RUCHY_DATE_TODAY}
  Page Should Contain Button     ${BTN_RUCHY_DATE_YESTERDAY}
  Page Should Contain Button     ${BTN_RUCHY_DATE_TWODAYAGO}
  Page Should Contain  Time
  Page Should Contain Textfield  ${TXT_RUCHY_TIME_HOUR}
  Page Should Contain Textfield  ${TXT_RUCHY_TIME_MINUTE}
  Page Should Contain Button     ${BTN_RUCHY_TIME_NOW}
  Page Should Contain  Comment
  Page Should Contain Element    ${ELT_RUCHY_COMMENT}

Ruchy ShouldShow GoSubmit
  Page Should Contain Button     ${BTN_RUCHY_GO}

Ruchy 3Waypoint Enter
  [Arguments]    ${wptcode}
  Wait Until Element Is Visible  ${TXT_RUCHY_WAYPOINT}
  Input Text                     ${TXT_RUCHY_WAYPOINT}  ${wptcode}
  Sleep                          1s

Ruchy 3Name Enter
  [Arguments]    ${wptname}
  Wait Until Element Is Visible  ${TXT_RUCHY_CACHENAME}
  Input Text                     ${TXT_RUCHY_CACHENAME}  ${wptname}
  Sleep                          1s

Ruchy 3Waypoint ShouldBe
  [Arguments]    ${txt}
  Wait Until Element Is Visible  ${TXT_RUCHY_WAYPOINT}
  Textfield Should Contain       ${TXT_RUCHY_WAYPOINT}  ${txt}  Ruchy waypoint code expect to be >${txt}<

Ruchy 3Name ShouldBe
  [Arguments]    ${txt}
  Wait Until Element Is Visible  ${TXT_RUCHY_CACHENAME}
  Textfield Should Contain       ${TXT_RUCHY_CACHENAME}  ${txt}  Ruchy waypoint name expect to be >${txt}<

Ruchy 3Context WaitResult
  Wait Until Page Contains Element  ${ELT_RUCHY_CONTEXT}
  Wait Until Element Does Not Contain  ${ELT_RUCHY_CONTEXT}  Retrieving...

Ruchy 3Context OKChecked
  Page Should Contain Element  ${ELT_RUCHY_CONTEXT_IMGOK}

Ruchy 3Context KOChecked
  Page Should Contain Element  ${ELT_RUCHY_CONTEXT_IMGKO}

Ruchy 3Context ShouldInclude
  [Arguments]    ${expectedText}
  Element Should Contain  ${ELT_RUCHY_CONTEXT}  ${expectedText}  Ruchy waypoint context expect to include >${expectedText}<

Ruchy 3Waypoint Disabled
  Element Should Be Disabled  ${TXT_RUCHY_WAYPOINT}

Ruchy 3Name Disabled
  Element Should Be Disabled  ${TXT_RUCHY_CACHENAME}

Ruchy 3Coordinates ShouldBe
  [Arguments]    ${txt}
  Wait Until Element Is Visible  ${TXT_RUCHY_LATLON}
  Textfield Should Contain       ${TXT_RUCHY_LATLON}  ${txt}  Ruchy coordinates expect to be >${txt}<

Ruchy ClickOn Check
  Wait Until Element Is Visible  ${BTN_RUCHY_CHECK}
  Click Button                   ${BTN_RUCHY_CHECK}
  Sleep    2s

Ruchy 3Context ClickOnFirstResult
  Wait Until Element Is Visible  ${ELT_RUCHY_CONTEXT_FIRSTRESULT}
  Click Element                  ${ELT_RUCHY_CONTEXT_FIRSTRESULT}
  Sleep    2s