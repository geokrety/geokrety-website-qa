
# GeoKrety.org QA

## Dashboard


<p align="center">

[![Travis Status](https://travis-ci.org/geokrety/geokrety-website-qa.svg?branch=master)](https://travis-ci.org/geokrety/geokrety-website-qa)<br/>

<a href="https://geokrety.github.io/geokrety-website-qa/"><img src="https://image.flaticon.com/icons/svg/203/203165.svg" width="50" alt="QA Tests reports"/> <small>QA Tests reports</small></a>

</p>

## Context

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

# HowTo run QA

Quality Assurance tests are executed against default configuration located in `acceptance/vars/robot-vars.py`.

- clone me
- install python+pip
- just execute `./scripts/runTests.sh`

# Contribute
- [Wiki page](https://github.com/geokrety/geokrety-website-qa/wiki) includes good practices and tips,
- Pull request need to embed use case definitions, and pass Travis checks.


# Credit

- This repository is a fork of [kitconcept/robotframework-starter](https://github.com/kitconcept/robotframework-starter) : a ready to use robotframework+travis github repo

