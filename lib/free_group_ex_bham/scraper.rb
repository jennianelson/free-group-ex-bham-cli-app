class FreeGroupExBham::Scraper

  def scrape_rrpark
    doc = Nokogiri::HTML(open("http://www.railroadpark.org/calendar.php"))
    doc.css(".event-listing").children
  end

  def create_rrpark_array
    rrpark_array = []
    scrape_rrpark.each do |e|
      if e.css(".details").text.include?("class")
        rrpark_array << { :klass => "#{e.css('.title').text.strip}: #{e.css('.date').text.strip}",
        :details => e.css('.details').text.strip }
      end
    end
    rrpark_array[0..5]
  end

  def scrape_library
    doc = Nokogiri::HTML(open("https://vestavialibrary.org/events/categories/adults/"))
    doc.css("div.entry-content ul li").collect do |c|
      c.children.text
    end
  end

  def create_library_array
    library_array = []
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

  def create_gardens_array
    gardens_array = []
    scrape_gardens_url.each do |u|
      doc = Nokogiri::HTML(open(u))
      c = doc.css("#event_details").children
      gardens_array << {
        :klass => "#{c.css('.event_title').text.strip}: #{c.css('.event_time em').text.strip}",
        :details => c.css(".details_value").text.strip }
    end
    gardens_array[0..5]
  end

  def create_rrpark_classes
    create_rrpark_array.each do |hash|
      FreeGroupExBham::RRPark.new(hash)
    end
  end

  def create_library_classes
    create_library_array.each do |l|
      @klass = FreeGroupExBham::Library.new(l)
    end
    @klass.print_classes
  end

  def create_gardens_classes
    create_gardens_array.each do |hash|
      FreeGroupExBham::Gardens.new(hash)
    end
  end

end
