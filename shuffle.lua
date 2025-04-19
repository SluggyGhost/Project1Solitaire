
-- NOT SURE WHERE THIS GOES, SO HERE IT IS

-- Returns the table after shuffling
-- Uses modern Fisher-Yates
function shuffle(deck)
  local cardCount = #deck
  for i = 1, cardCount do
    local randIndex = math.random(cardCount)
    local temp = deck[randIndex]
    deck[randIndex] = deck[cardCount]
    deck[cardCount] = temp
    cardCount = cardCount - 1
  end
  return deck
end
