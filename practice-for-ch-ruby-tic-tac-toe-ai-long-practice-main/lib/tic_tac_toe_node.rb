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
    board.dup
    TicTacToeNode.new(board.dup, @next_mover_mark, self)
    @next_mover_mark = board.next_mark 
    board.each_with_index do |ele, idx|
      board.each_with_index do |ele2,idx2|
        dup=board.dup
        if dup[idx][idx2].empty?
          dup[idx][idx2]=@next_mover_mark
        end
      end
    end
    next_mover_mark=dup.next_mark
  end
end

