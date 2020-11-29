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

local function fillGPS()
  sleep(5)
  local x,y,z = tm.getPosition()
  local fX,fY,fZ = math.floor(fX+0.5),math.floor(fY+0.5),math.floor(fZ+0.5)
  term.setCursorPos(20,5)
  term.write(tostring(fX))
  term.setCursorPos(20,6)
  term.write(tostring(fY))
  term.setCursorPos(20,7)
  term.write(tostring(fZ))
end

local function main()
  sleep(5)
end

parallel.waitForAny(main,fillGPS)
