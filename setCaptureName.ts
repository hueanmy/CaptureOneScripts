export = `
if application id "{0}" is running then
	tell application id "{0}"
		
		tell current document
			set capture name to "{1}"
			return true
		end tell
		
	end tell
end if
`