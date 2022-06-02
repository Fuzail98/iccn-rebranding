#!/bin/bash

# Downloading the ICCN theme logos from github

git clone https://github.com/Fuzail98/iccn-theme.git

# Going into the iccn-theme directory to copy images to the directory for changing to ICCN Theme from OPNsense

cd iccn-theme
if [ -d /root/iccn-rebranding/iccn-theme ]
then
        cp *.* /usr/local/opnsense/www/themes/tukan/build/images/
        echo "Logos have been changed! Please refresh you Web GUI and/or clear cache to see the results."
        cd ..
        rm -r iccn-theme/
else
        echo "No changes in logos have taken place. Please try again!"
fi

# Editing the core file for changing from OPNsense copyright to ICCN

#Path of core file
cd /usr/local/opnsense/version/

# Since the core file is json data, we will be needing the 'jq' package

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

# Making changes in the JSON file

jq '.product_copyright_owner = "ICCN"' core > test.json && mv test.json core
jq '.product_copyright_url = "https://www.iccnetworking.com"' core > test.json && mv test.json core
jq '.product_email = "info@iccnetworking.com"' core > test.json && mv test.json core
jq '.product_name = "AGW"' core > test.json && mv test.json core
jq '.product_nickname = "AGW"' core > test.json && mv test.json core
jq '.product_website = "https://www.iccnetworking.com"' core > test.json && mv test.json core

echo "Changes have been made in the core file!!! Please refresh and/or clear cache on your browser to see the changes."
