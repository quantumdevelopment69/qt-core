QT = {

    TriggerCallback = function(name, cb, ...)
        if ESX ~= nil then
            ESX.TriggerServerCallback(name, cb, ...)
        elseif QBCore ~= nil then
            QBCore.Functions.TriggerCallback(name, cb, ...)
        end
    end,

    getjob = function()
        if ESX ~= nil then
            return ESX.GetPlayerData().job.name
        elseif QBCore ~= nil then
            return QBCore.Functions.GetPlayerData().job.name
        end
    end,

     ZoneCheck = function(v, num)
        local ply = GetEntityCoords(PlayerPedId())
        local dist = #(ply - vector3(v.x, v.y, v.z))
        if dist <= num then 
            return true 
        else
            return false
        end
    end,

    CloseVeh = function(coords)
        if ESX ~= nil then
            return ESX.Game.GetClosestVehicle(coords)
        elseif QBCore ~= nil then
            return QBCore.Functions.GetClosestVehicle(coords)
        end
    end,

    GetPosition = function(entity)
        return vector4(GetEntityCoords(entity), GetEntityHeading(entity))
    end,

    CreateVeh = function(model, cb, ...)
        if ESX ~= nil then
            return ESX.Game.SpawnVehicle(model, cb, ...)
        elseif QBCore ~= nil then
            return QBCore.Functions.SpawnVehicle(model, cb, ...)
        end
    end,
    
}

