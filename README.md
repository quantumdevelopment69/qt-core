
QT = exports["qt-core"]:Utility() -- # for using core functions you can define like this 

    QT.CreateVeh({ -- # spawning vehicle is our functions we didnt use esx or qb function
        model = 'blista',
        coords = vector4(531.92, -185.0, 54.04, 358.96), -- # supports vector4
    }, function(veh)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
    end)
    
    local pos = GetPosition(entity) -- # geting player coords and heading position
    print(pos)