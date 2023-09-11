require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board=board
    @next_mover_mark=next_mover_mark
    @prev_move_pos=prev_move_pos
  end
  

  def losing_node?(evaluator)

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

    # board.rows.each_with_index do |ele, idx|
    #   board.rows.each_with_index do |ele2,idx2|
    #     p idx 
    #     p idx2
    #     dup=board.dup
    #     if dup[idx][idx2].empty?
    #       dup[idx][idx2]=@next_mover_mark
    #       dups_array << TicTacToeNode(dup, dup.next_mark, self)
    #     end
    #   end
    # end
  end
end


