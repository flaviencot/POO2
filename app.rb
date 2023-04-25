require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Flavien")
player2 = Player.new("Sarah")

puts "Les deux combattants sont #{player1.name} et #{player2.name}."

while player1.life_points > 0 && player2.life_points > 0

  puts "Etat de nos deux combattants :"
  player1.show_state
  player2.show_state

  puts "Let's fight!"
  player1.attacks(player2)
  if player2.life_points < 1
    break
    else player2.attacks(player1)
  end

end


