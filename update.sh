#!/bin/sh

# set -x

SRC=$HOME/Source
GITS=`find $SRC -name .git`

echo "Update from GIT"
for PLACE in $GITS; do
	echo `dirname $PLACE`
	HERE=`pwd`
	cd `dirname $PLACE`
	git pull
	cd $HERE
done
echo "================================"

SVNS=`find $SRC -name .svn`
echo "Update from SVN"

for PLACE in $SVNS; do
	echo `dirname $PLACE`
	HERE=`pwd`
	cd `dirname $PLACE`
	svn update
	cd $HERE
done
echo "================================"
