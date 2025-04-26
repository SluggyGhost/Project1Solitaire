Pile = {}
Pile.__index = Pile

function Pile:new(x, y, type)
    local pile = {
        position = Vector(x, y),
        cards = {},
        type = type -- "deck", "suit", "tableau", "draw"
    }
    setmetatable(pile, Pile)
    return pile
end

function Pile:addCard(card)
    table.insert(self.cards, card)
    card.position = self.position + Vector(0, 20 * (#self.cards - 1)) -- for tableau spacing
end

function Pile:topCard()
    return self.cards[#self.cards]
end

function Pile:removeTopCard()
    return table.remove(self.cards)
end