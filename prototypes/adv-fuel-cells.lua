local item_base = util.table.deepcopy(data.raw["item"]["uranium-fuel-cell"])

for x, adv_fuel_cell in pairs(adv_fuel_cells) do
    
    item = util.table.deepcopy(item_base)

    item.name = adv_fuel_cell.name
    item.subgroup = "ds-reactors"
    item.order = adv_fuel_cell.order
    item.fuel_value = adv_fuel_cell.fuel_value
    
    data:extend({ item })
end