export = `
set ret to {}
set list_of_installed_apps to paragraphs of (do shell script "find /Applications -name \\"Capture One *.app\\" -maxdepth 1")
repeat with installed_app in list_of_installed_apps
	set app_name to contents of installed_app
	set bundleId to paragraphs of (do shell script "mdls -name kMDItemCFBundleIdentifier -r \\"" & app_name & "\\"")
	set end of ret to {app_name, first item of bundleId}
end repeat
return ret
`