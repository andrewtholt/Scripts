#!/bin/sh

# set -x


SRC=$HOME/Source

HERE=`pwd`
cd $SRC

GITS=`find . -name .git`
# GITS=`find $SRC -name .git`

cd $HERE

echo "Update from GIT"
for PLACE in $GITS; do
        echo `dirname $PLACE`
        HERE=`pwd`
        cd `dirname $PLACE`
        git pull
        cd $HERE
done
echo "================================"

HERE=`pwd`
cd $SRC
SVNS=`find . -name .svn`
cd $HERE

echo "Update from SVN"

for PLACE in $SVNS; do
        echo `dirname $PLACE`
        HERE=`pwd`
        cd `dirname $PLACE`
        svn update
        cd $HERE
done
echo "================================"
