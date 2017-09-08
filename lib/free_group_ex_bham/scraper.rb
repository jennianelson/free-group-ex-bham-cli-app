class FreeGroupExBham::Scraper

  def scrape_rrpark
    doc = Nokogiri::HTML(open("http://www.railroadpark.org/calendar.php"))
    doc.css(".event-listing").children

    # title = doc.css(".title").children[0..5].collect {|t| t.text}
    # date = doc.css(".date").children[0..5].collect {|t| t.text}
    # details = doc.css(".details").children[0..5].collect {|t| t.text}
  end

  def make_rrpark_classes
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

  def make_library_classes
    scrape_library.collect do |t|
      if t.include?("Tai")
        t.gsub(";", "")
      end
    end.compact[0..3]
  end

  def scrape_gardens_url
    doc = Nokogiri::HTML(open("http://aldridgegardens.com/education/events/spring_event_calendar.html"))
    binding.pry
    doc.css("td.currentMonth a").collect do |a|
      url = a.attr('href')
      if url.include?("tai") || url.include?("yoga")
        url
      end
    end.compact
  end

  def combine_lists
    make_rrpark_classes + make_library_classes + scrape_gardens
  end

  def create_classes
    combine_lists.each do |c|
    FreeGroupExBham::Offerings.new(c)
    end
  end

end
