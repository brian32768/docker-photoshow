# docker-photoshow

## What this is

PhotoShow is a photo gallery web app.

Find documentation for it
not at the expired web site but in the sources on github,
thibaud-rohmer/PhotoShow
and linuxserver/docker-photoshow


## Build

There is no build step, I use a standard photoshow docker image.

## Configure

### Set up .env

Copy sample.env to .env and edit it with your own information.

Admin password forgetten? Look in .env

### Volumes

The first time you run, docker will create volumes
to hold your config, photos and thumbnails.

The pictures I am accessing are CIFS mounted into /media/photoshow/ from two different sources.
I used CIFS following suggestions from https://tecadmin.net/mounting-samba-share-on-ubuntu/
(hints: sec=ntlm in fstab did not work and I used ro instead of rw)

If you need to edit config.php you can use a shell in the running
container or edit it here as root.  I did not make any changes to it.

   /var/lib/docker/volumes/photoshow_config/_data/www/PhotoShow/config.php

Or sometimes when the mood strikes me to not use root, I copy the file to the local folder, edit and copy back.

   docker cp photoshow://config/www/PhotoShow/config.php .
   emacs config.php
   docker cp config.php photoshow://config/www/PhotoShow/
   docker-compose reload
   
### Check this project's config

   docker-compose config

## Run it

The command

   docker-compose up

will start container for PhotoShow.

