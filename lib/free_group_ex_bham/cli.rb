class FreeGroupExBham::CLI

  def call
    welcome
    list_locations
  end

  def welcome
    puts "\n\n----Free Group Exercise Classes in Birmingham, Alabama---\n\n"
    puts "Group exercise has many benefits over exercising on your own.  You have a knowledgable instructor to keep you moving safely and effectively, and you have a group of people to keep you motivated, encouraged, and supported.\n\n"
    puts "If you aren't ready to commit to a gym membership or weekly classes, there are many opportunities to take a class for FREE in the Birmingham area!\n\n"
    puts "These three locations offer free classes. Type the number of the location to see a list of the classes offered this week. Type 'exit' to exit.\n\n"
  end

  def list_locations
    puts "1. Railroad Park"
    puts "2. Aldridge Gardens"
    puts "3. Vestavia Hills Public Library"
    menu
  end

  def menu
      input = gets.strip.downcase
      if input == "1"
        FreeGroupExBham::Scraper.new.create_rrpark_classes
        FreeGroupExBham::RRPark.post_offerings
      elsif input == "2"
        FreeGroupExBham::Scraper.new.create_gardens_classes
        FreeGroupExBham::Gardens.post_offerings
      elsif input == "3"
        FreeGroupExBham::Scraper.new.create_library_classes
        FreeGroupExBham::Library.post_offerings
      elsif "exit"
        exit
      else
        puts "I'm sorry, I don't understand. Please type the number of a location on the list."
        list_locations
      end
    puts "Type the number of a class to see more details."
    puts "Type 'locations' to go back."
  end

end
