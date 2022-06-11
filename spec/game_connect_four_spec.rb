require_relative '../lib/game_connect_four'

describe ConnectFourGame do
  describe '#player_input' do
    subject(:game_input) { described_class.new(board) }
    let(:board) { double('board') }
    context 'player inputs a correct value' do
      before do
        allow(game_input).to receive(:puts)
        allow(game_input).to receive(:gets).and_return('4')
        allow(game_input).to receive(:verify_input).and_return('4')
      end

      it 'returns the value' do
        result = game_input.player_input
        expect(result).to eq('4')
      end

      it 'displays prompt once' do
        error_message = 'Please enter which slot you would like to go in(1-7)'
        expect(game_input).to receive(:puts).with(error_message).once
        game_input.player_input
      end
    end

    context 'player inputs an incorrect value then a correct value' do
      before do
        allow(game_input).to receive(:puts)
        allow(game_input).to receive(:gets).and_return('6')
        allow(game_input).to receive(:verify_input).and_return(nil, '6')
      end

      it 'returns the value' do
        result = game_input.player_input
        expect(result).to eq('6')
      end

      it 'dispays prompt twice' do
        error_message = 'Please enter which slot you would like to go in(1-7)'
        expect(game_input).to receive(:puts).with(error_message).twice
        game_input.player_input
      end
    end

    context 'player inputs an incorrect value 5 times then a correct value' do
      before do
        allow(game_input).to receive(:puts)
        allow(game_input).to receive(:gets).and_return('n', 'z', '6')
        allow(game_input).to receive(:verify_input).and_return(nil, nil,nil, '6')
      end

      it 'returns the value' do
        result = game_input.player_input
        expect(result).to eq('6')
      end

      it 'dispays prompt 6 times' do
        error_message = 'Please enter which slot you would like to go in(1-7)'
        expect(game_input).to receive(:puts).with(error_message).exactly(6).times
        game_input.player_input
      end
    end
  end
end
