export = `
if application id "{0}" is running then
	tell application id "{0}"
	set listNewImage to "{1}"
	set ret to {}
		set referenceDate to date ("1/1/1970")
		set newListVariant to {}
		set test to {}
		repeat with var in variants
			tell var
				repeat with i from 1 to count listNewImage
					if name contains item i of listNewImage then
						set end of newListVariant to var
						exit repeat
					end if
				end repeat
				
				if (count of newListVariant) is (count of listNewImage) then
					exit repeat
				end if
				
			end tell
		end repeat
		
		repeat with var in newListVariant
			tell var
				set varRet to {path of parent image, dimensions of parent image, crop, {rotation of adjustments, orientation of adjustments}}
				set varOuts to {}
				
				repeat with output in output events
					tell output
						if (my FileExists(path)) then
							set gmtDate to (date of output) - (time to GMT)
							set end of varOuts to {path, (gmtDate - referenceDate) * 1000}
							set end of varRet to varOuts
							set end of ret to varRet
						end if
					end tell
				end repeat
			end tell
		end repeat
		
		return ret
	end tell
end if


on FileExists(theFile) -- (String) as Boolean
	tell application "System Events"
		if exists file theFile then
			return true
		else
			return false
		end if
	end tell
end FileExists

`
