class FreeGroupExBham::Offerings
  attr_accessor :klass

  @@all = []

  def initialize(c)
    @klass = c
    @@all << self
  end

  def self.all
    @@all
  end

  def self.post_offerings
    @@all.each_with_index do |c, i|
      puts "#{i+1}. #{c.klass}"
    end
  end

end
