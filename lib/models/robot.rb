# frozen_string_literal: true

require_relative '../representers/robot_reporter'
require_relative './directions/direction'

class Robot
  attr_reader :name, :board, :x, :y, :direction

  def initialize(name:, board:, overrides: {})
    @name = name
    @board = board
    @x = nil
    @y = nil
    @direction = nil
    @reporter = overrides.fetch(:reporter) { RobotReporter }
  end

  def place(x:, y:, direction:)
    return unless board.valid_position?(x: x, y: y)

    move_position(obj: self, x: x, y: y, direction: get_direction(direction))
  end

  def move
    return unless is_placed?

    x_coord, y_coord = direction.move(x: x, y: y)

    move_position(obj: self, x: x_coord, y: y_coord, direction: direction)
  end

  def left
    return unless is_placed?

    self.direction = direction.left
  end

  def right
    return unless is_placed?

    self.direction = direction.right
  end

  def report
    return unless is_placed?

    @reporter.new(name: name, x: x, y: y, direction: direction).report
  end

  private
  
  attr_writer :x, :y, :direction

  def move_position(obj:, x:, y:, direction:)
    if board.occupy(obj: obj, x: x, y: y)
      self.x = x
      self.y = y
      self.direction = direction
    end
  end

  def is_placed?
    return false unless @x && @y && @direction
    
    true
  end

  def get_direction(direction)
    Directions::Direction.class_for(direction)
  end
end
