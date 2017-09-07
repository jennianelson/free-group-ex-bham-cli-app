class FreeGroupExBham::Scraper

  def self.scrape_rrpark
    doc = Nokogiri::HTML(open("http://www.railroadpark.org/events-get-healthy.html"))
    doc.css("h4").text.split(")").reject {|t| t.include?(":Frequently")}
  end

  def self.make_rrpark_classes
    scrape_rrpark.collect do |c|
      c.gsub(/\A:/, "").gsub(" (", ": ")
    end
  end

  def self.post_offerings
    self.make_rrpark_classes.each_with_index do |c, i|
      puts "#{i}. #{c}"
    end
  end

  # def rrpark_size ---belongs in offerings?
  #   scrape_rrpark.size
  # end

end
