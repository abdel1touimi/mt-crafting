Config = {
    ["Main"] = {
        ["weapon_pistol_mk2"] = { -- item name
            itemName = "weapon_pistol_mk2", -- item name
            label = "PISTOL MK2", -- item label
            level = 10, -- amount of level requeried
            points = 5, -- how many points you win in 1 craft
            items = { -- requeried items
                [1] = {
                    item = "iron",
                    amount = 1,
                },
                [2] = {
                    item = "steel",
                    amount = 1,
                },
                [3] = {
                    item = "copper",
                    amount = 1,
                },
                [4] = {
                    item = "plastic",
                    amount = 1,
                },
            }
        },
        ["handcuffs"] = { -- item name
            itemName = "handcuffs", -- item name
            label = "HANDCUFFS", -- item label
            level = 0, -- amount of level requeried
            points = 1, -- how many points you win in 1 craft
            items = { -- requeried items
                [1] = {
                    item = "iron",
                    amount = 1,
                },
                [2] = {
                    item = "steel",
                    amount = 1,
                },
                [3] = {
                    item = "copper",
                    amount = 1,
                },
                [4] = {
                    item = "plastic",
                    amount = 1,
                },
            }
        },
    },
    ['MainLocation'] = {
        ['UseLocation'] = true,
        ['Location'] = vector3(1189.55, 2641.58, 38.4)
    }
}
