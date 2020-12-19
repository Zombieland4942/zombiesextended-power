local science_t1 = {{"automation-science-pack",1}}
local science_t2 = {{"automation-science-pack",1},{"logistic-science-pack",1}}
local science_t3 = {{"automation-science-pack",1},{"logistic-science-pack",1},{"chemical-science-pack",1}}
local science_t4 = {{"automation-science-pack",1},{"logistic-science-pack",1},{"chemical-science-pack",1},{"production-science-pack",1}}
local science_t5 = {{"automation-science-pack",1},{"logistic-science-pack",1},{"chemical-science-pack",1},{"production-science-pack",1},{"utility-science-pack",1}}
local science_t6 = {{"automation-science-pack",1},{"logistic-science-pack",1},{"chemical-science-pack",1},{"production-science-pack",1},{"utility-science-pack",1},{"space-science-pack",1}}

technologies = {
    { order = "a-b-c", name = "solar-mk1", count = 400, time = 30, prerequisite = {"solar-energy"}, ingredients = science_t3 },
    { order = "a-b-d", name = "solar-mk2", count = 500, time = 45, prerequisite = {"solar-mk1"}, ingredients = science_t4 },
    { order = "a-b-e", name = "solar-mk3", count = 600, time = 45, prerequisite = {"solar-mk2"}, ingredients = science_t5 },
    { order = "a-b-f", name = "solar-mk4", count = 700, time = 60, prerequisite = {"solar-mk3"}, ingredients = science_t6 },
    { order = "a-b-g", name = "solar-mk5", count = 800, time = 60, prerequisite = {"solar-mk4"}, ingredients = science_t6 },

    { order = "a-b-g", name = "heavy-water-processing", count = 800, time = 60, prerequisite = {"nuclear-power"}, ingredients = science_t3 },

    { order = "a-b-h", name = "nuclear-mk1", count = 900, time = 60, prerequisite = {"nuclear-power"}, ingredients = science_t4 },
    { order = "a-b-i", name = "nuclear-mk2", count = 1000, time = 60, prerequisite = {"nuclear-mk1"}, ingredients = science_t5 },
    { order = "a-b-j", name = "nuclear-mk3", count = 1100, time = 60, prerequisite = {"nuclear-mk2"}, ingredients = science_t6 },

    { order = "a-b-k", name = "electric-energy-distribution-3", count = 200, time = 60, prerequisite = {"electric-energy-distribution-2"}, ingredients = science_t3 },
    { order = "a-b-l", name = "electric-energy-distribution-4", count = 300, time = 60, prerequisite = {"electric-energy-distribution-3"}, ingredients = science_t4 },

    { order = "a-b-g", name = "adv-nuclear-fuel-reprocessing", count = 800, time = 60, prerequisite = {"nuclear-fuel-reprocessing"}, ingredients = science_t4 },
}

-- Need to mod some vanilla items in order for the upgrade planner to work
data.raw["solar-panel"]["solar-panel"].fast_replaceable_group = "solar-panel"
data.raw["solar-panel"]["solar-panel"].next_upgrade = "solar-panel-mk1"
data.raw["accumulator"]["accumulator"].fast_replaceable_group = "accumulator"
data.raw["accumulator"]["accumulator"].next_upgrade = "accumulator-mk1"
data.raw["reactor"]["nuclear-reactor"].fast_replaceable_group = "reactor"
data.raw["reactor"]["nuclear-reactor"].next_upgrade = "adv-reactor-mk1"
data.raw["boiler"]["heat-exchanger"].fast_replaceable_group = "heat-exchanger"
data.raw["boiler"]["heat-exchanger"].next_upgrade = "heat-exchanger-mk1"
data.raw["generator"]["steam-turbine"].fast_replaceable_group = "steam-engine"
data.raw["generator"]["steam-turbine"].next_upgrade = "steam-turbine-mk1"
data.raw["heat-pipe"]["heat-pipe"].fast_replaceable_group = "heat-pipe"
data.raw["heat-pipe"]["heat-pipe"].next_upgrade = "heat-pipe-mk1"
data.raw["electric-pole"]["big-electric-pole"].fast_replaceable_group = "large-power-pole"
data.raw["electric-pole"]["big-electric-pole"].next_upgrade = "large-power-pole-mk1"
data.raw["electric-pole"]["medium-electric-pole"].fast_replaceable_group = "electric-pole"
data.raw["electric-pole"]["medium-electric-pole"].next_upgrade = "medium-power-pole-mk1"
data.raw["electric-pole"]["substation"].fast_replaceable_group = "substation"
data.raw["electric-pole"]["substation"].next_upgrade = "substation-mk1"

