class FreeGroupExBham::Scraper
  # attr_accessor :klass

  def self.scrape_rrpark
    doc = Nokogiri::HTML(open("http://www.railroadpark.org/calendar.php"))
    doc.css(".event-listing").children
  end

  def self.create_rrpark_array
    rrpark_array = []
    self.scrape_rrpark.each do |e|
      if e.css(".details").text.include?("class")
        rrpark_array << { :klass => "#{e.css('.title').text.strip}: #{e.css('.date').text.strip}",
        :details => e.css('.details').text.strip }
      end
    end
    rrpark_array[0..5]
  end

  def self.scrape_library
    doc = Nokogiri::HTML(open("https://vestavialibrary.org/events/categories/adults/"))
    doc.css("div.entry-content ul li").collect do |c|
      c.children.text
    end
  end

  def self.library_class_array
    self.scrape_library.collect do |t|
      if t.include?("Tai")
        t.gsub(";", "")
      end
    end.compact[0..1]
  end

  def self.scrape_gardens_url
    doc = Nokogiri::HTML(open("http://aldridgegardens.com/education/events/spring_event_calendar.html"))
    doc.css("td.currentMonth a").collect do |a|
      url = a.attr('href')
      if url.include?("tai") || url.include?("yoga")
        url
      end
    end.compact
  end

  def self.gardens_class_array
    self.scrape_gardens_url.collect do |u|
      doc = Nokogiri::HTML(open(u))
      c = doc.css("#event_details").children
      "#{c.css('.event_title').text.strip}: #{c.css('.event_time em').text.strip}"
    end[0..5]
  end

  def self.create_rrpark_classes
    self.create_rrpark_array.each do |hash|
      @new_class = FreeGroupExBham::RRPark.new(hash)
    end
    # FreeGroupExBham::RRPark.print_classes
  end

  def self.create_library_classes
    self.library_class_array.each do |l|
      @klass = FreeGroupExBham::Library.new(l)
    end
    @klass.print_classes
  end

  def self.create_gardens_classes
    self.gardens_class_array.each do |g|
      @klass = FreeGroupExBham::Gardens.new(g)
    end
    @klass.print_classes
  end

end
