#!/bin/sh

# First, let's make sure there are some images to serve

HOME="/media/photoshow"

# There are currently 3 folders mounted via CIFS and there have to be a few files in each of them.

for folder in $HOME/*; do
    if [ `find \$folder -type f |wc -l` -lt 5 ] ; then
	echo `hostname` problem in $folder
	exit 1
    fi
done

# Now let's make sure there is a web server running in the docker

# -L causes curl to follow the redirect
# so it checks on both the proxy and on the photoshow server

curl -L --fail -s http://giscache.co.clatsop.or.us/photoshow/ || echo `hostname` photoshow webserver not running || exit 1

exit 0
