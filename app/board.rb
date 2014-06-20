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

class InvalidMoveError < ArgumentError; end;

class Board
  attr_reader :board_internal

  def initialize(options={})
    @board_internal = create_board(options[:board_string] || '-' * 81)
  end

  def get(row, col)
    board_internal[row][col]
  end

  def set(row, col, piece, check_legitimacy=true)
    if check_legitimacy && !legitimate_move?(row, col, piece)
      raise InvalidMoveError.new
    end
    board_internal[row][col] = piece
  end

  def to_s
    board_internal.join
  end

  def legitimate_move?(row, col, piece)
    true
  end

  private
    def create_board(board_string)
      board_string.scan(/.{9}/).map do |row|
        row.split("").map do |cell_string|
          if cell_string == "-"
            BoardCell.new
          else
            BoardCell.new(options[possible_values: cell_string])
          end
        end
      end
    end
end

class BoardCell
  attr_reader :possible_values

  def initialize(options={})
    @possible_values = options[:possible_values] || (0..9).map(&:to_s)
  end

  def solved?
    possible_values.size == 1
  end

  def eliminate_possible_value(value)
    possible_values.delete(value)
  end

  def to_s
    return '-' unless solved?
    return possible_values.first
  end
end
