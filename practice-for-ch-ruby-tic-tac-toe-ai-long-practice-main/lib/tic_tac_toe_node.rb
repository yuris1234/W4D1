require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board=board
    @next_mover_mark=next_mover_mark
    @prev_move_pos=prev_move_pos
  end
  

  def losing_node?(evaluator)
    return true if board.over? && board.winner != evaluator
    return false if board.over? && (board.winner==nil || board.winner==evaluator)
   children.all? {|child| child.losing_node?(evaluator)} 

  end

  def winning_node?(evaluator)

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    dups_array=[]

    board.open_positions.each do |pos|
      dup = board.dup 
      dup[pos] = @next_mover_mark
      dups_array << TicTacToeNode.new(dup, dup.next_mark, pos)
    end

    dups_array
  end
end


