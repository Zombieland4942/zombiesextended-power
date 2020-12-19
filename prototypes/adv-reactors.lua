local reator_base = util.table.deepcopy(data.raw["reactor"]["nuclear-reactor"])
local item_base = util.table.deepcopy(data.raw["item"]["nuclear-reactor"])

for x, adv_reactor in pairs(adv_reactors) do
    
    reactor = util.table.deepcopy(reator_base)
    item = util.table.deepcopy(item_base)

    reactor.name = adv_reactor.name
    reactor.icon = "__zombiesextended-power__/graphics/icons/" .. adv_reactor.name .. ".png"
    reactor.working_light_picture.filename = "__zombiesextended-power__/graphics/entity/" .. adv_reactor.name .. "/reactor-lights-color.png"
    reactor.working_light_picture.hr_version.filename = "__zombiesextended-power__/graphics/entity/" .. adv_reactor.name .. "/hr-reactor-lights-color.png"
    reactor.minable.result = adv_reactor.name
    reactor.max_health = adv_reactor.health
    reactor.consumption = adv_reactor.production_mw .. "MW"
    reactor.heat_buffer.max_temperature = adv_reactor.max_temp
    reactor.heat_buffer.specific_heat = adv_reactor.specific_heat_mj .. "MJ"
    reactor.next_upgrade = adv_reactor.next_upgrade

    item.name = adv_reactor.name
    item.icon = "__zombiesextended-power__/graphics/icons/" .. adv_reactor.name .. ".png"
    item.place_result = adv_reactor.name
    item.order = item.order .. adv_reactor.order

    if settings.startup["zombies-use-seperate-tab"].value == true then        
        item.subgroup = "ds-reactors"
    end  
    
    table.insert(data.raw["technology"][adv_reactor.technology].effects, { type = "unlock-recipe", recipe = adv_reactor.name })

    data:extend({ reactor, item,
        {
            type = "recipe",
            name = adv_reactor.name,
            enabled = false,
            ingredients = adv_reactor.ingredients,
            result = adv_reactor.name
        }
    })
end