# frozen_string_literal: true

require_relative './north'
require_relative './south'

module Directions
  class East
    def self.left
      North
    end

    def self.right
      South
    end

    def self.move(x:, y:)
      x += 1

      [x, y]
    end

    def self.to_s
      "EAST"
    end
  end
end