solar_panels = {
    { order = "a", name = "solar-panel-mk1", health = 200, production_kw = 480, next_upgrade = "solar-panel-mk2", ingredients = { {"solar-panel", 9},{"complex-processing-unit", 4} }, technology = "solar-mk1" },
    { order = "b", name = "solar-panel-mk2", health = 200, production_kw = 3840, next_upgrade = "solar-panel-mk3", ingredients = { {"solar-panel-mk1", 9},{"complex-processing-unit", 4} }, technology = "solar-mk2" },
    { order = "c", name = "solar-panel-mk3", health = 200, production_kw = 30720, next_upgrade = "solar-panel-mk4", ingredients = { {"solar-panel-mk2", 9},{"complex-processing-unit", 5},{"vibranium-plate", 2} }, technology = "solar-mk3" },
    { order = "d", name = "solar-panel-mk4", health = 200, production_kw = 245760, next_upgrade = "solar-panel-mk5", ingredients = { {"solar-panel-mk3", 9},{"complex-processing-unit", 5},{"vibranium-plate", 2} }, technology = "solar-mk4" },
    { order = "e", name = "solar-panel-mk5", health = 200, production_kw = 1966080, next_upgrade = "", ingredients = { {"solar-panel-mk4", 9},{"complex-processing-unit", 5},{"vibranium-plate", 2} }, technology = "solar-mk5" },
}

accumulators = {
    { order = "a", name = "accumulator-mk1", health = 150, buffer_mj = 40, flow_in_kw = 2400, flow_out_kw = 2400, next_upgrade = "accumulator-mk2", ingredients = { {"accumulator", 9},{"complex-processing-unit", 4} }, technology = "solar-mk1" },
    { order = "b", name = "accumulator-mk2", health = 150, buffer_mj = 320, flow_in_kw = 19200, flow_out_kw = 19200, next_upgrade = "accumulator-mk3", ingredients = { {"accumulator-mk1", 9},{"complex-processing-unit", 4} }, technology = "solar-mk2" },
    { order = "c", name = "accumulator-mk3", health = 150, buffer_mj = 2560, flow_in_kw = 153600, flow_out_kw = 153600, next_upgrade = "accumulator-mk4", ingredients = { {"accumulator-mk2", 9},{"complex-processing-unit", 5},{"vibranium-plate", 2} }, technology = "solar-mk3" },
    { order = "d", name = "accumulator-mk4", health = 150, buffer_mj = 20480, flow_in_kw = 1228800, flow_out_kw = 1228800, next_upgrade = "accumulator-mk5", ingredients = { {"accumulator-mk3", 9},{"complex-processing-unit", 5},{"vibranium-plate", 2} }, technology = "solar-mk4" },
    { order = "e", name = "accumulator-mk5", health = 150, buffer_mj = 163840, flow_in_kw = 9830400, flow_out_kw = 9830400, next_upgrade = "", ingredients = { {"accumulator-mk4", 9},{"complex-processing-unit", 5},{"vibranium-plate", 2} }, technology = "solar-mk5" },
}

