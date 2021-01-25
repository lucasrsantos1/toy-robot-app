require 'representers/robot_reporter'

RSpec.describe RobotReporter do
  subject(:robot_reporter) { described_class.new(name: "Test", x: 1, y: 1, direction: double("North", to_s: "north")) }

  describe '#report' do
    it 'prints the robot info' do
      expect { robot_reporter.report }.to output("Test: 1, 1, north\n").to_stdout
    end
  end
end
