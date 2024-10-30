function _init()
    poke(0x5f2d, 0x1)   -- enable mouse and keyboard
    x, y = 64, 64
    interpolate = false

    x_offset, y_offset = 16, 24
    x_min, x_max, y_min, y_max = 1, 96, 1, 80
    drawing_board = init_drawing_board()
end

function _update()
    prev_x, prev_y = x, y
    x, y = mid(stat(32), 0, 127), mid(stat(33), 0, 127)

    if stat(34) & 1 == 1 then
        if within_bounds(x, y) then
            if interpolate then
                interpolateAndDraw(prev_x, prev_y, x, y, drawing_board)
            else
                drawing_board[x - x_offset][y - y_offset] = true
                interpolate = true;
            end

            if(stat(50) == -1) then
                sfx(0, 0)
            end
        else
            interpolate = false
        end
    elseif interpolate then
        interpolate = false
        fill_enclosed_areas(drawing_board)
    end
end

function _draw()
    cls()
    map()
    map(16, 0, 16, 8, 12, 12)
    draw_drawing_board(drawing_board)
    draw_cursor(x, y)
    
    -- circfill(x, y, 1, 8)
    --[[
    print("x: "..x, 0, 0, 7)
    print("y: "..y, 0, 10, 7)
    print("btns: "..stat(34), 0, 20, 7)
    print("note"..stat(50))
    ]]
end

function within_bounds(x, y)
    -- x and y will be within a range of 0-127
    center_x, center_y, width, height =  63, 64, 95, 75
    pset()
    -- Translate the mouse coordinates relative to the center of the ellipse
    dx = x - center_x
    dy = y - center_y
    -- Calculate if the point is inside the ellipse using the standard ellipse formula
    -- (dx^2 / (width / 2)^2) + (dy^2 / (height / 2)^2) <= 1
    return (dx * dx) / ((width / 2) * (width / 2)) + (dy * dy) / ((height / 2) * (height / 2)) <= 1


    -- set the bounds of the drawing board to include a 1px border around the drawing board to allow for an improved fill algorithm
    -- return x > x_offset + 1 and x < x_offset + x_max - 1 and y > y_offset + 1 and y < y_offset + y_max - 1

end

function init_drawing_board()
    local drawing_board = {}

    for x = x_min, x_max do
        drawing_board[x] = {}
        for y = y_min, y_max do
            drawing_board[x][y] = false
        end
    end
    return drawing_board
end

function draw_drawing_board(drawing_board)
    for x = x_min, x_max do
        for y = y_min, y_max do
            if drawing_board[x][y] then
                pset(x + x_offset, y + y_offset, 0)
            end
        end
    end
end

function draw_cursor(x, y)
    spr(92, x, y)
    spr(93, x + 8, y)
    spr(108, x, y + 8)
    spr(109, x + 8, y + 8)
    spr(93, x + 16, y + 8)
    spr(125, x + 8, y + 16)
    spr(126, x + 16, y + 16)
    spr(93, x+ 24, y + 16)
    spr(142, x + 16, y + 24)
    spr(143, x + 24, y + 24)
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
        if within_bounds(interpX, interpY) then
            drawing_board[interpX - x_offset][interpY - y_offset] = true;
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

    local visited = {}
    local enclosed_areas = {}

    local enclosed_areas_coords = {}

    -- need to copy the drawing board to visited
    for x = x_min, x_max do
        visited[x] = {}
        for y = y_min, y_max do
            visited[x][y] = drawing_board[x][y]
        end
    end
    
    -- run fill area on visited to fill everythin that is not enclosed
    visited = fill_area(visited)

    -- fill all enclosed areas
    for x = x_min + 1, x_max - 1 do
        for y = y_min + 1, y_max - 1 do
            if visited[x][y] == false then
                drawing_board[x][y] = true
            end
        end
    end

end


function fill_area(drawing_board)
    local first_row, last_row, first_column, last_column, empty = y_min, y_max, x_min, x_max, true
    local stack = {}

    -- run through the drawing board and find the first and last rows that have filled pixels
    for y = y_min, y_max do
        for x = x_min, x_max do
            if drawing_board[x][y] == true then
                empty = false
            end
        end
        if empty == false then
            if y > y_min + 2 then
                first_row = y - 2
            end
            break
        end
    end

    empty = true
    for y = y_max, y_min, -1 do
        for x = x_min, x_max do
            if drawing_board[x][y] == true then
                empty = false
            end
        end
        if empty == false then
            if y < y_max - 2 then
                last_row = y + 2
            end
            break
        end
    end

    empty = true
    for x = x_min, x_max do
        for y = y_min, y_max do
            if drawing_board[x][y] == true then
                empty = false
            end
        end
        if empty == false then
            if x > x_min + 2 then
                first_column = x - 2
            end
            break
        end
    end

    empty = true
    for x = y_max, y_min, -1 do
        for x = x_min, x_max do
            if drawing_board[x][y] == true then
                empty = false
            end
        end
        if empty == false then
            if  x < x_max + 2 then
                last_column = x + 2
            end
            break
        end
    end

    -- fill the empty rows/columns from the outside in
    if first_row > y_min then
        for y = y_min, first_row do
            for x = x_min, x_max do
                drawing_board[x][y] = true
            end
        end
        first_row += 1
    end

    if last_row < y_max then
        for y = last_row, y_max do
            for x = x_min, x_max do
                drawing_board[x][y] = true
            end
        end
    end

    if first_column > x_min then
        for x = x_min, first_column do
            for y = y_min, y_max do
                drawing_board[x][y] = true
            end
        end
        first_column += 1
    end

    if last_column < x_max then
        for x = last_column, x_max do
            for y = y_min, y_max do
                drawing_board[x][y] = true
            end
        end
    end
    
    drawing_board[first_column][first_row] = true
    add(stack, {x=first_column, y=first_row})

    while #stack > 0 do
        local current = stack[#stack]

        -- check up
        if current.y > y_min then
            if drawing_board[current.x][current.y - 1] == false then
                add(stack, {x = current.x, y = current.y - 1})
                drawing_board[current.x][current.y - 1] = true
            end
        end
        
        -- check down
        if current.y < y_max then
            if drawing_board[current.x][current.y + 1] == false then
                add(stack, {x = current.x, y = current.y + 1})
                drawing_board[current.x][current.y + 1] = true
            end
        end

        -- check left
        if current.x > x_min then
            if drawing_board[current.x - 1][current.y] == false then
                add(stack, {x = current.x - 1, y = current.y})
                drawing_board[current.x - 1][current.y] = true
            end
        end

        -- check right
        if current.x < x_max then
            if drawing_board[current.x + 1][current.y] == false then
                add(stack, { x = current.x + 1, y = current.y})
                drawing_board[current.x + 1][current.y] = true
            end
        end

        del(stack, current)

    end
    
    return drawing_board
end