
# GeoKrety.org QA

This project includes automated tests -Quality Assurance (QA)- for  GeoKrety.org website ([source code](https://github.com/geokrety/geokrety-website), [service](https://geokrety.org)):
- Tests rely on Python, RobotFramework, Selenium Frameworks
- Instance tested is https://rec.geokrety.org (pre-production like environment)

# Badges

[![Travis Status](https://travis-ci.org/geokrety/geokrety-website-qa.svg?branch=master)](https://travis-ci.org/geokrety/geokrety-website-qa)

# Credit

- This repository is a fork of [kitconcept/robotframework-starter](https://github.com/kitconcept/robotframework-starter) : a ready to use robotframework+travis github repo

# HowTo

## Windows
- clone me
- on windows with python+pip, just execute `tests.win.sh`

## Linux
- clone me
- install python+pip
- run the following commands:

    pip install --upgrade pip
    pip install -r requirements.txt
    pybot.bat -V acceptance/vars/rec-dev.py acceptance/GK_welcome.robot

# Contribute
- Pull request need to embed use case definitions, and pass Travis checks.
