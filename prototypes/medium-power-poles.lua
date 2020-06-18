data.raw["electric-pole"]["medium-electric-pole"].fast_replaceable_group = "medium-power-poles"

local electric_pole_base = util.table.deepcopy(data.raw["electric-pole"]["medium-electric-pole"])
local item_base = util.table.deepcopy(data.raw["item"]["medium-electric-pole"])

for x, medium_power_pole in pairs(medium_power_poles) do
    
    electric_pole = util.table.deepcopy(electric_pole_base)
    item = util.table.deepcopy(item_base)

    electric_pole.name = medium_power_pole.name
    electric_pole.icon = "__zombiesextended-power__/graphics/icons/" .. medium_power_pole.name .. ".png"
    electric_pole.minable.result = medium_power_pole.name
    electric_pole.max_health = medium_power_pole.health
    electric_pole.supply_area_distance  = medium_power_pole.area
    electric_pole.maximum_wire_distance  = medium_power_pole.wire_reach

    electric_pole.pictures.layers[1].filename = "__zombiesextended-power__/graphics/entity/" .. medium_power_pole.name .. "/medium-electric-pole.png"
    electric_pole.pictures.layers[1].hr_version.filename = "__zombiesextended-power__/graphics/entity/" .. medium_power_pole.name .. "/hr-medium-electric-pole.png"

    item.name = medium_power_pole.name
    item.icon = "__zombiesextended-power__/graphics/icons/" .. medium_power_pole.name .. ".png"
    item.place_result = medium_power_pole.name
    item.subgroup = "ds-power-dist"

    table.insert(data.raw["technology"][medium_power_pole.technology].effects, { type = "unlock-recipe", recipe = medium_power_pole.name })

    data:extend({ electric_pole, item,
        {
            type = "recipe",
            name = medium_power_pole.name,
            enabled = false,
            ingredients = medium_power_pole.ingredients,
            result = medium_power_pole.name
        }
    })
end