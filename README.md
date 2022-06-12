# mt-crafting
Simple crafting system full configurable for QBCore
- THIS IS A WIP SO IF SOMETHING IS NOT WORKING GOOD GIVE FEEDBACK AT MY DISCORD! :)

# Preview:
https://youtu.be/bo649JeniE4

# To emplement at future:
- level system with data base
- option to use job or gang
- option to add locations at config
- new props
- add logs option

# Installation:
Add to qb-core/shared/item.lua

```
	-- mt-crafting 2.0
	["mesa_craft"]  	= {["name"] = "mesa_craft", 			["label"] = "Crafting table", 								["weight"] = 100, 		["type"] = "item", 			["image"] = "mesa_craft.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},

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
                event = "mt-crafting:client:EliminarMesa",
                icon = "fas fa-table", 
                label = "Delete Table",
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
