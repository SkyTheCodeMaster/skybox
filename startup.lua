local file = require("libraries.file")
local graphic = require("libraries.graphic")
local tm = require("libraries.tm")

local guiLayerOne = "img/gui-layer-one.skgrp"
local guiLayerTwo = "img/gui-layer-two.skgrp"

local function drawGui()
  file.loadGrpLines(guiLayerOne)
  file.loadGrpLines(guiLayerTwo)
end

term.clear()

drawGui()

local drawGPS = true

local function fillGPS()
  while true do
    if drawGPS then
      local x,y,z = tm.getPosition()
      local fX,fY,fZ = math.floor(x+0.5),math.floor(y+0.5),math.floor(z+0.5)
      term.setCursorPos(20,3)
      term.write(tostring(fX))
      term.setCursorPos(20,4)
      term.write(tostring(fY))
      term.setCursorPos(20,5)
      term.write(tostring(fZ))
      sleep(0.2)
    end
  end
end

local function main()
  while true do
    sleep(5)
  end
end

parallel.waitForAny(main,fillGPS)
