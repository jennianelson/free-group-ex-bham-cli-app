class FreeGroupExBham::RRPark
  attr_accessor :klass, :details

  @@all = []

  def initialize(hash)
    binding.pry
    @klass = hash[:klass]
    @details = hash[:details]
    @@all << self
  end

  def self.all
    @@all
  end

  def print_classes
    puts "\nClasses this week at Railroad Park:"
    puts "--------------------------------------------"
    @@all.each_with_index do |c, i|
      puts "#{i+1}. #{c.klass}"
    end
    puts "----------------------------------------------"
  end

  def print_details(input)
    puts "\n"
  end


end
