require 'models/directions/direction'

RSpec.describe ::Directions::Direction do
  context 'when requesting a class for a direction' do
    context 'when the direction is north' do
      it 'returns the class North' do
        expect(described_class.class_for("north")).to eq(Directions::North)
      end
    end

    context 'when the direction is east' do
      it 'returns the class East' do
        expect(described_class.class_for("east")).to eq(Directions::East)
      end
    end

    context 'when the direction is south' do
      it 'returns the class South' do
        expect(described_class.class_for("south")).to eq(Directions::South)
      end
    end

    context 'when the direction is west' do
      it 'returns the class West' do
        expect(described_class.class_for("west")).to eq(Directions::West)
      end
    end

    context 'when using mixed letter casing' do
      it 'ignores the casing' do
        expect(described_class.class_for("NoRtH")).to eq(Directions::North)
      end
    end

    context 'when given an invalid direction' do
      it 'raises UnknownDirection' do
        expect { described_class.class_for("invalid") }.to raise_error(Directions::Direction::UnknownDirection)
      end
    end
  end
end