-- RTG's Not added for the moment
rtg_generators = {
    { order = "a", name = "rtg-mk1", health = 100, production_kw = 30 },
    { order = "b", name = "rtg-mk2", health = 150, production_kw = 60 },
    { order = "c", name = "rtg-mk3", health = 200, production_kw = 120 },
    { order = "d", name = "rtg-mk4", health = 250, production_kw = 240 },
    { order = "e", name = "rtg-mk5", health = 300, production_kw = 480 },
}

-- Geothermal's Not added for the moment
geothermal_generators = {
    { order = "f", name = "geothermal-mk1", health = 200, production_kw = 1000 },
    { order = "g", name = "geothermal-mk2", health = 200, production_kw = 2000 },
    { order = "h", name = "geothermal-mk3", health = 250, production_kw = 4000 },
    { order = "i", name = "geothermal-mk4", health = 250, production_kw = 8000 },
    { order = "j", name = "geothermal-mk5", health = 300, production_kw = 16000 },
}

adv_reactors = {
    { order = "a", name = "adv-reactor-mk1", health = 500, production_mw = 80, max_temp = 2000, specific_heat_mj = 20, next_upgrade = "adv-reactor-mk2", ingredients = { {"nuclear-reactor", 3},{"complex-processing-unit", 2} }, technology = "nuclear-mk1" },
    { order = "b", name = "adv-reactor-mk2", health = 500, production_mw = 160, max_temp = 4000, specific_heat_mj = 40, next_upgrade = "adv-reactor-mk3", ingredients = { {"adv-reactor-mk1", 3},{"complex-processing-unit", 5},{"vibranium-plate", 2} }, technology = "nuclear-mk2" },
    { order = "c", name = "adv-reactor-mk3", health = 500, production_mw = 320, max_temp = 8000, specific_heat_mj = 80, next_upgrade = "", ingredients = { {"adv-reactor-mk2", 3},{"complex-processing-unit", 5},{"vibranium-plate", 2} }, technology = "nuclear-mk3" }
}

heat_exchangers = {
    { order = "a", name = "heat-exchanger-mk1", health = 250, target_temp = 500, energy_con_mw = 20, max_temp = 1000, next_upgrade = "heat-exchanger-mk2", ingredients = { {"heat-exchanger", 3},{"complex-processing-unit", 2} }, technology = "nuclear-mk1"  },
    { order = "b", name = "heat-exchanger-mk2", health = 250, target_temp = 500, energy_con_mw = 40, max_temp = 1000, next_upgrade = "heat-exchanger-mk3", ingredients = { {"heat-exchanger-mk1", 3},{"complex-processing-unit", 5},{"vibranium-plate", 2} }, technology = "nuclear-mk2"  },
    { order = "c", name = "heat-exchanger-mk3", health = 250, target_temp = 500, energy_con_mw = 80, max_temp = 1000, next_upgrade = "", ingredients = { {"heat-exchanger-mk2", 3},{"complex-processing-unit", 5},{"vibranium-plate", 2} }, technology = "nuclear-mk3"  }
}

steam_turbines = {
    { order = "a", name = "steam-turbine-mk1", health = 350, max_temp = 500, fluid_per_tick = 0.5, next_upgrade = "steam-turbine-mk2", ingredients = { {"steam-turbine", 3},{"complex-processing-unit", 2} }, technology = "nuclear-mk1" },
    { order = "b", name = "steam-turbine-mk2", health = 400, max_temp = 500, fluid_per_tick = 1, next_upgrade = "steam-turbine-mk3", ingredients = { {"steam-turbine-mk1", 3},{"complex-processing-unit", 5},{"vibranium-plate", 2} }, technology = "nuclear-mk2" },
    { order = "c", name = "steam-turbine-mk3", health = 450, max_temp = 500, fluid_per_tick = 2, next_upgrade = "", ingredients = { {"steam-turbine-mk2", 3},{"complex-processing-unit", 5},{"vibranium-plate", 2} }, technology = "nuclear-mk3" }
}

