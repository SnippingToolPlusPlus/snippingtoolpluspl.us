#!/usr/bin/env bash

DEPLOY_PATH='/var/www-test/'
currentuser=`whoami`

echo "Deploying as user $currentuser" 
rsync -rav src/ $DEPLOY_PATH
chown -R www-data:adm $DEPLOY_PATH
find $DEPLOY_PATH -type d -exec chmod 775 {} \;
find $DEPLOY_PATH -type f -exec chmod 664 {} \;

