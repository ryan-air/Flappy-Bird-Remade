
ScoreState = Class{__includes = BaseState}

local gold = love.graphics.newImage('medal_gold.png')
local silver = love.graphics.newImage('apprentice_medal.png')
local bronze = love.graphics.newImage('junior_medal.png')

function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    if self.score >= 25 then
        love.graphics.printf('Congratualtions you got a gold medal', 0, 200, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(gold, VIRTUAL_WIDTH / 2 - gold:getWidth() / 2, 120)
    elseif self.score >= 15 then
        love.graphics.printf('Congratualtions you got a silver medal!', 0, 200, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(silver, VIRTUAL_WIDTH / 2 - silver:getWidth() / 2, 120)
    elseif self.score >= 5 then
        love.graphics.printf('Congratualtions you got a bronze medal!', 0, 200, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(bronze, VIRTUAL_WIDTH / 2 - bronze:getWidth() / 2, 120)
    elseif self.score >= 0 then
        love.graphics.printf('Try harder', 0, 200, VIRTUAL_WIDTH, 'center')
    end


    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
    
end