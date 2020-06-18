local new_cell_item_base = util.table.deepcopy(data.raw["item"]["uranium-fuel-cell"])
local used_cell_item_base = util.table.deepcopy(data.raw["item"]["used-up-uranium-fuel-cell"])

for x, adv_fuel_cell in pairs(adv_fuel_cells) do
    
    new_fuel_cell_item = util.table.deepcopy(new_cell_item_base)
    used_fuel_cell_item = util.table.deepcopy(used_cell_item_base)

    new_fuel_cell_item.name = adv_fuel_cell.name
    new_fuel_cell_item.icon = "__zombiesextended-power__/graphics/icons/" .. adv_fuel_cell.name .. ".png"
    new_fuel_cell_item.subgroup = "ds-fuel"
    new_fuel_cell_item.order = "1-" .. adv_fuel_cell.order
    new_fuel_cell_item.fuel_value = adv_fuel_cell.fuel_value
    new_fuel_cell_item.burnt_result = "used-up-" .. adv_fuel_cell.name

    used_fuel_cell_item.name = "used-up-" .. adv_fuel_cell.name
    used_fuel_cell_item.icon = "__zombiesextended-power__/graphics/icons/used-up-" .. adv_fuel_cell.name .. ".png"
    used_fuel_cell_item.subgroup = "ds-fuel"
    used_fuel_cell_item.order = "2-" .. adv_fuel_cell.order
    
    table.insert(data.raw["technology"]["adv-nuclear-fuel-reprocessing"].effects, { type = "unlock-recipe", recipe = adv_fuel_cell.name .. "-reprocessing" })
    
    table.insert(data.raw["technology"][adv_fuel_cell.technology].effects, { type = "unlock-recipe", recipe = adv_fuel_cell.name })

    data:extend({ new_fuel_cell_item, used_fuel_cell_item,
        {
            type = "recipe",
            name = adv_fuel_cell.name .. "-reprocessing",
            energy_required = 60,
            enabled = false,
            category = "centrifuging",
            ingredients = { {"used-up-" .. adv_fuel_cell.name, 5} },
            icon = "__zombiesextended-power__/graphics/icons/" .. adv_fuel_cell.name .. "-reprocessing.png",
            icon_size = 64, icon_mipmaps = 4,
            subgroup = "ds-fuel",
            order = "a",
            main_product = "",
            results = adv_fuel_cell.recyle_result,
            allow_decomposition = false
        },
        {
            type = "recipe",
            name = adv_fuel_cell.name,
            energy_required = 10,
            enabled = false,
            ingredients = adv_fuel_cell.ingredients,
            result = adv_fuel_cell.name,
            result_count = 1
        },
    })
end