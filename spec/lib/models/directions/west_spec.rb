require 'models/directions/west'

RSpec.describe ::Directions::West do
  describe '#left' do
    it 'returns the South class' do
      expect(described_class.left).to eq(Directions::South)
    end
  end

  describe '#right' do
    it 'returns the North class' do
      expect(described_class.right).to eq(Directions::North)
    end
  end

  describe '#move' do
    context 'when calling move with 1, 1 coordinates' do
      it 'returns 0, 1' do
        expect(described_class.move(x: 1, y: 1)).to eq([0, 1])
      end
    end
  end
end
