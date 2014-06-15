require 'spec_helper'

describe "Board" do
  describe "initialization" do
    it "is empty when not specified" do
      board = Board.new
      # expect(board.to_s).to eq("-" * 81)
    end
  end
end