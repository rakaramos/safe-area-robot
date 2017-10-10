#!/bin/bash

if [ -n "$1" ]; then
	current="$(pwd)"

    cd "$1"

    find "$(cd .; pwd)" \( -name "*.storyboard" -o -name "*.xib" \) -print0 | xargs -0 egrep -r -o -L -e "useSafeAreas=\"YES\"" --include "*.storyboard" --include "*.xib" | while read line; do
    	echo "Processing $line";
        osascript "$current""/safeArea.applescript" --args "$line"
	done

    cd "$current"
else
    echo "Please provide a project root folder"
fi