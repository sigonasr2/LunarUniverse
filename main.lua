-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local latitude = display.newText( "-", 100, 50, native.systemFont, 16 )
local longitude = display.newText( "-", 100, 100, native.systemFont, 16 )
local altitude = display.newText( "-", 100, 150, native.systemFont, 16 )
local accuracy = display.newText( "-", 100, 200, native.systemFont, 16 )
local speed = display.newText( "-", 100, 250, native.systemFont, 16 )
local direction = display.newText( "-", 100, 300, native.systemFont, 16 )
local time = display.newText( "-", 100, 350, native.systemFont, 16 )
 
local locationHandler = function( event )
    if ( event.errorCode ) then
        native.showAlert( "GPS Location Error", event.errorMessage, {"OK"} )
        print( "Location error: " .. tostring( event.errorMessage ) )
    else
        local latitudeText = string.format( '%.4f', event.latitude )
        latitude.text = latitudeText
        local longitudeText = string.format( '%.4f', event.longitude )
        longitude.text = longitudeText
        local altitudeText = string.format( '%.3f', event.altitude )
        altitude.text = altitudeText
        local accuracyText = string.format( '%.3f', event.accuracy )
        accuracy.text = accuracyText
        local speedText = string.format( '%.3f', event.speed )
        speed.text = speedText
        local directionText = string.format( '%.3f', event.direction )
        direction.text = directionText
        local timeText = string.format( '%.0f', event.time )
        time.text = timeText
    end
end
  
-- Activate location listener
Runtime:addEventListener( "location", locationHandler )