
CreateProgress = function(msg, time)

end

SendNotify = function(data)

end

showText = function(data)

end

Notification = function(src, data)
    if Config.UseFrameworkNotification then 
        if ESX ~= nil then
            TriggerClientEvent('esx:showNotification', src, data.message)
        elseif QBCore ~= nil then
            TriggerClientEvent('QBCore:Notify', src, data.message)
        end
    else
        SendNotify(data)
    end
end
