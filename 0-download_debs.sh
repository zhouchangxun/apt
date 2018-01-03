#!/bin/bash

#edit your package list.
#PACKAGES="wget tcpdump unzip"
PACKAGES=$(cat soft.list)
echo soft list:$PACKAGES

# get dep recurse
DEPS=$(apt-cache depends --recurse --no-recommends --no-suggests \
          --no-conflicts --no-breaks --no-replaces --no-enhances \
          --no-pre-depends ${PACKAGES} | grep "^\w" )

echo deb list: $DEPS 
#for item in $DEPS;do
#  echo $item
#done

# download all deps
cd deb-packages/
apt-get download $DEPS
cd ..
