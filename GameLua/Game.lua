require "Paddle"
require "Ball"
require "Bricks"
require "Collisions"

Game = Object:extend()


--[[
    Game object constructor
    - initialize game components:
        paddle, ball and bricks
--]]
function Game:new()
    --self.bricks = Bricks()
    self.paddle = Paddle()
    self.ball = Ball()
    self.collisions = Collisions()
    self.bricks = nil 
end 


--[[
    Draw ball, paddle and bricks on the screen
--]]
function Game:draw()
    self.ball:draw()
    self.paddle:draw()
    self.bricks:draw()
end 


--[[
    Update component information
--]]
function Game:update(dt)
    self.collisions:ballPaddleCollision(self.ball, self.paddle)
    self.collisions:ballBricksCollision(self.ball, self.bricks)
    self.ball:update(dt, self.paddle)
    self.paddle:update(dt)
end 