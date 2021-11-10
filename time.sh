#!/bin/bash
# set noninteractive installation
    export DEBIAN_FRONTEND=noninteractive
    # install tzdata package
    apt-get install -y tzdata
    # set your timezone
    ln -fs /usr/share/zoneinfo/Indian/Maldives /etc/localtime
    dpkg-reconfigure --frontend noninteractive tzdata

