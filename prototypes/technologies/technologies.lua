TECHNOLOGY {
    type = "technology",
    name = "oil-sands",
    icon = "__pypetroleumhandlinggraphics__/graphics/technology/oil-sands.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {},
    effects = {},
    unit = {
        count = 200,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack",   1}
        },
        time = 45
    }
}

TECHNOLOGY {
    type = "technology",
    name = "scrude",
    icon = "__pypetroleumhandlinggraphics__/graphics/technology/scrude.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {},
    effects = {},
    unit = {
        count = 200,
        ingredients = {
            {"automation-science-pack", 1},
            --{'logistic-science-pack', 1}
        },
        time = 45
    }
}

TECHNOLOGY {
    type = "technology",
    name = "rubber",
    icon = "__pypetroleumhandlinggraphics__/graphics/technology/rubber.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {},
    effects = {},
    unit = {
        count = 200,
        ingredients = {
            {"automation-science-pack", 1},
        },
        time = 45
    }
}

TECHNOLOGY {
    type = "technology",
    name = "rubber-2",
    icon = "__pypetroleumhandlinggraphics__/graphics/technology/rubber.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"rubber"},
    dependencies = {"rubber"},
    effects = {},
    unit = {
        count = 200,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack",   1},
        },
        time = 45
    }
}

TECHNOLOGY {
    type = "technology",
    name = "rubber-3",
    icon = "__pypetroleumhandlinggraphics__/graphics/technology/rubber.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {},
    dependencies = {"rubber-2"},
    effects = {},
    unit = {
        count = 200,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack",   1},
            {"chemical-science-pack",   1},
        },
        time = 45
    }
}

local tech = table.deepcopy(data.raw.technology["fast-inserter"])
tech.name = "fast-inserter-2"
tech.dependencies = {"fast-inserter"}
tech.effects = {}
TECHNOLOGY(tech):add_pack("logistic-science-pack")

TECHNOLOGY("bulk-inserter").upgrade = false
TECHNOLOGY("bulk-inserter").prerequisites = {}

tech = table.deepcopy(data.raw.technology["bulk-inserter"])
tech.name = "bulk-inserter-2"
tech.dependencies = {"bulk-inserter"}
tech.effects = {}
TECHNOLOGY(tech):add_pack("chemical-science-pack")
