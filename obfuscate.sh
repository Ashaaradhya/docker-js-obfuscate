#!/usr/bin/env bash

FILE_IN=$1
INDEX_FILE=$2

if [ -z "$ASSETS_BASE" ] || [ -z "$INDEX_FILE" ]; then
    echo ""
    echo "script launch format: "
    echo "$0 JAVASCRIPT_FILE INDEX_FILE"
    echo ""
    exit 1
fi

OUT_NAME=$(echo $FILE_IN | sed 's|js|min.js|g')

python /usr/bin/garble.py $FILE_IN $OUT_NAME yes 2> /dev/null /dev/null

# Replace in HTML file
sed -e 's|'"$FILE_IN"'|'"$OUT_NAME|"'g' $INDEX_FILE > _tmp && cp _tmp $INDEX_FILE && rm -rf _tmp


