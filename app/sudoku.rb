require "opal"
require "jquery"
require "opal-jquery"

class Board
  def initialize(options={})
    @board = options[:board] || new_board
  end

  private
    def new_board
      Array.new(9) { Array.new(9) { '-' } }
    end
end