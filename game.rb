require_relative 'player'

class Game
  attr_accessor :players, :nums
  def initialize
    @nums = (1..40).to_a
    @players = Array.new
  end

  def end_game
    puts "Good Game!\n"
    display_players
    exit(0)
  end

  def game_loop
    p1 = @players[0]
    p2 = @players[1]
    while p1.life || p2.life > 0 do
      turn
    end
  end

  def generate_question
    num1 = nums.sample
    num2 = nums.sample
    puts "#{num1} + #{num2}\n"
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
    while i <= 2  do
      puts("Player #{i} name: \n")
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
    puts "|-------- New Turn --------|\n"
    player = @players[0]
    puts "#{player.name}'s turn...\n"
    answer = generate_question
    validate(player, answer)
    player = @players[1]
    puts "#{player.name}'s turn...\n"
    answer = generate_question
    validate(player, answer)
  end

  def validate(currentPlayer, answer)
    if answer == false
      currentPlayer.lose_life
      end_game if currentPlayer.life < 1

      puts "#{currentPlayer.name} has #{currentPlayer.life}/3 lives left\n"
    else
      puts "#{currentPlayer.name} is correct! You live another day!\n"
    end
  end

end