heat_pipes = {
    { order = "a", name = "heat-pipe-mk1", health = 350, max_temp = 2000, tier = "tier-1", next_upgrade = "heat-pipe-mk2", ingredients = { {"vibranium-plate", 1} }, technology = "nuclear-mk1" },
    { order = "b", name = "heat-pipe-mk2", health = 450, max_temp = 4000, tier = "tier-2", next_upgrade = "heat-pipe-mk3", ingredients = { {"heat-pipe-mk1", 1}, {"vibranium-plate", 2} }, technology = "nuclear-mk2" },
    { order = "c", name = "heat-pipe-mk3", health = 550, max_temp = 8000, tier = "tier-3", next_upgrade = "", ingredients = { {"heat-pipe-mk2", 1}, {"vibranium-plate", 2} }, technology = "nuclear-mk3" },
}

adv_fuel_cells = {
    { order = "a", name = "adv-fuel-cell-mk1", fuel_value = "16GJ", recyle_result = {{"uranium-238", 3}}, ingredients = { {"uranium-fuel-cell", 2},{"vibranium-plate", 1} }, technology = "nuclear-mk1" },
    { order = "b", name = "adv-fuel-cell-mk2", fuel_value = "32GJ", recyle_result = {{"uranium-238", 5},{"plutonium", 1}}, ingredients = { {"adv-fuel-cell-mk1", 2},{"vibranium-plate", 1} }, technology = "nuclear-mk2" },
    { order = "c", name = "adv-fuel-cell-mk3", fuel_value = "64GJ", recyle_result = {{"uranium-238", 8},{"plutonium", 5}}, ingredients = { {"adv-fuel-cell-mk2", 2},{"vibranium-plate", 1} }, technology = "nuclear-mk3" },
}

large_power_poles = {
    { order = "a", name = "large-power-pole-mk1", health = 150, wire_reach = 45, area = 2, next_upgrade = "large-power-pole-mk2", ingredients = { {"big-electric-pole", 2},{"gold-plate", 1} }, technology = "electric-energy-distribution-3" },
    { order = "b", name = "large-power-pole-mk2", health = 150, wire_reach = 64, area = 2, next_upgrade = "", ingredients = { {"large-power-pole-mk1", 2},{"vibranium-plate", 2} }, technology = "electric-energy-distribution-4" },
}

medium_power_poles = {
    { order = "a", name = "medium-power-pole-mk1", health = 100, wire_reach = 18, area = 7, next_upgrade = "medium-power-pole-mk2", ingredients = { {"medium-electric-pole", 2},{"gold-plate", 1} }, technology = "electric-energy-distribution-3" },
    { order = "b", name = "medium-power-pole-mk2", health = 100, wire_reach = 36, area = 14, next_upgrade = "", ingredients = { {"medium-power-pole-mk1", 2},{"vibranium-plate", 2} }, technology = "electric-energy-distribution-4" },
}
 
substations = {
    { order = "a", name = "substation-mk1", health = 250, wire_reach = 34, area = 18, next_upgrade = "substation-mk2", ingredients = { {"substation", 2},{"gold-plate", 1} }, technology = "electric-energy-distribution-3" },
    { order = "b", name = "substation-mk2", health = 250, wire_reach = 64, area = 32, next_upgrade = "", ingredients = { {"substation-mk1", 2},{"vibranium-plate", 2} }, technology = "electric-energy-distribution-4" },
}

fluids = {
    { order = "a", name = "heavy-water", auto_barrel = true, default_temperature = 15, max_temperature = 100, heat_capacity = "0.8KJ", base_color = {r=0, g=0.04, b=0.6}, flow_color = {r=0.7, g=0.7, b=0.7}, energy_required = 0.5, ingredients = { {type="fluid", name="water", amount=100} }, amount = 50, technology = "heavy-water-processing" },
    { order = "b", name = "heavy-steam", auto_barrel = false, default_temperature = 15, max_temperature = 1000, heat_capacity = "0.8KJ", base_color = {r=0.20, g=0.20, b=0.20}, flow_color = {r=0.5, g=0.5, b=0.5} },
}