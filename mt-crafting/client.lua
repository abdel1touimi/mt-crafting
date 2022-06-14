local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mt-crafting:client:AbrirMenuCraft', function()
    local columns = {
        {
            header = "Crafting Menu",
            isMenuHeader = true,
        },
    }
    for k, v in pairs(Config.Main) do
        local item = {}
        item.header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items[v.itemName].image.." width=35px style='margin-right: 10px'> " .. v.label
        local text = ""
        for k, v in pairs(v.items) do
            text = text .. "• " .. v.item .. ": " .. v.amount .. "x <br>"
        end
        item.text = text
        item.params = {
            event = 'mt-crafting:client:CraftItems',
            args = {
                type = k
            }
        }
        table.insert(columns, item)
    end

    exports['qb-menu']:openMenu(columns)
end)

local function CraftItems(item)
    local pontos = Config.Main[item].points
    if QBCore.Functions.GetPlayerData().metadata["craftinglevel"] >= Config.Main[item].level then
        QBCore.Functions.Progressbar('crafting', 'CRAFTING '..Config.Main[item].label, 5000, false, false, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "mini@repair",
            anim = "fixing_a_ped",
            }, {}, {}, function()
            QBCore.Functions.Notify("Crafted "..Config.Main[item].label, 'success')
            TriggerServerEvent('QBCore:Server:AddItem', Config.Main[item].itemName, 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.Main[item].itemName], "add")
            for k, v in pairs(Config.Main[item].items) do
                TriggerServerEvent('mt-crafting:server:AddPontos', pontos)
                TriggerServerEvent('QBCore:Server:RemoveItem', v.item, v.amount)
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[v.item], "remove")
            end
            ClearPedTasks(PlayerPedId())
        end)
    else
        QBCore.Functions.Notify('You dont have requeried level to craft this item!', 'error', 7500)
    end
end

RegisterNetEvent('mt-crafting:client:CraftItems', function(data)
    QBCore.Functions.TriggerCallback("mt-crafting:server:ItemsSuficientes", function(hasItems)
        if (hasItems) then
            CraftItems(data.type)
        else
            QBCore.Functions.Notify("You do not have the right items", "error")
            return
        end
    end, Config.Main[data.type].items)
end)

RegisterCommand('craft', function()
    TriggerEvent('mt-crafting:client:AbrirMenuCraft')
end)

RegisterNetEvent('mt-crafting:client:SpawnarMesa', function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)

    local model = `prop_tool_bench02_ld`
    RequestModel(model)
    while (not HasModelLoaded(model)) do
        Wait(1)
    end
    local obj = CreateObject(model, x, y, z, true, false, true)
    PlaceObjectOnGroundProperly(obj)
    SetEntityAsMissionEntity(obj)

    TriggerServerEvent('QBCore:Server:RemoveItem', 'mesa_craft', 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['mesa_craft'], "remove")
end)

RegisterNetEvent('mt-crafting:client:EliminarMesa', function()
    local coords = GetEntityCoords(PlayerPedId())
    local obj = QBCore.Functions.GetClosestObject(coords)
    if DoesEntityExist(obj) then
        DeleteEntity(obj)

        TriggerServerEvent('QBCore:Server:AddItem', 'mesa_craft', 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['mesa_craft'], "add")
    end
end)
