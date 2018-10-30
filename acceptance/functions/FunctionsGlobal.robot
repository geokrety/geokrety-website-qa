*** Settings ***
Resource          ComponentsLocator.robot
Library           SeleniumLibrary
# doc: http://robotframework.org/Selenium2Library/Selenium2Library.html
#      http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html
# NB: check without capture on travis side
#    Capture Page Screenshot
# import Xvfb for travis only
Resource        travis_${TRAVIS_FLAG}/Xvbf.robot

*** Keywords ***
!Open GeoKrety Browser
# OLD ONE #  Open Browser               ${GK_URL}    ${BROWSER}
  ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
  Call Method    ${chrome_options}   add_argument    headless
  Call Method    ${chrome_options}   add_argument    disable-gpu
  ${options}=     Call Method     ${chrome_options}    to_capabilities
  Open Browser    ${GK_URL}    browser=chrome     desired_capabilities=${options}

!Go To GeoKrety
  Run keyword if             '${TRAVIS_FLAG}' == 'true'    Start Virtual Display    1920    1080
  !Open GeoKrety Browser
  Set Selenium Timeout       30 s
  Set Window Size            1919    1079
  Location Should Contain    ${GK_URL}

Page WaitForPage
  Wait Until Page Contains Element  ${ELT_TOP}

Page ShouldShow Footer
  Page Should Contain  Made in Poland
  Page Should Contain  by filips
  Page Should Contain  contact
  Page Should Contain  Report abuse
  Page Should Contain  Terms of use
  Page Should Contain  version:

!Click On FR Flag
  Wait Until Element Is Visible  ${BTN_FLAG_FR}
  Click Element                  ${BTN_FLAG_FR}
  Location Should Be             ${GK_URL}

