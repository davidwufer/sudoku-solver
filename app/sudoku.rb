require "opal"
require "jquery"
require "opal-jquery"

Document.ready? do
  button = Element.find("button")

  button.on(:click) do
    input_board = Element.find("input").first.value
    solved_board = Solver.new(board_string: input_board).solve
    Element.find('.js-solved-board').text(solved_board)
  end

end

class Solver
  def initialize(options={})
    @board_string = options[:board_string]
  end

  def solve
    @board_string
  end
end

class Board
  def initialize(options={})
    @board = options[:board] || new_board
  end

  private
    def new_board
      Array.new(9) { Array.new(9) { '-' } }
    end
end