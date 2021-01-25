# frozen_string_literal: true

class RobotReporter
  def initialize(name:, x:, y:, direction:)
    @name = name
    @x = x
    @y = y
    @direction = direction
  end

  def report
    puts "#{name}: #{x}, #{y}, #{direction.to_s}"
  end

  private

  attr_reader :name, :x, :y, :direction
end
