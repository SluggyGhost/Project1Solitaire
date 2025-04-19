
require "vector"

CardClass = {}

CARD_STATE = {
  IDLE = 0,
  MOUSE_OVER = 1,
  GRABBED = 2
}

function CardClass:new(xPos, yPos)
  local card = {}
  local metadata = {__index = cardClass}
  setmetatable(card, metadata)
  
  
  
  card
end
