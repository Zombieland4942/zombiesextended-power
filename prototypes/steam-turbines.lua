
local turbine_base = util.table.deepcopy(data.raw["generator"]["steam-turbine"])
local item_base = util.table.deepcopy(data.raw["item"]["steam-turbine"])

for x, steam_turbine in pairs(steam_turbines) do
    
    turbine = util.table.deepcopy(turbine_base)
    item = util.table.deepcopy(item_base)

    turbine.name = steam_turbine.name
    turbine.icon = "__darkstar-power__/graphics/icons/" .. steam_turbine.name .. ".png"
    turbine.minable.result = steam_turbine.name
    turbine.max_health = steam_turbine.health
    turbine.maximum_temperature  = steam_turbine.max_temp
    turbine.fluid_usage_per_tick = steam_turbine.fluid_per_tick

    turbine.horizontal_animation.layers[1].filename  = "__darkstar-power__/graphics/entity/" .. steam_turbine.name .. "/steam-turbine-H.png"
    turbine.horizontal_animation.layers[1].hr_version.filename  = "__darkstar-power__/graphics/entity/" .. steam_turbine.name .. "/hr-steam-turbine-H.png"

    turbine.vertical_animation.layers[1].filename  = "__darkstar-power__/graphics/entity/" .. steam_turbine.name .. "/steam-turbine-V.png"
    turbine.vertical_animation.layers[1].hr_version.filename  = "__darkstar-power__/graphics/entity/" .. steam_turbine.name .. "/hr-steam-turbine-V.png"

    item.name = steam_turbine.name
    item.icon = "__darkstar-power__/graphics/icons/" .. steam_turbine.name .. ".png"
    item.place_result = steam_turbine.name
    item.subgroup = "ds-reactors"
    item.order = steam_turbine.order

    data:extend({ turbine, item })
end