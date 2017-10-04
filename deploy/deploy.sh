#! /bin/bash

# make baseUrl production url, update the manifest count
version=`python deploy/deploy.py`
ROOT=`pwd`

# remove old zip and add new one
cd ../
rm pano-chrome-ext.zip
zip -r pano-chrome-ext.zip pano-chrome-ext/ -x *.git*

# clean git
cd $ROOT
git add manifest.json
git commit -m "Webstore deploy $version"
git checkout js/common.js
git push origin master
