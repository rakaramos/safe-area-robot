if [ -n "$1" ]; then
	current="$(pwd)"

    cd "$1"

    find "$(cd .; pwd)" \( -name "*.storyboard" -o -name "*.xib" \) | while read line; do
        osascript "$current""/safeArea.applescript" --args "$line"
	done

    cd "$current"
else
    echo "Please provide a project root folder"
fi
