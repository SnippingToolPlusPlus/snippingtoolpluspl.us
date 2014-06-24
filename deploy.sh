#!/usr/bin/env bash

#WEBSITE_ROOT_PATH='/var/www-test/'
currentuser=`whoami`

if [ -z "$WEBSITE_ROOT_PATH" ]; then
	echo "Please set the WEBSITE_ROOT_PATH environment variable"
	exit 1
fi

echo "Deploying as user $currentuser to $WEBSITE_ROOT_PATH"
rsync -rav src/ $WEBSITE_ROOT_PATH
chown -R www-data:adm $WEBSITE_ROOT_PATH
find $WEBSITE_ROOT_PATH -type d -exec chmod 775 {} \;
find $WEBSITE_ROOT_PATH -type f -exec chmod 664 {} \;

