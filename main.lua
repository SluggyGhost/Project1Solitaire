-- Joshua Acosta
-- CMPM 121 - Project 1: Solitaire
-- 4-17-25
io.stdout:setvbuf("no") -- No delay on terminal messages

require "card"
--require "grabber"

function love.load()
  -- Set the window and background
  love.window.setMode(960, 640)
  love.graphics.setBackgroundColor(0, 0.7, 0.2, 1)
  
  -- Load image files
  images = {}
  for nameIndex, name in ipairs({
      1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
      'pip_heart', 'pip_diamond', 'pip_club', 'pip_spade',
      'mini_heart', 'mini_diamond', 'mini_club', 'mini_spade',
      'card', 'card_face_down',
      'face_jack', 'face_queen', 'face_king',
  }) do
      images[name] = love.graphics.newImage('images/'..name..'.png')
  end
end

function love.update()
end

function love.draw()
--  for cardIndex, card in ipairs(playerHand) do
--    love.graphics.draw(images.card, (cardIndex - 1) * 60)
--  end
--  love.graphics.draw(images.card, 1 * 60, 30)
--  love.graphics.draw(images.card, 2 * 60, 30)
--  love.graphics.draw(images.card, 3 * 60, 30)
--  love.graphics.draw(images.card, 4 * 60, 30)
--  love.graphics.draw(images.card, 5 * 60, 30)
  
  if not testCards then
    testCards = {}
    local suits = {"heart", "diamond", "club", "spade"}
    for i = 1, 5 do
      local card = Card:new(suits[(i % 4) + 1], i + 8) -- 9 to King
      card.face_up = true
      card.position = Vector(i * 80, 50)
      table.insert(testCards, card)
    end
  end

  for _, card in ipairs(testCards) do
    card:draw()
  end
  
end
