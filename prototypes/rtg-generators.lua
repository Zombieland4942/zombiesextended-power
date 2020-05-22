
local eei_base = util.table.deepcopy(data.raw["electric-energy-interface"]["electric-energy-interface"])
local item_base = util.table.deepcopy(data.raw["item"]["electric-energy-interface"])

for x, rtg_gennie in pairs(rtg_generators) do
    
    rtg = util.table.deepcopy(eei_base)
    item = util.table.deepcopy(item_base)

    rtg.name = rtg_gennie.name
    rtg.minable.result = rtg_gennie.name
    rtg.max_health = rtg_gennie.health
    rtg.maximum_temperature  = rtg_gennie.max_temp

    rtg.energy_source.buffer_capacity = "10MJ"
    rtg.energy_source.usage_priority = "primary-output"    
    rtg.energy_source.input_flow_limit = "0kW"
    rtg.energy_source.output_flow_limit = rtg_gennie.production_kw .. "kW"
    rtg.energy_source.render_no_power_icon = false

    rtg.energy_production = rtg_gennie.production_kw .. "kW"
    rtg.energy_usage = "0kW"

    rtg.gui_mode = "none"

    item.name = rtg_gennie.name
    item.place_result = rtg_gennie.name
    item.subgroup = "ds-rtg"
    item.order = rtg_gennie.order

    data:extend({ rtg, item })
end