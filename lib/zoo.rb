class Zoo
  attr_reader :cages, :employees

  def initialize(name, season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @cages = []
    create_cages
    @employees = []
  end

  def create_cages
    10.times do
      @cages << Cage.new
    end
  end

  def add_employee(employee)
    @employees << employee
  end

  def open?(date)
    @season_opening_date <= date && @season_closing_date >= date
  end

  def add_animal(animal)
    @cages.each do |cage|
      if cage.empty?
        return cage.animal = animal
      end
    end
    return "Your zoo is already at capacity!"
  end

  def visit
    greetings = ""
    @employees.each do |employee|
      greetings += "#{employee.name} waved hello!\n"
    end
    @cages.each do |cage|
      if !cage.empty?
        greetings += "#{cage.animal.speak}\n"
      end
    end
    greetings
  end

end
