class FreeGroupExBham::Classes
  attr_accessor :klass
#
#   # @@all = []
#
#   def initialize(c)
#     @name = c
#     # @@all << self
#   end
#
#   def self.all
#     @@all
#   end
#
  def print_classes
    puts "\nClasses this week:"
    puts "--------------------------------------------"
    self.all.each_with_index do |c, i|
      puts "#{i+1}. #{c.klass}"
    end
    puts "----------------------------------------------"
  end
#
end
