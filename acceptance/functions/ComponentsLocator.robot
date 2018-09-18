*** Variables ***
# LBL = Labels ; BTN = Button ; TXT = Text Fields ; LST = List ; ELT = Element ;

################
#   COMMON
################
${ELT_TOP}        id=top
${BTN_FLAG_FR}    xpath=//span[@class='flag-icon flag-icon-fr']

################
# WELCOME PAGE
################
${TXT_WELCOME_CODE}  id=nr
${BTN_WELCOME_GO}    xpath=//form[@name='formularz']/input[@type='submit']