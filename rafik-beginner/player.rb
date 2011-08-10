#https://github.com/ryanb/ruby-warrior

class Player
  
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
      #if i meet an enemy in the 3rd square from my current position and it is not a captive
      elsif !warrior.look[2].captive? && warrior.look[2].enemy?  
          warrior.shoot!
      elsif warrior.health < 20      
          warrior.rest!      
      else
          warrior.walk!
      end
    #else
    else
       if space.wall?
         warrior.pivot!
       elsif space.enemy?
         warrior.attack!
       elsif space.captive?
         warrior.rescue!
       end          

    end
    
    @last_known_health = warrior.health

  end

  
  def parse_positions_ahead(array)
    
  end


end
