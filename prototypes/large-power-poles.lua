data.raw["electric-pole"]["big-electric-pole"].fast_replaceable_group = "big-power-poles"

local electric_pole_base = util.table.deepcopy(data.raw["electric-pole"]["big-electric-pole"])
local item_base = util.table.deepcopy(data.raw["item"]["big-electric-pole"])

for x, large_power_pole in pairs(large_power_poles) do
    
    electric_pole = util.table.deepcopy(electric_pole_base)
    item = util.table.deepcopy(item_base)

    electric_pole.name = large_power_pole.name
    electric_pole.minable.result = large_power_pole.name
    electric_pole.max_health = large_power_pole.health
    electric_pole.supply_area_distance  = large_power_pole.area
    electric_pole.maximum_wire_distance  = large_power_pole.wire_reach

    item.name = large_power_pole.name
    item.place_result = large_power_pole.name
    item.subgroup = "ds-power-dist"

    data:extend({ electric_pole, item })
end