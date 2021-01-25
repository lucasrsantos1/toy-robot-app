# frozen_string_literal: true

require_relative './east'
require_relative './west'

module Directions
  class South
    def self.left
      East
    end

    def self.right
      West
    end

    def self.move(x:, y:)
      y -= 1

      [x, y]
    end

    def self.to_s
      "SOUTH"
    end
  end
end
