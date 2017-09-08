class FreeGroupExBham::Scraper

  def scrape_rrpark
    doc = Nokogiri::HTML(open("http://www.railroadpark.org/events-get-healthy.html"))
    doc.css("h4").text.split(")").reject {|t| t.include?(":Frequently")}
  end

  def make_rrpark_array
    scrape_rrpark.collect do |c|
      c.gsub(/\A:/, "").gsub(" (", ": ")
    end
  end

  def scrape_library_one
    doc = Nokogiri::HTML(open("https://vestavialibrary.org/events/monday-night-tai-chi-for-beginners-2-2017-08-28/"))
    doc.css("h3").text.strip
  end

  def scrape_library_two
    doc = Nokogiri::HTML(open("https://vestavialibrary.org/events/adult-tai-chi-2/"))
    doc.css("h3").text.strip
  end

  def scrape_gardens_one
    # doc = Nokogiri::HTML(open("http://aldridgegardens.com/education/events/spring_event_calendar.html/event/2017/09/05/tai-chi-for-health/173019"))
    # doc.css(".event_title h3").text

    doc = Nokogiri::HTML(open("http://aldridgegardens.com/education/events/spring_event_calendar.html"))
    doc.css("td.currentMonth").text.split("\n").collect do |t|
      if t.include?("Yoga") || t.include?("Tai")
        t.strip
      end
    end.compact.uniq

  end

  def combine_lists
    make_rrpark_array + [scrape_library_one] + [scrape_library_two] + scrape_gardens_one
  end

  def create_classes
    combine_lists.each do |c|
    FreeGroupExBham::Offerings.new(c)
    end
  end

  # def rrpark_size ---belongs in offerings?
  #   scrape_rrpark.size
  # end

end
