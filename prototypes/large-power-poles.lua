data.raw["electric-pole"]["big-electric-pole"].fast_replaceable_group = "big-power-poles"

local electric_pole_base = util.table.deepcopy(data.raw["electric-pole"]["big-electric-pole"])
local item_base = util.table.deepcopy(data.raw["item"]["big-electric-pole"])

for x, large_power_pole in pairs(large_power_poles) do
    
    electric_pole = util.table.deepcopy(electric_pole_base)
    item = util.table.deepcopy(item_base)

    electric_pole.name = large_power_pole.name
    electric_pole.icon = "__darkstar-power__/graphics/icons/" .. large_power_pole.name .. ".png"
    electric_pole.minable.result = large_power_pole.name
    electric_pole.max_health = large_power_pole.health
    electric_pole.supply_area_distance  = large_power_pole.area
    electric_pole.maximum_wire_distance  = large_power_pole.wire_reach

    electric_pole.pictures.layers[1].filename = "__darkstar-power__/graphics/entity/" .. large_power_pole.name .. "/big-electric-pole.png"
    electric_pole.pictures.layers[1].hr_version.filename = "__darkstar-power__/graphics/entity/" .. large_power_pole.name .. "/hr-big-electric-pole.png"

    item.name = large_power_pole.name
    item.icon = "__darkstar-power__/graphics/icons/" .. large_power_pole.name .. ".png"
    item.place_result = large_power_pole.name
    item.subgroup = "ds-power-dist"

    data:extend({ electric_pole, item })
end