class FreeGroupExBham::Scraper

#RRPARK
  def scrape_rrpark
    doc = Nokogiri::HTML(open("http://www.railroadpark.org/calendar.php"))
    doc.css(".event-listing").children.collect do |c|
      if c.css(".details").text.include?("class")
        { :klass => "#{c.css('.title').text.strip}: #{c.css('.date').text.strip}",
        :details => c.css('.details').text.strip }
      end
    end.compact[0..5]
  end

  def create_rrpark_classes
    scrape_rrpark.each do |hash|
      FreeGroupExBham::RRPark.new(hash)
    end
  end

#LIBRARY
  def scrape_library
    doc = Nokogiri::HTML(open("https://vestavialibrary.org/events/categories/adults/"))
    doc.css("div.entry-content ul li").collect do |c|
      url = c.css("a").attr('href').value
      if url.include?('tai')
        {:klass => c.text.strip.gsub("  -", ","),
        :details => Nokogiri::HTML(open(url)).css("p").text.strip.split(/\b\./)[0]}
      end
    end.compact[0..2]
  end

  def create_library_classes
    scrape_library.each do |hash|
      FreeGroupExBham::Library.new(hash)
    end
  end

#GARDENS
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
    scrape_gardens_url.collect do |u|
      doc = Nokogiri::HTML(open(u))
      c = doc.css("#event_details").children
      {
        :klass => "#{c.css('.event_title').text.strip}: #{c.css('.event_time em').text.strip}",
        :details => c.css(".details_value").text.strip }
    end[0..5]
  end

  def create_gardens_classes
    create_gardens_array.each do |hash|
      FreeGroupExBham::Gardens.new(hash)
    end
  end

end
