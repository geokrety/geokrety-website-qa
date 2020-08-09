*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           Collections
Library           String
Library           BuiltIn
Test Teardown   Close All Browsers
Resource        ../functions/PageWelcome.robot
Force Tags      Welcome
Test Timeout    2 minutes

*** Variables ***
${SELENIUM_TIME_OUT} =   120
${SELENIUM_SPEED} =      0.45
${BROWSER} =             IE
${REMOTE_URL} =  ${BS_HUB}
${DC}

*** Test Cases ***

TC001_BrowserStack_DC_Windows10_Chrome
  Log    Open Browserstack
  Set Selenium Timeout    ${SELENIUM_TIME_OUT}
  Set Selenium Speed    ${SELENIUM_SPEED}
  !Go To GeoKrety
  !Click On EN Lang

#TC001_BrowserStack_DC_GalaxyTab_
#  Log    Open Browserstack
#  Open Browser    ${GK_URL}    ${BROWSER}  remote_url=${REMOTE_URL}  desired_capabilities=${DC_GalaxyTab}
#  Maximize Browser Window
#  !Click On FR Lang
