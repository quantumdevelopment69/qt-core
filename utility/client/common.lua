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

    CreateVeh = function(data, cb)
        local playerPed = PlayerPedId()
        local vehiclehash = GetHashKey(data.model)
        RequestModel(vehiclehash)
        CreateThread(function()
            local waiting = 0
            while not HasModelLoaded(vehiclehash) do
                waiting = waiting + 100
                Wait(100)
                if waiting > 5000 then
                    break
                end
            end
            local vehicle = CreateVehicle(vehiclehash, vector3(data.coords.x, data.coords.y, data.coords.z), data.coords.w, 1, 0)
            cb(vehicle)
        end)
    end,


    Cmd = function(name, handler, restricted)
        if ESX ~= nil then
            RegisterCommand(name, handler, restricted)
        elseif QBCore ~= nil then
            QBCore.Commands.Add(name, handler)
        end
    end,

    Notification = function(data)
        if Config.UseFrameworkNotification then 
            if ESX ~= nil then
                ESX.ShowNotification(data.message)
            elseif QBCore ~= nil then
                QBCore.Functions.Notify(data.message)
            end
        else
            SendNotify(data)
        end
    end,

    OpenStash = function(id, label, slots, weight, owner)
        if Config.Inventory == 'default' then
            if ESX ~= nil then
                -- no default stash
                if Config.Debug == true then
                    print('stash for default esx_addoninventory is not supported.')
                end
            elseif QBCore ~= nil then
                TriggerServerEvent('inventory:server:OpenInventory', 'stash', id, {
                    maxweight = weight,
                    slots = slots
                })
                TriggerEvent('inventory:client:SetCurrentStash', id)
            end
        elseif Config.Inventory == 'ox-inventory' then
            exports.ox_inventory:openInventory('stash', {id = id})
        elseif Config.Inventory == 'qs-inventory' then
            TriggerServerEvent('inventory:server:OpenInventory', 'stash', id, {
                maxweight = weight,
                slots = slots
            })
            TriggerEvent('inventory:client:SetCurrentStash', id)
        end
    end,
    
}

