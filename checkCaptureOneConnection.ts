export = `
if application id "{0}" is running then
	tell application id "{0}"
		return app version
	end tell
else
	return null
end if
`