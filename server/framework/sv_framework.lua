if (GetResourceState("es_extended") == "started") then
    Framework = "ESX"
    ESX = exports["es_extended"]:getSharedObject()
    print("[INFO] - ESX Framework")
elseif (GetResourceState("qb-core") == "started") then
    Framework = "QBCore"
    QBCore = exports['qb-core']:GetCoreObject()
    print("[INFO] - QBCore Framework")
end