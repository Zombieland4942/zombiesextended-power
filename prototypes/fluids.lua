
local fluid_base = util.table.deepcopy(data.raw["fluid"]["water"])

for x, fluid in pairs(fluids) do
    
    fluid_entity = util.table.deepcopy(fluid_base)

    fluid_entity.name = fluid.name
    fluid_entity.icon = "__zombiesextended-power__/graphics/icons/" .. fluid.name .. ".png"

    fluid_entity.default_temperature = fluid.default_temperature
    fluid_entity.max_temperature = fluid.max_temperature
    fluid_entity.heat_capacity = fluid.heat_capacity
    fluid_entity.base_color = fluid.base_color
    fluid_entity.flow_color = fluid.flow_color
    fluid_entity.auto_barrel = fluid.auto_barrel
    
    if fluid.ingredients then
        data:extend({
            {
                type = "recipe",
                name = fluid.name,
                category = "chemistry",
                energy_required = 1,
                enabled = false,
                ingredients = fluid.ingredients,
                results=
                {
                    {type="fluid", name=fluid.name, amount=1}
                },
                subgroup = "fluid-recipes"
            }
        })
        
        table.insert(data.raw["technology"][fluid.technology].effects, { type = "unlock-recipe", recipe = fluid.name })
    end
    
    data:extend({ fluid_entity })
end