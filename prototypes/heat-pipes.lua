local entity_base = util.table.deepcopy(data.raw["heat-pipe"]["heat-pipe"])
local item_base = util.table.deepcopy(data.raw["item"]["heat-pipe"])

for x, heat_pipe in pairs(heat_pipes) do
    
    reactor = util.table.deepcopy(entity_base)
    item = util.table.deepcopy(item_base)

    reactor.name = heat_pipe.name
    reactor.icon = "__darkstar-power__/graphics/icons/" .. heat_pipe.name .. ".png"    
    reactor.minable.result = heat_pipe.name
    reactor.max_health = heat_pipe.health
    reactor.heat_buffer.max_temperature = heat_pipe.max_temp
    
    item.name = heat_pipe.name
    item.icon = "__darkstar-power__/graphics/icons/" .. heat_pipe.name .. ".png"
    item.place_result = heat_pipe.name
    item.subgroup = "ds-reactors"
    item.order = heat_pipe.order
    
    table.insert(data.raw["technology"][heat_pipe.technology].effects, { type = "unlock-recipe", recipe = heat_pipe.name })

    data:extend({ reactor, item,
        {
            type = "recipe",
            name = heat_pipe.name,
            enabled = false,
            ingredients = heat_pipe.ingredients,
            result = heat_pipe.name
        }
    })
end