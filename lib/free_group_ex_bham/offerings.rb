class FreeGroupExBham::Offerings
  # attr_accessor :name, :location, :date, :time, :details

  # def initialize
  #
  # end

  def self.post_offerings
    Scraper.make_rrpark_classes.each_with_index do |c|
      puts "#{i}. #{c}"
    end
  end

end
