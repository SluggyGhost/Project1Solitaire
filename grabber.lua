
require "vector"

GrabberClass = {}

function GrabberClass:new()
  local grabber = {}
  local metadata = {__index = GrabberClass}
  setmetatable(grabber, metadata)
  
  grabber.previousMousePos = nil
  grabber.currentMousePos = nil
  
  grabber.grabPos = nil
  
  -- To keep track of the held object
  grabber.heldObject = nil
  
  return grabber
end

function GrabberClass:update()
  self.currentMousePos = Vector(
    love.mouse.getX(),
    love.mouse.getY()
  )
  
  -- Click (first frame)
  if love.mouse.isDown(1) and self.grabPos == nil then
    self:grab()
  end
  -- Release
  if not love.mouse.isDown(1) and self.grabPos ~= nil then
    self:release()
  end
end

function GrabberClass:grab()
  self.grabPos = self.currentMousePos
  
  -- actually grab the card
  for _, card in ipairs(cardTable) do
    if checkForMouseOver(self) then
      self.heldObject = card
      card.state = CARD_STATE.GRABBED
      break
    end
  end
  
  print("GRAB - " .. tostring(self.grabPos))
end

function GrabberClass:release()
  print("RELEASE - ")
  
  if self.heldObject == nil then -- We have nothing to release
    return
  end
  
  local isValidReleasePosition = true
  if not is ValidReleasePositon then
    self.heldObject.position = self.grabPosition
  end
  
  self.heldObject.state = 0 -- it's no longer grabbed
  
  self.heldObject = nil
  self.grabPos = nil
end