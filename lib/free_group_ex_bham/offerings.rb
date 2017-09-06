class FreeGroupExBham::Offerings
  attr_accessor :name, :location, :date, :time, :details

  def self.month
    choice_1 = self.new
    choice_1.name = "Zumba"
    choice_1.location = "Railroad Park"
    choice_1.date = "September 06, 2017"
    choice_1.time = "6:00pm"
  end

end
