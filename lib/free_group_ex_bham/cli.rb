class FreeGroupExBham::CLI

  def call
    # puts "hello"
    list_classes
    # menu
  end

  def list_classes
    puts "\n\n----Free Group Exercise Classes in Birmingham, Alabama---\n\n"
    puts "Group exercise has many benefits over exercising on your own.  You have a knowledgable instructor to keep you moving safely and effectively, and you have a group of people to keep you motivated, encouraged, and supported.\n\n"
    puts "If you aren't ready to commit to a gym membership or weekly classes, there are many opportunities to take a class for FREE in the Birmingham area.\n\n"
    puts "Here is a list of free classes offered this month. Type the number of the class to read more information. Type 'exit' to exit.\n\n"
    offerings = FreeGroupExBham::Scraper.scrape_rrpark
  end

  def menu
      input = gets.strip.downcase
      if input == "1"
        puts "Details about Zumba"
      elsif input == "2"
        puts "Details about Yoga"
      elsif input == "exit"
        puts "Goodbye!"
      else
        puts "I'm sorry, I don't understand. Please type the number of a class on the list."
      end
  end

end
