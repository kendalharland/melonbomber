module("gridmap", package.seeall)

function gridmap.load_map_data(filename)
    data = {}
    i = 0
    local f = file.Open(filename, "r", "DATA")
    repeat
        data[i] = f:ReadLine()
        i = i + 1
    until( f:EndOfFile() )
    return data
end

function gridmap.generate(grid, map)
    local blockTypes = {
        w = function(x, y) grid:setWall(x, y) end,
        b = function(x, y) grid:setBox(x, y) end,
        h = function(x, y) grid:setHardBox(x, y) end,
        e = function(x, y) grid:setExplosiveBox(x, y) end,
    }
    for x = grid.minx, grid.maxx do
        if x < string.len(map[0]) then
            for y = grid.miny, grid.maxy do
                -- Grid allows negative coords; shift the origin to 0,0.
                ox = x - grid.minx
                oy = y - grid.miny
                if (map[ox] ~= nil and y < string.len(map[ox])) then
                    bt = map[ox]:sub(oy, oy)
                    if blockTypes[bt] ~= nil then
                        blockTypes[bt](x, y)
                    end
                end
            end 
        end
	end
end