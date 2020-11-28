local file = require("libraries.file")
local graphic = require("libraries.graphic")

local guiLayerOne = "img/gui-layer-one.skgrp"
local guiLayerTwo = "img/gui-layer-two.skgrp"

local function drawGui()
  file.loadGrpLines(guiLayerOne)
  file.loadGrpLines(guiLayerTwo)
end

term.clear()

drawGui()

local function fillGPS()
  
end
