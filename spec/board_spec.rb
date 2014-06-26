require 'spec_helper'

describe "Board" do
  describe "initialization" do
    it "is empty when not specified" do
      board = Board.new
      expect(board.to_s).to eq("-" * 81)
    end
  end

  describe "getters and setters" do
    it "sets and gets the right value" do
      board = Board.new
      board.set(1, 1, '9')
      expect(board.get(1, 1)).to eq('9')
    end
  end

  describe "solved?" do
    it "is solved when all the cells have values and each row, column, and quadrant has distinct values" do
        
    end
  end
end
