
# GeoKrety.org QA

This project includes automated tests -Quality Assurance (QA)- for  GeoKrety.org website ([source code](https://github.com/geokrety/geokrety-website), [service](https://geokrety.org)):
- Tests rely on Python, RobotFramework, Selenium Frameworks
- Instance tested is https://rec.geokrety.org (pre-production like environment)

## Tested features
- welcome page 
   - structure basis
   - tracking code
- ruchy page 
   - structure basis
   - search waypoint

<ul><li><a href="https://geokrety.github.io/geokrety-website-qa/">Last Test reports</a></li></ul> 

# Badges

[![Travis Status](https://travis-ci.org/geokrety/geokrety-website-qa.svg?branch=master)](https://travis-ci.org/geokrety/geokrety-website-qa)

# Credit

- This repository is a fork of [kitconcept/robotframework-starter](https://github.com/kitconcept/robotframework-starter) : a ready to use robotframework+travis github repo

# HowTo run QA

Quality Assurance tests are executed against default configuration located in `acceptance/vars/robot-vars.py`.

- clone me
- install python+pip
- just execute `runTests.sh`

# Contribute
- [Wiki page](https://github.com/geokrety/geokrety-website-qa/wiki) includes good practices and tips,
- Pull request need to embed use case definitions, and pass Travis checks.
