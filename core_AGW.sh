#!/bin/bash

cd /usr/local/opnsense/version/
out=pkg install jq
if "The most recent versions of packages are already installed" in $out:
then
  echo "!..!"
else
  echo "Installing package 'jq'"

jq '.product_copyright_owner = "ICCN"' core > temp.json
jq '.product_copyright_url = "https://www.iccnetworking.com"' core > temp.json
jq '.product_email = "info@iccnetworking.com"' core > temp.json
jq '.product_name = "AGW"' core > temp.json
jq '.product_nickname = "AGW"' core > temp.json
jq '.product_website = "https://www.iccnetworking.com"' core > temp.json

cp temp.json core

rm temp.json
