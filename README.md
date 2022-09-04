# mt-crafting
Simple crafting system full configurable for QBCore using level system
- THIS IS A WIP SO IF SOMETHING IS NOT WORKING GOOD GIVE FEEDBACK AT MY DISCORD! :)

# Preview:
https://youtu.be/bo649JeniE4 [OUTDATED]

# To emplement at future:
- option to use job or gang
- Remove table item option and add locations to spawn tables at config.lua

# Installation:
Add to qb-smallresources/server/logs.lua
```
    ['crafting'] = '',
```

Add to qb-core/server/player.lua
```
    PlayerData.metadata['craftinglevel'] = PlayerData.metadata['craftinglevel'] or 0
```

Add to qb-core/shared/item.lua

```
	-- mt-crafting 2.0
	["mesa_craft"]  	= {["name"] = "mesa_craft", 			["label"] = "Crafting table", 								["weight"] = 70000, 		["type"] = "item", 			["image"] = "mesa_craft.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},

```

Add to qb-target/init.lua at Config.TargetModels
```
    ["mesa_craft"] = {
        models = {
            "prop_tool_bench02_ld",
        },
        options = {
            {
                type = "client",
                event = "mt-crafting:client:AbrirMenuCraft",
                icon = "fas fa-table", 
                label = "Craft Things",
            },
            {
                type = "client",
                action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
                    if IsPedAPlayer(entity) then return false end -- This will return false if the entity interacted with is a player and otherwise returns true
                    TriggerEvent('mt-crafting:client:EliminarMesa', entity) -- Triggers
                end,
                icon = "fas fa-table", 
                label = "Delete Table",
            },
                        {
                type = "client",
                event = "mt-crafting:client:VerificarPontos",
                icon = "fas fa-coins", 
                label = "Check Points",
            }
        },
        distance = 2.5,
    },
```

Add to images to qb-inventory/html/items.lua

# Dependicies:
- qb-core - https://github.com/qbcore-framework/qb-core
- qb-target - https://github.com/qbcore-framework/qb-target
- qb-menu - https://github.com/qbcore-framework/qb-menu

# Some code used from:
- https://github.com/CurlyLegend/qb-gunplug
