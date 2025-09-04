if application "Capture One 22" is running then
	tell application "Capture One 22"
		set outputFile to "sv_302953_figure-v117609 copy 327"
		
		set ret to {}
		set referenceDate to date ("1/1/1970")
		set filterVariant to {}
		set listNameNewVariants to {}
		set test to {}
		repeat with var in variants
			tell var
				if name contains outputFile then
					set varRet to {path of parent image, dimensions of parent image, crop, {rotation of adjustments, orientation of adjustments}}
					set varOuts to {}
					set test to {}
					
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
					exit repeat
				end if
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