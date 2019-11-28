*** Settings ***
Library         SeleniumLibrary  timeout=10  implicit_wait=0
Resource        ../functions/V2PageMove.robot
Force Tags      Move
Test Timeout    2 minutes

*** Test Cases ***
Move: start
  !Open browser onto Move

Move: (EN)
  [Documentation]    default page
  [Tags]             EN
  !Go To Move
  Page WaitForFooterHome
  Page WithoutWarningOrFailure
  Move ShouldShow IdentifyGeokret
  Page ShouldShow V2Footer

Move: end
  Close All Browsers

