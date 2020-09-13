# melonbomber
A Lua script for MechanicalMind/melonbomber that loads maps from bitmap files

# Setup

1. Create the folder `garrysmod/data/melonbomber`. This is where bitmap data goes.
1. Create the folder `garrysmod/lua/melonbomber/maptypes`. This is where your custom maptype scripts go. (See [this page](https://github.com/MechanicalMind/melonbomber/blob/master/gamemode/maptypes/HOW_TO_MAKE_NEW_MAPS.md))
1. Copy `gridmap.lua` to `garrysmod/lua/includes/modules`

# Create a map

## Create the map file
Maps are given as plaintext files. For example:
```
bbbbbbbb
b      b
b      b
b      b
bbbbbbbb
```
This creates a boring arena with a section of boxes in the corner.

The allowed characters are:
* `b`: box
* `w`: wall
* `h`: hard box
* `e`: explosive box

Save your map file to `garrysmod/data/melonbomber/my_map.txt`.

## Create the Lua script

```
require("gridmap")

map.name = "MyMap"
map.description = "My custom map"

function map:generateMap(grid)
    map = gridmap.load_map_data("melonbomber/my_map.txt")
    gridmap.generate(grid, map)
end
```

Save the contents of this file to `garrysmod/lua/melonbomber/maptypes/my_map.lua`
