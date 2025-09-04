export = `
if application id "{0}" is running then
	tell application id "{0}"
		
		tell current document
			repeat with rcp in recipes
				tell rcp
					set export crop method to ignore
				end tell
			end repeat
		end tell
		return true
		
	end tell
end if
`