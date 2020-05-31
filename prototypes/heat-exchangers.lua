
local exchanger_base = util.table.deepcopy(data.raw["boiler"]["heat-exchanger"])
local item_base = util.table.deepcopy(data.raw["item"]["heat-exchanger"])

for x, heat_exchanger in pairs(heat_exchangers) do
    
    exchanger = util.table.deepcopy(exchanger_base)
    item = util.table.deepcopy(item_base)

    exchanger.name = heat_exchanger.name
    exchanger.icon = "__darkstar-power__/graphics/icons/" .. heat_exchanger.name .. ".png"

    exchanger.structure.north.layers[1].filename = "__darkstar-power__/graphics/entity/" .. heat_exchanger.name .. "/heatex-N-idle.png"
    exchanger.structure.north.layers[1].hr_version.filename = "__darkstar-power__/graphics/entity/" .. heat_exchanger.name .. "/hr-heatex-N-idle.png"
    exchanger.structure.east.layers[1].filename = "__darkstar-power__/graphics/entity/" .. heat_exchanger.name .. "/heatex-E-idle.png"
    exchanger.structure.east.layers[1].hr_version.filename = "__darkstar-power__/graphics/entity/" .. heat_exchanger.name .. "/hr-heatex-E-idle.png"
    exchanger.structure.south.layers[1].filename = "__darkstar-power__/graphics/entity/" .. heat_exchanger.name .. "/heatex-S-idle.png"
    exchanger.structure.south.layers[1].hr_version.filename = "__darkstar-power__/graphics/entity/" .. heat_exchanger.name .. "/hr-heatex-S-idle.png"
    exchanger.structure.west.layers[1].filename = "__darkstar-power__/graphics/entity/" .. heat_exchanger.name .. "/heatex-W-idle.png"
    exchanger.structure.west.layers[1].hr_version.filename = "__darkstar-power__/graphics/entity/" .. heat_exchanger.name .. "/hr-heatex-W-idle.png"

    exchanger.minable.result = heat_exchanger.name
    exchanger.max_health = heat_exchanger.health
    exchanger.target_temperature = heat_exchanger.target_temp
    exchanger.energy_consumption = heat_exchanger.energy_con_mw .. "MW"
    exchanger.energy_source.max_temperature = heat_exchanger.max_temp
    
    item.name = heat_exchanger.name
    item.icon = "__darkstar-power__/graphics/icons/" .. heat_exchanger.name .. ".png"
    item.place_result = heat_exchanger.name
    item.subgroup = "ds-reactors"
    item.order = heat_exchanger.order
    
    table.insert(data.raw["technology"][heat_exchanger.technology].effects, { type = "unlock-recipe", recipe = heat_exchanger.name })

    data:extend({ exchanger, item,
        {
            type = "recipe",
            name = heat_exchanger.name,
            enabled = false,
            ingredients = heat_exchanger.ingredients,
            result = heat_exchanger.name
        }
    })
end