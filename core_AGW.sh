#!/bin/bash

cd /usr/local/opnsense/version/

if ! which jq > /dev/null; 
then
   echo -e "Command not found! Install? (y/n) \c"
   read
   if "$REPLY" = "y"; 
   then
      pkg install jq
   fi
fi

jq '.product_copyright_owner = "ICCN"' core > temp.json
jq '.product_copyright_url = "https://www.iccnetworking.com"' core > temp.json
jq '.product_email = "info@iccnetworking.com"' core > temp.json
jq '.product_name = "AGW"' core > temp.json
jq '.product_nickname = "AGW"' core > temp.json
jq '.product_website = "https://www.iccnetworking.com"' core > temp.json

cp temp.json core

rm temp.json
