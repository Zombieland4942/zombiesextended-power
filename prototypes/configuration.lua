
accumulators = {
    { order = "a", name = "accumulator-mk1", health = 150, buffer_mj = 10, flow_in_kw = 600, flow_out_kw = 600 },
    { order = "b", name = "accumulator-mk2", health = 200, buffer_mj = 20, flow_in_kw = 1200, flow_out_kw = 1200 },
    { order = "c", name = "accumulator-mk3", health = 200, buffer_mj = 40, flow_in_kw = 2400, flow_out_kw = 2400 },
    { order = "d", name = "accumulator-mk4", health = 250, buffer_mj = 80, flow_in_kw = 4800, flow_out_kw = 4800 },
    { order = "e", name = "accumulator-mk5", health = 250, buffer_mj = 160, flow_in_kw = 9600, flow_out_kw = 9600 },
}

solar_panels = {
    { order = "f", name = "solar-panel-mk1", health = 200, production_kw = 120 },
    { order = "g", name = "solar-panel-mk2", health = 250, production_kw = 240 },
    { order = "h", name = "solar-panel-mk3", health = 250, production_kw = 480 },
    { order = "i", name = "solar-panel-mk4", health = 300, production_kw = 960 },
    { order = "j", name = "solar-panel-mk5", health = 300, production_kw = 1920 },
}

geothermal_generators = {
    { order = "a", name = "geothermal-mk1", health = 200, production_kw = 1000 },
    { order = "b", name = "geothermal-mk2", health = 200, production_kw = 2000 },
    { order = "c", name = "geothermal-mk3", health = 250, production_kw = 4000 },
    { order = "d", name = "geothermal-mk4", health = 250, production_kw = 8000 },
    { order = "e", name = "geothermal-mk5", health = 300, production_kw = 16000 },
}

rtg_generators = {
    { order = "a", name = "rtg-mk1", health = 100, production_kw = 30 },
    { order = "b", name = "rtg-mk2", health = 150, production_kw = 60 },
    { order = "c", name = "rtg-mk3", health = 200, production_kw = 120 },
    { order = "d", name = "rtg-mk4", health = 200, production_kw = 240 },
}

adv_reactors = {
    { order = "a", name = "adv-reactor-mk1", health = 750, production_mw = 80, max_temp = 2000, specific_heat_mj = 20 },
    { order = "b", name = "adv-reactor-mk2", health = 1000, production_mw = 160, max_temp = 4000, specific_heat_mj = 40 },
    { order = "c", name = "adv-reactor-mk3", health = 1250, production_mw = 320, max_temp = 8000, specific_heat_mj = 80 }
}

heat_exchangers = {
    { order = "d", name = "heat-exchanger-mk1", health = 250, target_temp = 500, energy_con_mw = 20, max_temp = 1000 },
    { order = "e", name = "heat-exchanger-mk2", health = 300, target_temp = 500, energy_con_mw = 40, max_temp = 1000 },
    { order = "f", name = "heat-exchanger-mk3", health = 350, target_temp = 500, energy_con_mw = 80, max_temp = 1000 }
}

steam_turbines = {
    { order = "g", name = "steam-turbine-mk1", health = 350, max_temp = 500, fluid_per_tick = 2 },
    { order = "h", name = "steam-turbine-mk2", health = 400, max_temp = 500, fluid_per_tick = 4 },
    { order = "i", name = "steam-turbine-mk3", health = 450, max_temp = 500, fluid_per_tick = 8 }
}

adv_fuel_cells = {
    { order = "j", name = "adv-fuel-cell-mk1", fuel_value = "16GJ" },
    { order = "k", name = "adv-fuel-cell-mk2", fuel_value = "32GJ" },
    { order = "l", name = "adv-fuel-cell-mk3", fuel_value = "64GJ" },
}

medium_power_poles = {
    { order = "a", name = "medium-power-pole-mk1", health = 100, wire_reach = 18, area = 7 },
    { order = "b", name = "medium-power-pole-mk2", health = 150, wire_reach = 36, area = 14 },
}

large_power_poles = {
    { order = "c", name = "large-power-pole-mk1", health = 150, wire_reach = 45, area = 2 },
    { order = "d", name = "large-power-pole-mk2", health = 200, wire_reach = 64, area = 2 },
}

substations = {
    { order = "e", name = "substation-mk1", health = 250, wire_reach = 34, area = 17 },
    { order = "f", name = "substation-mk2", health = 350, wire_reach = 64, area = 32 },
}