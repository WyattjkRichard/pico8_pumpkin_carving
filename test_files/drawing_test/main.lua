function _init()
    poke(0x5f2d, 0x1)   -- enable mouse and keyboard
    drawing_board = init_drawing_board()
    x, y = 64, 64
    interpolate = false
end

function _update()
    prev_x, prev_y = x, y
    x, y = mid(stat(32), 1, 128), mid(stat(33), 1, 128)

    if stat(34) & 1 == 1 then
        if interpolate then
            interpolateAndDraw(prev_x, prev_y, x, y, drawing_board)
        else
            drawing_board[x][y] = true
            interpolate = true;
        end 
    else
        interpolate = false;
    end
end

function _draw()
    cls()
    circfill(x, y, 1, 8)
    print("x: "..x, 0, 0, 7)
    print("y: "..y, 0, 10, 7)
    print("btns: "..stat(34), 0, 20, 7)
    draw_drawing_board(drawing_board)
end

function init_drawing_board()
    local drawing_board = {}
    for i = 1, 128 do
        drawing_board[i] = {}
        for j = 1, 128 do
            drawing_board[i][j] = false
        end
    end
    return drawing_board
end

function draw_drawing_board(drawing_board)
    for i = 1, 128 do
        for j = 1, 128 do
            if drawing_board[i][j] then
                pset(i, j, 7)
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
        if (interpX >= 0 and interpX < 128 and interpY >= 0 and interpY < 128) then
            drawing_board[interpX][interpY] = true;
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