# frozen_string_literal: true

require_relative './north'
require_relative './south'

module Directions
  class North
    def self.left
      West
    end

    def self.right
      East
    end

    def self.move(x:, y:)
      y += 1

      [x, y]
    end

    def self.to_s
      "NORTH"
    end
  end
end
