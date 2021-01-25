# frozen_string_literal: true

class Board
  attr_reader :grid

  def initialize(size: 6)
    @grid = create_grid(size)
    @size = size
  end

  def valid_position?(x:, y:)
    edge_range.cover?(x) && edge_range.cover?(y) && grid[x][y].nil?
  end

  def occupy(obj:, x:, y:)
    return false unless valid_position?(x: x, y: y)

    grid[obj.x][obj.y] = nil if obj.x && obj.y
    grid[x][y] = obj.name
  end

  private

  attr_reader :size

  def create_grid(size)
    Array.new(size).tap do |grid|
      size.times do |r_index|
        grid[r_index] = Array.new(size)
      end
    end
  end

  def edge_range
    0...size
  end
end
