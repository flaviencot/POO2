require 'pry'

class Player 
  attr_accessor :name, :life_points
  @@array = []
  def initialize(name, life_points = 10, is_parent = true)
    @name = name
    @life_points = life_points
    if is_parent == true
      @@array << self
    end
  end

  def self.all
    @@array 
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie."
  end

  def gets_damage(damage)
    @life_points = @life_points - damage
    if @life_points > 0
      puts "#{@name} a #{@life_points} points de vie."
    else 
      puts "#{@name} est mort, cheh"
    end
  end

  def attacks(is_attacked)
    puts "le joueur #{self.name} attaque #{is_attacked.name}"
    damage = compute_damage
    puts "#{self.name} inflige #{damage} points de degats a #{is_attacked.name}"
    is_attacked.gets_damage(damage)
  end
  def random_attack
    rand = "bot"+rand(1..2).to_s
    return rand
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player

  attr_accessor :weapon_level, :life_points
 
  def initialize(name, life_points = 100, weapon_level = 1)
    @name = name
    @life_points = life_points
    @weapon_level = weapon_level
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
  end
  
  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon 
    new_weapon = rand(1..6)
    if new_weapon > @weapon_level
        puts "l'arme (#{new_weapon}) est mieux que ton arme actuelle (#{@weapon_level}), tu la prends"
        @weapon_level = new_weapon
    else 
        puts "l'arme est plus nulle que ton arme actuelle"
    end
  end
  
  def search_health_pack
    health_pack_rand = rand(1..6)
    if health_pack_rand == 1
      puts "t'as rien trouve"
    elsif health_pack_rand.between?(2,5)
      puts "t'as trouve un pack de +50 pv"
      if @life_points > 49
        @life_points = 100
      else
        @life_points += 50
      end
    else 
      puts "t'as trouve un pack de +80 pv"
      if @life_points > 19
        @life_points = 100
      else
        @life_points += 80
      end
    end
  end
end
binding.pry