--[[
turtlemovement.lua, my version of lama

tData table:
tData[1] is turtle position
{1,2,3,"east"}
]]

local settingsPath = ".tm/settings"

if not fs.exists(settingsPath) then
  fs.open(settingsPath,"w")
end

local tm = {}

local function save(tTbl,sFilepath)
  local file = fs.open(sFilepath,"w")
  file.write(textutils.serialise(tTbl))
  file.close()
end

local function load(sFilepath)
  local file = fs.open(sFilepath,"r")
  local data = file.readAll()
  file.close()
  return textutils.unserialise(data)
end

local tData = load(settingsPath)

local tLoc = tData[1]
local x,y,z,facing = tLoc[1],tLoc[2],tLoc[3],tLoc[4]

local function savePos()
  tLoc[1],tLoc[2],tLoc[3],tLoc[4] = x,y,z,facing
  tData[1] = tLoc
  save(tData,settingsPath)
end

function tm.forward(nDistance)
  nDistance = nDistance or 1
  for i=1,nDistance do
      if turtle.forward() then
      if facing == "north" then z = z - 1
      elseif facing == "west" then x = x - 1
      elseif facing == "south" then z = z + 1
      elseif facing == "east" then x = x + 1 end
    end
  end
  savePos()
end

function tm.back(nDistance)
  nDistance = nDistance or 1
  for i=1,nDistance do
      if turtle.back() then
        if facing == "north" then z = z + 1
        elseif facing == "west" then x = x + 1
        elseif facing == "south" then z = z - 1
        elseif facing == "east" then x = x - 1 end
      end
  end
  savePos()
end

function tm.up(nDistance)
  nDistance = nDistance or 1
  for i=1,nDistance do
    if turtle.up() then y = y + 1 end
  end
  savePos()
end

function tm.down(nDistance)
  nDistance = nDistance or 1
  for i=1,nDistance do
    if turtle.down() then y = y - 1 end
  end
  savePos()
end

function tm.turnLeft()
  turtle.turnLeft()
  if facing == "north" then facing = "west"
  elseif facing == "west" then facing = "south"
  elseif facing == "south" then facing = "east"
  elseif facing == "east" then facing = "north" end
  savePos()
end

function tm.turnRight()
  turtle.turnRight()
  if facing == "north" then facing = "east"
  elseif facing == "west" then facing = "north"
  elseif facing == "south" then facing = "west"
  elseif facing == "east" then facing = "south" end
  savePos()
end

function tm.setPosition(x,y,z,facing)
  tLoc[1],tLoc[2],tLoc[3],tLoc[4] = x,y,z,facing
end

function tm.face(sDirection)
  if sDirection == "north" then
    if facing == "west" then tm.turnRight()
    elseif facing == "south" then tm.turnRight() tm.turnRight()
    elseif facing == "east" then tm.turnLeft() end
  elseif sDirection == "west" then
    if facing == "south" then tm.turnRight()
    elseif facing == "east" then tm.turnRight() tm.turnRight()
    elseif facing == "north" then tm.turnLeft() end
  elseif sDirection == "south" then
    if facing == "east" then tm.turnRight()
    elseif facing == "north" then tm.turnRight() tm.turnRight()
    elseif facing == "west" then tm.turnLeft() end
  elseif sDirection == "east" then
    if facing == "north" then tm.turnRight()
    elseif facing == "west" then tm.turnRight() tm.turnRight()
    elseif facing == "south" then tm.turnLeft() end
  end
  savePos()
end

function tm.getPosition()
  return x,y,z,facing
end

function tm.save()
  savePos()
end

return tm
