#!/bin/sh

if [ $# -eq 0 ]; then
    echo "No args"
    exit 0
fi

CNT=$(update-alternatives --query gcc | grep Alter | grep "\-$1" | wc -l)
if [ $CNT -ne 0 ]; then
    echo "gcc Version $1 already added."
else
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-$1 50
fi


CNT=$(update-alternatives --query g++ | grep Alter | grep "\-$1" | wc -l)
if [ $CNT -ne 0 ]; then
    echo "g++ Version $1 already added."
else
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-$1 50
fi

update-alternatives --query gcc
echo "==============================="
update-alternatives --query g++

echo
echo "Use update-alternatives --config gcc to select the version of gcc and"
echo "Use update-alternatives --config g++ to select g++"

