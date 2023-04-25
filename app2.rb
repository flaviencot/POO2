require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "----------------------------------------"
puts "|Bienvenue sur ILS VEULENT TOUS MA POO |"
puts "|Comme on dit en Albanie, bon chance.  |"
puts "----------------------------------------"

puts "Quel est ton nom d'artiste"
print ">"
ton_petit_nom = gets.chomp

human = HumanPlayer.new(ton_petit_nom)
bot1 = Player.new("Josiane")
bot2 = Player.new("Jose")

puts "Bienvenue #{human.name}, pret pour la castagne ? \n
Aujourd'hui tu vas affronter #{bot1.name} et #{bot2.name}."

while human.life_points >0 && (bot1.life_points > 0 || bot2.life_points >0)

  puts "-----------------------------------------------------"
  puts "Etat des combattants :"
  bot1.show_state
  bot2.show_state
  human.show_state
  puts "  "


  puts "Quelle action souhaites-tu effectuer ? \n
  a : chercher une meilleure arme \n
  s : se soigner \n
  #{bot1.name} : tabasser #{bot1.name} (#{bot1.life_points} points de vie) \n
  #{bot2.name} : tabasser #{bot2.name} (#{bot2.life_points} points de vie) "
  print ">"
  input = gets.chomp
  if input == "a"
    human.search_weapon
  elsif input == "s"
    human.search_health_pack
  elsif input == bot1.name
    if bot1.life_points < 1
        puts "#{bot1.name} est deja mort"
        else human.attacks(bot1)
    end
  elsif input == bot2.name
    if bot2.life_points < 1
        puts "#{bot2.name} est deja mort"
        else human.attacks(bot2)
    end
  else 
    break
  end

  puts "-----------------------------------------------------"
  if bot1.life_points < 0 && bot2.life_points < 0
    puts "T'as gagne le jeu!"
    break
  else 
    puts "On vous attaque! \n"
    if bot1.life_points < 1
      else bot1.attacks(human)
    end
    if bot2.life_points < 1
      else bot2.attacks(human)
    end
  end
end
