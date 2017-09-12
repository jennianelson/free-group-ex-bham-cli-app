class FreeGroupExBham::CLI

  def goodbye
    puts "Go forth and get fit!"
    exit
  end

  def welcome
    puts "\nFREE Group Exercise Classes in Birmingham, Alabama!"
    sleep(1)
    puts "\nDid you know that these three locations in Birmingham offer FREE classes?"
    puts "  1. Railroad Park"
    puts "  2. Aldridge Gardens"
    puts "  3. Vestavia Hills Public Library\n"
    puts "Would you like to see what classes are available right now? ('yes' or 'no')"
    input = gets.strip.downcase
    if input == 'yes'
      find_classes
    elsif input == 'no'
      goodbye
    end
  end

  def find_classes
    puts "Please wait just a moment while I find upcoming classes for you...(I will only have to do this once!)"
    FreeGroupExBham::Scraper.new.create_rrpark_classes
    puts "one done!"
    FreeGroupExBham::Scraper.new.create_gardens_classes
    puts "two done!"
    FreeGroupExBham::Scraper.new.create_library_classes
    puts "finished!"
    puts "Type the number of the location to see a list of upcoming classes. Type 'exit' to exit."
    list_classes
  end

  def list_locations
    puts "\n  1. Railroad Park"
    puts "  2. Aldridge Gardens"
    puts "  3. Vestavia Hills Public Library\n"
    puts "Type the number of the location to see a list of upcoming classes. Type 'exit' to exit."
    list_classes
  end

  def list_classes
      input = gets.strip.downcase
      if input == "1"
        FreeGroupExBham::RRPark.print_classes
        rrpark_details
      elsif input == "2"
        FreeGroupExBham::Gardens.print_classes
        gardens_details
      elsif input == "3"
        FreeGroupExBham::Library.print_classes
        library_details
      elsif input == "exit"
        goodbye
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
      goodbye
    elsif !@details_input.to_i.integer?
      puts "I'm sorry, I don't understand."
      list_locations
    end
  end

  def final_menu
    puts "Type 'list' to see the list of classes and options again. Type 'locations' to go back to the list of locations. Type 'exit' to exit."
    @last_input = gets.strip.downcase
    if @last_input == "exit"
      goodbye
    elsif @last_input == "locations"
      list_locations
    elsif @last_input != "list" && @last_input != "locations"
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

  def gardens_details
    list_details
    if @details_input.to_i. <= FreeGroupExBham::Gardens.all.size
      FreeGroupExBham::Gardens.print_details(@details_input)
    end
    final_menu
    if @last_input == "list"
      FreeGroupExBham::Gardens.print_classes
      gardens_details
    end
  end

  def library_details
    list_details
    if @details_input.to_i. <= FreeGroupExBham::Library.all.size
      FreeGroupExBham::Library.print_details(@details_input)
    end
    final_menu
    if @last_input == "list"
      FreeGroupExBham::Library.print_classes
      library_details
    end
  end

end
