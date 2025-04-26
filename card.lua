
require "vector"

Card = {}
Card.__index = Card

function Card:new(suit, rank)
    local card = {
        suit = suit,
        rank = rank,
        face_up = false,
        state = "idle", -- can be "idle", "grabbed", or "mouse_over"
        position = Vector(0, 0),
        offset = Vector(0, 0)
    }
    setmetatable(card, Card)
    return card
end

function Card:isMouseOver(mx, my)
    local x, y = self.position.x, self.position.y
    return mx > x and mx < x + 72 and my > y and my < y + 96 -- assuming card size
end

function Card:draw()
  local x, y = self.position.x, self.position.y

  if not self.face_up then
    love.graphics.draw(images.card_face_down, x, y)
    return
  end

  -- Base card
  love.graphics.draw(images.card, x, y)

  -- Corner: mini suit + rank
  local mini_suit = images["mini_" .. self.suit]
  local rank_img = images[self.rank]
  if mini_suit then love.graphics.draw(mini_suit, x + 8, y + 8) end
  if rank_img then love.graphics.draw(rank_img, x + 28, y + 8) end

  -- Face card or pip
  if self.rank >= 11 and self.rank <= 13 then
    local face_key = ({ [11]="jack", [12]="queen", [13]="king" })[self.rank]
    local portrait = images["face_" .. face_key]
    if portrait then
      love.graphics.draw(portrait, x + 10, y + 40) -- adjust position as needed
    end
  else
    local center_pip = images["pip_" .. self.suit]
    if center_pip then
      love.graphics.draw(center_pip, x + 25, y + 40)
    end
  end
end