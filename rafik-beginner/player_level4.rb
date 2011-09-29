class Player
  #test
  @last_known_health = nil 


  def play_turn(warrior)
    @last_known_health = warrior.health unless @last_known_health   
    #next step
    space=warrior.feel

    #if the next square is empty    
    if space.empty?      
      #geting damage from far probably by archers
      if warrior.health < @last_known_health         
          #if i dont have enough health
          if warrior.health < 12             
            warrior.walk!(:backward)
          else
            warrior.walk!(:forward)            
          end
      elsif warrior.health < 20      
          warrior.rest!      
      else
          warrior.walk!
      end
    #else
    else
       if space.enemy?
          warrior.attack!
       elsif space.captive?
          warrior.rescue!
       end          
    end
    
    @last_known_health = warrior.health
    puts @last_known_health
  end

end
