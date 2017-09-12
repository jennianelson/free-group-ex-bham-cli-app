class FreeGroupExBham::CLI

  def call
    welcome
    list_locations
    # list_classes
  end

  def welcome
    puts "\nFREE Group Exercise Classes in Birmingham, Alabama!"
    FreeGroupExBham::Scraper.create_rrpark_classes
    puts "\nGroup exercise has many benefits over exercising on your own."
    sleep(2)
    puts "\nYou have a knowledgable instructor to keep you moving safely and effectively, and you have a group of people to keep you"
    sleep(3)
    puts "MOTIVATED"
    sleep(1)
    puts "and ENCOURAGED."
    sleep (1)
    puts "\nIf you aren't ready to commit to a gym membership or the price is too high,"
    sleep(3)
    puts "these three locations in Birmingham offer FREE fitness classes:"
    sleep(2)
  end

  def list_locations
    puts "  1. Railroad Park"
    puts "  2. Aldridge Gardens"
    puts "  3. Vestavia Hills Public Library\n"
    puts "Type the number of the location to see a list of upcoming classes. Type 'exit' to exit."
    list_classes
  end

  def list_classes
      input = gets.strip.downcase
      if input == "1"
        puts "\nFinding classes at Railroad Park..."
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
    puts "Type the number of a class to see more details.  Type 'locations' to go back to the list of locations.  Type 'exit' to exit the program."
    @details_input = gets.strip
    if @details_input == "locations"
      list_locations
    elsif @details_input == "exit"
      exit
    elsif !@details_input.to_i.integer?
      puts "I'm sorry, I don't understand."
      list_locations
    end
  end

  def final_menu
    puts "Type 'list' to see the list of classes and options again. Type 'exit' to exit."
    @last_input = gets.strip.downcase
    if @last_input == "exit"
      exit
    elsif @last_input != "list"
      puts "I don't understand."
      final_menu
    end
  end

  def rrpark_details
    list_details
    if @details_input.to_i. <= FreeGroupExBham::RRPark.all.size
      FreeGroupExBham::RRPark.print_details(@details_input)
    end
    final_menu
    if @last_input == "list"
      FreeGroupExBham::RRPark.print_classes
      rrpark_details
    end
  end


end
