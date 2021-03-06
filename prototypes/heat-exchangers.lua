
local exchanger_base = util.table.deepcopy(data.raw["boiler"]["heat-exchanger"])
local item_base = util.table.deepcopy(data.raw["item"]["heat-exchanger"])

for x, heat_exchanger in pairs(heat_exchangers) do
    
    exchanger = util.table.deepcopy(exchanger_base)
    item = util.table.deepcopy(item_base)

    exchanger.name = heat_exchanger.name
    exchanger.icon = "__zombiesextended-power__/graphics/icons/" .. heat_exchanger.name .. ".png"

    exchanger.structure.north.layers[1].filename = "__zombiesextended-power__/graphics/entity/" .. heat_exchanger.name .. "/heatex-N-idle.png"
    exchanger.structure.north.layers[1].hr_version.filename = "__zombiesextended-power__/graphics/entity/" .. heat_exchanger.name .. "/hr-heatex-N-idle.png"
    exchanger.structure.east.layers[1].filename = "__zombiesextended-power__/graphics/entity/" .. heat_exchanger.name .. "/heatex-E-idle.png"
    exchanger.structure.east.layers[1].hr_version.filename = "__zombiesextended-power__/graphics/entity/" .. heat_exchanger.name .. "/hr-heatex-E-idle.png"
    exchanger.structure.south.layers[1].filename = "__zombiesextended-power__/graphics/entity/" .. heat_exchanger.name .. "/heatex-S-idle.png"
    exchanger.structure.south.layers[1].hr_version.filename = "__zombiesextended-power__/graphics/entity/" .. heat_exchanger.name .. "/hr-heatex-S-idle.png"
    exchanger.structure.west.layers[1].filename = "__zombiesextended-power__/graphics/entity/" .. heat_exchanger.name .. "/heatex-W-idle.png"
    exchanger.structure.west.layers[1].hr_version.filename = "__zombiesextended-power__/graphics/entity/" .. heat_exchanger.name .. "/hr-heatex-W-idle.png"

    exchanger.next_upgrade = heat_exchanger.next_upgrade

    exchanger.minable.result = heat_exchanger.name
    exchanger.max_health = heat_exchanger.health
    exchanger.target_temperature = heat_exchanger.target_temp
    exchanger.energy_consumption = heat_exchanger.energy_con_mw .. "MW"
    exchanger.energy_source.max_temperature = heat_exchanger.max_temp
    
    exchanger.fluid_box.filter = "heavy-water"
    exchanger.output_fluid_box.filter = "heavy-steam"

    item.name = heat_exchanger.name
    item.icon = "__zombiesextended-power__/graphics/icons/" .. heat_exchanger.name .. ".png"
    item.place_result = heat_exchanger.name
    item.order = item.order .. heat_exchanger.order

    if settings.startup["zombies-use-seperate-tab"].value == true then        
        item.subgroup = "ds-reactors"
    end  
    
    table.insert(data.raw["technology"][heat_exchanger.technology].effects, { type = "unlock-recipe", recipe = heat_exchanger.name })

    data:extend({ exchanger, item,
        {
            type = "recipe",
            name = heat_exchanger.name,
            enabled = false,
            energy_required = heat_exchanger.craft_time,
            ingredients = heat_exchanger.ingredients,
            result = heat_exchanger.name
        }
    })
end