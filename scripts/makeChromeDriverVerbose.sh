#!/bin/bash
# original idea # https://stackoverflow.com/questions/19562257/starting-chromedriver-in-verbose-mode-node-js
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
echo " * replace chromedriver to verbose one"
sudo mv /usr/local/bin/chromedriver /usr/local/bin/chromedriversilent
sudo cp "${DIR}/chromedriver" /usr/local/bin/chromedriver
sudo chmod +x /usr/local/bin/chromedriver