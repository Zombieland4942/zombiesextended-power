
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