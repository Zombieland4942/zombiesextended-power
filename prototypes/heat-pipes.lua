local entity_base = util.table.deepcopy(data.raw["heat-pipe"]["heat-pipe"])
local item_base = util.table.deepcopy(data.raw["item"]["heat-pipe"])

for x, heat_pipe in pairs(heat_pipes) do
    
    entity = util.table.deepcopy(entity_base)
    item = util.table.deepcopy(item_base)

    entity.name = heat_pipe.name
    entity.icons = {
            { icon = "__zombiesextended-power__/graphics/icons/" .. heat_pipe.name .. ".png", icon_size = 64, icon_mipmaps = 4 },
            { icon = "__zombiesextended-power__/graphics/icons/" .. heat_pipe.tier .. ".png", icon_size = 64 }
    }  
    entity.minable.result = heat_pipe.name
    entity.max_health = heat_pipe.health
    entity.heat_buffer.max_temperature = heat_pipe.max_temp
    entity.next_upgrade = heat_pipe.next_upgrade
    
    item.name = heat_pipe.name
    item.icons = {
            { icon = "__zombiesextended-power__/graphics/icons/" .. heat_pipe.name .. ".png", icon_size = 64, icon_mipmaps = 4 },
            { icon = "__zombiesextended-power__/graphics/icons/" .. heat_pipe.tier .. ".png", icon_size = 64 }
    }
    item.place_result = heat_pipe.name
    item.order = item.order .. heat_pipe.order

    if settings.startup["zombies-use-seperate-tab"].value == true then        
        item.subgroup = "ds-reactors"
    end  
    
    table.insert(data.raw["technology"][heat_pipe.technology].effects, { type = "unlock-recipe", recipe = heat_pipe.name })

    data:extend({ entity, item,
        {
            type = "recipe",
            name = heat_pipe.name,
            enabled = false,
            energy_required = heat_pipe.craft_time,
            ingredients = heat_pipe.ingredients,
            result = heat_pipe.name
        }
    })
end