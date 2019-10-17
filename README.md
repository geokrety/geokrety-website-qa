
# GeoKrety.org QA

## Dashboard


<p align="center">

[![Travis Status](https://travis-ci.org/geokrety/geokrety-website-qa.svg?branch=master)](https://travis-ci.org/geokrety/geokrety-website-qa)<br/>

[![BrowserStack Status](https://automate.browserstack.com/badge.svg?badge_key=SGZSTjVSc2d0d1FSRDg4c1c3bE80akFPVVk3anBySFQ0REk5SVBkbWxaOD0tLXIrL3FRMjFVcFZtZzJEV1VITVJ1ZVE9PQ%3D%3D--3680a826bcdde55a8dec3a3d1a086bcac9a48fd8)](https://automate.browserstack.com/public-build/SGZSTjVSc2d0d1FSRDg4c1c3bE80akFPVVk3anBySFQ0REk5SVBkbWxaOD0tLXIrL3FRMjFVcFZtZzJEV1VITVJ1ZVE9PQ%3D%3D--3680a826bcdde55a8dec3a3d1a086bcac9a48fd8)

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
- just execute `make help`

## HowTo run QA BrowserStack stage (Experimental)

To run BrowserStack tests locally, you will need : 
- a BrowserStack username,
- a BrowserStack token.
 
They could be retrieved from  https://automate.browserstack.com/

````
export BS_USERNAME=jojo
export BS_TOKEN=ThisIsVerySecretToken
make testv2bs
````

Now, from [travis](https://travis-ci.org/geokrety/geokrety-website-qa/requests) point of view,
 you had to enforce this stage via `TARGET_BS`. 

You could [trigger a custom build](https://blog.travis-ci.com/2017-08-24-trigger-custom-build) using for example this config:

```
env:
- TARGET_BS=1 TARGET_ENV=feature/new-theme
```


# Contribute
- [Wiki page](https://github.com/geokrety/geokrety-website-qa/wiki) includes good practices and tips,
- Pull request need to embed use case definitions, and pass Travis checks.


# Credit

- This repository is a fork of [kitconcept/robotframework-starter](https://github.com/kitconcept/robotframework-starter) : a ready to use robotframework+travis github repo

