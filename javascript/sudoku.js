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

var board_operations = {
  dimension: function() { return 9; }
  get: function(row, col) {
    // TODO: Determine how row/col is laid out
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
