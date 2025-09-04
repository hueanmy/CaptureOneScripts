export = `
if application id "{0}" is running then
	tell application id "{0}" -- Capture One 21
		
		tell current document
			set capture name format to "{1}"
			return true
		end tell
		
	end tell
end if
`