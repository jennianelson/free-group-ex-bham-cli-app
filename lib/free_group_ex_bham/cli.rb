class FreeGroupExBham::CLI

  def welcome
    puts "\nFree Group Exercise Classes in Birmingham, Alabama!"
    puts "-----------------------------------------------------"
    puts "Group exercise has many benefits over exercising on your own.  You have a knowledgable instructor to keep you moving safely and effectively, and you have a group of people to keep you motivated, encouraged, and supported."
    puts "\nIf you aren't ready to commit to a gym membership or weekly classes, these three locations in Birmingham offer FREE fitness classes:"
    list_locations
  end

  def list_locations
    puts "1. Railroad Park"
    puts "2. Aldridge Gardens"
    puts "3. Vestavia Hills Public Library\n"
    puts "Type the number of the location to see a list of the classes offered this week. Type 'exit' to exit."
    list_classes
  end

  def list_classes
      input = gets.strip
      if input == "1"
        puts "\nFinding classes at Railroad Park..."
        FreeGroupExBham::Scraper.new.create_rrpark_classes
        FreeGroupExBham::RRPark.print_classes
        rrpark_details
      elsif input == "2"
        puts "\nFinding classes at Aldridge Gardens..."
        FreeGroupExBham::Scraper.new.create_gardens_classes
      elsif input == "3"
        puts "\nFinding classes at Vestavia Hills Library"
        FreeGroupExBham::Scraper.new.create_library_classes
      elsif input == "exit"
        exit
      else
        puts "I'm sorry, I don't understand. Please type the number of a location on the list."
        list_classes
      end
    end

  def list_details
    puts "\nType the number of a class to see more details.  Type 'locations' to go back to the list of locations.  Type 'exit' to exit the program."
    @second_input = gets.strip
    if @second_input == "locations"
      list_locations
    elsif @second_input == "exit"
      exit
    elsif !@second_input.to_i.integer?
      puts "I'm sorry, I don't understand."
      list_locations
    end
  end

  def rrpark_details
    list_details
    if @second_input.to_i. <= FreeGroupExBham::RRPark.all.size
      FreeGroupExBham::RRPark.print_details(@second_input)
    end
    puts "\nType 'list' to see the list of classes and options again. Type 'exit' to exit."
    input = gets.strip
    if input == "list"
      FreeGroupExBham::RRPark.print_classes
      rrpark_details
    elsif input == 'exit'
      exit
    else
      puts "I don't understand."
      rrpark_details
    end
  end

  # def last_level
  #   puts "Type 'list' to see the list of classes again"
  # end


end
