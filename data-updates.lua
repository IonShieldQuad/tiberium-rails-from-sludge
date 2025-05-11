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
table.insert(tech.effects,
	{
		type = "unlock-recipe",
		recipe = "tiberium-sludge-to-rails"
	}
)


local tech2 = data.raw["technology"]["fission-reactor-equipment"]
local reactor_recipe = table.deepcopy(data.raw["recipe"]["fission-reactor-equipment"])
reactor_recipe.name = "fission-reactor-equipment-from-tiberium"
reactor_recipe.localised_name = { "equipment-name.fission-reactor-equipment" }
for _, ingr in ipairs(reactor_recipe.ingredients) do
	if ingr.name == "uranium-fuel-cell" then
		ingr.name = "tiberium-fuel-cell"
	end
end

---@diagnostic disable-next-line: assign-type-mismatch
data:extend({ reactor_recipe })

table.insert(tech2.effects, {
	type = "unlock-recipe",
	recipe = "fission-reactor-equipment-from-tiberium"
})

local spike = data.raw["mining-drill"]["tiberium-spike"]
data.extend({
	{
		type = "corpse",
		name = "tiberium-spike-remnants",
		icon = spike.icon,
		flags = { "placeable-neutral", "not-on-map" },
		hidden_in_factoriopedia = true,
		subgroup = "energy-remnants",
		order = "z-a-a",
		selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
		tile_width = 3,
		tile_height = 5,
		selectable_in_game = false,
		time_before_removed = 60 * 60 * 15, -- 15 minutes
		expires = false,
		final_render_layer = "remnants",
		remove_on_tile_placement = false,
		animation = {
			layers = {
				{
					filenames = {
						"__tiberium-rails-from-sludge__/graphics/entity/TgSpike-base/spike_1 0001.png",
					},
					line_length = 1,
					lines_per_file = 1,
					repeat_count = 32,
					width = 246,
					height = 90,
				},
			}
		}
	},
})

local tree_version = settings.startup["tib-tweaks-tree-version"].value

--spike.output_fluid_box.pipe_connections[1].positions = { { 1, 0 }, { 1, 0 }, { 1, 0 }, { 1, 0 } }
---@diagnostic disable-next-line: assign-type-mismatch
--spike.output_fluid_box.pipe_connections[1].direction = defines.direction.south
spike.corpse = "tiberium-spike-remnants"
spike.heating_energy = nil
spike.graphics_set.animation = {
	layers = {
		{
			filenames = {
				"__tiberium-rails-from-sludge__/graphics/entity/TgSpike-base/spike_1 0000.png",
			},
			line_length = 1,
			lines_per_file = 1,
			repeat_count = 32 * 4,
			width = 246,
			height = 90,
		},
		{
			filenames = {
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0000.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0001.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0002.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0003.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0004.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0005.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0006.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0007.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0008.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0009.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0010.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0011.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0012.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0013.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0014.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0015.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0016.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0017.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0018.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0019.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0020.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0021.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0022.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0023.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0024.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0025.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0026.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0027.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0028.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0029.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0030.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0031.png",
			},
			line_length = 1,
			lines_per_file = 1,
			frame_count = 32,
			width = 42,
			height = 300,
			animation_speed = 0.5,
			frame_sequence = {},
		},
	}
}
spike.graphics_set.idle_animation = {
	layers = {
		{
			filenames = {
				"__tiberium-rails-from-sludge__/graphics/entity/TgSpike-base/spike_1 0000.png",
			},
			line_length = 1,
			lines_per_file = 1,
			repeat_count = 32 * 4,
			width = 246,
			height = 90,
		},
		{
			filenames = {
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0000.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0001.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0002.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0003.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0004.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0005.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0006.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0007.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0008.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0009.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0010.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0011.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0012.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0013.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0014.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0015.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0016.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0017.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0018.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0019.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0020.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0021.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0022.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0023.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0024.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0025.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0026.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0027.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0028.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0029.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0030.png",
				"__tiberium-rails-from-sludge__/graphics/entity/TGSpike_a/spike_1 0031.png",
			},
			line_length = 1,
			lines_per_file = 1,
			frame_count = 32,
			frame_sequence = {},
			width = 42,
			height = 300,
			animation_speed = 0.25,
			run_mode = "backward"
		},
	}
}
for i = 1, 32, 1 do
	table.insert(spike.graphics_set.idle_animation.layers[2].frame_sequence, i)
	table.insert(spike.graphics_set.idle_animation.layers[2].frame_sequence, i)
	table.insert(spike.graphics_set.idle_animation.layers[2].frame_sequence, i)
	table.insert(spike.graphics_set.idle_animation.layers[2].frame_sequence, i)
	table.insert(spike.graphics_set.animation.layers[2].frame_sequence, i)
	table.insert(spike.graphics_set.animation.layers[2].frame_sequence, i)
	table.insert(spike.graphics_set.animation.layers[2].frame_sequence, i)
	table.insert(spike.graphics_set.animation.layers[2].frame_sequence, i)
