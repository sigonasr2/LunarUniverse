-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local currentLocation = nil
local myMap = native.newMapView( 20, 20, 280, 360 )

local updateMap = function(event)
	-- Create a native map view
	if (myMap==nil) then
		currentLocation = {latitude=-1,longitude=-1}
	else 
		myMap.x = display.contentCenterX
		currentLocation = myMap:getUserLocation()
		myMap:setCenter( currentLocation.latitude, currentLocation.longitude )
	end

	local locationText = display.newText( "Location: ", 0, 400, native.systemFont, 16 )
	locationText.anchorY = 0
	locationText.x = display.contentCenterX
	if ( currentLocation.errorCode or ( currentLocation.latitude == 0 and currentLocation.longitude == 0 ) ) then
		locationText.text = currentLocation.errorMessage
	else
		locationText.text = "Current location: " .. currentLocation.latitude .. "," .. currentLocation.longitude
		-- myMap:addMarker( currentLocation.latitude, currentLocation.longitude )
	end
end

		 
timer.performWithDelay( 1000, updateMap, -1)