
local eei_base = util.table.deepcopy(data.raw["electric-energy-interface"]["electric-energy-interface"])
local item_base = util.table.deepcopy(data.raw["item"]["electric-energy-interface"])

for x, geothermal_gennie in pairs(geothermal_generators) do
    
    geothermal = util.table.deepcopy(eei_base)
    item = util.table.deepcopy(item_base)

    geothermal.name = geothermal_gennie.name
    geothermal.minable.result = geothermal_gennie.name
    geothermal.max_health = geothermal_gennie.health
    geothermal.maximum_temperature  = geothermal_gennie.max_temp

    geothermal.energy_source.buffer_capacity = "10MJ"
    geothermal.energy_source.usage_priority = "primary-output"    
    geothermal.energy_source.input_flow_limit = "0kW"
    geothermal.energy_source.output_flow_limit = geothermal_gennie.production_kw .. "kW"
    geothermal.energy_source.render_no_power_icon = false

    geothermal.energy_production = geothermal_gennie.production_kw .. "kW"
    geothermal.energy_usage = "0kW"

    geothermal.gui_mode = "none"

    item.name = geothermal_gennie.name
    item.place_result = geothermal_gennie.name
    item.subgroup = "ds-geothermal"
    item.order = geothermal_gennie.order

    data:extend({ geothermal, item })
end