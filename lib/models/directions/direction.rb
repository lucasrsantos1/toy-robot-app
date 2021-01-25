# frozen_string_literal: true

require_relative './north'
require_relative './east'
require_relative './south'
require_relative './west'

module Directions
  class Direction
    class UnknownDirection < StandardError; end

    def self.class_for(direction)
      {
        "north" => North,
        "east" => East,
        "south" => South,
        "west" => West,
        }[direction.downcase] || unknown_direction
      end
      
    private

    def self.unknown_direction
      raise UnknownDirection
    end
  end
end
