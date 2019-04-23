# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError => e
    puts "Invalid input!"
    puts "Error was: #{e.message}"
    return nil
  end
end

class CoffeeError < StandardError
end
# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include?(maybe_fruit)
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else
    raise StandardError
  end
end

def feed_me_a_fruit

  puts "Hello, I am a friendly monster. :)"

  begin
      puts "Feed me a fruit! (Enter the name of a fruit:)"
      maybe_fruit = gets.chomp
      reaction(maybe_fruit)
    rescue CoffeeError
      puts "COFFEE ALSO GOES WELL WITH FROOT, GIVE ME SOME"
      retry
    rescue StandardError => e
      puts "THAS NO FROOT"
      puts "Error was: #{e.message}"
    end 
end  

class YearsKnownError < StandardError
end
class LengthError < StandardError
end
# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @yrs_known = yrs_known
    unless yrs_known >= 5
      raise YearsKnownError.new "best fraans no each uther 4 at leest 5 yeers"
    end
    
    @name = name
    @fav_pastime = fav_pastime
    unless name.length > 0 && fav_pastime.length > 0 
      raise LengthError.new "You need a real name or pastime"
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


