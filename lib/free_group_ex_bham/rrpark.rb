class FreeGroupExBham::RRPark
  attr_accessor :klass, :details

  @@all = []

  def initialize(hash)
    @klass = hash[:klass]
    @details = hash[:details]
    @@all << self
  end

  def class_array
    # FreeGroupExBham::Scraper.new.create_rrpark_array
  end

  def self.all
    @@all
  end

  def self.print_classes
    puts "\nUpcoming classes:"
    puts "----------------------------------------------"
    self.all.each_with_index do |c, i|
      puts "#{i+1}. #{c.klass}"
    end
    puts "----------------------------------------------"
  end

  def self.print_details(input)
    k = self.all[input.to_i - 1]
    puts "----------------------------------------------"
    puts "#{k.klass}"
    puts "\nDetails: #{k.details}"
    puts "----------------------------------------------"
  end


end
