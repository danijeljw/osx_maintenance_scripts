tell application "System Events"
	-- Careful of things we DON'T want to remove...
	get the name of every login item
	-- Check for both.
	if login item "MacProtector" exists then
		delete login item "MacProtector"
		display dialog "Removed MacProtector from Login Items."
	else
		display dialog "No MacProtector infection found."
	end if
	if login item "MacDefender" exists then
		delete login item "MacDefender"
		display dialog "Removed MacDefender from Login Items."
	else
		display dialog "No MacDefender infection found."
	end if
end tell