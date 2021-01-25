require 'models/robot'
require 'models/board'

RSpec.describe Robot do
  let(:board) { instance_spy(Board) }
  subject(:robot) { described_class.new(name: "Test", board: board)}

  describe '#place' do
    context 'when trying to place in a valid position' do
      it 'asks the board to occupy that position' do
        allow(board).to receive(:valid_position?).with(x: 1, y: 1).and_return(true)
        
        robot.place(x: 1, y: 1, direction: "north")
  
        expect(board).to have_received(:occupy).with(obj: robot, x: 1, y: 1)  
      end

      it 'stores current position' do
        allow(board).to receive(:valid_position?).with(x: 1, y: 1).and_return(true)
        
        robot.place(x: 1, y: 1, direction: "north")
        
        expect(robot.x).to eq(1)
        expect(robot.y).to eq(1)
      end

      it 'stores current direction' do
        allow(board).to receive(:valid_position?).with(x: 1, y: 1).and_return(true)
        
        robot.place(x: 1, y: 1, direction: "north")

        expect(robot.direction).to eq(Directions::North)
      end
    end

    context 'when trying to place in an invalid position' do
      it 'does not ask the board to occupy that position' do
        allow(board).to receive(:valid_position?).with(x: 1, y: 1).and_return(false)
        
        robot.place(x: 1, y: 1, direction: "north")
  
        expect(board).to_not have_received(:occupy)
      end

      it 'does not store current position' do
        allow(board).to receive(:valid_position?).with(x: 1, y: 1).and_return(false)
        
        robot.place(x: 1, y: 1, direction: "north")

        expect(robot.x).to eq(nil)
        expect(robot.y).to eq(nil)
      end

      it 'does not store current direction' do
        allow(board).to receive(:valid_position?).with(x: 1, y: 1).and_return(false)
        
        robot.place(x: 1, y: 1, direction: "north")

        expect(robot.direction).to eq(nil)
      end
    end
  end

  describe '#move' do
    context 'when robot has been placed' do
      it 'moves the robot position' do
        allow(board).to receive(:valid_position?).with(x: 1, y: 1).and_return(true)
            
        robot.place(x: 1, y: 1, direction: "north")
  
        robot.move
  
        expect(robot.y).to eq(2)
      end
    end

    context 'when robot has not been placed' do
      it 'does not move' do
        expect(robot.move).to eq(nil)
      end
    end
  end

  describe '#left' do
    context 'when robot has been placed' do
      it 'changes direction' do
        allow(board).to receive(:valid_position?).with(x: 1, y: 1).and_return(true)
          
        robot.place(x: 1, y: 1, direction: "north")
        
        expect(robot.left).to eq(Directions::West)  
      end
    end

    context 'when robot has not been placed' do
      it 'does not do anything' do
        expect(robot.left).to eq(nil)
      end
    end
  end

  describe '#right' do
    context 'when robot has been placed' do
      it 'changes direction' do
        allow(board).to receive(:valid_position?).with(x: 1, y: 1).and_return(true)
          
        robot.place(x: 1, y: 1, direction: "north")
        
        expect(robot.right).to eq(Directions::East)  
      end
    end

    context 'when robot has not been placed' do
      it 'does not do anything' do
        expect(robot.left).to eq(nil)
      end
    end
  end

  describe '#report' do
    subject(:robot) { described_class.new(name: "Test", board: board, overrides: { reporter: FakeReporter })}
    
    context 'when passing a new reporter' do
      it 'prints report' do
        allow(board).to receive(:valid_position?).with(x: 1, y: 1).and_return(true)
            
        robot.place(x: 1, y: 1, direction: "north")
  
        expect do
          robot.report
        end.to output("Name: Test X: 1 Y: 1 Direction: NORTH\n").to_stdout
      end
    end
  end
end

class FakeReporter
  def initialize(name:, x:, y:, direction:)
    @name = name
    @x = x
    @y = y
    @direction = direction
  end

  def report
    puts "Name: #{@name} X: #{@x} Y: #{@y} Direction: #{@direction.to_s}"
  end
end