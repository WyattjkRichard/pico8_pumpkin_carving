function _init()
    poke(0x5f2d, 0x1)   -- enable mouse and keyboard
    drawing_board = {{false, false, false, true, true, true, true},
                    {false, false, false, true, false, false, true},
                    {false, false, true, false, true, false, true},
                    {true, true, false, false, false, true, true},
                    {false, false, true, false, true, false, false},
                    {false, false, false, true, false, false, false},
                    {false, false, false, true, false, false, false}}
    x, y = 64, 64
end

function _update()
    prev_x, prev_y = x, y
    x, y = mid(stat(32), 1, 128), mid(stat(33), 1, 128)
    fill_enclosed_areas(drawing_board)
end

function _draw()
    cls()
    circfill(x, y, 1, 8)
    print("x: "..x, 0, 0, 7)
    print("y: "..y, 0, 10, 7)
    print("btns: "..stat(34), 0, 20, 7)
    draw_drawing_board(drawing_board)
end


function draw_drawing_board(drawing_board)
    for i = 1, 7 do
        for j = 1, 7 do
            if drawing_board[i][j] then
                pset(i+64, j+64, 7)
            end
        end
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
    for x = 1, 7 do
        visited[x] = {}
        for y = 1, 7 do
            visited[x][y] = drawing_board[x][y]
        end
    end

    for x = 1, 7 do
        for y = 1, 7 do
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
        if current.y < 7 then
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
        if current.x < 7 then
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