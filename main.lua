function _init()
    poke(0x5f2d, 0x1)   -- enable mouse and keyboard
    drawing_board = init_drawing_board()
    x, y = 64, 64
    interpolate = false
    xoffset = 16
    yoffset = 24
end

function _update()
    prev_x, prev_y = x, y
    x, y = mid(stat(32), 1, 128), mid(stat(33), 1, 128)

    if stat(34) & 1 == 1 then
        if within_bounds(x, y) then
            if interpolate then
                interpolateAndDraw(prev_x, prev_y, x, y, drawing_board)
            else
                drawing_board[x - xoffset][y - yoffset] = true
                interpolate = true;
            end 
        end
    elseif interpolate then
        interpolate = false
        fill_enclosed_areas(drawing_board)
    end


end

function _draw()
    cls()
    map()
    draw_drawing_board(drawing_board)
    circfill(x, y, 1, 8)
    print("x: "..x, 0, 0, 7)
    print("y: "..y, 0, 10, 7)
    print("btns: "..stat(34), 0, 20, 7)
end

function within_bounds(x, y)
    return x > xoffset and x < 113 and y > yoffset and y < 105
end

function init_drawing_board()
    local drawing_board = {}
    for x = 1, 96 do
        drawing_board[x] = {}
        for y = 1, 80 do
            drawing_board[x][y] = false
        end
    end
    return drawing_board
end

function draw_drawing_board(drawing_board)
    for x = 1, 96 do
        for y = 1, 80 do
            if drawing_board[x][y] then
                pset(x + xoffset, y + yoffset, 0)
            end
        end
    end
end

function interpolateAndDraw(x1, y1, x2, y2, drawing_board)
    local deltaX = x2 - x1;
    local deltaY = y2 - y1;
    local distance = sqrt(deltaX * deltaX + deltaY * deltaY);
    local steps = ceil(distance); // Number of points to fill

    for i = 0, steps do
        local t = i / steps;
        local interpX = round(x1 + t * deltaX);
        local interpY = round(y1 + t * deltaY);
        if (interpX > xoffset and interpX < 113 and interpY > yoffset and interpY < 105) then
            drawing_board[interpX - xoffset][interpY - yoffset] = true;
        end
    end
end

function round(input)
    if input - flr(input) < 0.5 then
        return flr(input)
    else
        return ceil(input)
    end
end


-- Fill functions
function fill_enclosed_areas(drawing_board)
    local enclosed_areas = check_enclosed_areas(drawing_board)

    for i = 1, #enclosed_areas do
        fill_area(drawing_board, enclosed_areas[i])
    end
    return drawing_board
end



function check_enclosed_areas(drawing_board)
    local visited = {}
    local enclosed_areas = {}
    local enclosed_areas_coords = {}

    -- need to copy the drawing board to visited
    for x = 1, 96 do
        visited[x] = {}
        for y = 1, 80 do
            visited[x][y] = drawing_board[x][y]
        end
    end
    for x = 1, 96 do
        for y = 1, 80 do
            if visited[x][y] == false then
                visited, enclosed_areas_coords = fill_area(visited, {x=x, y=y})
                if #enclosed_areas_coords > 0 then
                    add(enclosed_areas, enclosed_areas_coords[1])
                end
            end
        end
    end
    return enclosed_areas
end



function fill_area(drawing_board, coords)
    drawing_board[coords.x][coords.y] = true
    
    local stack = {}
    local enclosed = true
    local enclosed_areas = {}
    
    add(stack, {x=coords.x, y=coords.y})

    while #stack > 0 do
        local current = stack[#stack]

        -- check up
        if current.y > 1 then
            if drawing_board[current.x][current.y - 1] == false then
                add(stack, {x = current.x, y = current.y - 1})
                drawing_board[current.x][current.y - 1] = true
            end
        else
            enclosed = false
        end
        
        -- check down
        if current.y < 80 then
            if drawing_board[current.x][current.y + 1] == false then
                add(stack, {x = current.x, y = current.y + 1})
                drawing_board[current.x][current.y + 1] = true
            end
        else
            enclosed = false
        end

        -- check left
        if current.x > 1 then
            if drawing_board[current.x - 1][current.y] == false then
                add(stack, {x = current.x - 1, y = current.y})
                drawing_board[current.x - 1][current.y] = true
            end
        else
            enclosed = false
        end

        -- check right
        if current.x < 96 then
            if drawing_board[current.x + 1][current.y] == false then
                add(stack, { x = current.x + 1, y = current.y})
                drawing_board[current.x + 1][current.y] = true
            end
        else
            enclosed = false
        end

        del(stack, current)

    end
    
    if enclosed then
        add(enclosed_areas, {x = coords.x, y = coords.y})
    end
    return drawing_board, enclosed_areas
end



-- make a mask of the drawing board - use for flood fill and within bounds checks
-- store drawing board as a 2d array of 8 bit numbers