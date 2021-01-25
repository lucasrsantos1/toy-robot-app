# frozen_string_literal: true

require_relative './north'
require_relative './south'

module Directions
  class West
    def self.left
      South
    end

    def self.right
      North
    end

    def self.move(x:, y:)
      x -= 1

      [x, y]
    end

    def self.to_s
      "WEST"
    end
  end
end
