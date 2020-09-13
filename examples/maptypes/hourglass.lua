require("gridmap")

map.name = "Hourglass"
map.description = "A map shaped like an hourglass"

function map:generateMap(grid)
    map = gridmap.load_map_data("melonbomber/map_hourglass.txt")
    gridmap.generate(grid, map)
end