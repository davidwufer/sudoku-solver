class Difficulty
  EASY, MEDIUM, HARD, EVIL = (1..4).to_a
end

class UrlCreator
  attr_reader :difficulty, :level, :puzzle_count

  def initialize(options)
    self.difficulty   = options[:difficulty] || Difficulty::EASY
    self.level        = options[:level] || 1
    self.puzzle_count = options[:puzzle_count] || 10
  end

end
