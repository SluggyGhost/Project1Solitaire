
require "vector"

Grabber = {}
Grabber.__index = Grabber

function Grabber:new()
    local grabber = {
        held_card = nil,
        offset = Vector(0, 0)
    }
    setmetatable(grabber, Grabber)
    return grabber
end

function Grabber:grab(card, mx, my)
    if card and card.face_up then
        self.held_card = card
        self.offset = Vector(mx, my) - card.position
        card.state = "grabbed"
    end
end

function Grabber:release()
    if self.held_card then
        self.held_card.state = "idle"
        self.held_card = nil
    end
end

function Grabber:update(mx, my)
    if self.held_card then
        self.held_card.position = Vector(mx, my) - self.offset
    end
end
