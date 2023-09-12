require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)
    not_lose = []
    node.children.each do |child|
      if child.winning_node?(mark)
        return child.prev_move_pos 
      elsif !child.losing_node?(mark)
        not_lose << child.prev_move_pos 
      end
    end
    if not_lose.length == 0
      raise "error"
    else
      return not_lose[0]
    end
  end
end

if $PROGRAM_NAME == __FILE__
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end