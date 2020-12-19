
local electric_pole_base = util.table.deepcopy(data.raw["electric-pole"]["big-electric-pole"])
local item_base = util.table.deepcopy(data.raw["item"]["big-electric-pole"])

for x, large_power_pole in pairs(large_power_poles) do
    
    electric_pole = util.table.deepcopy(electric_pole_base)
    item = util.table.deepcopy(item_base)

    electric_pole.name = large_power_pole.name
    electric_pole.icon = "__zombiesextended-power__/graphics/icons/" .. large_power_pole.name .. ".png"
    electric_pole.minable.result = large_power_pole.name
    electric_pole.max_health = large_power_pole.health
    electric_pole.supply_area_distance  = large_power_pole.area
    electric_pole.maximum_wire_distance  = large_power_pole.wire_reach
    electric_pole.next_upgrade = large_power_pole.next_upgrade

    electric_pole.pictures.layers[1].filename = "__zombiesextended-power__/graphics/entity/" .. large_power_pole.name .. "/big-electric-pole.png"
    electric_pole.pictures.layers[1].hr_version.filename = "__zombiesextended-power__/graphics/entity/" .. large_power_pole.name .. "/hr-big-electric-pole.png"

    if mods["beautiful_bridge_railway"] then
        electric_pole.collision_mask = { "object-layer" }
    end

    item.name = large_power_pole.name
    item.icon = "__zombiesextended-power__/graphics/icons/" .. large_power_pole.name .. ".png"
    item.place_result = large_power_pole.name
    item.order = item.order .. large_power_pole.order

    if settings.startup["zombies-use-seperate-tab"].value == true then        
        item.subgroup = "ds-power-dist"
    end    

    table.insert(data.raw["technology"][large_power_pole.technology].effects, { type = "unlock-recipe", recipe = large_power_pole.name })

    data:extend({ electric_pole, item,
        {
            type = "recipe",
            name = large_power_pole.name,
            enabled = false,
            ingredients = large_power_pole.ingredients,
            result = large_power_pole.name
        }
    })
end