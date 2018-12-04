class Player
  attr_reader :name, :life
  def initialize(name)
    @name = name
    @life = 3
  end
  def lose_life
    self.life -= 1
  end
end

puts "Please enter name of New Player..."
player1 = Player.new(gets.chomp)
puts "New Player \"#{player1.name}\" has joined"