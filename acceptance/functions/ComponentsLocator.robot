*** Variables ***
# LBL = Labels ; BTN = Button ; TXT = Text Fields ; LST = List ; ELT = Element ;

################
#   COMMON
################
${ELT_TOP}        id=top
${LINK_LOG_A_GK}  xpath=//*[@id='lewo']/ul[1]/li[2]/a
${BTN_FLAG_FR}    xpath=//span[@class='flag-icon flag-icon-fr']

################
# WELCOME PAGE
################
${TXT_WELCOME_CODE}  id=nr
${BTN_WELCOME_GO}    xpath=//form[@name='formularz']/input[@type='submit']

################
# RUCHY PAGE
################
${TXT_RUCHY_TRACKING_CODE}  id=nr

${TXT_RUCHY_WAYPOINT}       id=wpt
${TXT_RUCHY_CACHENAME}      id=NazwaSkrzynki
${BTN_RUCHY_CHECK}          id=btn_sprawdzskrzynke
${TXT_RUCHY_LATLON}         id=latlon
${BTN_RUCHY_LOGATHOME}      id=logAtHome
${BTN_RUCHY_GETGEOLOC}      id=getGeoLocation
${ELT_RUCHY_CONTEXT}        id=wynikWpt
${ELT_RUCHY_CONTEXT_IMG_OK}  xpath=//*[@id="wynikWpt"]/img[@src="https://cdn.geokrety.org/images/icons/ok.png"]
${ELT_RUCHY_CONTEXT_IMG_KO}  xpath=//*[@id="wynikWpt"]/img[@src="https://cdn.geokrety.org/images/icons/error.png"]
${ELT_RUCHY_CONTEXT_FIRSTRESULT}  xpath=//*[@id="wynikWpt"]/a[1]

${TXT_RUCHY_USERNAME}        id=username
${TXT_RUCHY_DATEPICKER}      id=data
${BTN_RUCHY_DATE_TODAY}      xpath=//*[@id="prawo"]/form/div[5]/div[2]/div/button[1]
${BTN_RUCHY_DATE_YESTERDAY}  xpath=//*[@id="prawo"]/form/div[5]/div[2]/div/button[2]
${BTN_RUCHY_DATE_TWODAYAGO}  xpath=//*[@id="prawo"]/form/div[5]/div[2]/div/button[3]
${TXT_RUCHY_TIME_HOUR}       id=godzina
${TXT_RUCHY_TIME_MINUTE}     id=minuta
${BTN_RUCHY_TIME_NOW}        xpath=//*[@id="prawo"]/form/div[6]/div[3]/div/button
# textarea is not textfield
${ELT_RUCHY_COMMENT}         id=poledoliczenia

${BTN_RUCHY_GO}              xpath=//*[@id="prawo"]/form/div[8]/div/input[1]