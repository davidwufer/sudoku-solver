require "opal"
require "jquery"
require "opal-jquery"
require "logic"

Document.ready? do
  button = Element.find("button")

  button.on(:click) do
    input_board = Element.find("input").first.value
    solved_board = Solver.new(board_string: input_board).solve
    Element.find('.js-solved-board').text(solved_board.to_s)
  end

end
