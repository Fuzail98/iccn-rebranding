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

jq '.product_copyright_owner = "ICCN"' core > temp.json
cp temp.json core
rm temp.json
jq '.product_copyright_url = "https://www.iccnetworking.com"' core > temp.json
cp temp.json core
rm temp.json
jq '.product_email = "info@iccnetworking.com"' core > temp.json
cp temp.json core
rm temp.json
jq '.product_name = "AGW"' core > temp.json
cp temp.json core
rm temp.json
jq '.product_nickname = "AGW"' core > temp.json
cp temp.json core
rm temp.json
jq '.product_website = "https://www.iccnetworking.com"' core > temp.json
cp temp.json core
rm temp.json

echo "Changes have been made!!! Please refresh and/or clear cache on your browser to see the changes."
