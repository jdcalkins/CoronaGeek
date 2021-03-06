--
-- Project: RobotWars
-- Description: 
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- MIT license
-- Brian Burton, Ed.D. - http://www.burtonsmediagroup.com

local spEffects = require("spEffects")

 
 local bot1 = display.newRect(150,250, 50, 200)
 bot1:setFillColor(255,0,0)

 local bot2 = display.newRect(display.contentWidth-150, 250, 50, 200)
 bot2:setFillColor(0,0,255)
 
 curDetail = 1 					-- needed for lightning
 lines = display.newGroup()     -- needed for lightning
 
 -- Lightning has 5 levels: 1: zap 5: big lightning strike
 lightningLevel = 5

local function ontouch(e)
        if e.phase == 'began' then
            local lightning =  spEffects.drawLightning(bot2.x, bot2.y, bot1.x, bot1.y, 100, 255, 255, 255, lightningLevel)
        	timer.performWithDelay(500, function() display.getCurrentStage():remove(3); lines = display.newGroup() end)
        end
end

 
Runtime:addEventListener('touch', ontouch)