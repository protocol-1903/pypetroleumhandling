RECIPE {
    type = "recipe",
    name = "natural-gas-seep-mk03",
    energy_required = 15,
    enabled = false,
    ingredients = {
        {type = "item",                                        name = "natural-gas-seep-mk02",  amount = 1},
        {mods.pyrawores and "distilator-mk03" or "distilator", 1},
        {type = "item",                                        name = "automated-factory-mk01", amount = 1},
        {type = "item",                                        name = "steel-plate",            amount = 100},
        {type = "item",                                        name = "processing-unit",        amount = 15},
        {type = "item",                                        name = "electric-engine-unit",   amount = 5},
        {type = "item",                                        name = "small-parts-03",         amount = 25},
        {type = "item",                                        name = "pipe",                   amount = 20},
    },
    results = {
        {type = "item", name = "natural-gas-seep-mk03", amount = 1}
    }
}:add_unlock("oil-machines-mk03")

ITEM {
    type = "item",
    name = "natural-gas-seep-mk03",
    icon = "__pypetroleumhandlinggraphics__/graphics/icons/gas-extractor-mk03.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-petroleum-handling-buildings-mk03",
    order = "a",
    place_result = "natural-gas-seep-mk03",
    stack_size = 10
}

ENTITY {
    type = "mining-drill",
    name = "natural-gas-extractor-mk03",
    icon = "__pypetroleumhandlinggraphics__/graphics/icons/gas-extractor-mk03.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "natural-gas-seep-mk03"},
    placeable_by = {item = "natural-gas-seep-mk03", count = 1},
    resource_categories = {"natural-gas"},
    max_health = 200,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.2, -3.2}, {3.2, 3.2}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    energy_source =
    {
        type = "electric",
        emissions_per_second_per_watt = 10 / 90000,
        usage_priority = "secondary-input"
    },
    output_fluid_box =
    {
        volume = 3000,
        pipe_covers = py.pipe_covers(false, true, true, true),
        pipe_connections = {
            {flow_direction = "input-output", position = {0, -3.0}, direction = defines.direction.north},
            {flow_direction = "input-output", position = {3.0, 0},  direction = defines.direction.east},
            {flow_direction = "input-output", position = {0, 3.0},  direction = defines.direction.south},
            {flow_direction = "input-output", position = {-3.0, 0}, direction = defines.direction.west},
        }
    },
    energy_usage = "400kW",
    mining_speed = 3,
    resource_searching_radius = 0.49,
    vector_to_place_result = {0, 0},
    module_slots = 3,
    allowed_effects = {"consumption", "speed", "productivity"},
    radius_visualisation_picture =
    {
        filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
        width = 12,
        height = 12
    },
    circuit_connector = circuit_connector_definitions["natural-gas-extractor-mkxx"],
    circuit_wire_max_distance = _G.default_circuit_wire_max_distance,
    monitor_visualization_tint = {r = 78, g = 173, b = 255},
    --base_render_layer = "lower-object-above-shadow",
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__pypetroleumhandlinggraphics__/graphics/entity/gas-extractor/raw.png",
                    width = 224,
                    height = 320,
                    line_length = 7,
                    frame_count = 30,
                    animation_speed = 1 / 5,
                    shift = util.by_pixel(0, -48)
                },
                {
                    filename = "__pypetroleumhandlinggraphics__/graphics/entity/gas-extractor/mask.png",
                    width = 224,
                    height = 320,
                    line_length = 7,
                    frame_count = 30,
                    animation_speed = 1 / 5,
                    tint = {r = 0.223, g = 0.490, b = 0.858, a = 1.0},
                    shift = util.by_pixel(0, -48)
                },
                {
                    filename = "__pypetroleumhandlinggraphics__/graphics/entity/gas-extractor/ao.png",
                    width = 288,
                    height = 352,
                    line_length = 7,
                    frame_count = 30,
                    animation_speed = 1 / 5,
                    shift = util.by_pixel(0, -32)
                },
                {
                    filename = "__pypetroleumhandlinggraphics__/graphics/entity/gas-extractor/l.png",
                    width = 224,
                    height = 320,
                    line_length = 7,
                    frame_count = 30,
                    animation_speed = 1 / 5,
                    draw_as_glow = true,
                    shift = util.by_pixel(0, -48)
                },
                {
                    filename = "__pypetroleumhandlinggraphics__/graphics/entity/gas-extractor/sh.png",
                    width = 288,
                    height = 352,
                    line_length = 1,
                    frame_count = 1,
                    repeat_count = 30,
                    animation_speed = 1 / 5,
                    draw_as_shadow = true,
                    shift = util.by_pixel(0, -32)
                },
            },
        },
    },
    impact_category = "metal-large",
    working_sound =
    {
        sound = {filename = "__pypetroleumhandlinggraphics__/sounds/gas-extractor.ogg", volume = 0.3},
        apparent_volume = 0.5
    },
    fast_replaceable_group = "natural-gas-extractor",
}

local seep = table.deepcopy(data.raw["mining-drill"]["natural-gas-extractor-mk03"])
seep.name = "natural-gas-seep-mk03"
seep.resource_categories = {"bitumen-seep", "natural-gas"}
data:extend {seep}
