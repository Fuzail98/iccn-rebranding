#!/bin/bash

#Downloading the ICCN theme logos from github

git clone https://github.com/Fuzail98/iccn-theme.git

#Going into the iccn-theme directory to copy images to the directory for changing to ICCN Theme from OPNsense

cd iccn-theme
if [ -d /root/iccn-bash/iccn-theme ]
then
	cp *.* /usr/local/opnsense/www/themes/tukan/build/images/
	echo "Theme changed! Please refresh you Web GUI and/or clear cache to see the results."
else
	echo "No changes have taken place. Please try again!"
fi

cd ..
rm -r iccn-theme/

echo "############################################################################################################################"

cd /usr/local/opnsense/version/

pkg_name=jq
out=$(pkg info $pkg_name | grep Name)
compare_string="Name           : $pkg_name"

if [ "$out" == "$compare_string" ]
then
    echo "Package: $pkg_name already installed. Executing the commands to make changes in the core file!!!"
else
    echo "$pkg_name not installed. Installing ' $pkg_name ' ..."
    pkg install $pkg_name
fi

jq '.product_copyright_owner = "ICCN"' core > temp.json
jq '.product_copyright_url = "https://www.iccnetworking.com"' core > temp.json
jq '.product_email = "info@iccnetworking.com"' core > temp.json
jq '.product_name = "AGW"' core > temp.json
jq '.product_nickname = "AGW"' core > temp.json
jq '.product_website = "https://www.iccnetworking.com"' core > temp.json

cp temp.json core

rm temp.json

echo "Changes have been made!!! Please refresh and/or clear cache on your browser to see the changes."
