#!/bin/bash

cd /usr/local/opnsense/version/
out=pkg install jq
string="Updating OPNsense repository catalogue... OPNsense repository is up to date. Updating SunnyValley repository catalogue... SunnyValley repository is up to date. All repositories are up to date. Checking integrity... done (0 conflicting) The most recent versions of packages are already installed"
if [ $out == $string ]:
then
  echo "!..!"
else
  echo "Installing package 'jq'"
fi

jq '.product_copyright_owner = "ICCN"' core > temp.json
jq '.product_copyright_url = "https://www.iccnetworking.com"' core > temp.json
jq '.product_email = "info@iccnetworking.com"' core > temp.json
jq '.product_name = "AGW"' core > temp.json
jq '.product_nickname = "AGW"' core > temp.json
jq '.product_website = "https://www.iccnetworking.com"' core > temp.json

cp temp.json core

rm temp.json
