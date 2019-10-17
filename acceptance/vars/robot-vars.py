import os

GK_TIMEOUT_MINUTES = 2
BROWSER = "Firefox"

GK_URL      = os.getenv('GEOKRETY_URL')
TRAVIS_FLAG = os.getenv('TRAVIS_FLAG')
BS_USERNAME = os.getenv('BS_USERNAME')
BS_TOKEN    = os.getenv('BS_TOKEN')

if TRAVIS_FLAG is None:
    TRAVIS_FLAG = "false"

if BS_USERNAME is None:
    BS_HUB      = None
else:
    BS_HUB      = "http://" + BS_USERNAME + ":" + BS_TOKEN + "@hub.browserstack.com:80/wd/hub"

GK_URL_RUCHY = GK_URL + "ruchy.php"

TEST_GEOKRET_REF = "GK10BCD"
TEST_GEOKRET_CODE = "673CI2"

# dont print token :)
print(" * starting robot test - bs_username {} target {}".format(BS_USERNAME, GK_URL))