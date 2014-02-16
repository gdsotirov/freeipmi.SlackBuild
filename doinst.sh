# Update the /usr/info/dir info-database, so that we will see the new
# "gmp" item in info root structure, if we type "info".
ErrCount=0

function echo_exit {
  ((ErrCount += $1))
  if [ $1 -eq 0 ]; then
    echo -n "$2 "
  else
    echo -n $3
  fi
}

if [ -x /usr/bin/install-info ] ; then
  echo -n "Installing info page... "
  install-info --info-dir=/usr/info /usr/info/freeipmi-faq.info.gz 2>/dev/null
  echo_exit $ErrCount "DONE" "FAILURE"
  echo
else
  echo "WARNING: Info pages cannot be installed!"
fi

