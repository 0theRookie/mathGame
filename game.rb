require_relative 'player'

class Game
  attr_accessor :players
  def initialize
    nums = [1-20]
    @players = Array.new
  
  end

  def collect_players
    i = 1
    num = 2

    while i <= num  do
      puts("Player #{i} name:")
      temp = gets.chomp
      p = Player.new(temp)
      @players.push(p);
      i +=1
    end

    def displayPlayers 
      players.each_with_index do |player, index|
        puts "Player #{index + 1}: #{player.name}"
      end
    end

  end
end

game = Game.new
game.collect_players
game.displayPlayers