export = `
if application id "{0}" is running then
	tell application id "{0}"
		
	tell current document
			set sessionFolder to POSIX path of (folder as alias)
			set capturesFolder to POSIX path of (captures as alias)
			set outputFolder to POSIX path of (output as alias)
			return {sessionFolder, capturesFolder, outputFolder}
		end tell
		
	end tell
end if
`
