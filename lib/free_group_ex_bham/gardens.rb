class FreeGroupExBham::Gardens
  attr_accessor :klass

  @@all = []

  def initialize(hash)
    @klass = hash[:klass]
    @details = hash[:details]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.print_classes
    puts "Classes this month at Aldridge Gardens:"
    puts "----------------------------------------------"
    @@all.each_with_index do |c, i|
      puts "#{i+1}. #{c.klass}"
    end
    puts "----------------------------------------------"
  end

  def self.print_details(input)
    k = self.all[input.to_i - 1]
    puts "----------------------------------------------"
    puts "---Details about #{k.klass}---"
    puts "\n#{k.details}"
    puts "----------------------------------------------"
  end

end
