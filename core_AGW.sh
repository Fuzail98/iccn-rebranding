#!/bin/bash

cd /usr/local/opnsense/version/
pkg install jq

jq '.product_copyright_owner = "ICCN"' core > tmp.json
jq '.product_copyright_url = "https://www.iccnetworking.com"' core > tmp.json
jq '.product_name = "AGW"' core > tmp.json
jq '.product_nickname = "AGW"' core > tmp.json
jq '.product_website = "https://www.iccnetworking.com"' core > tmp.json

cp tmp.json core
