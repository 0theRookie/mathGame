require_relative 'player'

class Game
  attr_accessor :players, :nums
  def initialize
    @nums = (1..20).to_a
    @players = Array.new
  end

  def generate_question
    num1 = nums.sample
    num2 = nums.sample
    puts "#{num1} + #{num2}"
    answer = gets.chomp.to_i
    evaluate(answer, num1, num2)
  end

  def evaluate(answer, num1, num2)
    if answer != (num1 + num2)
      false
    else
      true
    end
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

    def display_players 
      players.each_with_index do |player, index|
        puts "Player #{index + 1}: #{player.name} ------ Lives: #{player.life}"
      end

    end

  end

  def turn
    player = @players[0]
    answer = generate_question
    if answer == false
      puts "#{player.name} has #{player.life}/3 lives left"
    else
      puts "#{player.name} is correct!"
    end
  end

end

