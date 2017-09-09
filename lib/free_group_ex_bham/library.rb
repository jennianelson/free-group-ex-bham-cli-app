class FreeGroupExBham::Library
  attr_accessor :klass

  @@all = []

  def initialize(klass)
    @klass = klass
    @@all << self
  end

  def self.all
    @@all
  end

  def print_classes
    puts "\nClasses this week at the Vestavia Hills Library:"
    puts "\n----------------------------------------------"
    @@all.each_with_index do |c, i|
      puts "#{i+1}. #{c.klass}"
    end
    puts "----------------------------------------------"
  end

end
