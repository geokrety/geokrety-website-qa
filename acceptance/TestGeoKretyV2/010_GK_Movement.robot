*** Settings ***
Library         SeleniumLibrary  timeout=10  implicit_wait=0
Force Tags      Movement
Test Timeout    2 minutes
Suite Setup         !Open GeoKrety Browser     ${browser}    # which browser? the one that's the value of the variable
Suite Teardown      Close Browser   # and closed when the suite finishes

*** Test Cases ***
