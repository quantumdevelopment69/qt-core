

    
    QT = exports["qt-core"]:Utility() -- # for using core functions you can define like this 
    
    QT.CreateVeh({ -- # spawning vehicle is our functions we didnt use esx or qb function
        model = 'blista',
        coords = vector4(531.92, -185.0, 54.04, 358.96), -- # supports vector4
    }, function(veh)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
    end)
    
    local pos = QT.GetPosition(entity) -- # geting player coords and heading position
    print(pos)

    Qt.Item("item", function(source, item) -- # usable item example
    	if item == nil then
    		print("This item does not exist")
    	else
    		TriggerClientEvent('your_event_here', source)
    	end
    end)

    local closestveh = QT.CloseVeh(coords)
     if closestveh < 2.5 then 
      -- # checking closest veh in that distance and if is there any it will return entity 
     end
