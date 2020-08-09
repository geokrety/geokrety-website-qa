*** Settings ***
Library         SeleniumLibrary
Resource        ../functions/PageWelcome.robot
Test Teardown   Close All Browsers
Force Tags      Welcome
Test Timeout    ${GK_TIMEOUT_MINUTES} minutes

*** Test Cases ***
# this test cases were usefull to test geokrety-website-qa/issues/27 issue with chromedriver
Welcome: Reproduce Timeout
  [Documentation]    Open browser again and again
  [Tags]             TEMP
  !Go To GeoKrety
  Page WaitForPage

Welcome: Reproduce Timeout 2
  [Documentation]    Open browser again and again
  [Tags]             TEMP
  !Go To GeoKrety
  Page WaitForPage

Welcome: Reproduce Timeout 3
  [Documentation]    Open browser again and again
  [Tags]             TEMP
  !Go To GeoKrety
  Page WaitForPage

Welcome: Reproduce Timeout 4
  [Documentation]    Open browser again and again
  [Tags]             TEMP
  !Go To GeoKrety
  Page WaitForPage

Welcome: Reproduce Timeout 5
  [Documentation]    Open browser again and again
  [Tags]             TEMP
  !Go To GeoKrety
  Page WaitForPage

Welcome: Reproduce Timeout 6
  [Documentation]    Open browser again and again
  [Tags]             TEMP
  !Go To GeoKrety
  Page WaitForPage

Welcome: Reproduce Timeout 7
  [Documentation]    Open browser again and again
  [Tags]             TEMP
  !Go To GeoKrety
  Page WaitForPage

Welcome: Reproduce Timeout 8
  [Documentation]    Open browser again and again
  [Tags]             TEMP
  !Go To GeoKrety
  Page WaitForPage

Welcome: Reproduce Timeout 9
  [Documentation]    Open browser again and again
  [Tags]             TEMP
  !Go To GeoKrety
  Page WaitForPage

Welcome: Reproduce Timeout 10
  [Documentation]    Open browser again and again
  [Tags]             TEMP
  !Go To GeoKrety
  Page WaitForPage
