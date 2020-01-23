#!/bin/bash

if [ "$#" -ne 0 ]; then
  exec /usr/sbin/cntlm -f $*
fi

if [ ! -f /cntlm.ini ]; then

  if [ ! -t 0 ]; then
    echo 'No /cntlm.ini found.'
    echo 'Please run this image with the options '-it --rm' the config file.'
    exit 0
  fi

  clear

  echo 'No /cntlm.ini found. Start creating it...'
  read -p "Proxy: " proxy
  read -p "Domain: " domain
  read -p "Username: " username
  read -p "Password: " -s password
  echo ''
  read -p "NoProxy (may be empty, localhost and 127.0.0.* already included): " noproxy

  cntlm -u "$username" -d "$domain" -H <<< "$password" |grep 'Pass[LM|NT]' > hashes

  clear

  echo "Save the following configuration into a config file:"
  echo ""
  echo "Username $username"
  echo "Domain $domain"
  cat hashes
  echo "Proxy $proxy"
  echo "NoProxy localhost,127.0.0.*,$noproxy"
  echo "Listen 0.0.0.0:3128"
  echo ""
  echo 'Then start this container again with:'
  echo 'docker run -d --name cntlm -p localhost:3128:3128 -v <config-file>:/cntlm.ini <cntlm-image-name>'
  echo 'Afterwards your proxy URL is http://localhost:3128'
  exit 0
else
  exec /usr/sbin/cntlm -f -c /cntlm.ini
fi
