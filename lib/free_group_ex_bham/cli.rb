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
    user_input
  end

  def user_input
      input = gets.strip
      if input == "1"
        puts "\nFinding classes at Railroad Park..."
        FreeGroupExBham::Scraper.new.create_rrpark_classes
        # FreeGroupExBham::RRPark.print_classes
      elsif input == "2"
        puts "\nFinding classes at Aldridge Gardens..."
        FreeGroupExBham::Scraper.new.create_gardens_classes
        # FreeGroupExBham::Gardens.print_classes
      elsif input == "3"
        puts "\nFinding classes at Vestavia Hills Library"
        FreeGroupExBham::Scraper.new.create_library_classes
        # FreeGroupExBham::Library.print_classes
      elsif input == "exit"
        exit
      else
        puts "I'm sorry, I don't understand. Please type the number of a location on the list."
      end
      level_two
    end

  def level_two# puts "Type the number of a class to see more details."
    puts "Type 'locations' to go back. Type 'exit' to exit the program."

    input = gets.strip
    if input == "locations"
      list_locations
    elsif input == "exit"
      exit
    else
      puts "I'm sorry, I don't understand."
      list_locations
    end
  end

end
