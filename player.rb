require_relative 'game'

class Player
  attr_accessor :name, :life
  def initialize(name)
    @name = name
    @life = 3
  end
  def lose_life
    puts "Incorrect! Player loses life...\n"
    self.life -= 1
  end
end

