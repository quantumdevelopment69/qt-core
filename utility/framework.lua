if Config.Framework == "esx" then 
    ESX = exports["es_extended"]:getSharedObject()
elseif Config.Framework == "qb" then 
    QBCore = exports['qb-core']:GetCoreObject()
end

