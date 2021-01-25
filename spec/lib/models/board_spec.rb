require 'models/board'

RSpec.describe Board do
  subject(:board) { described_class.new(size: 2) }
  let(:obj) { double(name: 'test', x: 1, y: 1) }

  describe '#valid_position?' do
    context 'when position is currently empty' do
      it 'returns true' do
        expect(board.valid_position?(x: 0, y: 0)).to be true
      end
    end

    context 'when position is occupied' do
      it 'returns false' do
        board.occupy(obj: obj, x: 0, y: 0)
        expect(board.valid_position?(x: 0, y: 0)).to be false
      end
    end
  end

  describe '#occupy' do
    context 'when position is currently empty' do
      it 'moves obj into requested position' do
        board.occupy(obj: obj, x: 1, y: 1)

        expect(board.grid).to eq [[nil, nil], [nil, obj.name]]
      end

      it 'frees previous position' do
        board.occupy(obj: obj, x: 1, y: 1)
        board.occupy(obj: obj, x: 0, y: 1)

        expect(board.grid).to eq [[nil, obj.name], [nil, nil]]
      end
    end

    context 'when position is occupied' do
      it 'returns false' do
        board.occupy(obj: obj, x: 0, y: 0)

        expect(board.occupy(obj: obj, x: 0, y: 0)).to be false
      end
    end
  end
end
