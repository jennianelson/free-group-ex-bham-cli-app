class FreeGroupExBham::Gardens
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
    puts "\nClasses this month at Aldridge Gardens:"
    puts "----------------------------------------------"
    @@all.each_with_index do |c, i|
      puts "#{i+1}. #{c.klass}"
    end
    puts "----------------------------------------------"
  end

end
