local file = require("libraries.file")
local graphic = require("libraries.graphic")

local guiLayerOne = "img/gui-layer-one.skgrp"

local function drawGui()
  file.loadGrpLines(guiLayerOne)
end

drawGui()
