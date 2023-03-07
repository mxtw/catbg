#!/bin/bash

SUBREDDIT="blurrypicturesofcats"
URL="https://www.reddit.com/r/${SUBREDDIT}/new.json"
USERAGENT="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36"

# get list of images from json
# TODO: support more than .jpg
IMAGES=$(curl -A "$USERAGENT" $URL | jq '.data.children[].data.url | select(. | test(".*.jpg$"))' | tr '"' ' ' )
IMG_ARR=($(echo $IMAGES | tr ' ' '\n'))

# pick random image
IMAGE=${IMG_ARR[RANDOM%${#IMG_ARR[@]}]}

curl $IMAGE | feh --bg-scale -
