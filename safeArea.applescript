on run {input, parameters}
	set interfaceBuilderFile to parameters
	delay 1
	tell application "Xcode"
		open interfaceBuilderFile
		activate
		delay 1
		tell application "System Events" to tell process "Xcode"

			-- For old interface builder files, it will ask for a device, just pick whatever Xcode suggests and move on
			set needsChooseDevice to (count of (get title of every button of sheet of window 1)) > 0
			if needsChooseDevice then
				click button "Choose Device" of sheet of window 1
			end if

			-- Now lets toggle the checkbox
			try
				set safeAreaCheckbox to checkbox "Use Safe Area Layout Guides" of group "Interface Builder Document" of scroll area 1 of group 1 of splitter group 1 of splitter group 1 of window 1 of application process "Xcode" of application "System Events"
				if value of safeAreaCheckbox = 0 then
					set focused of safeAreaCheckbox to true
					delay 1
					keystroke space
				end if
			end try
		end tell
	end tell

	-- Save
	tell application "System Events" to tell process "Xcode"
		keystroke "s" using command down
		delay 1
	end tell

	-- Quit
	tell application "Xcode"
		quit
	end tell
end run
