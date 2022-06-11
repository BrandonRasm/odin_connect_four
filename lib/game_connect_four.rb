# Plays the game keeping track of turns and sending messages to the board
class ConnectFourGame
  def initialize(board = Board.new)
    @board = board
  end

  def player_input
    input = ''
    loop do 
      puts 'Please enter which slot you would like to go in(1-7)'
      input = gets.chomp
      verified_input = verify_input(input) if input.match(/[1-7]/)
      break if verified_input
    end
    input
  end

  def verify_input(input)
    input
  end
end

test = ConnectFourGame.new(4)
test.player_input
