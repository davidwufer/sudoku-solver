require "opal"

class Solver
  attr_reader :board

  def initialize(options={})
    @board = Board.new(board_string: options[:board_string])
  end

  def solve
    # TODO: Pass in the board
    board = Board.new
    board.set(0,0,'1')
    board
  end
end

class Board
  attr_reader :board_internal

  def initialize(options={})
    @board_internal = create_board(options[:board_string] || '-' * 81)
  end

  def get(row, col)
    board_internal[row][col]
  end

  def set(row, col, piece)
    board_internal[row][col] = piece
  end

  def to_s
    board_internal.join
  end

  private
    def create_board(board_string)
      board_string.scan(/.{9}/).map {|row| row.split("")}
    end
end