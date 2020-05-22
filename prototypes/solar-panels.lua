
local solar_base = util.table.deepcopy(data.raw["solar-panel"]["solar-panel"])
local item_base = util.table.deepcopy(data.raw["item"]["solar-panel"])

for x, solar_panel in pairs(solar_panels) do
    
    solar = util.table.deepcopy(solar_base)
    item = util.table.deepcopy(item_base)

    solar.name = solar_panel.name
    solar.max_health = solar_panel.health
    solar.production  = solar_panel.production_kw .. "kW"

    item.name = solar_panel.name
    item.place_result = solar_panel.name
    item.subgroup = "ds-solar"
    item.order = solar_panel.order

    data:extend({ solar, item })
end