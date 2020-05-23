data.raw["electric-pole"]["medium-electric-pole"].fast_replaceable_group = "medium-power-poles"

local electric_pole_base = util.table.deepcopy(data.raw["electric-pole"]["medium-electric-pole"])
local item_base = util.table.deepcopy(data.raw["item"]["medium-electric-pole"])

for x, medium_power_pole in pairs(medium_power_poles) do
    
    electric_pole = util.table.deepcopy(electric_pole_base)
    item = util.table.deepcopy(item_base)

    electric_pole.name = medium_power_pole.name
    electric_pole.minable.result = medium_power_pole.name
    electric_pole.max_health = medium_power_pole.health
    electric_pole.supply_area_distance  = medium_power_pole.area
    electric_pole.maximum_wire_distance  = medium_power_pole.wire_reach

    item.name = medium_power_pole.name
    item.place_result = medium_power_pole.name
    item.subgroup = "ds-power-dist"

    data:extend({ electric_pole, item })
end