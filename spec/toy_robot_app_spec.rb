require 'toy_robot_app'

RSpec.describe ToyRobotApp do
  describe '#call' do
    context 'when passing instructions from a file to ToyRobotApp' do
      context 'when you have only one robot moving' do
        it 'processes the instructions' do
          expect do
            described_class.call('./data/test-data-1.csv') 
          end.to output("ALICE: 0, 1, NORTH\n").to_stdout
        end
      end
      
      context 'when you have only one robot moving and changing directions' do
        it 'processes the instructions' do
          expect do
            described_class.call('./data/test-data-2.csv') 
          end.to output("BOB: 0, 0, WEST\n").to_stdout
        end
      end

      context 'when you have more than one robot moving and changing directions' do
        it 'processes the instructions' do
          expect do
            described_class.call('./data/test-data-3.csv') 
          end.to output("ALICE: 3, 3, NORTH\nBOB: 4, 2, SOUTH\n").to_stdout
        end
      end

      context 'when you have more than one robot moving, changing directions and colliding' do
        it 'processes the instructions' do
          expect do
            described_class.call('./data/test-data-4.csv') 
          end.to output("ALICE: 2, 1, EAST\nBOB: 1, 1, EAST\n").to_stdout
        end
      end

      context 'when you have one robot moving and colliding with the wall' do
        it 'processes the instructions' do
          expect do
            described_class.call('./data/test-data-5.csv') 
          end.to output("ALICE: 5, 4, EAST\n").to_stdout
        end
      end
    end
  end
end