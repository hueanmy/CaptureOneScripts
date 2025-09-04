set sessionFolderPath to "/Users/mailt/Desktop/"
set sessionName to "newSession"
tell application "Capture One 22"
	activate
	close every document without saving
	set newDoc to make new document with properties {name:sessionName, path:sessionFolderPath}
end tell