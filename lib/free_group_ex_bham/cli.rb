class FreeGroupExBham::CLI

  def call
    welcome
    list_locations
    menu
  end

  def welcome
    puts "\n\n----Free Group Exercise Classes in Birmingham, Alabama---\n\n"
    puts "Group exercise has many benefits over exercising on your own.  You have a knowledgable instructor to keep you moving safely and effectively, and you have a group of people to keep you motivated, encouraged, and supported.\n\n"
    puts "If you aren't ready to commit to a gym membership or weekly classes, there are many opportunities to take a class for FREE in the Birmingham area!\n\n"
  end

  def list_locations
    FreeGroupExBham::Scraper.new.create_classes
    puts "These three locations offer free classes. Type the number of the location to see a list of the classes offered this week. Type 'exit' to exit.\n\n"
    puts "1. Railroad Park"
    puts "2. Aldridge Gardens"
    puts "3. Vestavia Hills Public Library"
  end

  def menu
      input = gets.strip.downcase
      if input == "1"
        FreeGroupExBham::RRPark.post_offerings
      elsif input == "2"
        FreeGroupExBham::Gardens.post_offerings
      elsif input == "3"
        FreeGroupExBham::Library.post_offerings
      elsif "exit"
        exit
      else
        puts "I'm sorry, I don't understand. Please type the number of a class on the list."
      end
  end

end
