
local exchanger_base = util.table.deepcopy(data.raw["boiler"]["heat-exchanger"])
local item_base = util.table.deepcopy(data.raw["item"]["heat-exchanger"])

for x, heat_exchanger in pairs(heat_exchangers) do
    
    exchanger = util.table.deepcopy(exchanger_base)
    item = util.table.deepcopy(item_base)

    exchanger.name = heat_exchanger.name
    exchanger.max_health = heat_exchanger.health
    exchanger.target_temperature = heat_exchanger.target_temp
    exchanger.energy_consumption = heat_exchanger.energy_con_mw .. "MW"
    exchanger.energy_source.max_temperature = heat_exchanger.max_temp
    
    item.name = heat_exchanger.name
    item.place_result = heat_exchanger.name
    item.subgroup = "ds-reactors"
    item.order = heat_exchanger.order

    data:extend({ exchanger, item })
end