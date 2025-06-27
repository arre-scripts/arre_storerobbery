if Config.Framework == "esx" then
    ESX = exports["es_extended"]:getSharedObject()
elseif Config.Framework == "qb" then
    QBCore = exports['qb-core']:GetCoreObject()
end

if Config.Framework == "esx" then
ESX.RegisterServerCallback("arre_storerobbery:giveblackmoney", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addAccountMoney('black_money', math.random(1000))
end)
elseif Config.Framework == "qb" then
RegisterNetEvent("arre_storerobbery:giveblackmoney", function ()
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        Player.Functions.AddMoney('cash', math.random(1000))
        end
    end)
end