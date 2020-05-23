data.raw["electric-pole"]["substation"].fast_replaceable_group = "substations"

local substation_base = util.table.deepcopy(data.raw["electric-pole"]["substation"])
local item_base = util.table.deepcopy(data.raw["item"]["substation"])

for x, substation in pairs(substations) do
    
    sub = util.table.deepcopy(substation_base)
    item = util.table.deepcopy(item_base)

    sub.name = substation.name
    sub.minable.result = substation.name
    sub.max_health = substation.health
    sub.supply_area_distance  = substation.area
    sub.maximum_wire_distance  = substation.wire_reach

    item.name = substation.name
    item.place_result = substation.name
    item.subgroup = "ds-power-dist"

    data:extend({ sub, item })
end