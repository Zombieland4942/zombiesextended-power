
local turbine_base = util.table.deepcopy(data.raw["generator"]["steam-turbine"])
local item_base = util.table.deepcopy(data.raw["item"]["steam-turbine"])

for x, steam_turbine in pairs(steam_turbines) do
    
    turbine = util.table.deepcopy(turbine_base)
    item = util.table.deepcopy(item_base)

    turbine.name = steam_turbine.name
    turbine.max_health = steam_turbine.health
    turbine.maximum_temperature  = steam_turbine.max_temp
    turbine.fluid_usage_per_tick = steam_turbine.fluid_per_tick

    item.name = steam_turbine.name
    item.place_result = steam_turbine.name
    item.subgroup = "ds-steam-turbines"
    item.order = steam_turbine.order

    data:extend({ turbine, item })
end