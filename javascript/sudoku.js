$(document).ready(function() {
  $('button').click(function() {
    var board = $('input').val();
    var solved_board = solve(board);
    $('.js-solved-board').text(solved_board);
  });
});

function solve(board) {
  for (var strategy_index = 0; strategy_index < strategies.length; strategy_index += 1) {
    strategy = strategies[strategy_index];
    board = strategy(board);
  }
  return board;
}

var cell_values = {
}


// TODO: Pull out to separate file
function Board(board_string) {
  this.board = to_int_array(board_string)
}

Board.prototype.to_int_array(board_string) = function() {

};

// TODO: Pull above out to separate file

var board_fns = {
  dimension: function() { return 9; },

  get: function(board, row, col) {
    // The board is going to be organized
    // using row-column ordering.
    board.charAt((row * dimension()) + col)
  },

  to_int_array(board_str) {

  },

  to_str(board_as_int_array) {

  }
}

var strategies = {
  // TODO: find a better name for this
  // Fill in squares with 100% certainty
  fill_in: function(board) {
    // Look at column
    // Look at row
    // Look at quadrant
    return board;
  },

  // Looks at entire rows and columns
  line_elimination: function(board) {
    return board;
  }

};
