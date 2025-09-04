if application "Capture One 22" is running then
	tell application "Capture One 22"
		
		set ret to {}
	set referenceDate to date ("1/1/1970")
	repeat with var in variants
		tell var
			set varRet to {path of parent image, dimensions of parent image, crop, {rotation of adjustments, orientation of adjustments}}
			set varOuts to {}
			if output events is not {} then
				set varRet to {path of parent image, dimensions of parent image, crop, {rotation of adjustments, orientation of adjustments}}
				set varOuts to {}
				repeat with output in output events
					tell output
						set gmtDate to (date of output) - (time to GMT)
						set end of varOuts to {path, (gmtDate - referenceDate) * 1000}
					end tell
				end repeat
				set end of varRet to varOuts
			end if
			set end of ret to varRet
		end tell
	end repeat
	return ret
	
end tell
end if