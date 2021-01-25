require 'models/directions/east'

RSpec.describe ::Directions::East do
  describe '#left' do
    it 'returns the North class' do
      expect(described_class.left).to eq(Directions::North)
    end
  end

  describe '#right' do
    it 'returns the South class' do
      expect(described_class.right).to eq(Directions::South)
    end
  end

  describe '#move' do
    context 'when calling move with 1, 1 coordinates' do
      it 'returns 2, 1' do
        expect(described_class.move(x: 1, y: 1)).to eq([2, 1])
      end
    end
  end
end
