export = `
if application id "{0}" is running then
	tell application id "{0}"
		
		tell current document
			set kelvinFolder to "{1}" -- /Users/toantk/Pictures/Test Kelvin/Output/
			set sessionFolder to POSIX path of (folder as alias)
			set capturesFolder to POSIX path of (captures as alias)
			set outputFolder to POSIX path of (output as alias)
			if kelvinFolder = outputFolder then
				return {sessionFolder, capturesFolder}
			end if
			return {}
		end tell
		
	end tell
end if
`
