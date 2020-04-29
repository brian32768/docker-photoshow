# docker-photoshow

## What this is

PhotoShow is a photo gallery web app.

## Build

    docker-compose build

### Set up .env

Copy sample.env to .env and edit it with your own information.

The first time you run, docker will create volumes
to hold your photos and thumbnails for them.

For the county, I used photos from K:/PublicWorks/bridgeimages/

## Check this project's config

   docker-compose config

## Run it

The command

   docker-compose up

will start container for PhotoShow.

