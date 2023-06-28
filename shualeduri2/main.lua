function love.load()

    player = {
        x = 200,
        y = 200,
        speed = 200
    }

    
    enemies = {}

  
    numEnemies = 5


    for i = 1, numEnemies do
        table.insert(enemies, {
            x = love.math.random(50, love.graphics.getWidth() - 50),
            y = love.math.random(50, love.graphics.getHeight() - 50),
            speed = love.math.random(100, 300)
        })
    end
end

function love.update(dt)
    
    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed * dt
    elseif love.keyboard.isDown("down") then
        player.y = player.y + player.speed * dt
    end

    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed * dt
    elseif love.keyboard.isDown("right") then
        player.x = player.x + player.speed * dt
    end

  
    for i, enemy in ipairs(enemies) do
        enemy.x = enemy.x + enemy.speed * dt

     
        if checkCollision(player.x, player.y, 50, 50, enemy.x, enemy.y, 50, 50) then
            player.x = 200
            player.y = 200
        end

   
        if enemy.x > love.graphics.getWidth() then
            enemy.x = -50
            enemy.y = love.math.random(50, love.graphics.getHeight() - 50)
        end
    end
end

function love.draw()
   
    love.graphics.rectangle("fill", player.x, player.y, 50, 50)

    for i, enemy in ipairs(enemies) do
        love.graphics.rectangle("fill", enemy.x, enemy.y, 50, 50)
    end
end

-- Function to check for collision between two rectangles
function checkCollision(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 < x2 + w2 and
           x2 < x1 + w1 and
           y1 < y2 + h2 and
           y2 < y1 + h1
end