end

spike.graphics_set.frozen_patch = nil
spike.wet_mining_graphics_set = spike.graphics_set
spike.graphics_set.working_visualisations = {
	{
		always_draw = true,
		effect = "flicker",
		light = { intensity = 1, size = 8, color = { 0, 1, 0, 1 } }
	},
	{
		always_draw = true,
		effect = "flicker",
		light = { intensity = 1, size = 8, color = { 0, 1, 0, 1 }, shift = util.by_pixel(0, -100) }
	}
}
spike.working_sound.idle_sound = {
	filename = "__base__/sound/accumulator-idle.ogg",
	audible_distance_modifier = 0.5,
}

local tree = data.raw["cliff"]["tibNode_tree"]
local node = data.raw["resource"]["tibGrowthNode"]


if tree_version > 0 then
	local oriented_cliff_dummy = {
		collision_bounding_box = { { -0.4, -0.4 }, { 0.4, 0.4 } },
		pictures = {
			filename = tiberiumInternalName .. "/graphics/entity/nodes/tiberium_blossom_tree.png",
			--width = 320,
			--height = 251,
			width = 1,
			height = 1,
		},
		fill_volume = 0,
	}


	tree.orientations = {
		west_to_east = oriented_cliff_dummy,
		north_to_south = oriented_cliff_dummy,
		east_to_west = oriented_cliff_dummy,
		south_to_north = oriented_cliff_dummy,
		west_to_north = oriented_cliff_dummy,
		north_to_east = oriented_cliff_dummy,
		east_to_south = oriented_cliff_dummy,
		south_to_west = oriented_cliff_dummy,
		west_to_south = oriented_cliff_dummy,
		north_to_west = oriented_cliff_dummy,
		east_to_north = oriented_cliff_dummy,
		south_to_east = oriented_cliff_dummy,
		west_to_none = oriented_cliff_dummy,
		none_to_east = oriented_cliff_dummy,
		north_to_none = oriented_cliff_dummy,
		none_to_south = oriented_cliff_dummy,
		east_to_none = oriented_cliff_dummy,
		none_to_west = oriented_cliff_dummy,
		south_to_none = oriented_cliff_dummy,
		none_to_north = oriented_cliff_dummy,
	}
	node.draw_stateless_visualisation_under_building = false
	if tree_version == 1 then
		node.stateless_visualisation = {
			{
				count = 1,
				render_layer = "object",
				animation = util.sprite_load("__tiberium-rails-from-sludge__/graphics/entity/TibTree-x4/atlas",
					{
						priority = "extra-high",
						animation_speed = 0.02,
						run_mode = "forward-then-backward",
						frame_count = 6
						--scale = 0.5
						--shift = util.by_pixel( 0.5, -54.0)
					})
			}
		}
	end

	if tree_version == 2 then
		node.stateless_visualisation = {
			{
				count = 1,
				render_layer = "object",
				animation = util.sprite_load("__tiberium-rails-from-sludge__/graphics/entity/TibTree-2/atlas",
					{
						priority = "extra-high",
						animation_speed = 0.2,
						run_mode = "forward",
						frame_count = 11,
						scale = 0.5,
						frame_sequence = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, }
						--shift = util.by_pixel( 0.5, -54.0)
					})
			}
		}
	end
	if tree_version == 3 then
		node.stateless_visualisation = {
			{
				count = 1,
				render_layer = "object",
				animation = util.sprite_load("__tiberium-rails-from-sludge__/graphics/entity/TibTree-3/atlas",
					{
						priority = "extra-high",
						animation_speed = 0.2,
						run_mode = "forward",
						frame_count = 11,
						scale = 0.5,
						frame_sequence = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, }
						--shift = util.by_pixel( 0.5, -54.0)
					})
			}
		}
	end
end
