
local turbine_base = util.table.deepcopy(data.raw["generator"]["steam-turbine"])
local item_base = util.table.deepcopy(data.raw["item"]["steam-turbine"])

for x, steam_turbine in pairs(steam_turbines) do
    
    turbine = util.table.deepcopy(turbine_base)
    item = util.table.deepcopy(item_base)

    turbine.name = steam_turbine.name
    turbine.icon = "__zombiesextended-power__/graphics/icons/" .. steam_turbine.name .. ".png"
    turbine.minable.result = steam_turbine.name
    turbine.max_health = steam_turbine.health
    turbine.maximum_temperature  = steam_turbine.max_temp
    turbine.fluid_usage_per_tick = steam_turbine.fluid_per_tick
    turbine.next_upgrade = steam_turbine.next_upgrade

    turbine.horizontal_animation.layers[1].filename  = "__zombiesextended-power__/graphics/entity/" .. steam_turbine.name .. "/steam-turbine-H.png"
    turbine.horizontal_animation.layers[1].hr_version.filename  = "__zombiesextended-power__/graphics/entity/" .. steam_turbine.name .. "/hr-steam-turbine-H.png"

    turbine.vertical_animation.layers[1].filename  = "__zombiesextended-power__/graphics/entity/" .. steam_turbine.name .. "/steam-turbine-V.png"
    turbine.vertical_animation.layers[1].hr_version.filename  = "__zombiesextended-power__/graphics/entity/" .. steam_turbine.name .. "/hr-steam-turbine-V.png"

    turbine.fluid_box.filter = "heavy-steam"

    item.name = steam_turbine.name
    item.icon = "__zombiesextended-power__/graphics/icons/" .. steam_turbine.name .. ".png"
    item.place_result = steam_turbine.name
    item.order = item.order .. steam_turbine.order

    if settings.startup["zombies-use-seperate-tab"].value == true then        
        item.subgroup = "ds-reactors"
    end  
    
    table.insert(data.raw["technology"][steam_turbine.technology].effects, { type = "unlock-recipe", recipe = steam_turbine.name })

    data:extend({ turbine, item,
        {
            type = "recipe",
            name = steam_turbine.name,
            enabled = false,
            energy_required = steam_turbine.craft_time,
            ingredients = steam_turbine.ingredients,
            result = steam_turbine.name
        }
    })
end