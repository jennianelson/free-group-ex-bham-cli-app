class FreeGroupExBham::RRPark
  attr_accessor :name

  @@all = []

  def initialize(c)
    @name = c
    @@all << self
  end

  def self.all
    @@all
  end

  def self.post_offerings
    @@all.each_with_index do |c, i|
      puts "#{i+1}. #{c.name}"
    end
  end


end
