class FreeGroupExBham::Scraper

  def scrape_rrpark
    doc = Nokogiri::HTML(open("http://www.railroadpark.org/calendar.php"))
    doc.css(".event-listing").children

    # title = doc.css(".title").children[0..5].collect {|t| t.text}
    # date = doc.css(".date").children[0..5].collect {|t| t.text}
    # details = doc.css(".details").children[0..5].collect {|t| t.text}
  end

  def rrpark_class_array
    scrape_rrpark.collect do |e|
      if e.css(".details").text.include?("class")
        "#{e.css('.title').text.strip}: #{e.css('.date').text.strip}"
      end
    end.compact[0..5]
  end

  def scrape_library
    doc = Nokogiri::HTML(open("https://vestavialibrary.org/events/categories/adults/"))
    doc.css("div.entry-content ul li").collect do |c|
      c.children.text
    end
  end

  def library_class_array
    scrape_library.collect do |t|
      if t.include?("Tai")
        t.gsub(";", "")
      end
    end.compact[0..1]
  end

  def scrape_gardens_url
    doc = Nokogiri::HTML(open("http://aldridgegardens.com/education/events/spring_event_calendar.html"))
    doc.css("td.currentMonth a").collect do |a|
      url = a.attr('href')
      if url.include?("tai") || url.include?("yoga")
        url
      end
    end.compact
  end

  def gardens_class_array
    scrape_gardens_url.collect do |u|
      doc = Nokogiri::HTML(open(u))
      c = doc.css("#event_details").children
      "#{c.css('.event_title').text.strip}: #{c.css('.event_time em').text.strip}"
    end[0..3]
  end

  # def combine_lists
  #   make_rrpark_classes + make_library_classes + make_gardens_classes
  # end

  def create_rrpark_classes
    rrpark_class_array.each do |r|
      FreeGroupExBham::RRPark.new(r)
    end
  end

  def create_library_classes
    library_class_array.each do |l|
      FreeGroupExBham::Library.new(l)
    end
  end

  def create_gardens_classes
    gardens_class_array.each do |g|
      FreeGroupExBham::Gardens.new(g)
    end
  end

end
