#! /usr/bin/env bash

# taken from https://bash.cyberciti.biz/guide/$IFS

# setupapachevhost.sh - Apache webhosting automation demo script
file="./domains.txt"
filecontent="cyberciti.biz|202.54.1.1|/home/httpd|ftpcbzuser
nixcraft.com|202.54.1.2|/home/httpd|ftpnixuser"

# set the Internal Field Separator to |
IFS='|'
while read -r domain ip webroot ftpusername; do
    printf "*** Adding %s to httpd.conf...\n" $domain
    printf "Setting virtual host using %s ip...\n" $ip
    printf "DocumentRoot is set to %s\n" $webroot
    printf "Adding ftp access for %s using %s ftp account...\n\n" $domain $ftpusername

# reading from file will only process the first line
# done <"$file"
done < <(echo "$filecontent")
