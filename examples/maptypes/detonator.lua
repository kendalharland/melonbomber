require("gridmap")

map.name = "Detonator"
map.description = "First player to trigger the detonator wins."

function map:generateMap(grid)
    map = gridmap.load_map_data("melonbomber/map_detonator.txt")
    gridmap.generate(grid, map)
end