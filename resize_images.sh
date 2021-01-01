#! /bin/bash

set -x

for png in $(find images -name '*.png') ; do
  jpg="${png%.png}.jpg"
  jpg="assets/${jpg#images/}"
  jpg_dir=$(dirname "$jpg")
  test -d "$jpg_dir" || mkdir -p "$jpg_dir"
  test -f "$jpg" || convert -resize 800x600 "$png" "$jpg"
done
