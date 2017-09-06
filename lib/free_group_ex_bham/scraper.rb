class FreeGroupExBham::Scraper
  attr_accessor :name, :location, :date, :time, :details

  # def initialize
  #   @name = name
  # end

  def self.scrape_rrpark
    doc = Nokogiri::HTML(open("http://www.railroadpark.org/events-get-healthy.html"))
    # binding.pry
    classes = doc.css("h4").text.split(")")
    classes.each.with_index(1) do |c, i|
      puts "#{i}.#{c.gsub(/\A:/, "")}"
    end
  end

end
