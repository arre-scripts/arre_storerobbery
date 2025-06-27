if Config.Framework == "esx" then
    ESX = exports["es_extended"]:getSharedObject()
elseif Config.Framework == "qb" then
    QBCore = exports['qb-core']:GetCoreObject()
end

local lastRobberyTime = 0
local robberyCooldown = (Config.RobberyCooldown.StoreRobberyCooldown or 300) * 1000

exports.ox_target:addModel("prop_till_01", {
    label = "Rob",
    icon = "fa-solid fa-gun",
    onSelect = function ()
        local currentTime = GetGameTimer()
        lastRobberyTime = lastRobberyTime or 0
        local timeSinceLastRobbery = currentTime - lastRobberyTime

        if timeSinceLastRobbery < robberyCooldown then
            local timeLeft = math.ceil((robberyCooldown - timeSinceLastRobbery) / 1000)
            if Config.Framework == "esx" then
            ESX.ShowNotification("You have to wait " .. timeLeft .. " seconds before you can rob again.")
            elseif Config.Framework == "qb" then
                QBCore.Functions.Notify("You have to wait " .. timeLeft .. " seconds before you can rob again.")
            end
            return
        end

        lib.playAnim(PlayerPedId(), "anim@heists@ornate_bank@grab_cash", "grab", 8.0, -8.0, Config.RobberyCooldown.TakeMoneyCooldown, 49, 0.0, false, 0, false)

        SetTimeout(Config.RobberyCooldown.TakeMoneyCooldown, function ()
            if Config.Framework == "esx" then
            ESX.TriggerServerCallback("arre_storerobbery:giveblackmoney")
            elseif
            Config.Framework == "qb" then
                TriggerServerEvent("arre_storerobbery:giveblackmoney")
            end
        end)

        lastRobberyTime = GetGameTimer()
    end
})
