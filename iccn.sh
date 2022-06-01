#!/bin/bash

# Downloading the ICCN theme logos from github

git clone https://github.com/Fuzail98/iccn-theme.git

# Going into the iccn-theme directory to copy images to the directory for changing to ICCN Theme from OPNsense

cd iccn-theme
if [ -d /root/iccn-bash/iccn-theme ]
then
	cp *.* /usr/local/opnsense/www/themes/tukan/build/images/
	echo "Logos have been changed! Please refresh you Web GUI and/or clear cache to see the results."
	cd ..
	rm -r iccn-theme/
else
	echo "No changes have taken place. Please try again!"
fi
