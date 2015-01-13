#!/bin/bash

# prefix for spipe pipes for scanner
SPREF='scan-'

# FMRI for spiped
SFMRI='svc:/pkgsrc/spiped'

SCANFMRI="${SFMRI}${SPREF}*"

# read scan hosts from mdata
SCANHOST=$(mdata-get scan-host)

## remove all scan spipes
for SCANPIPE in $(/usr/bin/svcs -H -o FMRI $SCANFMRI)
do
  /usr/sbin/svcadm disable $SCANPIPE
  /usr/sbin/svccfg delete -f $SCANPIPE
done

## Scan Hosts in mdata?
if [ -z "$SCANHOST" ]
then 
## No 
## create exim config for local scanner
## start local scanner
  
else 
## Yes
## create spipes
## create exim config to use remote/spipe scanner
## stop local scanner
fi


