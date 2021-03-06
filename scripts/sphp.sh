#!/bin/bash

#https://raw.githubusercontent.com/conradkleinespel/sphp-osx/master/sphp

if [ $# -ne 1 ]; then
    echo "Usage: sphp [phpversion]"
    exit 1
fi

currentversion="`php -r \"echo str_replace('.', '', substr(phpversion(), 0, 3));\"`"
newversion="$1"

shortOld="`php -r \"echo substr(phpversion(), 0, 1);\"`"
shortNew="`php -r \"echo substr('$1', 0, 1);\"`"

brew list php$newversion 2> /dev/null > /dev/null

if [ $? -eq 0 ]; then
    echo "PHP version $newversion found"

    echo "Unlinking old binaries..."
    brew unlink php$currentversion 2> /dev/null > /dev/null

    echo "Linking new binaries..."
    brew link php$newversion

    echo "Linking new modphp addon..."
    sudo ln -sf `brew list php$newversion | grep libphp` /usr/local/lib/libphp${shortNew}.so

    echo "Fixing LoadModule..."
    apacheConf=`httpd -V | grep -i server_config_file | cut -d '"' -f 2`
    sudo sed -i -e "/LoadModule php${shortOld}_module/s/^#*/#/" $apacheConf
    sudo sed -i -e "/LoadModule php${shortNew}_module/s/^#//" $apacheConf

    echo "Updating version file..."

    pgrep -f /usr/sbin/httpd 2> /dev/null > /dev/null
    if [ $? -eq 0 ]; then
        echo "Restarting system Apache..."
        sudo pkill -9 -f /usr/sbin/httpd
        sudo /usr/sbin/apachectl -k restart > /dev/null 2>&1
    fi
    pgrep -f /usr/local/Cellar/*/httpd 2> /dev/null > /dev/null
    if [ $? -eq 0 ]; then
        echo "Restarting homebrew Apache..."
        sudo pkill -9 -f /usr/local/Cellar/*/httpd
        sudo /usr/local/bin/apachectl -k restart > /dev/null 2>&1
    fi

    echo "Done."
else
    echo "PHP version $newversion was not found."
    exit 1
fi