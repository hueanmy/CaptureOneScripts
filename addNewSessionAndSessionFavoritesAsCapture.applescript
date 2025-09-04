set sessionFolderPath to "/Users/mailt/Desktop/"
set sessionName to "newSession3"
set sessionFavoriteName to "newSessionFav"

tell application "Capture One 22"
	activate
	close every document without saving
	set newDoc to make new document with properties {name:sessionName, path:sessionFolderPath}
	my createNewSessionFavoriteAsCaptureFolder(sessionFavoriteName)
end tell


on createNewSessionFavoriteAsCaptureFolder(sessionFavName)
	tell front document of application "Capture One 22"
		-- Add all paths to favorites
		set collectionFav to make collection with properties {kind:favorite, file:my makeDirs(sessionFavName)}
		set collectionFav to make collection with properties {kind:favorite, file:captures}
	end tell
end createNewSessionFavoriteAsCaptureFolder


on makeDirs(newName)
	tell front document of application "Capture One 22"
		
		set currentCaptureDir to output
		tell application "Finder" to set captureName to name of folder currentCaptureDir
		
		set newDirs to []
		
		-- if the name is not Capture, we need to create our folder under the main Capture dir
		if captureName is not "Capture" then
			tell application "Finder"
				set d to currentCaptureDir as alias
				set currentCaptureDir to container of d as alias
			end tell
			
		end if
		
		set newDir to POSIX path of currentCaptureDir & newName
		set newDirs to newDirs & newDir
		
		tell application "Finder"
			try
				log "Making new dir " & newDir
				make new folder in currentCaptureDir with properties {name:newName}
			end try
			
		end tell
		log newDir
		
	end tell
	return newDirs
end makeDirs