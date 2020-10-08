-- https://github.com/rxi/classic
Object = require "Game/classic"

require "Game/About"
require "Game/Ball"
require "Game/Brick"
require "Game/Bricks"
require "Game/Button"
require "Game/Collisions"
require "Game/Game"
require "Game/Heart"
require "Game/InfoBar"
require "Game/Level"
require "Game/Options"
require "Game/Paddle"
require "Game/Sounds"
require "Game/Text"

require "Game/states/BaseState"
require "Game/states/MenuState"
require "Game/states/StateMachine"

WINDOW_WIDTH = 800
WINDOW_HEIGHT = 800


function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
    love.window.setTitle("Breakout++")


    stateMachine = StateMachine {
        ['title'] = function() return MenuState() end,
    }

    stateMachine:change('title')

end 


function love.update(dt)
    stateMachine:update(dt)
end 


function love.draw()
    love.graphics.setBackgroundColor(133/255, 205/255, 202/255, 0)
    stateMachine:draw()
end 

