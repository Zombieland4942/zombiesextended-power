
local solar_base = util.table.deepcopy(data.raw["solar-panel"]["solar-panel"])
local item_base = util.table.deepcopy(data.raw["item"]["solar-panel"])

for x, solar_panel in pairs(solar_panels) do
    
    solar = util.table.deepcopy(solar_base)
    item = util.table.deepcopy(item_base)

    solar.name = solar_panel.name
    solar.icon = "__zombiesextended-power__/graphics/icons/" .. solar_panel.name .. ".png"
    solar.minable.result = solar_panel.name
    solar.max_health = solar_panel.health
    solar.production  = solar_panel.production_kw .. "kW"
    solar.next_upgrade = solar_panel.next_upgrade

    solar.picture.layers[1].filename = "__zombiesextended-power__/graphics/entity/" .. solar_panel.name .. "/solar-panel.png"
    solar.picture.layers[1].hr_version.filename = "__zombiesextended-power__/graphics/entity/" .. solar_panel.name .. "/hr-solar-panel.png"

    item.name = solar_panel.name
    item.icon = "__zombiesextended-power__/graphics/icons/" .. solar_panel.name .. ".png"
    item.place_result = solar_panel.name
    item.order = item.order .. solar_panel.order

    if settings.startup["zombies-use-seperate-tab"].value == true then        
        item.subgroup = "ds-solar"
    end    
    
    table.insert(data.raw["technology"][solar_panel.technology].effects, { type = "unlock-recipe", recipe = solar_panel.name })

    data:extend({ solar, item,
    {
        type = "recipe",
        name = solar_panel.name,
        enabled = false,
        energy_required = solar_panel.energy_required,
        ingredients = solar_panel.ingredients,
        result = solar_panel.name
    }
    })
end