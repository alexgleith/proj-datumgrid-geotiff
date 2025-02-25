#!/bin/sh

TARGET=s3://cdn.proj.org/

for i in `ls -d *_*/`; do
    echo "Synchronizing $i ..."
    aws s3 sync $i "$TARGET" --exclude ".github/*" --profile projcdn
done
aws s3 cp index.html "$TARGET" --profile projcdn --content-type "text/html"
aws s3 cp README.DATUMGRID "$TARGET" --profile projcdn --content-type "text/plain"
