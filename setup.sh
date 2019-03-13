#!/bin/bash

curl https://raw.githubusercontent.com/noahShinabarger/programmingEnvironment/master/.vimrc > ~/.vimrc
curl https://raw.githubusercontent.com/noahShinabarger/programmingEnvironment/master/.bashrc > ~/.bashrc
curl https://raw.githubusercontent.com/noahShinabarger/programmingEnvironment/master/update_vimrc_and_bashrc.sh > /etc/cron.hourly/update_vimrc_and_bashrc.sh

chmod 644 ~/.vimrc
chmod 644 ~/.bashrc
chmod 744 /etc/cron.hourly/update_vimrc_and_bashrc.sh

md5sum ~/.vimrc | cut -c 1-32 > ~/.historical_vimrc_hash
md5sum ~/.bashrc | cut -c 1-32 > ~/.historical_bashrc_hash
