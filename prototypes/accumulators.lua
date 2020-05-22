
local accumulator_base = util.table.deepcopy(data.raw["accumulator"]["accumulator"])
local item_base = util.table.deepcopy(data.raw["item"]["accumulator"])

for x, accumulator in pairs(accumulators) do
    
    accumul = util.table.deepcopy(accumulator_base)
    item = util.table.deepcopy(item_base)

    accumul.name = accumulator.name
    accumul.max_health = accumulator.health
    accumul.energy_source.buffer_capacity  = accumulator.buffer_mj .. "MJ"
    accumul.energy_source.input_flow_limit  = accumulator.flow_in_kw .. "kW"
    accumul.energy_source.output_flow_limit  = accumulator.flow_out_kw .. "kW"
    
    item.name = accumulator.name
    item.place_result = accumulator.name
    item.subgroup = "ds-accumulator"
    item.order = accumulator.order

    data:extend({ accumul, item })
end