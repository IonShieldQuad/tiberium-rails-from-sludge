tiberiumInternalName = "__Factorio-Tiberium__"

data:extend({
	{
		type = "recipe",
		name = "tiberium-sludge-to-rails",
		category = "crafting-with-fluid",
		--energy_required = 2,
		enabled = false,
		ingredients = {
			{ type = "fluid", name = "tiberium-sludge", amount = 1 },
			{ type = "item",  name = "iron-stick",      amount = 1 },
			{ type = "item",  name = "steel-plate",     amount = 1 },
		},
		results = {
			{ type = "item", name = "rail", amount = 2 }
		},
		icons = {
			{
				icon = "__base__/graphics/icons/rail.png",
				icon_size = 64,
			},
			{
				icon = tiberiumInternalName .. "/graphics/icons/fluid/tiberium-sludge.png",
				icon_size = 64,
				scale = 0.25,
				shift = { 6, -6 }
			},
		},
		icon = tiberiumInternalName .. "/graphics/icons/tiberium-sludge-to-stone-brick.png",
		icon_size = 32,
		subgroup = "a-direct",
		allow_as_intermediate = false,
		allow_decomposition = false,
		always_show_made_in = true,
		order = "z-3"
	},
})

local tech = data.raw["technology"]["tiberium-sludge-processing"]
table.insert(tech.effects, {
	{
		type = "unlock-recipe",
		recipe = "tiberium-sludge-to-rails"
	}
})
