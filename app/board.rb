require "opal"
# require 'pry-debugger'

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
  attr_reader :board_rows


  def initialize(options={})
    @board_rows = create_board(options[:board_string] || '-' * 81)

  end

  def get(row, col)
    board_rows[row][col]

  end

  def set(row, col, piece, check_legitimacy=true)
    if check_legitimacy && !legitimate_move?(row, col, piece)
      raise InvalidMoveError.new
    end
    board_rows[row][col] = piece

  end

  def to_s
    board_rows.join

  end

  def legitimate_move?(row, col, piece)
    true
  end

  def solved?
    [spots_all_filled?,
     rows_all_distinct?,
     columns_all_distinct?,
     quadrants_all_distinct?].all?
  end

  private
    def spots_all_filled?
      board_rows.all? { |row| row.all? {|col| col.solved? } }
    end

    def rows_all_distinct?
      board_rows.all? { |row| row.uniq.count == 9 }
    end

    def columns_all_distinct?
      board_rows.transpose.all? { |col| col.uniq.count == 9 }
    end

    def quadrants_all_distinct?
      board_rows.each_slice(3) do |rows|
        rows.transpose.each_slice(3) do |quadrant|
          if quadrant.flatten.uniq.count != 9
            return false
          end
        end
      end
      true
    end

    def create_board(board_string)
      board_string.scan(/.{9}/).map do |row|
        row.split("").map do |cell_string|
          if cell_string == "-"
            BoardCell.new
          else
            BoardCell.new(possible_values: [cell_string])
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

  def eliminate_possible_values(values)
    possible_values.delete_if {|v| values.include?(v)}
  end

  def to_s
    return '-' unless solved?
    return possible_values.first
  end
end
