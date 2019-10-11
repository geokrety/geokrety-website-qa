*** Settings ***
Resource   ComponentsLocator.robot
Library    SeleniumLibrary
# doc: http://robotframework.org/Selenium2Library/Selenium2Library.html
#      http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html
# NB: check without capture on travis side
#    Capture Page Screenshot
# import Xvfb for travis only
Resource        travis_${TRAVIS_FLAG}/Xvbf.robot

*** Variables ***
# ${FF_PROFILE}      ff_profile

*** Keywords ***
!Open GeoKrety Browser Firefox
  Log    Open Browser Firefox
  ${firefox_options} =     Evaluate    sys.modules['selenium.webdriver'].firefox.webdriver.Options()    sys, selenium.webdriver
  Call Method    ${firefox_options}   add_argument    headless
#  Call Method    ${firefox_options}   add_argument    marionette
  ${options}=     Call Method     ${firefox_options}    to_capabilities
  Open Browser    url=${GK_URL}   browser=ff     desired_capabilities=${options}
# ff_profile_dir=${FF_PROFILE}
  Go To           ${GK_URL}
  Maximize Browser Window

!Open GeoKrety Browser Chrome
  Log    Open Browser Chrome
  ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
  Call Method    ${chrome_options}   add_argument    headless
  Call Method    ${chrome_options}   add_argument    disable-gpu
  Call Method    ${chrome_options}   add_argument    dns-prefetch-disable
  Call Method    ${chrome_options}   add_argument    disable-web-security
  Call Method    ${chrome_options}   add_argument    allow-running-insecure-content
  Call Method    ${chrome_options}   add_argument    disable-browser-side-navigation
  ${options}=     Call Method     ${chrome_options}    to_capabilities
  Open Browser    ${GK_URL}    browser=chrome     desired_capabilities=${options}

!Open GeoKrety Browser
  [Arguments]    ${browser}
  Run Keyword If    "${browser}"=="Firefox"    !Open GeoKrety Browser Firefox
  Run Keyword If    "${browser}"=="Chrome"     !Open GeoKrety Browser Chrome

!Go To GeoKrety
  Run keyword if             '${TRAVIS_FLAG}' == 'true'    Start Virtual Display    1920    1080
  !Open GeoKrety Browser     ${BROWSER}
  Set Selenium Timeout       30 s
  Set Window Size            1919    1079
  Location Should Contain    ${GK_URL}

Page WaitForPage
  Wait Until Page Contains Element  ${ELT_TOP}

Page WithoutWarningOrFailure
  Page Should Not Contain  Warning:
  Page Should Not Contain  Failed


Page ShouldShow Footer
  Page Should Contain  Made in Poland
  Page Should Contain  by filips
  Page Should Contain  contact
  Page Should Contain  Report abuse
  Page Should Contain  Terms of use
  Page Should Contain  version:

!Click On EN Flag
  Wait Until Element Is Visible  ${BTN_FLAG_EN}
  Click Element                  ${BTN_FLAG_EN}
  Location Should Be             ${GK_URL}

!Click On FR Flag
  Wait Until Element Is Visible  ${BTN_FLAG_FR}
  Click Element                  ${BTN_FLAG_FR}
  Location Should Be             ${GK_URL}

## V2
!Click On EN Lang
  Wait Until Element Is Visible  ${DROPDOWN_LANG}
  Click Element                  ${DROPDOWN_LANG}
  Wait Until Element Is Visible  ${DROPDOWN_LANG_EN}
  Click Element                  ${DROPDOWN_LANG_EN}
  Location Should Be             ${GK_URL}en?

!Click On FR Lang
  Wait Until Element Is Visible  ${DROPDOWN_LANG}
  Click Element                  ${DROPDOWN_LANG}
  Wait Until Element Is Visible  ${DROPDOWN_LANG_FR}
  Click Element                  ${DROPDOWN_LANG_FR}
  Location Should Be             ${GK_URL}fr?

