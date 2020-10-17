
local entity_base = util.table.deepcopy(data.raw["accumulator"]["accumulator"])
local item_base = util.table.deepcopy(data.raw["item"]["accumulator"])

for x, accumulator in pairs(accumulators) do
    
    entity = util.table.deepcopy(entity_base)
    item = util.table.deepcopy(item_base)

    entity.name = accumulator.name    
    entity.icon = "__zombiesextended-power__/graphics/icons/" .. accumulator.name .. ".png"
    entity.minable.result = accumulator.name
    entity.max_health = accumulator.health
    entity.energy_source.buffer_capacity  = accumulator.buffer_mj .. "MJ"
    entity.energy_source.input_flow_limit  = accumulator.flow_in_kw .. "kW"
    entity.energy_source.output_flow_limit  = accumulator.flow_out_kw .. "kW"
    
    entity.picture.layers[1].filename = "__zombiesextended-power__/graphics/entity/" .. accumulator.name .. "/accumulator.png"
    entity.picture.layers[1].hr_version.filename = "__zombiesextended-power__/graphics/entity/" .. accumulator.name .. "/hr-accumulator.png"
    entity.discharge_animation.layers[1].layers[1].filename = "__zombiesextended-power__/graphics/entity/" .. accumulator.name .. "/accumulator.png"
    entity.discharge_animation.layers[1].layers[1].hr_version.filename = "__zombiesextended-power__/graphics/entity/" .. accumulator.name .. "/hr-accumulator.png"
    entity.charge_animation.layers[1].layers[1].filename = "__zombiesextended-power__/graphics/entity/" .. accumulator.name .. "/accumulator.png"
    entity.charge_animation.layers[1].layers[1].hr_version.filename = "__zombiesextended-power__/graphics/entity/" .. accumulator.name .. "/hr-accumulator.png"

    item.name = accumulator.name
    item.icon = "__zombiesextended-power__/graphics/icons/" .. accumulator.name .. ".png"
    item.place_result = accumulator.name
    item.subgroup = "ds-solar"
    item.order = accumulator.order
    
    table.insert(data.raw["technology"][accumulator.technology].effects, { type = "unlock-recipe", recipe = accumulator.name })

    data:extend({ entity, item,
    {
        type = "recipe",
        name = accumulator.name,
        enabled = false,
        ingredients = accumulator.ingredients,
        result = accumulator.name
    }
    })
end