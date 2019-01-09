import os

GK_TIMEOUT_MINUTES = 2
BROWSER = "Firefox"

GK_URL      = os.environ['GEOKRETY_URL']
TRAVIS_FLAG = os.environ['TRAVIS_FLAG']

GK_URL_RUCHY = GK_URL + "ruchy.php"

TEST_GEOKRET_REF = "GK10BCD"
TEST_GEOKRET_CODE = "673CI2"
