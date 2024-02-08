

    
    QT = exports["qt-core"]:Utility() -- # for using core functions you can define like this 
    
    QT.CreateVeh({ -- # spawning vehicle is our functions we didnt use esx or qb function
        model = 'blista',
        coords = vector4(531.92, -185.0, 54.04, 358.96), -- # supports vector4
    }, function(veh)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
    end)
    
 -- # get_entity_coords
 
    local pos = QT.GetPosition(entity) -- # geting player coords and heading position
    print(pos)
    
-- # usable item example

    Qt.Item("item", function(source, item) 
    	if item == nil then
    		print("This item does not exist")
    	else
    		TriggerClientEvent('your_event_here', source)
    	end
    end)
    
 -- # CLOSEST VEHICLE 
 
    local closestveh = QT.CloseVeh(coords)
     if closestveh < 2.5 then 
       -- # your code here
     end
     
 -- # COMMANDS 
 
     QT.Cmd("command_name", function()
       -- # your code here
     end)
-- # ZONE DISTANCE CHECK 

    local inZone = QT.ZoneCheck(coords, distance)
     if inZone then 
       print("in_zone")
     else
       print("out_of_zone")
     end
     
