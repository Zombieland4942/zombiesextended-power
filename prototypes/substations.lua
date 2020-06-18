data.raw["electric-pole"]["substation"].fast_replaceable_group = "substations"

local substation_base = util.table.deepcopy(data.raw["electric-pole"]["substation"])
local item_base = util.table.deepcopy(data.raw["item"]["substation"])

for x, substation in pairs(substations) do
    
    sub = util.table.deepcopy(substation_base)
    item = util.table.deepcopy(item_base)

    sub.name = substation.name
    sub.icon = "__zombiesextended-power__/graphics/icons/" .. substation.name .. ".png"
    sub.minable.result = substation.name
    sub.max_health = substation.health
    sub.supply_area_distance  = substation.area
    sub.maximum_wire_distance  = substation.wire_reach

    sub.pictures.layers[1].filename = "__zombiesextended-power__/graphics/entity/" .. substation.name .. "/substation.png"
    sub.pictures.layers[1].hr_version.filename = "__zombiesextended-power__/graphics/entity/" .. substation.name .. "/hr-substation.png"

    item.name = substation.name    
    item.icon = "__zombiesextended-power__/graphics/icons/" .. substation.name .. ".png"
    item.place_result = substation.name
    item.subgroup = "ds-power-dist"

    table.insert(data.raw["technology"][substation.technology].effects, { type = "unlock-recipe", recipe = substation.name })

    data:extend({ sub, item,
        {
            type = "recipe",
            name = substation.name,
            enabled = false,
            ingredients = substation.ingredients,
            result = substation.name
        }
    })
end