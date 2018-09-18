*** Settings ***
Resource          ComponentsLocator.robot
Library           SeleniumLibrary

*** Keywords ***

!Go To GeoKrety
    Open Browser    ${GK_URL}    ${BROWSER}
    Location Should Contain      ${GK_URL}

!WaitForTop
    Wait Until Page Contains Element  ${ELT_TOP}

!Click On FR Flag
    Wait Until Element Is Visible  ${BTN_FLAG_FR}
    Click Element                  ${BTN_FLAG_FR}
    Location Should Be             ${GK_URL}

