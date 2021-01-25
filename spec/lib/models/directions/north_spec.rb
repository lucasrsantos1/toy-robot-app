require 'models/directions/north'

RSpec.describe ::Directions::North do
  describe '#left' do
    it 'returns the West class' do
      expect(described_class.left).to eq(Directions::West)
    end
  end

  describe '#right' do
    it 'returns the East class' do
      expect(described_class.right).to eq(Directions::East)
    end
  end

  describe '#move' do
    context 'when calling move with 1, 1 coordinates' do
      it 'returns 1, 2' do
        expect(described_class.move(x: 1, y: 1)).to eq([1, 2])
      end
    end
  end
end
