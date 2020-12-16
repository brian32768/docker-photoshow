#!/bin/sh

HOME="/media/photoshow"

# Check volumes are mounted by looking for files
# There are currently 3 folders mounted via CIFS and there have to be a few files in each of them.
#
for folder in $HOME/*; do
    if [ `find \$folder -type f |wc -l` -lt 5 ] ; then
	echo `hostname` problem in $folder
	exit 1
    fi
done

# Now let's make sure there is a web server running in the docker

# -L causes curl to follow the redirect
# so it checks on both the proxy and on the photoshow server

curl -L --fail -s http://giscache.co.clatsop.or.us/photoshow/ > /dev/null || echo `hostname` photoshow webserver not running || exit 1

exit 0
