#!/bin/sh
if [ $# -eq 0 ]; then
    echo 
    echo "Enter version number to switch to, choices are:"
    echo
    update-alternatives --query gcc | grep Alter |cut -f2 -d":"
    echo
    echo "Selected version is:"
    gcc --version | grep "^gcc"
    exit 0
fi

CNT=$(update-alternatives --query gcc | grep Alter | grep "\-$1$" | wc -l)

if [ $CNT -eq 0 ]; then
    echo "gcc Version $1 unknown"
else
    TOOL_PATH=$(which gcc-$1)
    update-alternatives --set gcc $TOOL_PATH
fi

CNT=$(update-alternatives --query g++ | grep Alter | grep "\-$1" | wc -l)
if [ $CNT -eq 0 ]; then
    echo "g++ Version $1 unknown."
else
    TOOL_PATH=$(which g++-$1)
    update-alternatives --set g++ $TOOL_PATH
fi

update-alternatives --query gcc
echo "==============================="
update-alternatives --query g++
